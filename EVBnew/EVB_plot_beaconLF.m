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
% load Beacon LF:
x_beaconLF_raw      = x_full(1:1:1342);
% Substract mean:
x_beaconLF          = x_beaconLF_raw - mean(x_beaconLF_raw);
t_beaconLF          = (1:1:length(x_beaconLF))*dt;
% FFT calculation for BeaconLF
Nfft                = length(x_beaconLF);
deltaF              = Fs/Nfft;
tVectors            = (1:Nfft)*dt;
fVectors            = (1:Nfft)*deltaF;
% Beacon LF part to FFT calculation
fftBeaconLFTem      = fft(x_beaconLF(1:1:Nfft),Nfft);
fftBeaconLF         = abs(fftBeaconLFTem);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot Full Beacon LF
figure(1);
subplot(3,1,1);
plot(t_beaconLF,x_beaconLF);
title('BeaconLF time signal.');
% plot time signal
subplot(3,1,2);
plot(tVectors,x_beaconLF(1:Nfft));
title("Beacon LF: Time signal to FFT calculation.");
%axis([0 Nfft*1/Fs 0 1*scale]);
% plot fft output
subplot(3,1,3);
stem(fVectors,fftBeaconLF);
title('Beacon LF: Fourier transform. Abs.'); 
%axis([0 Fs 0 Nfft/2*scale]);
%axis([0 Fs 0 25]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% filter lowpass design
Fs                      = 1000000;                     % sampling frequency (Hz)
wc                      = 30000;                       % Cutoff frequency
n                       = 6;                           % filter order = 2*n = 12
w1                      = (2*wc)/Fs;
[b1, a1]                = butter(n,w1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% filter highpass design
Fs                      = 1000000;                     % sampling frequency (Hz)
wp                      = 150000;                      % highpass frequency
n                       = 6;                           % filter order = 2*n = 12
wn                      = (2*wp)/Fs;
[b2, a2]                = butter(n,wn,'high');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x_beaconLF_lp           = filter(b1,a1,x_beaconLF);
x_beaconLF_hp           = filter(b2,a2,x_beaconLF);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(2);
subplot(3,1,1);
plot(t_beaconLF,x_beaconLF);
title('BeaconLF time signal.');
% plot time signal
subplot(3,1,2);
plot(t_beaconLF,x_beaconLF_lp);
title('Beacon TIP: result of using LPF(fc = 30,000Hz).');
%axis([0 Nfft*1/Fs 0 1*scale]);
% plot fft output
subplot(3,1,3);
plot(t_beaconLF,x_beaconLF_hp);
title('Beacon RING: result of using HPF (fp = 150,000Hz).');