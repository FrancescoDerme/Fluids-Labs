close all
clear
clc

format longg;

function [rolling_average_series, time_of_acquisition] = rolling_average(data_series, margin_of_stability, conv_width, id)
    rolling_sum = 0;
    sz = length(data_series);
    rolling_average_series = zeros(sz, 1);

    for i = 1:sz
        rolling_sum = rolling_sum + data_series(i);
        rolling_average_series(i) = rolling_sum / i;
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

    time_of_acquisition = (sz - stable_region_width)/100;

    if stable_region_width < conv_width
        warning = append('Attention: experiment ', id, ' might not be converged! Stable region duration: ', string(sz/100 - time_of_acquisition), '[s].');
        disp(warning);
    end
end

function plot_rolling_average(rolling_average, suffix)
    titlename = append('Cumulative voltage average of test ', suffix);
    sz = length(rolling_average);
    
    figure();
    x = linspace(0.1, sz/100, sz);
    semilogx(x, rolling_average);

    title(titlename);
    xlabel('t [s]');
    ylabel('cumulative voltage [V]');
    grid on;
end

voltages = cell(16, 1);
rolling_averages = cell(16, 1);
acquisition_times = zeros(16, 1);
V0s = zeros(16, 1);
Fstar = [0.000, -0.314, -0.411, -0.695, -0.891, -1.186, -1.676, -2.656, -5.598, -10.501, 0.126, 1.097, 2.078, 4.039, 8.942, 13.845];

for i = 1:16
    suffix = int2str(i);
    if isscalar(suffix)
        suffix = append('0', suffix);
    end

    importpath = append('raw-acquisition-data/calibr', suffix);

    data = load('-mat', importpath);
    voltages{i} = data.V;

    [rolling_averages{i}, acquisition_times(i)] = rolling_average(voltages{i}, 0.005, 1000, suffix);
    V0s(i) = rolling_averages{i}(end);

    %plot_rolling_average(rolling_averages{i}, suffix);
end

clear importpath;
clear suffix;
clear data;

% Linear regression
x = [ones(length(Fstar), 1), Fstar'];
b = x\V0s;

b(1) = -b(1)/b(2);
b(2) = 1/b(2);
x = [ones(length(V0s), 1), V0s];
y = x * b;

U1 = max(abs(Fstar' - y));
disp('U1: ' + string(U1));

sf_squared = 1/14 * sum((y - Fstar') .* (y - Fstar'));
U2 = 2 * sqrt(sf_squared);
disp('U2: ' + string(U2));

figure();
hold on;
scatter(V0s, Fstar);
plot(V0s, y,'--');
plot(V0s, y + U1,'--');
plot(V0s, y - U1,'--');
legend('$V_0$ vs $F^*$', 'Transer function: from $V_0$ to $\widetilde{F}$', '$95\%$ confidence lower bound', '$95\%$ confidence upper bound', 'Interpreter', 'latex', 'Location','best');
ylabel('Force [N]');
xlabel('Voltage [V]');
title('Relation between voltage and force')
grid on;
hold off;

squared_error = sum((Fstar' - y) .* (Fstar' - y));
disp('squared_error: ' + string(squared_error));

% Resolution
voltage_res = 1e6;
for i=1:16
    for j=1:16
        if i~=j
            voltage_res = min(voltage_res, abs(V0s(i) - V0s(j)));
        end
    end
end

disp('Resolution in terms of voltage ' + string(voltage_res));

force_res = 1e6;
for i=1:16
    for j=1:16
        if i~=j
            force_res = min(force_res, abs(y(i) - y(j)));
        end
    end
end

disp('Resolution in terms of force ' + string(force_res));

% Linear regression for the acquisition times
x = [ones(length(Fstar), 1), Fstar'];
b = x\acquisition_times;

x1 = linspace(min(Fstar), max(Fstar), 30);
p = polyfit(Fstar, acquisition_times, 3);
y = polyval(p, x1);

figure();
hold on;
scatter(Fstar, acquisition_times);
plot(Fstar, x * b,'--');
plot(x1, y,'--');
legend('$F^*$ vs acquisition times', 'Linear transer function: from $F^*$ to acquisition times', 'Cubic transer function: from $F^*$ to acquisition times', 'Interpreter', 'latex', 'Location','best');
ylabel('Time [s]');
xlabel('Force [N]');
title('Relation between force and time of acquisition')
grid on;
hold off;