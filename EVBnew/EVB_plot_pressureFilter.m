%mducng/SoC/D2/G2touch
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;
close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% load txt file
load EVB1M.txt;
dataraw                 = EVB1M;
temp                    = size(dataraw);
length_full             = temp(1);
x_full                  = dataraw;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Fs                      = 10^6;  
dt                      = 1/Fs;
t_full                  = (0:1:length_full-1)*dt;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% filter bandpass design
wp                      = 70000;                       % passband frequency
ws                      = 90000;                       % stopband frequency
n                       = 6;                      % filter order = 2*n = 12
w1                      = (2*wp)/Fs;
w2                      = (2*ws)/Fs;
wn                      = [w1,w2];
[b1, a1]                = butter(n,wn,'bandpass');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% filter lowpass design
wc                      = 30000;                       % Cutoff frequency
n                       = 6;                      % filter order = 2*n = 12
w1                      = (2*wc)/Fs;
[b2, a2]                = butter(n,w1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% load pressureHF:
x_pressureHF_raw        = x_full(7506:1:7506+1312-1);
% Substract mean:
x_pressureHFsm          = x_pressureHF_raw - mean(x_pressureHF_raw);
% Digital filter:
x_pressureHFbp          = filter(b1,a1,x_pressureHFsm);
x_pressureHFlp          = filter(b2,a2,x_pressureHFsm);
t_pressureHF            = (1:1:length(x_pressureHFsm))*dt;
% FFT calculation for pressureHF
Nfft                    = length(x_pressureHFlp);
deltaF                  = Fs/Nfft;
tVectors                = (1:Nfft)*dt;
fVectors                = (1:Nfft)*deltaF;
% pressureHF part to FFT calculation
fftpressureHFTem        = fft(x_pressureHFsm(1:1:Nfft),Nfft);
fftpressureHF           = abs(fftpressureHFTem);
fftpressureHFbpTem      = fft(x_pressureHFbp(1:1:Nfft),Nfft);
fftpressureHFbp         = abs(fftpressureHFbpTem);
fftpressureHFlpTem      = fft(x_pressureHFlp(1:1:Nfft),Nfft);
fftpressureHFlp         = abs(fftpressureHFlpTem);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot Full Beacon LF
figure(1);
subplot(3,1,1);
plot(t_pressureHF,x_pressureHFsm);
title('pressureHF time signal.');
% plot time signal
subplot(3,1,2);
plot(tVectors,x_pressureHFsm(1:Nfft));
title("pressureHF: Time signal to FFT calculation.");
%axis([0 Nfft*1/Fs 0 1*scale]);
% plot fft output
subplot(3,1,3);
stem(fVectors,fftpressureHF);
title('pressureHF: Fourier transform. Abs.'); 
%axis([0 Fs 0 Nfft/2*scale]);
%axis([0 Fs 0 25]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot Full Beacon LF
figure(2);
subplot(3,1,1);
plot(t_pressureHF,x_pressureHFbp);
title('pressureHF time signal.');
% plot time signal
subplot(3,1,2);
plot(tVectors,x_pressureHFbp(1:Nfft));
title("pressureHF: Time signal to FFT calculation.");
%axis([0 Nfft*1/Fs 0 1*scale]);
% plot fft output
subplot(3,1,3);
stem(fVectors,fftpressureHFbp);
title('pressureHF: Fourier transform. Abs.'); 
%axis([0 Fs 0 Nfft/2*scale]);
%axis([0 Fs 0 25]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot Full Beacon LF
figure(3);
subplot(3,1,1);
plot(t_pressureHF,x_pressureHFlp);
title('pressureHF time signal.');
% plot time signal
subplot(3,1,2);
plot(tVectors,x_pressureHFlp(1:Nfft));
title("pressureHF: Time signal to FFT calculation.");
%axis([0 Nfft*1/Fs 0 1*scale]);
% plot fft output
subplot(3,1,3);
stem(fVectors,fftpressureHFlp);
title('pressureHF: Fourier transform. Abs.'); 
%axis([0 Fs 0 Nfft/2*scale]);
%axis([0 Fs 0 25]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot mixed signal and filtered signal:
figure(4);
plot(t_pressureHF,x_pressureHFsm);
hold on;
plot(t_pressureHF,x_pressureHFbp);
hold on;
plot(t_pressureHF,x_pressureHFlp);
legend('Mixed signal.','Filtered signal BP.','Filtered signal LP.');