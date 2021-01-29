%mducng/SoC/D2/G2touch
clc;
clear;
close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% UI to open file
[filename, pathname] = uigetfile({'*.txt'},'File Selector');
if ~ischar(filename)
    return;  % User aborted the file selection
end
file        = fullfile(pathname, filename);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Open file
[fid,meg]   = fopen(file, 'r');
if fid      == -1
    error(msg);
end
nextline    = '';
str         = '';
while ischar(nextline)
    nextline = fgetl(fid);
    if ischar(nextline)
        str = [str; nextline];
    end
end
fclose(fid);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fi function
%data = fi([], 0, 12, 0);   % For no scaling data
data        = fi([], 0, 12, 12); % For scaling data with scaling factor: 2^12
data.hex    = str;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%fileID   = fopen('C0_2.txt','a');
fileID      = fopen('C0_1.txt','a');
fprintf(fileID,'%f\n',data);
fclose(fileID);