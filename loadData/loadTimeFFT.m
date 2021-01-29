%mducng/SoC/D2/G2touch
% Load time signal from txt file
% Calculate FFT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;
close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load testData.dat;
Fs    = 22000;
x     = testData(2001:2500);
t     = 0:1/Fs:(2500-2001)/Fs;
Nfft  = 1024;
df    = Fs/Nfft;
f     = (0:Nfft-1)*df;
y     = fft(x,Nfft);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1);
subplot(3,1,1); 
plot(t,x);
axis([0 0.0227 -0.7 0.9]);
xlabel('time (s)');
ylabel('vowel of "a"');
subplot(3,1,2); 
stem(f,abs(y));
subplot(3,1,3); 
stem(f,imag(y));
