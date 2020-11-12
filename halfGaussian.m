function out = halfGaussian(start, stop, edge, value)
%GAUSSIAN Summary of this function goes here
%   Detailed explanation goes here

    interval = stop - start;
    interval = interval/2;
    
    switch edge
        case 'falling'
            out = exp(-(value - start).^2/(interval));
            if value > stop
                out = 0;
            elseif value < start
                out = 1;
            end
        case 'rising'
            out = exp(-(value - stop).^2/(interval));
            if value > stop
                out = 1;
            elseif value < start
                out = 0;
            end
    end
end

