function importfile(importpath, suffix)

    data = load('-mat', importpath);
    
    vars = fieldnames(data);
    for i = 1:length(vars)
        assignin('base', append(vars{i}, suffix), data.(vars{i}));
    end
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
function plot_rolling_average(rolling_average_x, rolling_average_y, freq)

    titlename = append('Cumulative average of forces along x and y');
    sz = length(rolling_average_x);

    figure();
    x = linspace(0.1, sz/freq, sz);
    yyaxis left;
    semilogx(x, rolling_average_x, 'DisplayName', 'Force along x');
    xlabel('t [s]');
    ylabel('cumulative force [N]', 'Color', 'black');
    %set(gca, 'YColor', 'black');

    yyaxis right;
    semilogx(x, rolling_average_y, 'DisplayName', 'Force along y');
    %set(gca, 'YColor', 'black');

    start = find(~isnan(rolling_average_x), 1);

    if(start ~= 1)
        xline(x(start), '--', 'DisplayName', 'Only NaN values until this point');
    end

    title(titlename);
    legend('Location', 'best');
    ylabel('cumulative force [N]', 'Color', 'black');
    grid on;
end

close all;
clear;
clc;

plot_q3 = true;
plot_q5 = true;

B = 0.5;
D = 0.06;
L = 0.185;
t = 0.002;
b =  0.180;
h = 0.45;
hb = 0.18;
fs = 200;
Q = 75e-3;
rho = 998;
mu = 0.001;

% Question 1
nu = mu / rho;
Ub = Q / (B * h);
disp("Ub velocity: " + string(Ub));

% Ub ≈ Uinf 
Red = D * Ub / nu;
disp("Reynolds number: " + string(Red) + ".");

if Red > 5000 && Red < 3e5
    disp("Sub-critical regime.");
end

% Question 2
importfile('FORCEdata/FORCEdata_stillwater', '_s');
Fb = mean(Fy_s, 'omitnan');
Fb_sd = std(Fy_s, 'omitnan');
Fd_0 = mean(Fx_s, 'omitnan');
Fd_0_sd = std(Fx_s, 'omitnan');

disp(append('Buoyancy force Fb: ', string(Fb), '. Std. dev. of Fb: ', string(Fb_sd), '.'));
disp(append('Drag force in the still case Fd_0: ', string(Fd_0), '. Std. dev. of Fd_0: ', string(Fd_0_sd), '.'));

% Question 3
importfile('FORCEdata/FORCEdata_flow', '_f');

ra_Fx = rolling_average(Fx_f, 0.005, fs, 10, 'Fx');
ra_Fy = rolling_average(Fy_f, 0.005, fs, 10, 'Fy');

if plot_q3
    plot_rolling_average(ra_Fx, ra_Fy, fs);
end

Fd = ra_Fx(end);
Fl = ra_Fy(end) - Fb;
disp(append('Reynolds-averaged Fd and Fl: ', string(Fd), ', ', string(Fl), '.'));

% A cylinder oriented as in the present case can be considered to be a
% bluff body.
surface_area = L * D;
Cd = 2 * Fd / (rho * surface_area * Ub^2);
Cl = 2 * Fl / (rho * surface_area * Ub^2);

disp(append('Reynolds-averaged Cd and Cl: ', string(Cd), ', ', string(Cl), '.'));
disp('Reference value from the literature for Cd of a cylinder in the sub-critical regime: 1.22.');

% Question 4
% Done on paper

% QUestion 5
[freq, force_fft] = fft_of_force(Fy_f - Fb, fs);

if plot_q5
    figure;
    plot(freq, force_fft);
    xlabel('Frequency [Hz]');
    ylabel('Force [N]');
    title('Frequency spectrum of the lift force');
    grid on;
end

[~, index] = max(force_fft);
vortex_shedding_frequency = freq(index);
disp('Vortex-shedding frequency: ' + string(vortex_shedding_frequency));

Sr = vortex_shedding_frequency*D/Ub;
Sr_lit = 0.195;
disp(append('Strouhal number: ' + string(Sr), ', from literature: ', string(Sr_lit), '.'));

% Question 6
importfile('FORCEdata/FORCEdata_NatOsc', '');

[freq, force_fft] = fft_of_force(Dati(1,:), fs);
[~, index] = max(force_fft);
natural_fre1 = freq(index);

[freq, force_fft] = fft_of_force(Dati(2,:), fs);
[~, index] = max(force_fft);
natural_fre2 = freq(index);

disp(append('Natural frequency along y: ', string(natural_fre1), ', natural frequency along x: ', string(natural_fre2)));
