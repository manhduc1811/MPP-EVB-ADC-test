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
x_beaconLF_raw          = x_full(1:1:1280);
% Substract mean:
x_beaconLF              = x_beaconLF_raw - mean(x_beaconLF_raw);
x_beaconLF_lp           = filter(b,a,x_beaconLF);
t_beaconLF              = (1:1:length(x_beaconLF))*dt;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Down sampling
ss                      = 10;
Fs_new                  = Fs/ss;
dt_new                  = 1/Fs_new;
x_full_new              = x_full(1:ss:length(x_full));
x_beaconLF_lp_new       = x_beaconLF_lp(1:ss:length(x_beaconLF));
t_full_new              = t_full(1:ss:length(x_full));
t_beaconLF_new          = t_beaconLF(1:ss:length(x_beaconLF));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matched filter:
y_Conv_new              = conv(x_full_new,x_beaconLF_lp_new);
size_Corr_new           = size(t_beaconLF_new)+size(t_full_new)-1;
t_Conv_new              = (1:1:size_Corr_new(2))*dt_new;
peaks1                  = myPeaksDetector(y_Conv_new);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1);
subplot(3,1,1);
stem(t_full_new,x_full_new,'k');
axis([-0.5*10^(-3) 4*10^(-3) -0.2 0.2]);
title('Full EVB time signal.');
%figure(2);
subplot(3,1,2);
stem(t_beaconLF_new,x_beaconLF_lp_new,'k');
axis([-0.5*10^(-3) 4*10^(-3) -0.2 0.2]);
title('Reference BeaconLF signal.');
%figure(3);
subplot(3,1,3);
stem(t_Conv_new,y_Conv_new,'k');
axis([-0.5*10^(-3) 4*10^(-3) -0.2 0.2]);
title('Detector signal.');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x_full_new2             = [x_full_new; x_full_new;x_full_new;x_full_new];
y_Conv_new2             = conv(x_full_new2,x_beaconLF_lp_new);
peaks2                  = myPeaksDetector(y_Conv_new2);
figure(2);
subplot(3,1,1);
plot(y_Conv_new2,'k');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
beaconStop1 = myWindow32(peaks1(:,2));
beaconStop2 = myWindow32(peaks2(:,2));