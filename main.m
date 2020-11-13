%%  MAIN SCRIPT
% comment or uncomment exercises which you want to run

close all; clear; clc;
%%  defining a parameters of system
T_s = 0.1;
SimTime = 250;
h1 = 30;             % liquid level fo tank 1 [cm]
h2 = 10;             % liquid level fo tank 2 [cm]
A1 = 50;             % diameter of tank 1 [cm^2]
A2 = 70;             % diameter of tank 2 [cm^2]
a1 = 0.5;            % diameter of output orifice 1 [cm^2]
a2 = 1.5;            % diameter of output orifice 2 [cm^2]
b1 = 1;              % diameter of input pipe 1 [cm^2]
b2 = 1;              % diameter of input pipe 2 [cm^2]
g = 980.665;         % gravitational constant [cm*s^-2]
Km = 5;              % motor constant

satValue = 220;

desValChange = 0;           % change setpoint
disturbanceInput = 0;       % disturbance - decreasing diameter of input pipes
disturbanceOutflow1 = 0;    % disturbance - leackage of tank 1
disturbanceOutflow2 = 0;    % disturbance - leackage of tank 2
%%  defining a structure of fuzzy system parameters
infEngine = struct('MamdaniMinimum', 1, 'MamdaniProduct', 2);
memType = struct('Triangullar', 1, 'Gaussian', 2);
defType = struct('SoM', 1, 'MoM', 2, 'LoM', 3, 'CA', 4, 'CoG', 5);

%%  exercises - create plots
% uncomment one of the exercise to check results.

%ex5_A          % Testing of various inference engines
%ex5_B          % Testing of various defuzzifiers
%ex6_A          % Testing of various membership functions
%ex6_B_IN       % Testing of various number of input rules
%ex6_B_OUT      % Testing of various number of output rules
%ex7_A          % Testing of various references - worse controller
%ex7_B          % Testing of various references - better controller
%ex8_A          % Comparison of disturbance - leackage on tanks
ex8_B          % Comparison of disturbances on input pipe 1 and 2

