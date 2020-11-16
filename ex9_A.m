%%  EX 8 A
% Comparison of disturbance - leackage on tanks

%%  setting parameters of fuzzy system
membershipType = memType.Gaussian;
inferenceEngine = infEngine.MamdaniMinimum;
defuzzyfierType = defType.TS;
inputSetErr = [-2.5 0 2.5];
inputSetDErr = [-1.5 0 1.5];
outputSet = [-2 -1.4 -0.2 0 0.2 1.4 2];

desireValue = 30;   % desire value of liquid level in cm
%%  simulationssim sim1;
disturbanceOutflow1 = 1;
disturbanceOutflow2 = 0;
sim sim1;
data1 = ans.ScopeData;

disturbanceOutflow1 = 0;
disturbanceOutflow2 = 1;
sim sim1;
data2 = ans.ScopeData;
%%  plotting results
plotSimulinkData([data1, data2], ["Leackage on tank 1", "Leackage on tank 2"], 0);

