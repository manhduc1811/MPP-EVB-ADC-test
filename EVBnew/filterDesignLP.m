%mducng/SoC/D2/G2touch
clc;
clear;
close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% filter lowpass design
Fs                      = 1000000;                     % sampling frequency (Hz)
wc                      = 30000;                       % Cutoff frequency
n                       = 6;                           % filter order = 2*n = 12
w1                      = (2*wc)/Fs;
[b, a]                = butter(n,w1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
w                       = 0:0.01:pi;
[h, om]                 = freqz(b, a, w);
m                       = 20*log10(abs(h));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot magnitude response of designed filter:
figure(1); 
plot(om/pi*(Fs/2), m);
ylabel('Gain (dB)');
xlabel('Frequency (Hz)');
