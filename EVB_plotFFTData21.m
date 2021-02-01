%mducng/SoC/D2/G2touch
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;
close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% load txt file
load ./DataConverted/C0_1.txt;
load ./DataConverted/C1_1.txt;
load ./DataConverted/C2_1.txt;
load ./DataConverted/C3_1.txt;
load ./DataConverted/C4_1.txt;
load ./DataConverted/C5_1.txt;
load ./DataConverted/C6_1.txt;
load ./DataConverted/C7_1.txt;
load ./DataConverted/R0_1.txt;
load ./DataConverted/R1_1.txt;
load ./DataConverted/R2_1.txt;
load ./DataConverted/R3_1.txt;
load ./DataConverted/R4_1.txt;
load ./DataConverted/R5_1.txt;
load ./DataConverted/R6_1.txt;
load ./DataConverted/R7_1.txt;
dataC0       = C0_1;
dataC1       = C1_1;
dataC2       = C2_1;
dataC3       = C3_1;
dataC4       = C4_1;
dataC5       = C5_1;
dataC6       = C6_1;
dataC7       = C7_1;
dataR0       = R0_1;
dataR1       = R1_1;
dataR2       = R2_1;
dataR3       = R3_1;
dataR4       = R4_1;
dataR5       = R5_1;
dataR6       = R6_1;
dataR7       = R7_1;
temp         = size(dataC2);
length_full  = temp(1);
x_fullC0     = dataC0;
x_fullC1     = dataC1;
x_fullC2     = dataC2;
x_fullC3     = dataC3;
x_fullC4     = dataC4;
x_fullC5     = dataC5;
x_fullC6     = dataC6;
x_fullC7     = dataC7;
x_fullR0     = dataR0;
x_fullR1     = dataR1;
x_fullR2     = dataR2;
x_fullR3     = dataR3;
x_fullR4     = dataR4;
x_fullR5     = dataR5;
x_fullR6     = dataR6;
x_fullR7     = dataR7;
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
plot(t_full,x_fullC0,t_full,x_fullC1,t_full,x_fullC2,t_full,x_fullC3,t_full,...
    x_fullC4,t_full,x_fullC5,t_full,x_fullC6,t_full,x_fullC7);
%axis([0 2*length_full*dt 0.4*scale 0.6*scale]);
title('Column Time signal. Abs.');

subplot(2,1,2);
%stem(t_full,x_full,':diamondr');
plot(t_full,x_fullR0,t_full,x_fullR1,t_full,x_fullR2,t_full,x_fullR3,t_full,...
    x_fullR4,t_full,x_fullR5,t_full,x_fullR6,t_full,x_fullR7);
%axis([0 2*length_full*dt 0.4*scale 0.6*scale]);
title('Row Time signal. Abs.');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% run FFT
Nfft        = 2^10;
deltaF      = Fs/Nfft;
tVectors    = (0:(Nfft-1))*dt;
fVectors    = (0:(Nfft-1))*deltaF;
yC0         = fft(x_fullC0,Nfft);
yC0Abs      = abs(yC0/Nfft);
yC1         = fft(x_fullC1,Nfft);
yC1Abs      = abs(yC1/Nfft);
yC2         = fft(x_fullC2,Nfft);
yC2Abs      = abs(yC2/Nfft);
yC3         = fft(x_fullC3,Nfft);
yC3Abs      = abs(yC3/Nfft);
yC4         = fft(x_fullC4,Nfft);
yC4Abs      = abs(yC4/Nfft);
yC5         = fft(x_fullC5,Nfft);
yC5Abs      = abs(yC5/Nfft);
yC6         = fft(x_fullC6,Nfft);
yC6Abs      = abs(yC6/Nfft);
yC7         = fft(x_fullC7,Nfft);
yC7Abs      = abs(yC7/Nfft);

yR0         = fft(x_fullR0,Nfft);
yR0Abs      = abs(yR0/Nfft);
yR1         = fft(x_fullR1,Nfft);
yR1Abs      = abs(yR1/Nfft);
yR2         = fft(x_fullR2,Nfft);
yR2Abs      = abs(yR2/Nfft);
yR3         = fft(x_fullR3,Nfft);
yR3Abs      = abs(yR3/Nfft);
yR4         = fft(x_fullR4,Nfft);
yR4Abs      = abs(yR4/Nfft);
yR5         = fft(x_fullR5,Nfft);
yR5Abs      = abs(yR5/Nfft);
yR6         = fft(x_fullR6,Nfft);
yR6Abs      = abs(yR6/Nfft);
yR7         = fft(x_fullR7,Nfft);
yR7Abs      = abs(yR7/Nfft);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%
% plot time signal
figure(2);
subplot(2,1,1);
plot(tVectors,x_fullC0(1:Nfft),tVectors,x_fullC1(1:Nfft),tVectors,...
    x_fullC2(1:Nfft),tVectors,x_fullC3(1:Nfft),tVectors,x_fullC4(1:Nfft),...
    tVectors,x_fullC5(1:Nfft),tVectors,x_fullC6(1:Nfft),tVectors,x_fullC7(1:Nfft));
title("Time signal to FFT calculation.");
%axis([0 Nfft*1/Fs 0 1*scale]);
%%%%%%%%%%%%%%
% plot fft output
subplot(2,1,2);
plot(fVectors,yC0Abs,fVectors,yC1Abs,fVectors,yC2Abs,fVectors,yC3Abs,...
    fVectors,yC4Abs,fVectors,yC5Abs,fVectors,yC6Abs,fVectors,yC7Abs);
title('Fourier transform. Abs.'); 
%axis([0 Fs 0 Nfft/2*scale]);
%axis([0 Fs 0 25]);
%%%%%%%%%%%%%%
% plot time signal
figure(3);
subplot(2,1,1);
plot(tVectors,x_fullR0(1:Nfft),tVectors,x_fullR1(1:Nfft),tVectors,...
    x_fullR2(1:Nfft),tVectors,x_fullR3(1:Nfft),tVectors,x_fullR4(1:Nfft),...
    tVectors,x_fullR5(1:Nfft),tVectors,x_fullR6(1:Nfft),tVectors,x_fullR7(1:Nfft));
title("Time signal to FFT calculation.");
%axis([0 Nfft*1/Fs 0 1*scale]);
%%%%%%%%%%%%%%
% plot fft output
subplot(2,1,2);
plot(fVectors,yR0Abs,fVectors,yR1Abs,fVectors,yR2Abs,fVectors,yR3Abs,...
    fVectors,yR4Abs,fVectors,yR5Abs,fVectors,yR6Abs,fVectors,yR7Abs);
title('Fourier transform. Abs.'); 
%axis([0 Fs 0 Nfft/2*scale]);
%axis([0 Fs 0 25]);
