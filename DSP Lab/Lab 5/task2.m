Fs = 100000; 
Am = 10; 
fc = 2000; 
message_bits = [1 0 1 1 0 1]; % Example binary message
bit_duration = 0.002; % Duration of one bit
t = 0:1/Fs:bit_duration * length(message_bits) - 1/Fs; % Time vector for all bits
samples_per_bit = Fs * bit_duration; % Ensure this is an integer
message_signal = repelem(message_bits, samples_per_bit);
carrier_signal = Am * cos(2 * pi * fc * t);
modulated_signal = message_signal .* carrier_signal;
demodulated_signal = modulated_signal .* carrier_signal; % Coherent demodulation
demodulated_signal = lowpass(demodulated_signal, 300, Fs); % Low-pass filter
freq_axis = linspace(-Fs/2, Fs/2, length(t));
fft_message = abs(fftshift(fft(message_signal)));
fft_carrier = abs(fftshift(fft(carrier_signal)));
fft_modulated = abs(fftshift(fft(modulated_signal)));
fft_demodulated = abs(fftshift(fft(demodulated_signal)));
figure;
subplot(4, 1, 1);
plot(t, message_signal); title('Message Signal (Time Domain)');
xlabel('Time (s)'); ylabel('Amplitude'); grid on;

subplot(4, 1, 2);
plot(t, carrier_signal); title('Carrier Signal (Time Domain)');
xlabel('Time (s)'); ylabel('Amplitude'); grid on;

subplot(4, 1, 3);
plot(t, modulated_signal); title('Modulated Signal (Time Domain)');
xlabel('Time (s)'); ylabel('Amplitude'); grid on;

subplot(4, 1, 4);
plot(t, demodulated_signal); title('Demodulated Signal (Time Domain)');
xlabel('Time (s)'); ylabel('Amplitude'); grid on;

figure;
subplot(2, 1, 1);
plot(freq_axis, fft_modulated); title('Modulated Signal (Frequency Domain)');
xlabel('Frequency (Hz)'); ylabel('Amplitude'); grid on;

subplot(2, 1, 2);
plot(freq_axis, fft_demodulated); title('Demodulated Signal (Frequency Domain)');
xlabel('Frequency (Hz)'); ylabel('Amplitude'); grid on;