%%  EX 7
% Testing of various references
desValChange = 1;
%%  setting parameters of fuzzy system
membershipType = memType.Gaussian;
inferenceEngine = infEngine.MamdaniMinimum;
defuzzyfierType = defType.CA;
inputSetErr = [-2.5 0 2.5];
inputSetDErr = [-1.5 0 1.5];

desireValue = 30;   % desire value of liquid level in cm
%%  simulations
outputSet = [-2 -1.4 -0.2 0 0.2 1.4 2];
sim sim1;
data1 = ans.ScopeData;
data2 = ans.ScopeData1;

%%  plotting results
plotSimulinkData([data1, data2], "Controller", 1);

