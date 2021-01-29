lengthData = 1302;
Fs         = 4*10^6;
f1         = 25000;
deltaT     = 1/Fs;
t          = (1:1:lengthData)*deltaT;
x          = 1+cos(2*pi*f1*t);

subplot(3,1,1);
plot(t,x);

Nfft      = 2^10;
deltaF    = Fs/Nfft;
f         = (1:1:Nfft)*deltaF;
y         = fft(x,Nfft);
yAbs      = abs(y);
subplot(3,1,2);
plot(f,yAbs);
