%%  EX 8 B
% Comparison of disturbances on input pipe 1 and 2

%%  setting parameters of fuzzy system
membershipType = memType.Gaussian;
inferenceEngine = infEngine.MamdaniMinimum;
defuzzyfierType = defType.TS;
inputSetErr = [-2.5 0 2.5];
inputSetDErr = [-1.5 0 1.5];
outputSet = [-2 -1.4 -0.2 0 0.2 1.4 2];

desireValue = 30;   % desire value of liquid level in cm
%%  simulationssim sim1;
disturbanceInput = 1;
sim sim1;
data1 = ans.ScopeData;

disturbanceInput = 2;
sim sim1;
data2 = ans.ScopeData;
%%  plotting results
plotSimulinkData([data1, data2], ["Disturbance on input pipe 1", "Disturbance on input pipe 2"], 0);

