%% IMPORT THE DATA FROM LARS EVEN TORBERGSEN (1998) FROM EXCEL INTO MATLAB

% Path to the excel file
fileName_open = "C:\Users\user\Desktop\CFD labs\Lab 2\Matlab\exp_data_Torgbersen.xlsx";

% Path to the matlab workspace containing the data
fileName_save = 'C:\Users\user\Desktop\CFD labs\Lab 2\Matlab\exp_data_Torgbersen.mat';


% 1) AXIAL VELOCITY DATA

%Reads the two axial velocity series and creates two matrixes. Specifically
% - the first column contains the r/R values
% - the second columns contains the W/Wb values
W_profile_series1= table2array(readtable(fileName_open, 'Sheet', 'data', 'range', 'A8:B31'));
W_profile_series2= table2array(readtable(fileName_open, 'Sheet', 'data', 'range', 'C8:D32'));

% 2) TURBULENT KINETIC ENERGY DATA

%Reads the turbulent kinetic energy data and creates two matrixes. Specifically
% - the first column contains the r/R values
% - the second columns contains the k/Wb^2 values
k_profile = table2array(readtable(fileName_open, 'Sheet', 'data', 'range', 'A38:B59'));

% 3) TURBULENT DISSIPATION RATE

%Reads the three turbulent dissipation rate series and creates three matrixes. Specifically
% - the first column contains the r/R values
% - the second columns contains the eps*R/Wb^3 values
eps_profile_series1 = table2array(readtable(fileName_open, 'Sheet', 'data', 'range', 'A66:B84'));
eps_profile_series2 = table2array(readtable(fileName_open, 'Sheet', 'data', 'range', 'C66:D72'));
eps_profile_series3 = table2array(readtable(fileName_open, 'Sheet', 'data', 'range', 'E66:F86'));

save(fileName_save)