Fs = 100000; 
t = 0:1/Fs:0.01; 
Am = 10; 
fm = 200; 
fc = 2000; 
mi = 0.6; 
Ac = Am / mi; 

message_sig = Am * cos(2 * pi * fm * t);
carrier_sig = Ac * cos(2 * pi * fc * t);
modulated_sig = ammod(message_sig, fc, Fs, 0, Ac);
demodulated_sig = amdemod(modulated_sig, fc, Fs, 0, Ac);

freq_axis = linspace(-Fs/10, Fs/10, length(t));

fft_message = abs(fftshift(fft(message_sig)));
fft_carrier = abs(fftshift(fft(carrier_sig)));
fft_modulated = abs(fftshift(fft(modulated_sig)));
fft_demodulated = abs(fftshift(fft(demodulated_sig)));

figure;
subplot(4, 1, 1);
plot(t, message_sig);
title('Message Signal in Time Domain');
xlabel('Time ');
ylabel('Amplitude');
grid on;

subplot(4, 1, 2);
plot(t, carrier_sig);
title('Carrier Signal in Time Domain');
xlabel('Time ');
ylabel('Amplitude');
grid on;

subplot(4, 1, 3);
plot(t, modulated_sig);
title('Modulated Signal in Time Domain');
xlabel('Time');
ylabel('Amplitude');
grid on;

subplot(4, 1, 4);
plot(t, demodulated_sig);
title('Demodulated Signal in Time Domain');
xlabel('Time ');
ylabel('Amplitude');
grid on;

figure;
subplot(4, 1, 1);
plot(freq_axis, fft_message);
title('Message Signal in Frequency Domain');
xlabel('Frequency');
ylabel('Amplitude');
grid on;

subplot(4, 1, 2);
plot(freq_axis, fft_carrier);
title('Carrier Signal in Frequency Domain');
xlabel('Frequency');
ylabel('Amplitude');
grid on;

subplot(4, 1, 3);
plot(freq_axis, fft_modulated);
title('Modulated Signal in Frequency Domain');
xlabel('Frequency');
ylabel('Amplitude');
grid on;

subplot(4, 1, 4);
plot(freq_axis, fft_demodulated);
title('Demodulated Signal in Frequency Domain');
xlabel('Frequency');
ylabel('Amplitude');
grid on;
