%mducng/SoC/D2/G2touch
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;
close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% load txt file
load EVB1M.txt;
dataraw         = EVB1M;
temp            = size(dataraw);
length_full     = temp(1);
x_full          = dataraw;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Fs              = 10^6;  
dt              = 1/Fs;
t_full          = (0:1:length_full-1)*dt;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot time signal
figure(1);
subplot(2,1,1);
plot(t_full,x_full);
title('Full EVB time signal.');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% load Beacon LF:
x_beaconLF_raw  = x_full(1:1:1281);
% Substract mean:
x_beaconLF      = x_beaconLF_raw - mean(x_beaconLF_raw);
t_beaconLF      = (1:1:length(x_beaconLF))*dt;
% plot Full Beacon LF
figure(2);
subplot(3,1,1);
plot(t_beaconLF,x_beaconLF);
title('BeaconLF time signal.');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FFT calculation 
Nfft        = 2^7;
deltaF      = Fs/Nfft;
tVectors    = (1:Nfft)*dt;
fVectors    = (1:Nfft)*deltaF;
% Beacon LF part to FFT calculation
yBeaconTem  = fft(x_beaconLF(1:1:Nfft),Nfft);
yBeaconFFT  = abs(yBeaconTem);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot time signal
subplot(3,1,2);
plot(tVectors,x_beaconLF(1:Nfft));
title("Beacon LF: Time signal to FFT calculation.");
%axis([0 Nfft*1/Fs 0 1*scale]);
% plot fft output
subplot(3,1,3);
stem(fVectors,yBeaconFFT);
title('Beacon LF: Fourier transform. Abs.'); 
%axis([0 Fs 0 Nfft/2*scale]);
%axis([0 Fs 0 25]);