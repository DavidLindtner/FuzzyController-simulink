%%  EX 5.
% Testing of various inference engines

%%  setting parameters of fuzzy system
inferenceEngine = infEngine.MamdaniMinimum;
membershipType = memType.Triangullar;
inputSetErr = [-5 0 5];
inputSetDErr = [-1 0 1];
outputSet = [-1 -0.2 0 0.2 1];

desireValue = 30;   % desire value of liquid level in cm
%%  simulations
defuzzyfierType = defType.CA;
sim sim1;
data1 = ans.ScopeData;

defuzzyfierType = defType.TS;
sim sim1;
data2 = ans.ScopeData;

%%  plotting results
plotSimulinkData([data1, data2], ["Center average", "Takagi Sugeno"], 0);


