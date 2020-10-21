%%  fuzzy
close all; clear; clc;
%%  defining a variables
T_s = 0.1;
h1 = 50;             % liquid level fo tank 1 [cm]
h2 = 5;             % liquid level fo tank 2 [cm]
A1 = 10;             % diameter of tank 1 [cm^2]
A2 = 10;             % diameter of tank 2 [cm^2]
a1 = 0.5;            % diameter of output orifice 1 [cm^2]
a2 = 1;            % diameter of output orifice 2 [cm^2]
b1 = 1.5;              % diameter of input pipe 1 [cm^2]
b2 = 1.5;              % diameter of input pipe 2 [cm^2]
g = 9.80665;         % gravitational constant [m*s^-2]
rho = b1/(b1+b2);    % constant
Km = 1;              % motor constant

satValue = 220;

desireValue = 30;    % desired value of liquid level [cm]
%%



