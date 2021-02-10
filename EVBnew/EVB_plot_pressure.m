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
% load pressureHF:
x_pressureHF_raw    = x_full(7506:1:7506+1312-1);
% Substract mean:
x_pressureHF        = x_pressureHF_raw - mean(x_pressureHF_raw);
t_pressureHF        = (1:1:length(x_pressureHF))*dt;
% FFT calculation for pressureHF
Nfft                = length(x_pressureHF);
deltaF              = Fs/Nfft;
tVectors            = (1:Nfft)*dt;
fVectors            = (1:Nfft)*deltaF;
% pressureHF part to FFT calculation
fftpressureHFTem    = fft(x_pressureHF(1:1:Nfft),Nfft);
fftpressureHF       = abs(fftpressureHFTem);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot Full Beacon LF
figure(7);
subplot(3,1,1);
plot(t_pressureHF,x_pressureHF);
title('pressureHF time signal.');
% plot time signal
subplot(3,1,2);
plot(tVectors,x_pressureHF(1:Nfft));
title("pressureHF: Time signal to FFT calculation.");
%axis([0 Nfft*1/Fs 0 1*scale]);
% plot fft output
subplot(3,1,3);
stem(fVectors,fftpressureHF);
title('pressureHF: Fourier transform. Abs.'); 
%axis([0 Fs 0 Nfft/2*scale]);
%axis([0 Fs 0 25]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%