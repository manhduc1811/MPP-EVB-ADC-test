%mducng/SoC/D2/G2touch
% Load time signal from txt file
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; 
clear; 
close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Fs          =  100;
dT          =  1/Fs;
f1          =  10;
f2          =  10.2;
Nfft        =  Fs;
dF          =  Fs/Nfft;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tVectors    =  (0:1:(Nfft-1))*dT;
x1          =  cos(2*pi*f1*tVectors);
x2          =  cos(2*pi*f2*tVectors);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fVectors    =  (0:1:(Nfft-1))*dF;
y1          =   fft(x1,Nfft);
y2          =   fft(x2,Nfft);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot time signal
subplot(2,2,1);
stem(tVectors,x1);
xlabel('Time (s)');
ylabel('Amplitude ');
subplot(2,2,2);
stem(tVectors,x2);
xlabel('Time (s)');
ylabel('Amplitude ');
%Plot frequency signal
subplot(2,2,3);
stem(fVectors,abs(y1/Nfft));
xlabel('Frequency (Hz)');
ylabel('Power ');
subplot(2,2,4);
stem(fVectors,abs(y2/Nfft));
xlabel('Frequency (Hz)');
ylabel('Power ');
