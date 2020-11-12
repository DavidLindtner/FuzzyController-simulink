function out = halfBackGaussian(start, stop, edge, value)
%GAUSSIAN Summary of this function goes here
%   Detailed explanation goes here

    interval = stop - start;
    interval = interval/2;

    switch edge
        case 'falling'
            out = sqrt(-log(value) * interval) + start;
        case 'rising'
            out = 1 - sqrt(-log(value) * interval) + start;
    end
    if out > stop
        out = stop;
    elseif out < start
        out = start;
    end
end