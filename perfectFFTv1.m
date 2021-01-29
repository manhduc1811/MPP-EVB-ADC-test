%mducng/SoC/D2/G2touch
% Load time signal from txt file
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; 
clear; 
close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Fs          =  1000;
dT          =  1/Fs;
f1          =  10;
f2          =  200;
Nfft        =  Fs;
dF          =  Fs/Nfft;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tVectors    =  (0:1:(Nfft-1))*dT;
x1          =  0.5*cos(2*pi*f1*tVectors) + 0.5*cos(2*pi*f2*tVectors);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fVectors    =  (0:1:(Nfft-1))*dF;
y1          =   fft(x1,Nfft);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot time signal
subplot(2,1,1);
plot(tVectors,x1);
xlabel('Time (s)');
ylabel('Amplitude ');
%Plot frequency signal
subplot(2,1,2);
stem(fVectors,abs(y1/Nfft));
xlabel('Frequency (Hz)');
ylabel('Power ');
