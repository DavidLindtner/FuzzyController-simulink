%%  EX 5.
% Testing of various inference engines

%%  setting parameters of fuzzy system
membershipType = memType.Triangullar;
defuzzyfierType = defType.MoM;
inputSetErr = [-5 0 5];
inputSetDErr = [-1.5 0 1.5];
outputSet = [-1 -0.2 0 0.2 1];

desireValue = 30;   % desire value of liquid level in cm
%%  simulations
inferenceEngine = infEngine.MamdaniMinimum;
sim sim1;
data1 = ans.ScopeData;

inferenceEngine = infEngine.MamdaniProduct;
sim sim1;
data2 = ans.ScopeData;
%%  plotting results
plotSimulinkData([data1, data2], ["Mamdani minimum", "Mamdani product"], 0);


