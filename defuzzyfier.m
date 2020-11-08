function changeVoltage = defuzzyfier(DOM, outputSet, dtype, memType)
%DOM = Degree of Membership
%dtype = diffuzifier type
%memType = membership function type 'Triangullar', 'Gaussian'

changeVoltage = 0;
switch dtype
    case 'SoM' %smallest of maxima 
        changeVoltage = SmallestOfMaxima(DOM, outputSet, memType);
        
    case 'LoM' %largest of maxima
        changeVoltage = LargestOfMaxima(DOM, outputSet, memType);
        
    case 'MoM' %medium of maxima
        changeVoltage = MediumOfMaxima(DOM, outputSet, memType);
        
    case 'CoG' %center of gravity
        %   not implemented
        changeVoltage = CenterOfGravity(DOM, outputSet);
        
    case 'CA' %center average
        changeVoltage = CenterAverage(DOM, outputSet, memType);
end