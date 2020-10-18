%%  fuzzy
close all; clear; clc;
%%  defining a variables
h1 = 10;             % liquid level fo tank 1 [cm]
h2 = 10;             % liquid level fo tank 2 [cm]
A1 = 10;             % diameter of tank 1 [cm^2]
A2 = 10;             % diameter of tank 2 [cm^2]
a1 = 0.5;            % diameter of output orifice 1 [cm^2]
a2 = 0.5;            % diameter of output orifice 2 [cm^2]
b1 = 1;              % diameter of input pipe 1 [cm^2]
b2 = 1;              % diameter of input pipe 2 [cm^2]
g = 9.80665;         % gravitational constant [m*s^-2]
rho = b1/(b1+b2);    % constant
Km = 1;              % motor constant
Vp = 15;             % input voltage to motor [V] - controlled value

desireValue = 40;    % desired value of liquid level [cm]
%%



