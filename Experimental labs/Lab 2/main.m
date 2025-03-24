clc;
clear;
close all;

print_preliminaries = false;
print_reynolds_averaged = false;
print_urans = true;
record_videos = true;

function is_in = is_in_cylinder(Grid_x0_D, Grid_y0_D, x, y)
    x = Grid_x0_D(1, x) + 0.5;
    y = Grid_y0_D(y, 1);
    is_in = x^2 + y^2 < 2*0.5^2;
end

function [rolling_average_series, time_of_acquisition] = rolling_average(data_series, margin_of_stability, freq, conv_seconds, id)
    rolling_sum = 0;
    number_of_nans = 0;
    sz = length(data_series);
    rolling_average_series = zeros(sz, 1);

    for i = 1:sz
        if ~isnan(data_series(i))
            rolling_sum = rolling_sum + data_series(i);
            rolling_average_series(i) = rolling_sum / (i - number_of_nans);
        else
            if i > 1 && ~isnan(rolling_average_series(i-1))
                rolling_average_series(i) = rolling_average_series(i-1);
            else
                rolling_average_series(i) = NaN;
            end

            number_of_nans = number_of_nans + 1;
        end
    end

    if rolling_average_series(end) >= 0
        lower_bound = rolling_average_series(end) * (1 - margin_of_stability);
        upper_bound = rolling_average_series(end) * (1 + margin_of_stability);
    else
        lower_bound = rolling_average_series(end) * (1 + margin_of_stability);
        upper_bound = rolling_average_series(end) * (1 - margin_of_stability);
    end
    
    % The last value is by deinition part of the stable region
    stable_region_width = 1;

    for i=1:sz-1
        if lower_bound <= rolling_average_series(sz-i) && rolling_average_series(sz-i) <= upper_bound
            stable_region_width = i + 1;
        else
            break;
        end
    end

    time_of_acquisition = (sz - stable_region_width)/freq;
    stable_duration = stable_region_width/freq;

    if stable_duration < conv_seconds
        warning = append('Attention: experiment ', id, ' might not be converged! Stable region duration: ', string(stable_duration), '[s].');
        disp(warning);
    end
end

function plot_rolling_average(rolling_average_x, rolling_average_y, freq, suffix)
    titlename = append('Cumulative velocity average at ', suffix, '.');
    sz = length(rolling_average_x);

    figure();
    x = linspace(0.1, sz/freq, sz);
    yyaxis left;
    semilogx(x, rolling_average_x, 'DisplayName', 'Cumulative velocity average along x');
    xlabel('t [s]');
    ylabel('cumulative velocity [m/s]', 'Color', 'black');
    %set(gca, 'YColor', 'black');

    yyaxis right;
    semilogx(x, rolling_average_y, 'DisplayName', 'Cumulative velocity average along y');
    %set(gca, 'YColor', 'black');

    start = find(~isnan(rolling_average_x), 1);

    if(start ~= 1)
        xline(x(start), '--', 'DisplayName', 'Only NaN values until this point');
    end

    title(titlename);
    legend('Location', 'best');
    ylabel('cumulative velocity [m/s]', 'Color', 'black');
    grid on;
end

B = 0.5;
D = 0.06;
fs = 50;
h = 0.42;
hb = 0.18;
Q = 35e-3;
res = 3040;
rho = 998;
mu = 0.001;

function importfile(importpath)
    data = load('-mat', importpath);
    
    vars = fieldnames(data);
    for i = 1:length(vars)
        assignin('base', vars{i}, data.(vars{i}));
    end
end

nu = mu / rho;
Ub = Q / (B * h);
disp("Ub velocity: " + string(Ub));

% Ub ≈ Uinf 
Red = D * Ub / nu;
disp("Reynolds number: " + string(Red) + ".");

if Red > 5000 && Red < 3e5
    disp("Sub-critical regime.");
end

importfile('PSVdata');

% These values are used in the very-last section of the code
vidHeight = round(max(Grid_Ypx, [], 'all'));
vidWidth = round(max(Grid_Xpx, [], 'all'));

% Trim the empty slots
validRows = ~all(isnan(SXpx), [2, 3]);
validCols = ~all(isnan(SXpx), [1, 3]);
SXpx = SXpx(validRows, validCols, :);
SYpx = SYpx(validRows, validCols, :);
Grid_Xpx = Grid_Xpx(validRows, validCols);
Grid_Ypx = Grid_Ypx(validRows, validCols);

stagnation_pt_coord_px = [464, 273];
stagnation_pt_coord_mt = stagnation_pt_coord_px ./ res;

Grid_x0_D = (stagnation_pt_coord_mt(1) - Grid_Xpx ./ res) ./ D;
Grid_y0_D = (stagnation_pt_coord_mt(2) - Grid_Ypx ./ res) ./ D;
clear Grid_Xpx;
clear Grid_Ypx;

% This is almost the instantaneous velocity, except that it's not the
% velocity of the fluid but of the seeding particles (albeit with small
% Stokes number) and that it's really an average over the exposure time.
u0_Ub = -1 * (SXpx ./ res) .* fs ./ Ub;
v0_Ub = -1 * (SYpx ./ res) .* fs ./ Ub;
clear SXpx;
clear SYpx;

U0_Ub = mean(u0_Ub, 3, "omitnan");
V0_Ub = mean(v0_Ub, 3, "omitnan");

if print_preliminaries
    for i=1:8
        % This point is near the center of the cylinder
        x = 26;
        y = 13;

        % Repear till the point (x, y) is in the cylinder
        while is_in_cylinder(Grid_x0_D, Grid_y0_D, x, y)
            x = randi([1, size(Grid_x0_D, 2)], 1);
            y = randi([1, size(Grid_x0_D, 1)], 1);
        end

        ra_x = rolling_average(u0_Ub(y, x, :), 0.1, fs, 1, string(i));
        ra_y = rolling_average(v0_Ub(y, x, :), 0.1, fs, 1, string(i));
        coordinates = append('y = ', string(Grid_y0_D(y, x)), ', x = ', string(Grid_x0_D(y, x)));
        plot_rolling_average(ra_x, ra_y, fs, coordinates);
    end
end

if print_reynolds_averaged
    figure();
    pcolor(Grid_x0_D, Grid_y0_D, U0_Ub);
    set(gca, 'XDir', 'reverse');
    title("Reynolds-averaged x-velocity magnitude");
    shading interp;
    colorbar;
    axis tight;
    axis equal;
    hold on;
    rectangle('Position', [-1, -0.5, 1, 1], 'Curvature', [1, 1]);
    
    figure();
    pcolor(Grid_x0_D, Grid_y0_D, V0_Ub);
    set(gca, 'XDir', 'reverse');
    title("Reynolds-averaged y-velocity magnitude");
    shading interp;
    colorbar;
    axis tight;
    axis equal;
    hold on;
    rectangle('Position', [-1, -0.5, 1, 1], 'Curvature', [1, 1]);
    
    magnitudes = (U0_Ub.^2 + V0_Ub.^2).^(1/2);
    
    figure();
    pcolor(Grid_x0_D, Grid_y0_D, magnitudes);
    set(gca, 'XDir', 'reverse');
    title("Reynolds-averaged velocity magnitude");
    shading interp;
    colorbar;
    axis tight;
    axis equal;
    hold on;
    rectangle('Position', [-1, -0.5, 1, 1], 'Curvature', [1, 1]);
    
    figure();
    quiverC2D(Grid_x0_D, Grid_y0_D, U0_Ub, V0_Ub, 1);
    set(gca, 'XDir', 'reverse');
    title("Vector map");
    axis tight;
    axis equal;
    hold on;
    rectangle('Position', [-1, -0.5, 1, 1], 'Curvature', [1, 1]);

    figure();
    streamslice(Grid_x0_D, Grid_y0_D, U0_Ub, V0_Ub);
    set(gca, 'XDir', 'reverse');
    title("Streamlines");
    axis tight;
    axis equal;
    hold on;
    rectangle('Position', [-1, -0.5, 1, 1], 'Curvature', [1, 1]);

    x = Grid_x0_D(1, :);
    y = interp2(Grid_x0_D, Grid_y0_D, U0_Ub, x, zeros(1, length(x)));
    
    figure();
    plot(x, y, 'DisplayName', 'y = 0');
    hold on;
    plot(x, U0_Ub(2, :), 'DisplayName', 'y = 1.37');
    plot(x, U0_Ub(21, :), 'DisplayName', 'y = -1');
    legend('Location', 'best');
    title("U0/Ub profile along horizontal lines");
    xlabel('z [m]');
    ylabel('velocity [m/s]');
    grid on;
    
    x = Grid_y0_D(:, 1);
    y1 = interp2(Grid_x0_D, Grid_y0_D, U0_Ub, 0.5 * ones(length(x), 1), x);
    y2 = interp2(Grid_x0_D, Grid_y0_D, U0_Ub, 1.5 * ones(length(x), 1), x);
    
    figure();
    plot(x, y1, 'DisplayName', 'x = 0.5');
    hold on;
    plot(x, y2, 'DisplayName', 'x = 1.5');
    legend('Location', 'best');
    title("U0/Ub profile along vertical lines");
    xlabel('y [m]');
    ylabel('velocity [m/s]');
    grid on;
    
    [curlx, curly] = curl(Grid_x0_D, Grid_y0_D, U0_Ub, V0_Ub);
    
    figure();
    pcolor(Grid_x0_D, Grid_y0_D, curlx);
    set(gca, 'XDir', 'reverse');
    title("Reynolds-averaged x vorticity field");
    shading interp;
    colorbar;
    axis tight;
    axis equal;
    hold on;
    rectangle('Position', [-1, -0.5, 1, 1], 'Curvature', [1, 1]);
    streamslice(Grid_x0_D, Grid_y0_D, U0_Ub, V0_Ub);

    figure();
    pcolor(Grid_x0_D, Grid_y0_D, curly);
    set(gca, 'XDir', 'reverse');
    title("Reynolds-averaged y vorticity field");
    shading interp;
    colorbar;
    axis tight;
    axis equal;
    hold on;
    rectangle('Position', [-1, -0.5, 1, 1], 'Curvature', [1, 1]);
    streamslice(Grid_x0_D, Grid_y0_D, U0_Ub, V0_Ub);

    curl_magnitude = (curlx.^2 + curly.^2).^(1/2);
    
    figure();
    pcolor(Grid_x0_D, Grid_y0_D, curl_magnitude);
    set(gca, 'XDir', 'reverse');
    title("Reynolds-averaged vorticity field");
    shading interp;
    colorbar;
    axis tight;
    axis equal;
    hold on;
    rectangle('Position', [-1, -0.5, 1, 1], 'Curvature', [1, 1]);
    streamslice(Grid_x0_D, Grid_y0_D, U0_Ub, V0_Ub);
end

if print_urans
    [~, rear_x_index] = min(abs(Grid_x0_D(1,:) - (0.01)));
    [~, rear_upper_index] = min(abs(Grid_y0_D(:,1) - (0.49)));
    [~, rear_lower_index] = min(abs(Grid_y0_D(:,1) - (-0.59)));
    
    while Grid_x0_D(1,rear_x_index) <= 0.01
        rear_x_index = rear_x_index - 1;
    end
    while Grid_y0_D(rear_upper_index,1) >= 0.49
        rear_upper_index = rear_upper_index + 1;
    end
    while Grid_y0_D(rear_lower_index,1) <= -0.49
        rear_lower_index = rear_lower_index - 1;
    end
    
    rear_points_x = 1:rear_x_index;
    rear_points_y = rear_upper_index:rear_lower_index;
    starting_point = [13, 10];
    
    figure();
    x = linspace(0, 1499/50, 1499);
    y = squeeze(v0_Ub(starting_point(1), starting_point(2), :));
    plot(x, y);
    tt = append('v0/Ub at y = ', string(Grid_y0_D(starting_point(1), starting_point(2))), ", x = ", string(Grid_x0_D(starting_point(1), starting_point(2))), ".");
    title(tt);
    xlabel('t [s]');
    ylabel('velocity [m/s]');
    grid on;
    
    [freq, v0_Ub_fft] = fft_of_v0_Ub_velocity(y,50);
    figure();
    plot(freq, v0_Ub_fft);
    title('FFT transform of v0/Ub for a single point');
    xlabel('amplitude [m/s]');
    ylabel('frequency [Hz]');
    grid on;
    
    [~, vortex_shedding_freq_index] = max(v0_Ub_fft);
    vortex_shedding_freq = freq(vortex_shedding_freq_index);
    Sr=vortex_shedding_freq*D/Ub;
    disp('Strouhal number: ' + string(Sr));

    Sr_Fei = 0.225;
    disp('Literature Strouhal number: ' + string(Sr_Fei));

    figure();
    hold on;
    
    Sr_min = 1e6;
    Sr_max = -1e6;
    all_vortex_shedding_freq = zeros(22, 29);
    
    for i=1:29
        for j=1:22
            y = squeeze(v0_Ub(j, i, :));
            try
                [freq, v0_Ub_fft] = fft_of_v0_Ub_velocity(y,50);
                plot(freq, v0_Ub_fft);
                [~, new_vortex_shedding_freq_index] = max(v0_Ub_fft);
                new_vortex_shedding_freq = freq(new_vortex_shedding_freq_index);
                new_Sr=new_vortex_shedding_freq*D/Ub;
                all_vortex_shedding_freq(j, i) = new_vortex_shedding_freq;
    
                if new_Sr > Sr_max
                    Sr_max = new_Sr;
                end
                if new_Sr < Sr_min
                    Sr_min = new_Sr;
                end
            catch ME
                disp('Whole domain: excluding point ' + string(i) + '-' + string(j) + ' because of too many NaNs.');
            end
        end
    end

    title('FFT transform of v0/Ub for every point in the domain');
    xlabel('amplitude [m/s]');
    ylabel('frequency [Hz]');
    grid on;
    
    percentage_shift = (Sr_max - Sr_min) * 100 / Sr_max;
    disp('Percentage shift in Strouhal number (whole domain): ' + string(percentage_shift));
    
    figure();
    pcolor(Grid_x0_D, Grid_y0_D, all_vortex_shedding_freq);
    set(gca, 'XDir', 'reverse');
    title("Vortex shedding frequencies");
    shading interp;
    colorbar;
    axis tight;
    axis equal;
    hold on;
    rectangle('Position', [-1, -0.5, 1, 1], 'Curvature', [1, 1]);
    
    figure();
    hold on;

    Sr_min = 1e6;
    Sr_max = -1e6;
    
    for i=rear_points_x
        for j=rear_points_y
            y = squeeze(v0_Ub(j, i, :));
            try
                [freq, v0_Ub_fft] = fft_of_v0_Ub_velocity(y,50);
                plot(freq, v0_Ub_fft);
                [~, new_vortex_shedding_freq_index] = max(v0_Ub_fft);
                new_vortex_shedding_freq = freq(new_vortex_shedding_freq_index);
                new_Sr=new_vortex_shedding_freq*D/Ub;
    
                if new_Sr > Sr_max
                    Sr_max = new_Sr;
                end
                if new_Sr < Sr_min
                    Sr_min = new_Sr;
                end
            catch ME
                disp('Rear: excluding point ' + string(i) + '-' + string(j) + ' because of too many NaNs.');
            end
        end
    end
    
    title('FFT transform of v0/Ub for every point in the rear of the cylinder');
    xlabel('amplitude [m/s]');
    ylabel('frequency [Hz]');
    grid on;
    
    percentage_shift = (Sr_max - Sr_min) * 100 / Sr_max;
    disp('Percentage shift in Strouhal number (rear): ' + string(percentage_shift));
end

if record_videos
    close all;
    window_size =  round(0.2/vortex_shedding_freq*fs);
    u0_Ub_vid = movmean(u0_Ub, window_size, 3, 'omitnan');
    v0_Ub_vid = movmean(v0_Ub, window_size, 3, 'omitnan');

    % vel magnitude field, velocity vector field, streamslices, vorticity field at different time instants during a period.
    magnitudes_vid = sqrt(u0_Ub_vid.^2 + v0_Ub_vid.^2);
    makevideo(magnitudes_vid, Grid_x0_D, Grid_y0_D, vidHeight, vidWidth, [-1, 2.5439], [-1.1283, 1.4967], 'pcolor');

    makevideo({u0_Ub_vid, v0_Ub_vid}, Grid_x0_D, Grid_y0_D, vidHeight, vidWidth, [-1, 2.6107], [-1.1530, 1.5167], 'quiverC2D');

    makevideo({u0_Ub_vid, v0_Ub_vid}, Grid_x0_D, Grid_y0_D, vidHeight, vidWidth, [-1, 2.5314], [-1.1262, 1.5096], 'streamslice');

    curlx_vid = zeros(22, 29, 1499);
    curly_vid = zeros(22, 29, 1499);
    
    for i=1:1499
        [curlx_vid(:,:,i), curly_vid(:,:,i)] = curl(Grid_x0_D, Grid_y0_D, u0_Ub_vid(:,:,i), v0_Ub_vid(:,:,i));
    end

    makevideo(curlx_vid, Grid_x0_D, Grid_y0_D, vidHeight, vidWidth, [-1, 2.5439], [-1.1283, 1.5096], 'pcolor');

    makevideo(curly_vid, Grid_x0_D, Grid_y0_D, vidHeight, vidWidth, [-1, 2.5439], [-1.1283, 1.5096], 'pcolor');

    curl_magnitude_vid = (curlx_vid.^2 + curly_vid.^2).^(1/2);
    makevideo(curl_magnitude_vid, Grid_x0_D, Grid_y0_D, vidHeight, vidWidth, [-1, 2.5439], [-1.1283, 1.5096], 'pcolor');
end
    
   
    

    

