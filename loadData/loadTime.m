%mducng/SoC/D2/G2touch
% Load time signal from txt file
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;
close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load testData.dat;
x     = testData(2001:2500);
Fs    = 22000;
t     = 0:1/Fs:(2500-2001)/Fs;
plot(t,x);
axis([0 0.0227 -0.7 0.9]);
xlabel('time (s)');
ylabel('vowel of "a"');
