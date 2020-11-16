function [changeVoltage] = TakagiSugeno(error, dError, DOM)

    outDim=max(size(DOM));
    changeVoltage = 0;

    if outDim == 5
        %vector of proportinal gains
        Kp=[3 3 3 3 3];
        %vector of integrative gains
        Ki=[3 3 3 3 3];
    elseif outDim == 7
        %vector of proportinal gains
        Kp=[3 3 3 3 3 3 3];
        %vector of integrative gains
        Ki=[3 3 3 3 3 3 3];
    end

        deltaVp=zeros(1,outDim(1)); 
        deltaVp=Kp.*dError+Ki.*error;

    changeVoltage = (sum(DOM.*deltaVp))/sum(DOM);
end