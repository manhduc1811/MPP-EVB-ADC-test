%SoC, mducng
function peaks = myPeaksDetector(x)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Peaks detection module: finds max and these indexs 
% of a given signal "x"
% INPUT:
%        x:      signal in a one dimensional array
% OUTPUT:
%        Maxs:   max peak indexs and max peak values
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    leng         =  length(x);
    dx           =  [];
    peaks        =  [];
    for j = 2:leng-1 
        dx(j)    =  x(j)   - x(j-1);
        dx(j+1)  =  x(j+1) - x(j);    
        if(dx(j) == 0 || (dx(j) >= 0 && dx(j+1) < 0))
           peaks =  [peaks; j, x(j)];
        end
    end
end
