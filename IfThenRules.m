function [DOM] = IfThenRules(err, dErr, inputSetErr, inputSetDErr, fType, memType, outDim)
%IfThenRules multiple fuzzy if then rule based on fuzzy input sets.
%   DOM = matrix with degrees of membership for all output rules.


%________________________
%      |      error      |
%dError|  L  |  Z  |  H  |
%______|_____|_____|_____|
%   L  | VL     L     Z  |
%   Z  |  L     Z     H  |
%   H  |  Z     H    VH  |
%________________________|

%________________________
%      |      error      |
%dError|  L  |  Z  |  H  |
%______|_____|_____|_____|
%   L  | VVL    L     Z  |
%   Z  | VL     Z    VH  |
%   H  |  Z     H    VVH |
%________________________|

%______________________________
%      |      error            |
%dError| VL  |  L  |  H  |  VH |
%______|_____|_____|_____|_____|
%  VL  | VL    VL     L     Z  |
%   L  | VL     L     Z     H  |
%   H  |  L     Z     H    VH  |
%  VH  |  Z     H    VH    VH  |
%______________________________|

%______________________________
%      |      error            |
%dError| VL  |  L  |  H  |  VH |
%______|_____|_____|_____|_____|
%  VL  | VVL   VL     L     Z  |
%   L  | VL     L     Z     H  |
%   H  |  L     Z     H    VH  |
%  VH  |  Z     H    VH    VVH |
%______________________________|


    if outDim ~= 5 && outDim ~= 7
        error('ERROR - wrong output dimesion')
    end
    
    DOM = zeros(1, outDim);
    DOM_mm = zeros(1, max(size(inputSetErr)) * max(size(inputSetDErr)));
    DOM_mp = zeros(1, max(size(inputSetErr)) * max(size(inputSetDErr)));
    domErr = 0;
    domDErr = 0;
    

%%  main loop
    for i = 1:max(size(inputSetErr))
        for j = 1:max(size(inputSetDErr))
            if i == 1
                switch memType
                    case 'Triangullar'
                        domErr = (inputSetErr(i+1) - err)/(inputSetErr(i+1) - inputSetErr(i));
                        if domErr > 1
                            domErr = 1;
                        end
                    case 'Gaussian'
                        domErr = halfGaussian(inputSetErr(i), inputSetErr(i+1), 'falling', err);
                end
            elseif i == max(size(inputSetErr))
                switch memType
                    case 'Triangullar'
                        domErr = (err - inputSetErr(end-1))/(inputSetErr(end) - inputSetErr(end-1));
                        if domErr > 1
                            domErr = 1;
                        end
                    case 'Gaussian'
                        domErr = halfGaussian(inputSetErr(end-1), inputSetErr(end), 'rising', err);
                end
            else
                if err > inputSetErr(i-1) && err < inputSetErr(i+1)
                    if err > inputSetErr(i-1) && err < inputSetErr(i)
                        switch memType
                            case 'Triangullar'
                                domErr = (err - inputSetErr(i-1))/(inputSetErr(i) - inputSetErr(i-1));
                            case 'Gaussian'
                                domErr = halfGaussian(inputSetErr(i-1), inputSetErr(i), 'rising', err);
                        end
                    else
                        switch memType
                            case 'Triangullar'
                                domErr = (inputSetErr(i+1) - err)/(inputSetErr(i+1) - inputSetErr(i));
                            case 'Gaussian'
                                domErr = halfGaussian(inputSetErr(i), inputSetErr(i+1), 'falling', err);
                        end
                    end
                end
            end
            
            if j == 1
                switch memType
                    case 'Triangullar'
                        domDErr = (inputSetDErr(j+1) - dErr)/(inputSetDErr(j+1) - inputSetDErr(j));
                        if domDErr > 1
                            domDErr = 1;
                        end
                    case 'Gaussian'
                        domDErr = halfGaussian(inputSetDErr(j), inputSetDErr(j+1), 'falling', dErr);
                end
            elseif j == max(size(inputSetDErr))
                switch memType
                    case 'Triangullar'
                        domDErr = (dErr - inputSetDErr(end-1))/(inputSetDErr(end) - inputSetDErr(end-1));
                        if domDErr > 1
                            domDErr = 1;
                        end
                    case 'Gaussian'
                        domDErr = halfGaussian(inputSetDErr(end-1), inputSetDErr(end), 'rising', dErr);
                end
            else
                if dErr > inputSetDErr(j-1) && dErr < inputSetDErr(j+1)
                    if dErr > inputSetDErr(j-1) && dErr < inputSetDErr(j)
                        switch memType
                            case 'Triangullar'
                                domDErr = (dErr - inputSetDErr(j-1))/(inputSetDErr(j) - inputSetDErr(j-1));
                            case 'Gaussian'
                                domDErr = halfGaussian(inputSetDErr(j-1), inputSetDErr(j), 'rising', dErr);
                        end
                    else
                        switch memType
                            case 'Triangullar'
                                domDErr = (inputSetDErr(j+1) - dErr)/(inputSetDErr(j+1) - inputSetDErr(j));
                            case 'Gaussian'
                                domDErr = halfGaussian(inputSetDErr(j), inputSetDErr(j+1), 'falling', dErr);
                        end
                    end
                end
            end
            if domErr < 0
                domErr = 0;
            end
            if domDErr < 0
                domDErr = 0;
            end
            DOM_mm(i+(j-1)*max(size(inputSetErr))) = min(domErr, domDErr);
            DOM_mp(i+(j-1)*max(size(inputSetErr))) = domErr * domDErr;
        end
    end
    
%%  output cases for multiple input possibilities
    switch fType
        case 'Mamdani minimum'
            if outDim == 5
                if max(size(inputSetErr)) == 3
                    DOM(1) = DOM_mm(1);
                    DOM(2) = max(DOM_mm(2), DOM_mm(4));
                    DOM(3) = max(DOM_mm(3), max(DOM_mm(5), DOM_mm(7)));
                    DOM(4) = max(DOM_mm(6), DOM_mm(8));
                    DOM(5) = DOM_mm(9);
                elseif max(size(inputSetErr)) == 4
                    DOM(1) = max(DOM_mm(1), max(DOM_mm(2), DOM_mm(5)));
                    DOM(2) = max(DOM_mm(3), max(DOM_mm(6), DOM_mm(9)));
                    DOM(3) = max(DOM_mm(4), max(DOM_mm(7), max(DOM_mm(10), DOM_mm(13))));
                    DOM(4) = max(DOM_mm(8), max(DOM_mm(11), DOM_mm(14)));
                    DOM(5) = max(DOM_mm(12), max(DOM_mm(15), DOM_mm(16)));
                end
            elseif outDim == 7
                if max(size(inputSetErr)) == 3
                    DOM(1) = DOM_mm(1);
                    DOM(2) = DOM_mm(4);
                    DOM(3) = DOM_mm(2);
                    DOM(4) = max(DOM_mm(3), max(DOM_mm(5), DOM_mm(7)));
                    DOM(5) = DOM_mm(8);
                    DOM(6) = DOM_mm(6);
                    DOM(7) = DOM_mm(9);
                elseif max(size(inputSetErr)) == 4
                    DOM(1) = DOM_mm(1);
                    DOM(2) = max(DOM_mm(2), DOM_mm(5));
                    DOM(3) = max(DOM_mm(3), max(DOM_mm(6), DOM_mm(9)));
                    DOM(4) = max(DOM_mm(4), max(DOM_mm(7), max(DOM_mm(10), DOM_mm(15))));
                    DOM(5) = max(DOM_mm(8), max(DOM_mm(11), DOM_mm(14)));
                    DOM(6) = max(DOM_mm(12), DOM_mm(15));
                    DOM(7) = DOM_mm(16);
                end
            end
        case 'Mamdani product'
            if outDim == 5
                if max(size(inputSetErr)) == 3
                    DOM(1) = DOM_mp(1);
                    DOM(2) = max(DOM_mp(2), DOM_mp(4));
                    DOM(3) = max(DOM_mp(3), max(DOM_mp(5), DOM_mp(7)));
                    DOM(4) = max(DOM_mp(6), DOM_mp(8));
                    DOM(5) = DOM_mp(9);
                elseif max(size(inputSetErr)) == 4
                    DOM(1) = max(DOM_mm(1), max(DOM_mm(2), DOM_mm(5)));
                    DOM(2) = max(DOM_mm(3), max(DOM_mm(6), DOM_mm(9)));
                    DOM(3) = max(DOM_mm(4), max(DOM_mm(7), max(DOM_mm(10), DOM_mm(13))));
                    DOM(4) = max(DOM_mm(8), max(DOM_mm(11), DOM_mm(14)));
                    DOM(5) = max(DOM_mm(12), max(DOM_mm(15), DOM_mm(16)));
                end
            elseif outDim == 7
                if max(size(inputSetErr)) == 3
                    DOM(1) = DOM_mm(1);
                    DOM(2) = DOM_mm(4);
                    DOM(3) = DOM_mm(2);
                    DOM(4) = max(DOM_mm(3), max(DOM_mm(5), DOM_mm(7)));
                    DOM(5) = DOM_mm(8);
                    DOM(6) = DOM_mm(6);
                    DOM(7) = DOM_mm(9);
                elseif max(size(inputSetErr)) == 4
                    DOM(1) = DOM_mm(1);
                    DOM(2) = max(DOM_mm(2), DOM_mm(5));
                    DOM(3) = max(DOM_mm(3), max(DOM_mm(6), DOM_mm(9)));
                    DOM(4) = max(DOM_mm(4), max(DOM_mm(7), max(DOM_mm(10), DOM_mm(15))));
                    DOM(5) = max(DOM_mm(8), max(DOM_mm(11), DOM_mm(14)));
                    DOM(6) = max(DOM_mm(12), DOM_mm(15));
                    DOM(7) = DOM_mm(16);
                end
            end
    end
end

