function [start, maxs, mins, stop] = myFindpeaks(x)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% https://www.mathworks.com/matlabcentral/fileexchange/64092-peak-detection-of-1-d-signal
% findextremas - finds maximas and minimas (i. e. peaks or extremas) of
% given signal "x"
% INPUT:
% - x: signal in a one dimensional array
% OUTPUT:
% -start: start point index and its value
% -maxs:  max peak indexs and those values  
% -mins:  min peak indexs and those values 
% -stop:  stop point index and its value
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    leng        = length(x);
    df          = [];
    maxs        = [];
    mins        = [];
    for j = 2:leng-1 
        df(j)       =  x(j)   - x(j-1);
        df(j+1)     =  x(j+1) - x(j);    
        if df(j)    == 0 || ( df(j) >= 0 && df(j+1) < 0 )    
           maxs     = [maxs; j, x(j)];
        elseif df(j) == 0 || ( df(j) <= 0 && df(j+1) > 0 )
            mins    = [mins; j, x(j)];
        end
    end
    %  maxs = [1, inputs(1); maxs; leng, inputs(leng)];
    %  mins = [1, inputs(1); mins; leng, inputs(leng)];
    start  = [1, x(1)];
    stop   = [leng, x(leng)];
    %pks = [start; maxs; mins; stop];
end