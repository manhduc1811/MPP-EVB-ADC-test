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
% load PortType:
x_PortType_raw      = x_full(3540:1:3540+480-1);
% Substract mean:
x_PortType          = x_PortType_raw - mean(x_PortType_raw);
t_PortType          = (1:1:length(x_PortType))*dt;
% FFT calculation for DigitalLF
Nfft                = length(x_PortType);
deltaF              = Fs/Nfft;
tVectors            = (1:Nfft)*dt;
fVectors            = (1:Nfft)*deltaF;
% DigitalLF part to FFT calculation
fftPortTypeTem      = fft(x_PortType(1:1:Nfft),Nfft);
fftPortType         = abs(fftPortTypeTem);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot Full PortTypeHI
figure(4);
subplot(3,1,1);
plot(t_PortType,x_PortType);
title('PortTypeHI time signal.');
% plot time signal
subplot(3,1,2);
plot(tVectors,x_PortType(1:Nfft));
title("PortTypeHI: Time signal to FFT calculation.");
%axis([0 Nfft*1/Fs 0 1*scale]);
% plot fft output
subplot(3,1,3);
stem(fVectors,fftPortType);
title('PortTypeHI: Fourier transform. Abs.'); 
%axis([0 Fs 0 Nfft/2*scale]);
%axis([0 Fs 0 25]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%