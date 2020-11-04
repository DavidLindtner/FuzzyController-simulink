function [incrementVoltage] = SmallestOfMaxima(DOM, outputSet, memType)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    incrementVoltage = 0;

    maxDomIndex = find(DOM==max(DOM));

    maxDom = DOM(maxDomIndex(1));

%   VERY VERY LOW output rule
    if maxDomIndex(1) == 1
        if maxDom >= 1
            incrementVoltage = outputSet(1);
        else
            switch memType
                case 'Triangullar'
                    incrementVoltage = -(maxDom * (outputSet(2) - outputSet(1)) - outputSet(2));
                case 'Gaussian'
                    incrementVoltage = halfBackGaussian(outputSet(1), outputSet(2), 'falling', maxDom);
            end
        end
        
%   VERY VERY HIGH output rule
    elseif maxDomIndex(1) == max(size(outputSet))
        if maxDom >= 1
            incrementVoltage = outputSet(5);
        else
            switch memType
                case 'Triangullar'
                    incrementVoltage = maxDom * (outputSet(maxDomIndex(1)) - outputSet(maxDomIndex(1)-1)) + outputSet(maxDomIndex(1)-1);
                case 'Gaussian'
                    incrementVoltage = halfBackGaussian(outputSet(maxDomIndex(1)-1), outputSet(maxDomIndex(1)), 'rising', maxDom);
            end
        end
        
%   All other rule
    else
        switch memType
            case 'Triangullar'
                incrementVoltage = maxDom * (outputSet(maxDomIndex(1)) - outputSet(maxDomIndex(1)-1)) + outputSet(maxDomIndex(1)-1);
            case 'Gaussian'
                incrementVoltage = halfBackGaussian(outputSet(maxDomIndex(1)-1), outputSet(maxDomIndex(1)), 'rising', maxDom);
        end
    end
end

