%mducng/SoC/D2/G2touch
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;
close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% filter lowpass design
Fs                      = 1000000;                     % sampling frequency (Hz)
wc                      = 30000;                       % Cutoff frequency
n                       = 6;                           % filter order = 2*n = 12
w1                      = (2*wc)/Fs;
[b, a]                  = butter(n,w1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% load txt file
load EVB1M.txt;
dataraw                 = EVB1M;
temp                    = size(dataraw);
length_full             = temp(1);
x_full_raw              = dataraw;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Fs                      = 10^6;  
dt                      = 1/Fs;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Substract mean:
x_full                  = x_full_raw - mean(x_full_raw);
t_full                  = (1:1:length(x_full))*dt;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% load Beacon LF:
x_beaconLF_raw          = x_full(1:1:1281);
% Substract mean:
x_beaconLF              = x_beaconLF_raw - mean(x_beaconLF_raw);
x_beaconLF_lp           = filter(b,a,x_beaconLF);
t_beaconLF              = (1:1:length(x_beaconLF))*dt;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matched filter:
y_Corr                  = conv(x_full,x_beaconLF_lp);
size_Corr               = size(t_beaconLF)+size(t_full)-1;
t_Corr                  = (0:1:size_Corr(2)-1)*dt;
% plot full EVB time signal
figure(1);
subplot(3,1,1);
plot(t_full,x_full,'k');
axis([-0.5*10^(-3) 4*10^(-3) -0.2 0.2]);
title('Full EVB time signal.');
%figure(2);
subplot(3,1,2);
plot(t_beaconLF,x_beaconLF_lp,'k');
axis([-0.5*10^(-3) 4*10^(-3) -0.2 0.2]);
title('Reference BeaconLF signal.');
%figure(3);
subplot(3,1,3);
plot(t_Corr,y_Corr,'k');
axis([-0.5*10^(-3) 4*10^(-3) -3 3]);
title('Detector signal.');
% plot full EVB time signal
figure(2);
subplot(3,1,1);
plot(t_full,x_full);
%axis([-0.016 0.016 -0.15 0.15]);
title('Full EVB time signal.');
subplot(3,1,2);
plot(t_beaconLF,x_beaconLF_lp);
%axis([0 0.016 -0.15 0.15]);
title('Reference BeaconLF signal.');
subplot(3,1,3);
plot(t_Corr,y_Corr);
%axis([-0.016 0.004 -3 3]);
title('Detector signal.');