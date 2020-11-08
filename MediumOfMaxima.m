function [incrementVoltage] = MediumOfMaxima(DOM,outputSet, memType)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    incrementVoltage = 0;

    maxDomIndex = find(DOM==max(DOM));

    maxDom = DOM(maxDomIndex(1));
    
    inc1 = 0;
    inc2 = 0;

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
                inc1 = maxDom * (outputSet(maxDomIndex(1)) - outputSet(maxDomIndex(1)-1)) + outputSet(maxDomIndex(1)-1);
                inc2 = -(maxDom *(outputSet(maxDomIndex(1)+1) - outputSet(maxDomIndex(1))) - outputSet(maxDomIndex(1)+1));
            case 'Gaussian'
                inc1 = halfBackGaussian(outputSet(maxDomIndex(1)-1), outputSet(maxDomIndex(1)), 'rising', maxDom);
                inc2 = halfBackGaussian(outputSet(maxDomIndex(1)), outputSet(maxDomIndex(1)+1), 'falling', maxDom);
        end
        incrementVoltage = (inc1 + inc2)/2;
    end
end

