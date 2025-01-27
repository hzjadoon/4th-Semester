Fs = 100000; 
fc = 2000; % Carrier frequency
bit_duration = 0.002; % Duration of one bit
message_bits = [1 0 1 1 0 1]; 
t = 0:1/Fs:bit_duration * length(message_bits) - 1/Fs; % Time vector for all bits
samples_per_bit = Fs * bit_duration;
message_signal = repelem(message_bits, samples_per_bit);
carrier_signal = cos(2 * pi * fc * t); 
psk_signal = cos(2 * pi * fc * t + pi * message_signal);
psk_demodulated_signal = cos(2 * pi * fc * t + pi * message_signal);
psk_demodulated_signal = psk_demodulated_signal > 0; % Decision threshold at 0
freq_axis = linspace(-Fs/2, Fs/2, length(t));
fft_psk_signal = abs(fftshift(fft(psk_signal)));
fft_psk_demodulated = abs(fftshift(fft(psk_demodulated_signal)));

figure;subplot(4, 1, 1);
plot(t, message_signal);title('Message Signal (Time Domain)');
xlabel('Time (s)');ylabel('Amplitude');grid on;

subplot(4, 1, 2);
plot(t, carrier_signal);title('Carrier Signal (Time Domain)');
xlabel('Time (s)');ylabel('Amplitude');grid on;

subplot(4, 1, 3);
plot(t, psk_signal);title('PSK Modulated Signal (Time Domain)');
xlabel('Time (s)');ylabel('Amplitude');grid on;

subplot(4, 1, 4);
plot(t, psk_demodulated_signal);title('PSK Demodulated Signal (Time Domain)');
xlabel('Time (s)');ylabel('Amplitude');grid on;

% Frequency-domain plots
figure;subplot(2, 1, 1);
plot(freq_axis, fft_psk_signal);title('PSK Modulated Signal (Frequency Domain)');
xlabel('Frequency (Hz)');ylabel('Amplitude');grid on;

subplot(2, 1, 2);
plot(freq_axis, fft_psk_demodulated);title('PSK Demodulated Signal (Frequency Domain)');
xlabel('Frequency (Hz)');ylabel('Amplitude');grid on;
