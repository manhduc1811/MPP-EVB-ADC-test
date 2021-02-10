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
% load HI:
x_HI_raw            = x_full(4027:1:4027+142-1);
% Substract mean:
x_HI                = x_HI_raw - mean(x_HI_raw);
t_HI                = (1:1:length(x_HI))*dt;
% FFT calculation for HI
Nfft                = length(x_HI);
deltaF              = Fs/Nfft;
tVectors            = (1:Nfft)*dt;
fVectors            = (1:Nfft)*deltaF;
% HI part to FFT calculation
fftHITem            = fft(x_HI(1:1:Nfft),Nfft);
fftHI               = abs(fftHITem);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot Full PortTypeHI
figure(5);
subplot(3,1,1);
plot(t_HI,x_HI);
title('HI time signal.');
% plot time signal
subplot(3,1,2);
plot(tVectors,x_HI(1:Nfft));
title("HI: Time signal to FFT calculation.");
%axis([0 Nfft*1/Fs 0 1*scale]);
% plot fft output
subplot(3,1,3);
stem(fVectors,fftHI);
title('HI: Fourier transform. Abs.'); 
%axis([0 Fs 0 Nfft/2*scale]);
%axis([0 Fs 0 25]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%