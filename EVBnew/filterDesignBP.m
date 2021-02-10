%mducng/SoC/D2/G2touch
clc;
clear;
close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% filter bandpass design
Fs                      = 1000000;                     % sampling frequency (Hz)
wp                      = 70000;                       % passband frequency
ws                      = 90000;                       % stopband frequency
n                       = 6;                           % filter order = 2*n = 12
w1                      = (2*wp)/Fs;
w2                      = (2*ws)/Fs;
wn                      = [w1,w2];
[b, a]                  = butter(n,wn,'bandpass');
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