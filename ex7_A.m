%%  EX 7
% Testing of various references - worse controller

desValChange = 1;
%%  setting parameters of fuzzy system
inferenceEngine = infEngine.MamdaniMinimum;
membershipType = memType.Triangullar;
defuzzyfierType = defType.MoM;
inputSetErr = [-2 0 2];
inputSetDErr = [-1.5 0 1.5];
outputSet = [-2 -0.3 0 0.3 2];

desireValue = 30;   % desire value of liquid level in cm
%%  simulations
sim sim1;
data1 = ans.ScopeData;
data2 = ans.ScopeData1;

%%  plotting results
plotSimulinkData([data1, data2], "Controller", 1);

