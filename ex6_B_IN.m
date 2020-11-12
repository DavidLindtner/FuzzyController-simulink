%%  EX 6 B IN
% Testing of various number of input rules

%%  setting parameters of fuzzy system
membershipType = memType.Gaussian;
inferenceEngine = infEngine.MamdaniMinimum;
defuzzyfierType = defType.CA;
outputSet = [-1.5 -0.2 0 0.2 1.5];

desireValue = 30;   % desire value of liquid level in cm
%%  simulations
inputSetErr = [-2.5 0 2.5];
inputSetDErr = [-1.5 0 1.5];
sim sim1;
data1 = ans.ScopeData;


inputSetErr = [-2.5 -0.4 0.4 2.5];
inputSetDErr = [-1.5 -0.4 0.4 1.5];
sim sim1;
data2 = ans.ScopeData;
%%  plotting results
plotSimulinkData([data1, data2], ["3 input rules", "4 input rules"], 0);

