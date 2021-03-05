clc;
clear;
close all;
for j = 0:1:31
    formatSpec ="(x(i+%d) < x(i+%d+1)) && ...\n";
    fprintf(formatSpec,j,j);
end