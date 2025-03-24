clc
clear
close all

% Testcase data
% '6.mat' for wall-function, 'lowre1.mat' or 'lowre2.mat' for low-Re
import_directory = '6.mat';
importfile(import_directory);

if strcmp(import_directory, '6.mat')
    importfile('3meters.mat');
else
    importfile('3meterslowre.mat');
end

% Testcase setting
D = 0.1;
R = D / 2;
Wb = 0.75;
nu = 1e-6;
rho = 998.23;
mu = rho * nu;
[~, probe_zlocation_index] = min(abs(Z_C(1,:) - 5));

% Preliminary calculations
% Question 1: compute the Raynolds number
Re = (Wb*D)/nu;
disp("Raynolds bulk number Re = " +Re);

% Question 2: fully developed flow
% Remove the last three cells since numerical values there are not valid
east_faces = squeeze(Z_H(1,1:end-3));
centerline_velocities = squeeze(W1(1,1,1:end-3));

% Compute the incremental ratio of the centerline velocity 
% (where we reach the maximum speed) in order to obtain a quantitative 
% criterion for the entry length
differences = centerline_velocities(2:end) - centerline_velocities(1:end-1);
incremental_ratio = differences / (east_faces(2) - east_faces(1));

% Plot the velocity and the incremental ratio
hold on
xlabel("z [m]");
ylabel("W [m/s]");
title("Quantitative entry-lenght criterion");
legend();
plot(east_faces,centerline_velocities,'DisplayName','Centerline velocity')
plot(east_faces(2:end),abs(incremental_ratio),'DisplayName','Incremental ratio')

% Define a threshold in order to find the lenght where the flow becomes
% fully developed.
fd_threshold = 0.01;
yline(fd_threshold,'DisplayName','Threshold');
simul_length = max(size(centerline_velocities));

if strcmp(import_directory, '6.mat')
    number_of_lines = 2;
else
    number_of_lines = 4;
end

fd_line = find(abs(incremental_ratio) <= fd_threshold, number_of_lines);
fd_line = fd_line(end);

if fd_line < simul_length
    label=['Entry length = ' num2str(east_faces(fd_line))];
    xline(east_faces(fd_line),'--','DisplayName',label);
    disp("Custom quantitative criterion: fully developed flow reached at z = " + east_faces(fd_line));
else
    disp("Fully developed flow not reached!");
end

% LAMINAR
% Hagen-Poiseville
Lhp = 0.06*Re*D;
disp("Laminar entry length according to Hagen-Poiseville = " +Lhp);

% Atkinson
La = (0.59 + 0.056*Re)*D;
disp("Laminar entry length according to Atkinson = " +La);

% Dombrowski
Ldo = (0.379*exp(-0.148*Re) + 0.055*Re + 0.26)*D;
disp("Laminar entry length according to Dombrowski = " +Ldo);

% Durst
Ldu = ((0.619^(1.6) + (0.0567*Re)^(1.6))^(1/(1.6)))*D;
disp("Laminar entry length according to Durst = " +Ldu);

% TURBULENT
% Yunus
Ly = (1.359*(Re)^(1/4))*D;
disp("Turbulent entry length according to Yunus = " +Ly);

% Prandtl-Karman
Lpk = 4.4*(Re^(1/6))*D;
disp("Turbulent entry length according to Prandtl-Karman = " +Lhp);

% Nikurades
Ln = 40*D;
disp("Turbulent entry length according to Nikurades = " +La);

% Lien at. Al
Ld = 150*D;
disp("Turbulent entry length according to Lien at. Al = " +Ld);

Lxtheory = [Ly,Lpk,Ln];
Lytheory = zeros(4);
colors = ["#092470","#A62440", "#3C5A7C"];
names = ["Yunus","Prandtl-Karman","Nikurades"];

for i = 1:3 
plot(Lxtheory(i),Lytheory(i),'o','MarkerSize',7,'MarkerfaceColor', colors(i),'MarkerEdgeColor',colors(i),'DisplayName',names(i));
end
hold off

figure();
hold on
z = linspace(3/100,3,100);
yline(W1(1,1,end-3), '--', 'DisplayName','Centerline velocity in fully developed state');
plot(east_faces,centerline_velocities,'DisplayName','Centerline velocity with L = 6m')
plot(z(1:end-3),squeeze(W1_3meters(1,1,1:end-3)),'DisplayName','Centerline velocity with L = 3m')
legend();
grid on;
ylabel('Centerline velocity [m/s]')
xlabel('z [m]')
axis([min(east_faces) max(east_faces) 0 1.1]);
hold off

figure();
hold on;
plot(1, Ly / D, 'o', 'DisplayName', 'Turbulent by Yunus');
plot(1, Lpk / D, 'o', 'DisplayName', 'Turbulent by Prandtl-Karman');
plot(1, Ln / D, 'o', 'DisplayName', 'Turbulent by Nikurades');
plot(1, Ld / D, 'o', 'DisplayName', 'Turbulent by Lien at. Al');
plot(2, Lhp / D, 'o', 'DisplayName', 'Laminar by Hagen-Poiseville');
plot(2, La / D, 'o', 'DisplayName', 'Laminar by Atkinson');
plot(2, Ldo / D, 'o', 'DisplayName', 'Laminar by Dombrowski');
plot(2, Ldu / D, 'o', 'DisplayName', 'Laminar by Durst');
title('Entry length criteria: laminar vs turbulent');
set(gca,'xtick',[]);
axis([0.75, 2.25, 20, 4600]);
ylabel('Entry length [m]')
legend('Location', 'northwest');
grid on;
hold off;

% Inspection of the CFD solution and assessment of its physical consistency
centers_along_z = squeeze(Z_C(1,1:end-3));
centers_along_y = squeeze(Y_C(1,:));
north_faces = squeeze(Y_N(1,:));

figure();

% Pstar along the axis of the pipe
centerline_pstar = squeeze(P1(1,1,1:end-3));

subplot(2,3,1);
hold on;
xlabel("z [m]");
ylabel("P* along z [P]");
title("P* along the axis of the pipe");
plot(centers_along_z, centerline_pstar)
grid on;
hold off;

% Profile of the Reynolds average velocity along the pipe radius
% 1) W/Wb versus r/R
W_y = squeeze(W1(1,:,probe_zlocation_index));

subplot(2,3,2);
hold on;
xlabel("r/R [adim]");
ylabel("R.a. W/Wb along y [adim]");
title("Adim. R.a. velocity along the radius");
plot(centers_along_y / R, W_y / Wb);
grid on;
hold off;

% 2) w+ versus y+ (log-log)
distance_from_wall = R - centers_along_y;
friction_velocity = (STRS(1,end,:)).^(1/2);
y_plus_along_y = distance_from_wall * friction_velocity(probe_zlocation_index) / nu;
w_plus = W_y / friction_velocity(probe_zlocation_index);

subplot(2,3,3);
hold on;
xlabel("y+ = (R - r) * w_{\tau} / \nu [adim]");
ylabel("R.a. w+ = W/w_{\tau} along y [adim]");
title("Adim. R.a. velocity along the radius");
loglog(y_plus_along_y, w_plus);
grid on;
hold off;

% Profile of the total shear stresses and of its components along the pipe
% radius in dimentionless form

% We are using the wall function approach with the wall function of
% L&S, we have y+ > 30, hence we are in the log branch of the velocity
% profile. This implies that the wall-shear stress cannot be evaluated
% starting from W1.
tau_w = STRS(1,end,:) * rho;
tau_w_probe = tau_w(probe_zlocation_index);

DWDY_probe = squeeze(DWDY(1,:,probe_zlocation_index));
tau_visc = mu * DWDY_probe;

EP_probe = squeeze(EP(1,:,probe_zlocation_index));
KE_probe = squeeze(KE(1,:,probe_zlocation_index));

% The following are 2 different ways to calculate mu_turb at the probe,
% the pseudo L1 norm of their difference is 1.8723e-04.
% mu_turb_probe = 0.09 * rho * KE_probe.* KE_probe ./ EP_probe;
mu_turb_probe = squeeze(ENUT(1,:,probe_zlocation_index)) * rho;

tau_re = mu_turb_probe .* DWDY_probe;
tau_tot = tau_visc + tau_re;

% The viscous sublayer boundary is found at y+ = 5
viscous_sublayer_boundary = R - 5 * nu / friction_velocity(probe_zlocation_index);

subplot(2,3,4);
hold on;
xlabel("r/R [adim]");
ylabel("stresses [adim]");
title("Adim. shear stresses along the radius");
plot(centers_along_y / R, tau_re / tau_w_probe,'DisplayName','\tau_{re}/\tau_w');
plot(centers_along_y / R, tau_visc / tau_w_probe,'DisplayName','\tau_{visc}/\tau_w');
plot(centers_along_y / R, tau_tot / tau_w_probe,'DisplayName','\tau/\tau_w');
xline(viscous_sublayer_boundary / R, '--', 'DisplayName','Viscous sublayer (y+ = 5)');
legend('Location', 'southwest')
grid on;
hold off;

% Profile of the turbulent kinetic energy along the pipe radius in dimensionless form
subplot(2,3,5);
hold on;
xlabel("r/R [adim]");
ylabel("k/W_b^2 [adim]");
title("Adim. turbulent kinetic energy along the radius");
plot(centers_along_y / R, KE_probe / Wb^2);
grid on;
hold off;

% Profile of the turbulent dissipation rate along the pipe radius in dimensionless form
subplot(2,3,6);
hold on;
xlabel("r/R [adim]");
ylabel("\epsilon*R/W_b^3 [adim]");
title("Adim. turbulent dissipation rate along the radius");
plot(centers_along_y / R, EP_probe * R / Wb^3);
grid on;
hold off;

% Numerical convergence
% Variables to test grid-independence on: Pstar, W, dW/dY, k, epsilon

% Wall-function approach
% Base refinement: 1, 30 + 1, 100 (the extra region is
% treated separately in phoenics and made larger to ensure yplus > 30).
% To be specific, the last cell goes from r =  0.0475 to the wall for all
% refinement levels.
% ref1 : 1, 60 + 1, 100
% ref2: 1, 90 + 1, 100
% ref3: 1, 30 + 1, 150
% ref4: 1, 30 + 1, 200
% ref5: 1, 60 + 1, 150

% Low-Re approach
% The region from r =  0.0475 to the wall is divided into 30 cells for all
% refinement levels in order to ensure that yplus is about 1.
% Base refinement: 1, 30 + 30, 100
% ref1 : 1, 60 + 30, 100
% ref2: 1, 90 + 30, 100
% ref3: 1, 30 + 30, 150
% ref4: 1, 30 + 30, 200
% ref5: 1, 60 + 30, 150

if strcmp(import_directory, '6.mat')
    importfile('ref1var.mat');
    importfile('ref2var.mat');
    importfile('ref3var.mat');
    importfile('ref4var.mat');
    importfile('ref5var.mat');
else
    importfile('ref1lowrevar.mat');
    importfile('ref2lowrevar.mat');
    importfile('ref3lowrevar.mat');
    importfile('ref4lowrevar.mat');
    importfile('ref5lowrevar.mat');
end

% Preprocess the data in order to lose the negligible dimensions and cut
% the cells that can give numerical problems
z_margin = 3;
y_margin = 0;
east_faces_ref1 = squeeze(Z_H_ref1(1,1:end-z_margin));
east_faces_ref2 = squeeze(Z_H_ref2(1,1:end-z_margin));
east_faces_ref3 = squeeze(Z_H_ref3(1,1:end-z_margin));
east_faces_ref4 = squeeze(Z_H_ref4(1,1:end-z_margin));
east_faces_ref5 = squeeze(Z_H_ref5(1,1:end-z_margin));

centers_along_z_ref1 = squeeze(Z_C_ref1(1,1:end-z_margin));
centers_along_z_ref2 = squeeze(Z_C_ref2(1,1:end-z_margin));
centers_along_z_ref3 = squeeze(Z_C_ref3(1,1:end-z_margin));
centers_along_z_ref4 = squeeze(Z_C_ref4(1,1:end-z_margin));
centers_along_z_ref5 = squeeze(Z_C_ref5(1,1:end-z_margin));

nord_faces_ref1 = squeeze(Y_N_ref1);
nord_faces_ref2 = squeeze(Y_N_ref2);
nord_faces_ref3 = squeeze(Y_N_ref3);
nord_faces_ref4 = squeeze(Y_N_ref4);
nord_faces_ref5 = squeeze(Y_N_ref5);

centers_along_y_ref1 = squeeze(Y_C_ref1(1,:));
centers_along_y_ref2 = squeeze(Y_C_ref2(1,:));
centers_along_y_ref3 = squeeze(Y_C_ref3(1,:));
centers_along_y_ref4 = squeeze(Y_C_ref4(1,:));
centers_along_y_ref5 = squeeze(Y_C_ref5(1,:));

centerline_pstar_ref1 = squeeze(P1_ref1(1,1,1:end-z_margin));
centerline_pstar_ref2 = squeeze(P1_ref2(1,1,1:end-z_margin));
centerline_pstar_ref3 = squeeze(P1_ref3(1,1,1:end-z_margin));
centerline_pstar_ref4 = squeeze(P1_ref4(1,1,1:end-z_margin));
centerline_pstar_ref5 = squeeze(P1_ref5(1,1,1:end-z_margin));

centerline_velocities_ref1 = squeeze(W1_ref1(1,1,1:end-z_margin));
centerline_velocities_ref2 = squeeze(W1_ref2(1,1,1:end-z_margin));
centerline_velocities_ref3 = squeeze(W1_ref3(1,1,1:end-z_margin));
centerline_velocities_ref4 = squeeze(W1_ref4(1,1,1:end-z_margin));
centerline_velocities_ref5 = squeeze(W1_ref5(1,1,1:end-z_margin));

[~, probe_zlocation_index_ref1] = min(abs(Z_C_ref1(1,:) - 5));
[~, probe_zlocation_index_ref2] = min(abs(Z_C_ref2(1,:) - 5));
[~, probe_zlocation_index_ref3] = min(abs(Z_C_ref3(1,:) - 5));
[~, probe_zlocation_index_ref4] = min(abs(Z_C_ref4(1,:) - 5));
[~, probe_zlocation_index_ref5] = min(abs(Z_C_ref5(1,:) - 5));

DWDY_probe_ref1 = squeeze(DWDY_ref1(1,:,probe_zlocation_index_ref1));
DWDY_probe_ref2 = squeeze(DWDY_ref2(1,:,probe_zlocation_index_ref2));
DWDY_probe_ref3 = squeeze(DWDY_ref3(1,:,probe_zlocation_index_ref3));
DWDY_probe_ref4 = squeeze(DWDY_ref4(1,:,probe_zlocation_index_ref4));
DWDY_probe_ref5 = squeeze(DWDY_ref5(1,:,probe_zlocation_index_ref5));

KE_probe_ref1 = squeeze(KE_ref1(1,:,probe_zlocation_index_ref1));
KE_probe_ref2 = squeeze(KE_ref2(1,:,probe_zlocation_index_ref2));
KE_probe_ref3 = squeeze(KE_ref3(1,:,probe_zlocation_index_ref3));
KE_probe_ref4 = squeeze(KE_ref4(1,:,probe_zlocation_index_ref4));
KE_probe_ref5 = squeeze(KE_ref5(1,:,probe_zlocation_index_ref5));

EP_probe_ref1 = squeeze(EP_ref1(1,:,probe_zlocation_index_ref1));
EP_probe_ref2 = squeeze(EP_ref2(1,:,probe_zlocation_index_ref2));
EP_probe_ref3 = squeeze(EP_ref3(1,:,probe_zlocation_index_ref3));
EP_probe_ref4 = squeeze(EP_ref4(1,:,probe_zlocation_index_ref4));
EP_probe_ref5 = squeeze(EP_ref5(1,:,probe_zlocation_index_ref5));

figure();

% Plot the pressure with respect to z at different refinment levels
subplot(3, 2, 1);
hold on;
plot(centers_along_z, centerline_pstar, 'DisplayName', 'P* base ref');
plot(centers_along_z_ref1, centerline_pstar_ref1, 'DisplayName', 'P* ref1');
plot(centers_along_z_ref2, centerline_pstar_ref2, 'DisplayName', 'P* ref2');
plot(centers_along_z_ref3, centerline_pstar_ref3, 'DisplayName', 'P* ref3');
plot(centers_along_z_ref4, centerline_pstar_ref4, 'DisplayName', 'P* ref4');
plot(centers_along_z_ref5, centerline_pstar_ref5, 'DisplayName', 'P* ref5');
title('Pressure');
ylabel('Pressure [Pa]');
xlabel('z [m]')
legend show;
hold off;

% Plot the z-velocity with respect to z at different refinment levels
subplot(3, 2, 2);
hold on;
plot(east_faces, centerline_velocities, 'DisplayName', 'W1 base ref');
plot(east_faces_ref1, centerline_velocities_ref1, 'DisplayName', 'W1 ref1');
plot(east_faces_ref2, centerline_velocities_ref2, 'DisplayName', 'W1 ref2');
plot(east_faces_ref3, centerline_velocities_ref3, 'DisplayName', 'W1 ref3');
plot(east_faces_ref4, centerline_velocities_ref4, 'DisplayName', 'W1 ref4');
plot(east_faces_ref5, centerline_velocities_ref5, 'DisplayName', 'W1 ref5');
title('z-velocity');
ylabel('W [m/s]')
xlabel('z [m]');
legend show;
hold off;

% Plot the derivative of the z-velocity with respect to y at different refinment levels
subplot(3, 2, 3);
hold on;
plot(centers_along_y, DWDY_probe, 'DisplayName', 'DWDY base ref');
plot(centers_along_y_ref1, DWDY_probe_ref1, 'DisplayName', 'DWDY ref1');
plot(centers_along_y_ref2, DWDY_probe_ref2, 'DisplayName', 'DWDY ref2');
plot(centers_along_y_ref3, DWDY_probe_ref3, 'DisplayName', 'DWDY ref3');
plot(centers_along_y_ref4, DWDY_probe_ref4, 'DisplayName', 'DWDY ref4');
plot(centers_along_y_ref5, DWDY_probe_ref5, 'DisplayName', 'DWDY ref5');
title('DWDY');
ylabel('dW/dY [Hz]')
xlabel('r [m]')
legend('Location', 'southwest');
hold off;

% Plot the turbulent kinetic energy with respect to y at different refinment levels
subplot(3, 2, 4);
hold on;
plot(centers_along_y, KE_probe, 'DisplayName', 'k base ref');
plot(centers_along_y_ref1, KE_probe_ref1, 'DisplayName', 'k ref1');
plot(centers_along_y_ref2, KE_probe_ref2, 'DisplayName', 'k ref2');
plot(centers_along_y_ref3, KE_probe_ref3, 'DisplayName', 'k ref3');
plot(centers_along_y_ref4, KE_probe_ref4, 'DisplayName', 'k ref4');
plot(centers_along_y_ref5, KE_probe_ref5, 'DisplayName', 'k ref5');
ylabel('k [m^2 / s^2]')
xlabel('r [m]')
title('k');
legend('Location', 'northwest');
hold off;

% Plot the turbulent dissipation rate with respect to y at different refinment levels
subplot(3, 2, 5);
hold on;
plot(centers_along_y, EP_probe, 'DisplayName', '\epsilon base ref');
plot(centers_along_y_ref1, EP_probe_ref1, 'DisplayName', '\epsilon ref1');
plot(centers_along_y_ref2, EP_probe_ref2, 'DisplayName', '\epsilon ref2');
plot(centers_along_y_ref3, EP_probe_ref3, 'DisplayName', '\epsilon ref3');
plot(centers_along_y_ref4, EP_probe_ref4, 'DisplayName', '\epsilon ref4');
plot(centers_along_y_ref5, EP_probe_ref5, 'DisplayName', '\epsilon ref5');
ylabel('\epsilon [m^2 / s^3]');
xlabel('r [m]');
title('\epsilon');
legend('Location', 'northwest');
hold off;

% Plot the velocity profile with respect to y at different refinment levels
subplot(3, 2, 6);
hold on;
plot(centers_along_y, squeeze(W1(1,:,probe_zlocation_index)), 'DisplayName', 'W profile base ref');
plot(centers_along_y_ref1, squeeze(W1_ref1(1,:,probe_zlocation_index_ref1)), 'DisplayName', 'W profile ref1');
plot(centers_along_y_ref2, squeeze(W1_ref2(1,:,probe_zlocation_index_ref2)), 'DisplayName', 'W profile ref2');
plot(centers_along_y_ref3, squeeze(W1_ref3(1,:,probe_zlocation_index_ref3)), 'DisplayName', 'W profile ref3');
plot(centers_along_y_ref4, squeeze(W1_ref4(1,:,probe_zlocation_index_ref4)), 'DisplayName', 'W profile ref4');
plot(centers_along_y_ref5, squeeze(W1_ref5(1,:,probe_zlocation_index_ref5)), 'DisplayName', 'W profile ref5');
ylabel('W [m / s]');
xlabel('r [m]');
title('W profile');
legend('Location', 'southwest');
hold off;

% Compute the L1-norms in order to confirm the grid indipendence
% L1-norm for the pressure
centerline_pstar_ref1_interp = interp1(centers_along_z_ref1, centerline_pstar_ref1, centers_along_z, 'linear');
centerline_pstar_ref2_interp = interp1(centers_along_z_ref2, centerline_pstar_ref2, centers_along_z, 'linear');
centerline_pstar_ref3_interp = interp1(centers_along_z_ref3, centerline_pstar_ref3, centers_along_z, 'linear');
centerline_pstar_ref4_interp = interp1(centers_along_z_ref4, centerline_pstar_ref4, centers_along_z, 'linear');
centerline_pstar_ref5_interp = interp1(centers_along_z_ref5, centerline_pstar_ref5, centers_along_z, 'linear');

L1_norm = sum(abs(centerline_pstar - centerline_pstar_ref1_interp'))/max(size(Z_H));
disp("L1-norm of P1 with base ref and P1 with ref1 = " +L1_norm);

L1_norm = sum(abs(centerline_pstar_ref2_interp' - centerline_pstar))/max(size(Z_H));
disp("L1-norm of P1 with base ref and P1 with ref2 = " +L1_norm);

L1_norm = sum(abs(centerline_pstar_ref3_interp' - centerline_pstar))/max(size(Z_H));
disp("L1-norm of P1 with base ref and P1 with ref3 = " +L1_norm);

L1_norm = sum(abs(centerline_pstar_ref4_interp' - centerline_pstar))/max(size(Z_H));
disp("L1-norm of P1 with base ref and P1 with ref4 = " +L1_norm);

L1_norm = sum(abs(centerline_pstar_ref5_interp' - centerline_pstar))/max(size(Z_H));
disp("L1-norm of P1 with base ref and P1 with ref5 = " +L1_norm);

% L1-norm for the velocity
centerline_velocities_ref1_interp = interp1(east_faces_ref1, centerline_velocities_ref1, east_faces, 'linear');
centerline_velocities_ref2_interp = interp1(east_faces_ref2, centerline_velocities_ref2, east_faces, 'linear');
centerline_velocities_ref3_interp = interp1(east_faces_ref3, centerline_velocities_ref3, east_faces, 'linear');
centerline_velocities_ref4_interp = interp1(east_faces_ref4, centerline_velocities_ref4, east_faces, 'linear');
centerline_velocities_ref5_interp = interp1(east_faces_ref5, centerline_velocities_ref5, east_faces, 'linear');

L1_norm = sum(abs(centerline_velocities - centerline_velocities_ref1_interp'))/max(size(Z_H));
disp("L1-norm of W1 with base ref and W1 with ref1 = " +L1_norm);

L1_norm = sum(abs(centerline_velocities_ref2_interp' - centerline_velocities))/max(size(Z_H));
disp("L1-norm of W1 with base ref and W1 with ref2 = " +L1_norm);

L1_norm = sum(abs(centerline_velocities_ref3_interp' - centerline_velocities))/max(size(Z_H));
disp("L1-norm of W1 with base ref and W1 with ref3 = " +L1_norm);

L1_norm = sum(abs(centerline_velocities_ref4_interp' - centerline_velocities))/max(size(Z_H));
disp("L1-norm of W1 with base ref and W1 with ref4 = " +L1_norm);

L1_norm = sum(abs(centerline_velocities_ref5_interp' - centerline_velocities))/max(size(Z_H));
disp("L1-norm of W1 with base ref and W1 with ref5 = " +L1_norm);

% L1-norm for DWDY
DWDY_probe_ref1_interp = interp1(centers_along_y_ref1, DWDY_probe_ref1, centers_along_y, 'linear');
DWDY_probe_ref2_interp = interp1(centers_along_y_ref2, DWDY_probe_ref2, centers_along_y, 'linear');
DWDY_probe_ref3_interp = interp1(centers_along_y_ref3, DWDY_probe_ref3, centers_along_y, 'linear');
DWDY_probe_ref4_interp = interp1(centers_along_y_ref4, DWDY_probe_ref4, centers_along_y, 'linear');
DWDY_probe_ref5_interp = interp1(centers_along_y_ref5, DWDY_probe_ref5, centers_along_y, 'linear');

L1_norm = sum(abs(DWDY_probe - DWDY_probe_ref1_interp))/max(size(Y_N));
disp("L1-norm of DWDY with base ref and DWDY with ref1 = " +L1_norm);

L1_norm = sum(abs(DWDY_probe_ref2_interp - DWDY_probe))/max(size(Y_N));
disp("L1-norm of DWDY with base ref and DWDY with ref2 = " +L1_norm);

L1_norm = sum(abs(DWDY_probe_ref3_interp - DWDY_probe))/max(size(Y_N));
disp("L1-norm of DWDY with base ref and DWDY with ref3 = " +L1_norm);

L1_norm = sum(abs(DWDY_probe_ref4_interp - DWDY_probe))/max(size(Y_N));
disp("L1-norm of DWDY with base ref and DWDY with ref4 = " +L1_norm);

L1_norm = sum(abs(DWDY_probe_ref5_interp - DWDY_probe))/max(size(Y_N));
disp("L1-norm of DWDY with base ref and DWDY with ref5 = " +L1_norm);

% L1-norm for k
KE_probe_ref1_interp = interp1(centers_along_y_ref1, KE_probe_ref1, centers_along_y, 'linear');
KE_probe_ref2_interp = interp1(centers_along_y_ref2, KE_probe_ref2, centers_along_y, 'linear');
KE_probe_ref3_interp = interp1(centers_along_y_ref3, KE_probe_ref3, centers_along_y, 'linear');
KE_probe_ref4_interp = interp1(centers_along_y_ref4, KE_probe_ref4, centers_along_y, 'linear');
KE_probe_ref5_interp = interp1(centers_along_y_ref5, KE_probe_ref5, centers_along_y, 'linear');

L1_norm = sum(abs(KE_probe - KE_probe_ref1_interp))/max(size(Y_N));
disp("L1-norm of k with base ref and k with ref1 = " +L1_norm);

L1_norm = sum(abs(KE_probe_ref2_interp - KE_probe))/max(size(Y_N));
disp("L1-norm of k with base ref and k with ref2 = " +L1_norm);

L1_norm = sum(abs(KE_probe_ref3_interp - KE_probe))/max(size(Y_N));
disp("L1-norm of k with base ref and k with ref3 = " +L1_norm);

L1_norm = sum(abs(KE_probe_ref4_interp - KE_probe))/max(size(Y_N));
disp("L1-norm of k with base ref and k with ref4 = " +L1_norm);

L1_norm = sum(abs(KE_probe_ref5_interp - KE_probe))/max(size(Y_N));
disp("L1-norm of k with base ref and k with ref5 = " +L1_norm);

% L1-norm for epsilon
EP_probe_ref1_interp = interp1(centers_along_y_ref1, EP_probe_ref1, centers_along_y, 'linear');
EP_probe_ref2_interp = interp1(centers_along_y_ref2, EP_probe_ref2, centers_along_y, 'linear');
EP_probe_ref3_interp = interp1(centers_along_y_ref3, EP_probe_ref3, centers_along_y, 'linear');
EP_probe_ref4_interp = interp1(centers_along_y_ref4, EP_probe_ref4, centers_along_y, 'linear');
EP_probe_ref5_interp = interp1(centers_along_y_ref5, EP_probe_ref5, centers_along_y, 'linear');

L1_norm = sum(abs(EP_probe - EP_probe_ref1_interp))/max(size(Y_N));
disp("L1-norm of epsilon with base ref and epsilon with ref1 = " +L1_norm);

L1_norm = sum(abs(EP_probe_ref2_interp - EP_probe))/max(size(Y_N));
disp("L1-norm of epsilon with base ref and epsilon with ref2 = " +L1_norm);

L1_norm = sum(abs(EP_probe_ref3_interp - EP_probe))/max(size(Y_N));
disp("L1-norm of epsilon with base ref and epsilon with ref3 = " +L1_norm);

L1_norm = sum(abs(EP_probe_ref4_interp - EP_probe))/max(size(Y_N));
disp("L1-norm of epsilon with base ref and epsilon with ref4 = " +L1_norm);

L1_norm = sum(abs(EP_probe_ref5_interp - EP_probe))/max(size(Y_N));
disp("L1-norm of epsilon with base ref and epsilon with ref5 = " +L1_norm);

[~, probe_ylocation_index] = min(abs(Y_C(1,:) - 0.04875));
[~, probe_ylocation_index_ref1] = min(abs(Y_C_ref1(1,:) -  0.04875));
[~, probe_ylocation_index_ref2] = min(abs(Y_C_ref2(1,:) - 0.04875));
[~, probe_ylocation_index_ref3] = min(abs(Y_C_ref3(1,:) - 0.04875));
[~, probe_ylocation_index_ref4] = min(abs(Y_C_ref4(1,:) - 0.04875));
[~, probe_ylocation_index_ref5] = min(abs(Y_C_ref5(1,:) - 0.04875));

% Plot the variable of interest (W, P, DWDY, k, epsilon) with resect to the refinment level
figure;

number_of_cells = [1*31*100, 1*61*100, 1*91*100, 1*31*150, 1*31*200, 1*61*150];
pressures = [P1(1, probe_ylocation_index, probe_zlocation_index), P1_ref1(1, probe_ylocation_index_ref1, probe_zlocation_index_ref1), P1_ref2(1, probe_ylocation_index_ref2, probe_zlocation_index_ref2), P1_ref3(1, probe_ylocation_index_ref3, probe_zlocation_index_ref3), P1_ref4(1, probe_ylocation_index_ref4, probe_zlocation_index_ref4), P1_ref5(1, probe_ylocation_index_ref5, probe_zlocation_index_ref5)];
velocities = [W1(1, probe_ylocation_index, probe_zlocation_index), W1_ref1(1, probe_ylocation_index_ref1, probe_zlocation_index_ref1), W1_ref2(1, probe_ylocation_index_ref2, probe_zlocation_index_ref2), W1_ref3(1, probe_ylocation_index_ref3, probe_zlocation_index_ref3), W1_ref4(1, probe_ylocation_index_ref4, probe_zlocation_index_ref4), W1_ref5(1, probe_ylocation_index_ref5, probe_zlocation_index_ref5)];
dwdys = [DWDY(1, probe_ylocation_index, probe_zlocation_index), DWDY_ref1(1, probe_ylocation_index_ref1, probe_zlocation_index_ref1), DWDY_ref2(1, probe_ylocation_index_ref2, probe_zlocation_index_ref2), DWDY_ref3(1, probe_ylocation_index_ref3, probe_zlocation_index_ref3), DWDY_ref4(1, probe_ylocation_index_ref4, probe_zlocation_index_ref4), DWDY_ref5(1, probe_ylocation_index_ref5, probe_zlocation_index_ref5)];
ks = [KE(1, probe_ylocation_index, probe_zlocation_index), KE_ref1(1, probe_ylocation_index_ref1, probe_zlocation_index_ref1), KE_ref2(1, probe_ylocation_index_ref2, probe_zlocation_index_ref2), KE_ref3(1, probe_ylocation_index_ref3, probe_zlocation_index_ref3), KE_ref4(1, probe_ylocation_index_ref4, probe_zlocation_index_ref4), KE_ref5(1, probe_ylocation_index_ref5, probe_zlocation_index_ref5)];
epsilons = [EP(1, probe_ylocation_index, probe_zlocation_index), EP_ref1(1, probe_ylocation_index_ref1, probe_zlocation_index_ref1), EP_ref2(1, probe_ylocation_index_ref2, probe_zlocation_index_ref2), EP_ref3(1, probe_ylocation_index_ref3, probe_zlocation_index_ref3), EP_ref4(1, probe_ylocation_index_ref4, probe_zlocation_index_ref4), EP_ref5(1, probe_ylocation_index_ref5, probe_zlocation_index_ref5)];

subplot(3,2,1)
for i = 1:max(size(number_of_cells))
    scatter(number_of_cells(i), pressures(i), 60, 'filled');
    hold on
end

grid on
xlabel('Refinment level as mesured by the number of cells'); 
ylabel('Pressure at the probe');
axis([-inf, inf, 45, 60])

subplot(3,2,2);
for i = 1:max(size(number_of_cells))
    scatter(number_of_cells(i),velocities(i),60,'filled');
    hold on
end

grid on
xlabel('Refinment level as mesured by the number of cells'); 
ylabel('Z-velocity at the probe');
axis([-inf, inf, 0.5, 0.6])

subplot(3,2,3);
for i = 1:max(size(number_of_cells))
    scatter(number_of_cells(i),dwdys(i),60,'filled');
    hold on
end

grid on
xlabel('Refinment level as mesured by the number of cells'); 
ylabel('DWDY at the probe');

if strcmp(import_directory, '6.mat')
    axis([-inf, inf, -50, -40])
else
    axis([-inf, inf, -110, -60])
end

subplot(3,2,4);
for i = 1:max(size(number_of_cells))
    scatter(number_of_cells(i),ks(i),60,'filled');
    hold on
end

grid on
xlabel('Refinment level as mesured by the number of cells'); 
ylabel('k at the probe');

if strcmp(import_directory, '6.mat')
    axis([-inf, inf, 4.4e-3, 4.5e-3])
else
    axis([-inf, inf, 4.4e-3, 4.8e-3])
end

subplot(3,2,5);
for i = 1:max(size(number_of_cells))
    scatter(number_of_cells(i),epsilons(i),60,'filled');
    hold on
end

grid on
xlabel('Refinment level as mesured by the number of cells'); 
ylabel('\epsilon at the probe');

if strcmp(import_directory, '6.mat')
    axis([-inf, inf, 0.09, 0.1])
else
    axis([-inf, inf, 0.05, 0.16])
end

% Validation of the CFD solution
figure();

% Extra precision needed for this step
format longg

% Frictional losses
f_simul = (8*tau_w(1, 1, probe_zlocation_index))/(rho*Wb^2);
disp("Simulated friction factor: " + f_simul);

f_torbergsen = 0.019036288;
formula_by_prandtl = @(f) 1/sqrt(f) + 2 * log10(2.51 / (Re * sqrt(f)));
f_prandtl = fzero(formula_by_prandtl, f_simul);
f_haaland = 1 / (1.8 * log10(6.9 / Re))^2;
f_moody = 0.019;

subplot(3, 2, 1);
hold on;
plot(1, f_simul, 'o', 'DisplayName', 'Numerical solution');
plot(2, f_torbergsen, 'o', 'DisplayName', 'Torbergsen');
plot(2, f_prandtl, 'o', 'DisplayName', 'Prandtl');
plot(2, f_haaland, 'o', 'DisplayName', 'Haaland');
plot(2, f_moody, 'o', 'DisplayName', 'Moody');

if strcmp(import_directory, '6.mat')
    axis([0.75, 3.25, 0.0185, 0.0195]);
else
    axis([0.75, 3.25, 0.0185, 0.021]);
end

title('Friction factor')
ylabel('f [adim]')
set(gca,'xtick',[]);
legend();
grid on;
hold off;

% Profile of the Reynolds-averaged axial velocity along the pipe radius
importfile('exp_data_Torgbersen.mat');
n = @(f) f .^ (-0.5);
normalized_nikuradse = @(r, n) (2.*n + 1).*(n+1)./(2.*n^2) .* (1 - r ./ R) .^ (1 ./ n);

subplot(3, 2, 2);
hold on;
plot(centers_along_y / R, W1(1,:,probe_zlocation_index) / Wb, 'DisplayName', 'Numerical solution');
plot(W_profile_series1(:,1), W_profile_series1(:,2), 'DisplayName', 'Torgbersen series 1');
plot(W_profile_series2(:,1), W_profile_series2(:,2), 'DisplayName', 'Torgbersen series 2');
plot(centers_along_y / R, normalized_nikuradse(centers_along_y, n(f_moody)), 'DisplayName', 'Nikuradse + Moody');
plot(centers_along_y / R, normalized_nikuradse(centers_along_y, n(f_prandtl)), 'DisplayName', 'Nikuradse + Prandtl');
plot(centers_along_y / R, normalized_nikuradse(centers_along_y, n(f_haaland)), 'DisplayName', 'Nikuradse + Haaland');
title('Adim. R.a. velocity along the radius')
ylabel('W/Wb [adim]')
xlabel('r/R [adim]')
legend('Location', 'southwest');
grid on;
hold off;

syms yls;
laund_and_spald = piecewise(yls < 11.6, yls, (yls > 11.6) & (yls <= 130), log(8.6 * yls) / 0.41, NaN);

subplot(3, 2, 3);
hold on;
loglog(y_plus_along_y, w_plus, 'DisplayName', 'Numerical solution');
loglog(y_plus_along_y, subs(laund_and_spald, yls, y_plus_along_y), 'DisplayName', 'Equilibrium wall function');
xlabel("y+ = (R - r) * w_{\tau} / \nu [adim]");
ylabel("R.a. w+ = W/w_{\tau} [adim]");
title("Adim. R.a. velocity along the radius");
legend('Location', 'southeast');
grid on;
hold off;

% Profile of the turbulent kinetic energy along the pipe radius
normalized_khn = @(r, f) f./8 .* (1 + 2./3 .* r ./ R + 10 ./ 3 .* (r ./ R).^3);

subplot(3, 2, 4);
hold on;
plot(centers_along_y / R, KE_probe / Wb^2, 'DisplayName', 'Numerical solution');
plot(k_profile(:, 1), k_profile(:, 2), 'DisplayName', 'Torgbersen series');
plot(centers_along_y / R, normalized_khn(centers_along_y, f_moody), 'DisplayName', 'Kam Hong Ng + Moody');
plot(centers_along_y / R, normalized_khn(centers_along_y, f_prandtl), 'DisplayName', 'Kam Hong Ng + Prandtl');
plot(centers_along_y / R, normalized_khn(centers_along_y, f_haaland), 'DisplayName', 'Kam Hong Ng + Haaland');
xlabel("r / R [adim]");
ylabel("k / W_b^2 [adim]");
title("Adim. turbulent kinetic energy along the radius");
legend('Location', 'northwest');
grid on;
hold off;

% Profile of the turbulent dissipation rate along the pipe radius
nikuradse_mixing_length = @(r) R .* (0.14 - 0.08 .* (r./R).^2 - 0.06 .* (r./R).^4);
std_eps = @(r, f) 0.1643 .* (normalized_khn(r, f) .* Wb.^2).^(3./2) ./ nikuradse_mixing_length(r);

subplot(3,2,5);
hold on;
plot(centers_along_y / R, EP_probe * R / Wb^3, 'DisplayName', 'Numerical solution');
plot(eps_profile_series1(:, 1), eps_profile_series1(:, 2), 'DisplayName', 'Torgbersen series 1');
plot(eps_profile_series2(:, 1), eps_profile_series2(:, 2), 'DisplayName', 'Torgbersen series 2');
plot(eps_profile_series3(:, 1), eps_profile_series3(:, 2), 'DisplayName', 'Torgbersen series 3');
plot(centers_along_y / R, std_eps(centers_along_y, f_moody) * R / Wb^3, 'DisplayName', 'Nikuradse + Moody + Kam Hong Ng');
plot(centers_along_y / R, std_eps(centers_along_y, f_prandtl) * R / Wb^3, 'DisplayName', 'Nikuradse + Prandtl + Kam Hong Ng');
plot(centers_along_y / R, std_eps(centers_along_y, f_haaland) * R / Wb^3, 'DisplayName', 'Nikuradse + Haaland + Kam Hong Ng');
xlabel("r/R [adim]");
ylabel("\epsilon*R/W_b^3 [adim]");
title("Adim. turbulent dissipation rate along the radius");
legend('Location', 'northwest');
grid on;
hold off;

if strcmp(import_directory, '6.mat')
    % Further questions: question 1
    % The region from y =  0.0475 to the wall is divided into 15 cells for the
    % first simulation (y+ is about 4), 40 cells for the second one (y+ is about 1.5).
    importfile('fq1var.mat');
    importfile('fq2var.mat');

    [~, probe_zlocation_index_wrong1] = min(abs(Z_C_fq1(1,:) - 5));
    [~, probe_zlocation_index_wrong2] = min(abs(Z_C_fq2(1,:) - 5));
    east_faces_wrong1 = squeeze(Z_H_fq1(1,1:end-z_margin));
    east_faces_wrong2 = squeeze(Z_H_fq2(1,1:end-z_margin));
    centers_along_y_wrong1 = squeeze(Y_C_fq1(1,:));
    centers_along_y_wrong2 = squeeze(Y_C_fq2(1,:));
    centerline_velocities_wrong1 = squeeze(W1_fq1(1,1,1:end-z_margin));
    centerline_velocities_wrong2 = squeeze(W1_fq1(1,1,1:end-z_margin));
    tau_w_wrong1 = STRS_fq1(1,end,:) * rho;
    tau_w_wrong2 = STRS_fq2(1,end,:) * rho;
    f_simul_wrong1 = (8*tau_w_wrong1(1, 1, probe_zlocation_index_wrong1))/(rho*Wb^2);
    f_simul_wrong2 = (8*tau_w_wrong2(1, 1, probe_zlocation_index_wrong2))/(rho*Wb^2);
    KE_probe_wrong1 = squeeze(KE_fq1(1,:,probe_zlocation_index_wrong1));
    KE_probe_wrong2 = squeeze(KE_fq2(1,:,probe_zlocation_index_wrong2));
    EP_probe_wrong1 = squeeze(EP_fq1(1,:,probe_zlocation_index_wrong1));
    EP_probe_wrong2 = squeeze(EP_fq2(1,:,probe_zlocation_index_wrong2));
    
    figure();
    
    subplot(2, 2, 1);
    hold on;
    plot(1, f_simul, 'o', 'DisplayName', 'Numerical solution for y+ \approx 40');
    plot(2, f_simul_wrong1, 'o', 'DisplayName', 'Numerical solution for y+ \approx 4');
    plot(2, f_simul_wrong2, 'o', 'DisplayName', 'Numerical solution for y+ \approx 1.5');
    title('Friction factor')
    ylabel('f [adim]')
    set(gca,'xtick',[]);
    legend('Location', 'northwest');
    axis([0.75, 2.25, 0.018, 0.035]);
    grid on;
    hold off;
    
    subplot(2, 2, 2);
    hold on;
    plot(east_faces, centerline_velocities, 'DisplayName', 'Numerical solution for y+ \approx 40');
    plot(east_faces_wrong1, centerline_velocities_wrong1, 'DisplayName', 'Numerical solution for y+ \approx 4');
    plot(east_faces_wrong2, centerline_velocities_wrong2, 'DisplayName', 'Numerical solution for y+ \approx 1.5');
    title('R.a. axial velocity profile');
    ylabel('W [m / s]');
    xlabel('z [m]');
    legend('Location', 'southeast');
    grid on;
    hold off;
    
    subplot(2, 2, 3);
    hold on;
    plot(centers_along_y, KE_probe, 'DisplayName', 'Numerical solution for y+ \approx 40');
    plot(centers_along_y_wrong1, KE_probe_wrong1, 'DisplayName', 'Numerical solution for y+ \approx 4');
    plot(centers_along_y_wrong2, KE_probe_wrong2, 'DisplayName', 'Numerical solution for y+ \approx 1.5');
    ylabel('k [m^2 / s^2]')
    xlabel('r [m]')
    title('k');
    legend('Location', 'northwest');
    grid on;
    hold off;
    
    subplot(2, 2, 4);
    hold on;
    plot(centers_along_y, EP_probe, 'DisplayName', 'Numerical solution for y+ \approx 40');
    plot(centers_along_y_wrong1, EP_probe_wrong1, 'DisplayName', 'Numerical solution for y+ \approx 4');
    plot(centers_along_y_wrong2, EP_probe_wrong2, 'DisplayName', 'Numerical solution for y+ \approx 1.5');
    ylabel('\epsilon [m^2 / s^3]');
    xlabel('r [m]');
    title('\epsilon');
    legend('Location', 'northwest');
    grid on;
    hold off;
end

% Further questions: question 2
% Just run the whole script again but change the import directory to
% 'lowre1.mat' or 'lowre2.mat' instead of '6.mat' at line 7,
% everything will work the same except for L1 norms and some unneeded graphs.