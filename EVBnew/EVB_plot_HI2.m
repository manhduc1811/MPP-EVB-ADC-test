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
x_full              = dataraw;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Fs                  = 10^6;  
dt                  = 1/Fs;
t_full              = (0:1:length_full-1)*dt;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% load HI2:
x_HI2_raw           = x_full(11534:1:11534+142-1);
% Substract mean:
x_HI2               = x_HI2_raw - mean(x_HI2_raw);
t_HI2               = (1:1:length(x_HI2))*dt;
% FFT calculation for HI2
Nfft                = length(x_HI2);
deltaF              = Fs/Nfft;
tVectors            = (1:Nfft)*dt;
fVectors            = (1:Nfft)*deltaF;
% HI2 part to FFT calculation
fftHI2Tem           = fft(x_HI2(1:1:Nfft),Nfft);
fftHI2              = abs(fftHI2Tem);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot Full PortTypeHI2
figure(9);
subplot(3,1,1);
plot(t_HI2,x_HI2);
title('HI2 time signal.');
% plot time signal
subplot(3,1,2);
plot(tVectors,x_HI2(1:Nfft));
title("HI2: Time signal to FFT calculation.");
%axis([0 Nfft*1/Fs 0 1*scale]);
% plot fft output
subplot(3,1,3);
stem(fVectors,fftHI2);
title('HI2: Fourier transform. Abs.'); 
%axis([0 Fs 0 Nfft/2*scale]);
%axis([0 Fs 0 25]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%