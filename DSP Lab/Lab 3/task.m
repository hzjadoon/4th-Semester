%Part 1
fs = 1000;              
t = 0:1/fs:0.25;       
x = sin(2*pi*50*t) + sin(2*pi*120*t);

%Part 2
SD = 2;                         
y = x + SD * randn(size(t));     
figure;
plot(t, y);
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Noisy Time Domain Signal');
grid on;

%Part 3
N = 251;                              
Y = fft(y, N);                       
f = (fs/N) * (0:127);                 
figure;
plot(f, abs(Y(1:128)));               
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Magnitude of the Discrete Fourier Transform (DFT)');
grid on;

%STEP 4
Pyy = Y .* conj(Y) / N;             
figure;
plot(f, Pyy(1:128));                  
xlabel('Frequency (Hz)');
ylabel('Power/Frequency (dB/Hz)');
title('PSD of the Noisy Signal');
grid on;

%STEP 5
figure;
periodogram(y,[],N,fs);              
title('Periodogram of the Noisy Signal');

%STEP 6
figure;
plot(f(1:120), Pyy(1:120));             
xlabel('Frequency (Hz)');
ylabel('Power/Frequency (dB/Hz)');
title('Zoomed Power Spectral Density (up to 200 Hz)');
grid on;