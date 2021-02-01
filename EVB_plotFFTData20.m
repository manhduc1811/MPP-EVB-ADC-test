%mducng/SoC/D2/G2touch
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;
close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% load txt file
load ./DataConverted/C2_1.txt;
dataC2raw    = C2_1;
dataC2       = dataC2raw - mean(dataC2raw);
temp         = size(dataC2);
length_full  = temp(1);
x_fullC2     = dataC2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Fs           = 4*10^6;  
dt           = 1/Fs;
t_full       = (0:1:length_full-1)*dt;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
scale        = 1;
% plot time signal
figure(1);
subplot(2,1,1);
%stem(t_full,x_full,':diamondr');
stem(t_full,x_fullC2,':diamondr');
%axis([0 2*length_full*dt 0.4*scale 0.6*scale]);
title('Full Colum C2 time signal. Abs.');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% run FFT
Nfft        = 2^10;
deltaF      = Fs/Nfft;
tVectors    = (0:(Nfft-1))*dt;
fVectors    = (0:(Nfft-1))*deltaF;
yC2         = fft(x_fullC2,Nfft);
yC2Abs      = abs(yC2/Nfft);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%
% plot time signal
figure(2);
subplot(2,1,1);
stem(tVectors,x_fullC2(1:Nfft),':diamondr');
title("Time signal to FFT calculation.");
%axis([0 Nfft*1/Fs 0 1*scale]);
%%%%%%%%%%%%%%
% plot fft output
subplot(2,1,2);
stem(fVectors,yC2Abs,':diamondr');
title('Fourier transform. Abs.'); 
%axis([0 Fs 0 Nfft/2*scale]);
%axis([0 Fs 0 25]);
