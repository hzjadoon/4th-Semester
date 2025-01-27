Fs = 100000;  fc1 = 2000;  fc2 = 4000; 
bit_duration = 0.002;  message_bits = [1 0 1 1 0 1]; 
t = 0:1/Fs:bit_duration * length(message_bits) - 1/Fs; % Time vector for all bits
samples_per_bit = Fs * bit_duration;
message_signal = repelem(message_bits, samples_per_bit);
carrier_signal = cos(2 * pi * fc1 * t); % Carrier for 0 bit
fsk_signal = zeros(1, length(t));
for i = 1:length(message_bits)
    if message_bits(i) == 1
        fsk_signal((i-1)*samples_per_bit+1:i*samples_per_bit) = cos(2*pi*fc2*t((i-1)*samples_per_bit+1:i*samples_per_bit));
    else
        fsk_signal((i-1)*samples_per_bit+1:i*samples_per_bit) = cos(2*pi*fc1*t((i-1)*samples_per_bit+1:i*samples_per_bit));
    end
end
fsk_demodulated_signal = zeros(1, length(t));
for i = 1:length(message_bits)
    if message_bits(i) == 1
        fsk_demodulated_signal((i-1)*samples_per_bit+1:i*samples_per_bit) = cos(2*pi*fc2*t((i-1)*samples_per_bit+1:i*samples_per_bit));
    else
        fsk_demodulated_signal((i-1)*samples_per_bit+1:i*samples_per_bit) = cos(2*pi*fc1*t((i-1)*samples_per_bit+1:i*samples_per_bit));
    end
end
freq_axis = linspace(-Fs/2, Fs/2, length(t));
fft_fsk_signal = abs(fftshift(fft(fsk_signal)));
fft_fsk_demodulated = abs(fftshift(fft(fsk_demodulated_signal)));

figure;subplot(4, 1, 1);
plot(t, message_signal);title('Message Signal (Time Domain)');
xlabel('Time (s)');ylabel('Amplitude'); grid on;
subplot(4, 1, 2);
plot(t, carrier_signal);title('Carrier Signal (Time Domain)');
xlabel('Time (s)');ylabel('Amplitude');grid on;
subplot(4, 1, 3);
plot(t, fsk_signal);title('FSK Modulated Signal (Time Domain)');
xlabel('Time (s)');ylabel('Amplitude');grid on;
subplot(4, 1, 4);
plot(t, fsk_demodulated_signal);title('FSK Demodulated Signal (Time Domain)');
xlabel('Time (s)');ylabel('Amplitude');grid on;
figure;subplot(2, 1, 1);
plot(freq_axis, fft_fsk_signal);title('FSK Modulated Signal (Frequency Domain)');
xlabel('Frequency (Hz)');ylabel('Amplitude');grid on;
subplot(2, 1, 2);
plot(freq_axis, fft_fsk_demodulated);title('FSK Demodulated Signal (Frequency Domain)');
xlabel('Frequency (Hz)');ylabel('Amplitude');grid on;
