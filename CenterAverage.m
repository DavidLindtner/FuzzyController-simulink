function [incrementVoltage] = CenterAverage(DOM, outputSet, memType)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    out1 = 0;
    out2 = 0;

    maxDomIndex1 = find(DOM==max(DOM));
    maxDom1 = DOM(maxDomIndex1(1));
    
    DOM(maxDomIndex1(1)) = 0;
    
    maxDomIndex2 = find(DOM==max(DOM));
    maxDom2 = DOM(maxDomIndex2(1));
    
%%  find output value of highest maximum
%   VERY VERY LOW output rule
    if maxDomIndex1(1) == 1
        if maxDom1 >= 1
            out1 = outputSet(1);
        else
            switch memType
                case 'Triangullar'
                    out1 = -(maxDom1 * (outputSet(2) - outputSet(1)) - outputSet(2));
                case 'Gaussian'
                    out1 = halfBackGaussian(outputSet(1), outputSet(2), 'falling', maxDom1);
            end
        end
        
%   VERY VERY HIGH output rule
    elseif maxDomIndex1(1) == max(size(outputSet))
        if maxDom1 >= 1
            out1 = outputSet(5);
        else
            switch memType
                case 'Triangullar'
                    out1 = maxDom1 * (outputSet(maxDomIndex1(1)) - outputSet(maxDomIndex1(1)-1)) + outputSet(maxDomIndex1(1)-1);
                case 'Gaussian'
                    out1 = halfBackGaussian(outputSet(maxDomIndex1(1)-1), outputSet(maxDomIndex1(1)), 'rising', maxDom1);
            end
        end
        
%   All other rule
    else
        switch memType
            case 'Triangullar'
                inc1 = maxDom1 * (outputSet(maxDomIndex1(1)) - outputSet(maxDomIndex1(1)-1)) + outputSet(maxDomIndex1(1)-1);
                inc2 = -(maxDom1 *(outputSet(maxDomIndex1(1)+1) - outputSet(maxDomIndex1(1))) - outputSet(maxDomIndex1(1)+1));
            case 'Gaussian'
                inc1 = halfBackGaussian(outputSet(maxDomIndex1(1)-1), outputSet(maxDomIndex1(1)), 'rising', maxDom1);
                inc2 = halfBackGaussian(outputSet(maxDomIndex1(1)), outputSet(maxDomIndex1(1)+1), 'falling', maxDom1);
        end
        out1 = (inc1 + inc2)/2;
    end
    
    
%%  find output value of second highest maximum
%   VERY VERY LOW output rule
    if maxDomIndex2(1) == 1
        if maxDom2 >= 1
            out2 = outputSet(1);
        else
            switch memType
                case 'Triangullar'
                    out2 = -(maxDom2 * (outputSet(2) - outputSet(1)) - outputSet(2));
                case 'Gaussian'
                    out2 = halfBackGaussian(outputSet(1), outputSet(2), 'falling', maxDom2);
            end
        end
        
%   VERY VERY HIGH output rule
    elseif maxDomIndex2(1) == max(size(outputSet))
        if maxDom2 >= 1
            out2 = outputSet(5);
        else
            switch memType
                case 'Triangullar'
                    out2 = maxDom2 * (outputSet(maxDomIndex2(1)) - outputSet(maxDomIndex2(1)-1)) + outputSet(maxDomIndex2(1)-1);
                case 'Gaussian'
                    out2 = halfBackGaussian(outputSet(maxDomIndex2(1)-1), outputSet(maxDomIndex2(1)), 'rising', maxDom2);
            end
        end
        
%   All other rule
    else
        switch memType
            case 'Triangullar'
                inc1 = maxDom2 * (outputSet(maxDomIndex2(1)) - outputSet(maxDomIndex2(1)-1)) + outputSet(maxDomIndex2(1)-1);
                inc2 = -(maxDom2 *(outputSet(maxDomIndex2(1)+1) - outputSet(maxDomIndex2(1))) - outputSet(maxDomIndex2(1)+1));
            case 'Gaussian'
                inc1 = halfBackGaussian(outputSet(maxDomIndex2(1)-1), outputSet(maxDomIndex2(1)), 'rising', maxDom2);
                inc2 = halfBackGaussian(outputSet(maxDomIndex2(1)), outputSet(maxDomIndex2(1)+1), 'falling', maxDom2);
        end
        out2 = (inc1 + inc2)/2;
    end
    
    incrementVoltage = (out1*maxDom1 + out2*maxDom2) / (maxDom1 + maxDom2);
end

