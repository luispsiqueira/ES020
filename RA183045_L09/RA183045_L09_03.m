function [dt, tn, df, fmin, fmax, h] = RA183045_L09_03()
 h = figure;
 
 N = 64;
 %fs = 1/dt
 fs = 128;
 dt = 1/fs;
 tn = N/fs;
 fmax = 0.5*fs;
 tspan = (0:N-1)/fs;
 T = tspan(end);
 df = fs/N;

 y = 1.5 + 1.8*cos(2*pi*12*tspan) + 0.8*sin(2*pi*20*tspan) - 1.25*cos(2*pi*28*tspan);

Y = fft(y)/N;
Y';

 %ver se isso ta certo
 nyquist = fs/2;
 fmin = 1/T;
 f = linspace(fmin,nyquist,N/2);
 Y(1)=[];
 YP = Y(1:N/2);
 subplot(2,1,1)
 stem(f,abs(YP),'linewidth',2,'MarkerFaceColor','blue')
 grid;title('(a) Amplitude versus frequência')
 subplot(2,1,2)
 stem(f,angle(YP),'linewidth',2,'MarkerFaceColor','blue')
 grid;title('(b) Fase versus frequência')
 xlabel('Frequência [Hz]')
end