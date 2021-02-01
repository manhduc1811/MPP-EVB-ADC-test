%mducng/SoC/D2/G2touch
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;
close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% txt file selection
[filename, pathname] = uigetfile({'*.txt'},'File Selector');
if ~ischar(filename)
    return;  % User aborted the file selection
end
file = fullfile(pathname, filename);
[fid, msg] = fopen(file, 'r');
if fid == -1
    error(msg);
end
Data = fscanf(fid, '%f\n', [1, inf]);  % Or how your file is formatted
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
temp         = size(Data);
length_full  = temp(2);
x_raw        = Data;
x_full       = x_raw - mean(x_raw);
Fs           = 4*10^6;  
dt           = 1/Fs;
t_full       = (0:1:length_full-1)*dt;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
scale        = 1;
% plot time signal
figure(1);
subplot(3,1,1);
%stem(t_full,x_full,':diamondr');
plot(t_full,x_full);
%axis([0 2*length_full*dt 0 1*scale]);
title('Full Time signal. Abs.');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% run FFT
Nfft        = 2^10;
Fs          = 4*10^6;
deltaF      = Fs/Nfft;
tVectors    = (0:(Nfft-1))*dt;
fVectors    = (0:(Nfft-1))*deltaF;
y           = fft(x_full,Nfft);
yAbs        = abs(y/Nfft);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%
% plot time signal
subplot(3,1,2);
%stem(tVectors,x_full(1:Nfft),':diamondr');
plot(tVectors,x_full(1:Nfft));
xlabel("Time signal to FFT calculation.");
%axis([0 Nfft*1/Fs 0 1*scale]);
%%%%%%%%%%%%%%
% plot fft output
subplot(3,1,3);
plot(fVectors,yAbs);
title('Fourier transform. Abs.'); 
%axis([0 Fs 0 Nfft*scale/2]);
%%%%%%%%%%%%%%
% Export txt file
%fileID   = fopen('OUT_FFT.txt','a');
%fprintf(fileID,'%f\n',yAbs);
%fclose(fileID);