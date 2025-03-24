clc

% Question 2
% Import the data
importfile('tutto.mat')
importfile('5meters.mat')
importfile('ff.mat')

% Remove the last three cells since numerical values there are not valid
east_faces = squeeze(Z_H(1,1:end-3));
centerline_velocities = squeeze(W1(1,1,1:end-3));

% Compute the incremental ratio of the centerline velocity 
% (where we reach the maximum speed) in order to obtain a quantitative 
% criterion to understand where the flow becomes fully developed
differences = centerline_velocities(2:end) - centerline_velocities(1:end-1);
incremental_ratio = differences / (east_faces(2) - east_faces(1));

% Plot the velocity and the incremental ratio
hold on
xlabel("Length along the z axis [m]");
ylabel("Velocity along the z axis [m/s]");
title("Quantitative entry-lenght criterion");
legend();
plot(east_faces,centerline_velocities,'DisplayName','Centerline velocity','LineWidth',2)
plot(east_faces(2:end),incremental_ratio,'DisplayName','Incremental ratio','LineWidth',2)

% Define a threshold in order to find the lenght where the flow becomes
% fully developed
fd_threshold = 0.01;
yline(fd_threshold,'DisplayName','Threshold');
simul_length = max(size(centerline_velocities));
fd_line = find(incremental_ratio <= fd_threshold, 1);

if fd_line < simul_length
    label=['Entry length = ' num2str(east_faces(fd_line))];
    xline(east_faces(fd_line),'--','DisplayName',label);
    disp("Fully developed flow reached at z = " + east_faces(fd_line));
else
    disp("Fully developed flow not reached!");
end

% Compute the Raynolds number
d = 150*1e-3;
Wb = 0.45;
nu = 3.5*1e-4;

Re = (Wb*d)/nu;
%disp("Raynolds bulk number Re = " +Re);

% Hagen-Poiseville
Lhp = 0.06*Re*d;
disp("Entry length for Hagen-Poiseville = " +Lhp);

% Atkinson
La = (0.59 + 0.056*Re)*d;
disp("Entry length for Atkinson = " +La);

% Dombrowski
Ld = (0.379*exp(-0.148*Re) + 0.055*Re + 0.26)*d;
disp("Entry length for Dombrowski = " +Ld);

% Durst
Ldu = ((0.619^(1.6) + (0.0567*Re)^(1.6))^(1/(1.6)))*d;
disp("Entry length for Durst = " +Ldu);

Lxtheory = [Lhp,La,Ld,Ldu];
Lytheory = zeros(4);
colors = ["#062440", "#005A7C", "#87B9F5", "#FF7D17"];
names = ["Hagen-Poiseville","Atkinson","Dombrowski","Durst"];

for i = 1:4
plot(Lxtheory(i),Lytheory(i),'o','MarkerSize',7,'MarkerfaceColor', colors(i),'MarkerEdgeColor',colors(i),'DisplayName',names(i));
end

figure();
hold on
yline(0.8996,'DisplayName','W in fully developed state','Color','green');
z = linspace(5/100,5,100);
plot(z(1:end-3),squeeze(W1_5(1,1,1:end-3)),'DisplayName','Centerline velocity with L=2.5 m','LineWidth',2)
plot(east_faces,centerline_velocities,'DisplayName','Centerline velocity with L=5 m','LineWidth',2)
legend();
grid on;
ylim([0,1.1]);
hold off

% Question 4

% Display all the plots
figure;

% Preprocess the data in order to lose the negligible dimensions and cut
% the last cells that can give numerical problems
z_margin = 3;
y_margin = 5;
Z_H=squeeze(Z_H(1,1:end-z_margin));
Z_H_z2=squeeze(Z_H_z2(1,1:end-z_margin));
Z_H_z3=squeeze(Z_H_z3(1,1:end-z_margin));

Y_N=squeeze(Y_N);
Y_N_y2=squeeze(Y_N_y2);
Y_N_y3=squeeze(Y_N_y3);

Y_N_yp1=squeeze(Y_N_yp1(1,1:end-y_margin));
Y_N_yp2=squeeze(Y_N_yp2(1,1:end-y_margin));
Y_N_yp3=squeeze(Y_N_yp3(1,1:end-y_margin));
Y_N_yp4=squeeze(Y_N_yp4(1,1:end-y_margin));
Y_N_yp5=squeeze(Y_N_yp5(1,1:end-y_margin));
Y_N_yp6=squeeze(Y_N_yp6(1,1:end-y_margin));
Y_N_yp7=squeeze(Y_N_yp7(1,1:end-y_margin));
Y_N_yp8=squeeze(Y_N_yp8(1,1:end-y_margin));
Y_N_yp9=squeeze(Y_N_yp9(1,1:end-y_margin));
Y_N_yp10=squeeze(Y_N_yp10(1,1:end-y_margin));


P1=squeeze(P1(1,1,1:end-3));
P1_z2=squeeze(P1_z2(1,1,1:end-z_margin));
P1_z3=squeeze(P1_z3(1,1,1:end-z_margin));

W1=squeeze(W1(1,1,1:end-3));
W1_z2=squeeze(W1_z2(1,1,1:end-z_margin));
W1_z3=squeeze(W1_z3(1,1,1:end-z_margin));

z_plot_coordinate = 2.2;

[~, z_plot_index] = min(abs(Z_H - z_plot_coordinate));

DWDY=squeeze(DWDY(1,:,z_plot_index));
DWDY_y2=squeeze(DWDY_y2(1,1:end,z_plot_index));
DWDY_y3=squeeze(DWDY_y3(1,1:end,z_plot_index));

DWDY_yp1=squeeze(DWDY_yp1(1,1:end-5,z_plot_index));
DWDY_yp2=squeeze(DWDY_yp2(1,1:end-5,z_plot_index));
DWDY_yp3=squeeze(DWDY_yp3(1,1:end-5,z_plot_index));
DWDY_yp4=squeeze(DWDY_yp4(1,1:end-5,z_plot_index));
DWDY_yp5=squeeze(DWDY_yp5(1,1:end-5,z_plot_index));
DWDY_yp6=squeeze(DWDY_yp6(1,1:end-5,z_plot_index));
DWDY_yp7=squeeze(DWDY_yp7(1,1:end-5,z_plot_index));
DWDY_yp8=squeeze(DWDY_yp8(1,1:end-5,z_plot_index));
DWDY_yp9=squeeze(DWDY_yp9(1,1:end-5,z_plot_index));
DWDY_yp10=squeeze(DWDY_yp10(1,1:end-5,z_plot_index));

% Plot the pressure with respect to z three times with different refinment
% level with a cylindrical mesh without power law
subplot(3, 1, 1);
hold on;
plot(Z_H,P1, 'DisplayName', 'Pressure z1');
plot(Z_H_z2,P1_z2, 'DisplayName', 'Pressure z2');
plot(Z_H_z3,P1_z3, 'DisplayName', 'Pressure z3');
title('Pressure');
legend show;
hold off;

% Plot the z-velocity with respect to z three times with different refinment
% level with a cylindrical mesh without power law
subplot(3, 1, 2);
hold on;
plot(Z_H, W1, 'DisplayName', 'W1 z1');
plot(Z_H_z2, W1_z2, 'DisplayName', 'W1 z2');
plot(Z_H_z3, W1_z3, 'DisplayName', 'W1 z3');
title('z-velocity');
legend show;
hold off;

% Plot the derivative of the z-velocity with respect to y three times with different refinment
% level with a cylindrical mesh
subplot(3, 1, 3);
hold on;
plot(Y_N, DWDY, 'DisplayName', 'DWDY y1');
plot(Y_N_y2, DWDY_y2, 'DisplayName', 'DWDY y2');
plot(Y_N_y3, DWDY_y3, 'DisplayName', 'DWDY y3');
plot(Y_N_yp1, DWDY_yp1, 'DisplayName', 'DWDY yp1');
plot(Y_N_yp2, DWDY_yp2, 'DisplayName', 'DWDY yp2');
title('DWDY');
legend show;
hold off;

% Compute the L1-norm in order to confirm the grid indipendence

% L1-norm for the pressure
P1_z2_interp = interp1(Z_H_z2,P1_z2,Z_H,'linear');
P1_z3_interp = interp1(Z_H_z3,P1_z3,Z_H,'linear');
L1_norm = sum(abs(P1 - P1_z2_interp'))/max(size(Z_H));
disp("L1-norm of P1 with z1 and P1 with z2 = " +L1_norm);
L1_norm = sum(abs(P1_z3_interp' - P1_z2_interp'))/max(size(Z_H));
disp("L1-norm of P1 with z2 and P1 with z3 = " +L1_norm);
L1_norm = sum(abs(P1_z3_interp' - P1))/max(size(Z_H));
disp("L1-norm of P1 with z1 and P1 with z3 = " +L1_norm);

% L1-norm for the velocity
W1_z2_interp = interp1(Z_H_z2,W1_z2,Z_H,'linear');
W1_z3_interp = interp1(Z_H_z3,W1_z3,Z_H,'linear');
L1_norm = sum(abs(W1 - W1_z2_interp'))/max(size(Z_H));
disp("L1-norm of W1 with z1 and W1 with z2 = " +L1_norm);
L1_norm = sum(abs(W1_z3_interp' - W1_z2_interp'))/max(size(Z_H));
disp("L1-norm of W1 with z2 and W1 with z3 = " +L1_norm);
L1_norm = sum(abs(W1_z3_interp' - W1))/max(size(Z_H));
disp("L1-norm of W1 with z1 and W1 with z3 = " +L1_norm);

% L1-norm for DWDY without the power law
DWDY_y2_interp = interp1(Y_N_y2,DWDY_y2,Y_N,'linear');
DWDY_y3_interp = interp1(Y_N_y3,DWDY_y3,Y_N,'linear');
L1_norm = sum(abs(DWDY(1:end-1) - DWDY_y2_interp(1:end-1)))/max(size(Y_N));
disp("L1-norm of DWDY with y1 and DWDY with y2 = " +L1_norm);
L1_norm = sum(abs(DWDY_y3_interp(1:end-1) - DWDY_y2_interp(1:end-1)))/max(size(Y_N));
disp("L1-norm of DWDY with y2 and DWDY with y3 = " +L1_norm);
L1_norm = sum(abs(DWDY_y3_interp(1:end-1) - DWDY(1:end-1)))/max(size(Y_N));
disp("L1-norm of DWDY with y1 and DWDY with y3 = " +L1_norm);

% L1-norm for DWDY with the power law
DWDY_yp2_interp = interp1(Y_N_yp2,DWDY_yp2,Y_N_yp1,'linear');
L1_norm = sum(abs(DWDY_yp1(1:end-1) - DWDY_yp2_interp(1:end-1)))/max(size(Y_N_yp1));
disp("L1-norm of DWDY with yp1 and DWDY with yp2 = " +L1_norm);

% L1-norm for DWDY with and without the power law
DWDY_y3_pinterp = interp1(Y_N_y3,DWDY_y3,Y_N_yp1,'linear');
L1_norm = sum(abs(DWDY_y3_pinterp(1:end-1) - DWDY_yp2_interp(1:end-1)))/max(size(Y_N_yp1));
disp("L1-norm of DWDY with y3 and DWDY with yp2 = " +L1_norm);

y_plot_coordinate = 0.07;

[~, y_plot_index] = min(abs(Y_N - y_plot_coordinate));
[~, y_plot_index_y2] = min(abs(Y_N_y2 - y_plot_coordinate));
[~, y_plot_index_y3] = min(abs(Y_N_y3 - y_plot_coordinate));
[~, y_plot_index_yp1] = min(abs(Y_N_yp1 - y_plot_coordinate));
[~, y_plot_index_yp2] = min(abs(Y_N_yp2 - y_plot_coordinate));
[~, y_plot_index_yp3] = min(abs(Y_N_yp3 - y_plot_coordinate));
[~, y_plot_index_yp4] = min(abs(Y_N_yp4 - y_plot_coordinate));
[~, y_plot_index_yp5] = min(abs(Y_N_yp5 - y_plot_coordinate));
[~, y_plot_index_yp6] = min(abs(Y_N_yp6 - y_plot_coordinate));
[~, y_plot_index_yp7] = min(abs(Y_N_yp7 - y_plot_coordinate));
[~, y_plot_index_yp8] = min(abs(Y_N_yp8 - y_plot_coordinate));
[~, y_plot_index_yp9] = min(abs(Y_N_yp9 - y_plot_coordinate));
[~, y_plot_index_yp10] = min(abs(Y_N_yp10 - y_plot_coordinate));

% Plot the variable of interest (W,P,DWDY) with resect to the refinment level
figure;
z_refinment = [100, 250, 500];
zthreshold = 2.1;
ythreshold = 0.0416667;
probe_pressure = [P1(find(Z_H >= zthreshold, 1)), P1_z2(find(Z_H_z2 >= zthreshold,1)), P1_z3(find(Z_H_z3 >= zthreshold,1))];
probe_velocity = [W1(find(Z_H >= zthreshold, 1)), W1_z2(find(Z_H_z2 >= zthreshold,1)), W1_z3(find(Z_H_z3 >= zthreshold,1))];
y_refinment = [20, 25, 26, 30, 35, 40, 45, 50, 50, 55, 60, 80, 100];
DWDY_wall = [DWDY_yp1(y_plot_index_yp1), DWDY_yp2(y_plot_index_yp2), DWDY(y_plot_index), DWDY_yp3(y_plot_index_yp3), DWDY_yp4(y_plot_index_yp4), DWDY_yp5(y_plot_index_yp5), DWDY_yp6(y_plot_index_yp6), DWDY_y2(y_plot_index_y2), DWDY_yp7(y_plot_index_yp7), DWDY_yp8(y_plot_index_yp8), DWDY_yp9(y_plot_index_yp9), DWDY_yp10(y_plot_index_yp10), DWDY_y3(y_plot_index_y3)];
DWDY_strangepoint = [DWDY_yp1(find(Y_N_yp1 >= ythreshold, 1)), DWDY_yp2(find(Y_N_yp2 >= ythreshold, 1)), DWDY(find(Y_N >= ythreshold, 1)), DWDY_yp3(find(Y_N_yp3 >= ythreshold, 1)), DWDY_yp4(find(Y_N_yp4 >= ythreshold, 1)), DWDY_yp5(find(Y_N_yp5 >= ythreshold, 1)), DWDY_yp6(find(Y_N_yp6 >= ythreshold, 1)), DWDY_y2(find(Y_N_y2 >= ythreshold, 1)), DWDY_yp7(find(Y_N_yp7 >= ythreshold, 1)), DWDY_yp8(find(Y_N_yp8 >= ythreshold, 1)), DWDY_yp9(find(Y_N_yp9 >= ythreshold, 1)), DWDY_yp10(find(Y_N_yp10 >= ythreshold, 1)), DWDY_y3(find(Y_N_y3 >= ythreshold, 1))];

subplot(2,2,1)
for i = 1:max(size(z_refinment))
    scatter(z_refinment(i),probe_pressure(i),60,'filled');
    hold on
end
grid on
xlabel('Refinment level'); 
ylabel('Pressure at the probe');

subplot(2,2,2);
for i = 1:max(size(z_refinment))
    scatter(z_refinment(i),probe_velocity(i),60,'filled');
    hold on
end 
grid on
xlabel('Refinment level'); 
ylabel('Z-velocity at the probe');

subplot(2,2,3);
for i = 1:max(size(DWDY_wall))
        if (i == 1 || i == 2 || i == 7 || i == 4 || i == 5 || i == 6 || i == 9 || i == 10 || i == 11 || i == 12)
           scatter(y_refinment(i),DWDY_wall(i),60);
        else
           scatter(y_refinment(i),DWDY_wall(i),60,'filled');
        end

    hold on
end 
grid on
xlabel('Refinment level'); 
ylabel('DWDY at the wall');

subplot(2,2,4);
for i = 1:max(size(DWDY_wall))
        if (i == 1 || i == 2 || i == 7 || i == 4 || i == 5 || i == 6 || i == 9 || i == 10 || i == 11 || i == 12)
           scatter(y_refinment(i),DWDY_strangepoint(i),60);
        else
           scatter(y_refinment(i),DWDY_strangepoint(i),60,'filled');
        end

    hold on
end 
grid on
xlabel('Refinment level'); 
ylabel('DWDY at y = 0.0416667');

hold off

% Question 5

% Check the equivalence between the theoretical pressure gradient and the
% exact pressure gradient
DpDZ_exact = -203.84;
DpDZ_predicted = P1_y2(find(Z_H >= east_faces(fd_line), 1)) - P1_y2(end);

if(DpDZ_exact/2 - DpDZ_predicted < 0.01)
    disp("The solution predicted for DpDZ is correct!");
else
    disp("The solution predicted for DpDZ is not correct!");
end

% Check the equivalence between the theoretical z-velocity profile along y 
% and the exact one 
mu = 0.3185;
W_exact = @(r) -(1/(4*mu))*DpDZ_exact.*((d/2)^2 - r.^2); 

% Qualitative check with the plots
figure();
subplot(2,1,1);
plot(Y_N_y2,W_exact(Y_N_y2),'DisplayName','z-velocity theoretical');
title('z-velocity');
xlabel("Length along the y axis [m]");
ylabel("Velocity [m/s]");
hold on
plot(Y_N_y2,W1_y2(1,:,find(Z_H >= east_faces(fd_line), 1)),'DisplayName','z-velocity experimental');
xlabel("Length along the y axis [m]");
ylabel("Velocity [m/s]");
legend();
hold off

% Quantitative check with the L1-norm
L1_norm = sum(abs(W_exact(Y_N_y2(1,:)) - W1_y2(1,:,find(Z_H >= east_faces(fd_line), 1))))/max(size(Y_N_y2));
disp("L1-norm of W_exact and W_predicted = " +L1_norm);

% Check the equivalence between the theoretical shear stress and the
% predicted shear stress
shear_stress_exact = @(r) -DpDZ_exact*0.5*r;
shear_stress_predicted = -mu*DWDY_y2;

subplot(2,1,2);
plot(Y_N_y2,shear_stress_exact(Y_N_y2),'DisplayName','shear stress theoretical');
title('shear stress');
xlabel("Length along the y axis [m]");
ylabel("shear stress");
hold on
plot(Y_N_y2,shear_stress_predicted(1,:),'DisplayName','shear stress experimental');
xlabel("Length along the y axis [m]");
ylabel("shear stress");
legend();
hold off

% Quantitative check with the L1-norm
L1_norm = sum(abs(shear_stress_exact(Y_N_y2(1,:)) - shear_stress_predicted(1,1:end)))/max(size(Y_N_y2));
disp("L1-norm of shear_stress_exact and shear_stress_predicted = " +L1_norm);


% Question 6
rho = 910;
f_exact = 64/Re;
f_predicted = (8*shear_stress_predicted(1,end))/(rho*Wb^2);

if(f_exact - f_predicted < 0.01)
    disp("The solution predicted for f is correct (Wb = 0.45, d = 0.15, threshold = 1%)!");
else
    disp("The solution predicted for f is not correct (Wb = 0.45, d = 0.15, threshold = 1%)!");
end


Wb2 = 0.55;
d2 = 0.25;
Re2 = (Wb2*d2)/nu;
f_exact = 64/Re2;
shear_stress_predicted = -mu*DWDY_1;
f_predicted = (8*shear_stress_predicted(1,end))/(rho*Wb2^2);

if(f_exact - f_predicted < 0.01)
    disp("The solution predicted for f is correct (Wb = 0.55, d = 0.25, threshold = 1%)!");
else
    disp("The solution predicted for f is not correct (Wb = 0.55, d = 0.25, threshold = 1%)!");
end

Wb3 = 0.7;
d3 = 0.4;
Re3 = (Wb3*d3)/nu;
f_exact = 64/Re3;
shear_stress_predicted = -mu*DWDY_2;
f_predicted = (8*shear_stress_predicted(1,end))/(rho*Wb3^2);

if(f_exact - f_predicted < 0.01)
    disp("The solution predicted for f is correct (Wb = 0.7, d = 0.4, threshold = 1%)!");
else
    disp("The solution predicted for f is not correct (Wb = 0.7, d = 0.4, threshold = 1%)!");
end

Wb4 = 1;
d4 = 0.6;
Re4 = (Wb4*d4)/nu;
f_exact = 64/Re4;
shear_stress_predicted = -mu*DWDY_3;
f_predicted = (8*shear_stress_predicted(1,end))/(rho*Wb4^2);

if(f_exact - f_predicted < 0.01)
    disp("The solution predicted for f is correct (Wb = 1, d = 0.6, threshold = 1%)!");
else
    disp("The solution predicted for f is not correct (Wb = 1, d = 0.6, threshold = 1%)!");
end