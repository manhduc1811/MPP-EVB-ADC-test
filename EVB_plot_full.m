%mducng/SoC/D2/G2touch
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;
close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% load txt file
load EVB1M.txt;
dataraw             = EVB1M;
temp                = size(dataraw);
length_full         = temp(1);
x_full_raw          = dataraw;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Fs                  = 10^6;  
dt                  = 1/Fs;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Substract mean:
x_full              = x_full_raw - mean(x_full_raw);
t_full              = (1:1:length(x_full))*dt;
% FFT calculation for BeaconLF
Nfft                = length(x_full);
deltaF              = Fs/Nfft;
tVectors            = (1:Nfft)*dt;
fVectors            = (1:Nfft)*deltaF;
% Beacon LF part to FFT calculation
fftfullTem          = fft(x_full(1:1:Nfft),Nfft);
fftfull             = abs(fftfullTem);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot full EVB time signal
figure(1);
subplot(3,1,1);
plot(t_full,x_full_raw);
title('Full EVB time signal.');
subplot(3,1,2);
plot(t_full,x_full);
title('Full EVB time signal with subtract mean.');
% plot fft output
subplot(3,1,3);
plot(fVectors,fftfull);
title('Full: Fourier transform. Abs.'); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%