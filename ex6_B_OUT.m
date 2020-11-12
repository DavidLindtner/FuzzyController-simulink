%%  EX 6 B out
% Testing of various number of output rules

%%  setting parameters of fuzzy system
membershipType = memType.Gaussian;
inferenceEngine = infEngine.MamdaniMinimum;
defuzzyfierType = defType.CA;
inputSetErr = [-2.5 0 2.5];
inputSetDErr = [-1.5 0 1.5];

desireValue = 30;   % desire value of liquid level in cm
%%  simulations
outputSet = [-1.5 -0.2 0 0.2 1.5];
sim sim1;
data1 = ans.ScopeData;


outputSet = [-2 -1.4 -0.2 0 0.2 1.4 2];
sim sim1;
data2 = ans.ScopeData;
%%  plotting results
plotSimulinkData([data1, data2], ["5 output rules", "7 output rules"], 0);

