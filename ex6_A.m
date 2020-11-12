%%  EX 6 A
% Testing of various membership functions

%%  setting parameters of fuzzy system
inferenceEngine = infEngine.MamdaniMinimum;
defuzzyfierType = defType.CA;
inputSetErr = [-2.5 0 2.5];
inputSetDErr = [-1.5 0 1.5];
outputSet = [-1.5 -0.2 0 0.2 1.5];

desireValue = 30;   % desire value of liquid level in cm
%%  simulations
membershipType = memType.Triangullar;
sim sim1;
data1 = ans.ScopeData;

membershipType = memType.Gaussian;
sim sim1;
data2 = ans.ScopeData;
%%  plotting results
plotSimulinkData([data1, data2], ["Triangular MF", "Gaussian MF"], 0);


