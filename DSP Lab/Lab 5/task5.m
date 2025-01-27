Fs = 100000; 
fc = 2000; 
bit_duration = 0.002; 
message_bits = [1 0 1 1 0 1 1 0]; 
num_symbols = length(message_bits) / 2;
t = 0:1/Fs:bit_duration * num_symbols - 1/Fs;
symbols = reshape(message_bits, 2, [])';
carrier_I = cos(2*pi*fc*t);
carrier_Q = sin(2*pi*fc*t);
qpsk_signal = zeros(1, length(t));
for i = 1:num_symbols
    if symbols(i, 1) == 0 && symbols(i, 2) == 0
        qpsk_signal((i-1)*Fs*bit_duration+1:i*Fs*bit_duration) = carrier_I((i-1)*Fs*bit_duration+1:i*Fs*bit_duration);
    elseif symbols(i, 1) == 0 && symbols(i, 2) == 1
        qpsk_signal((i-1)*Fs*bit_duration+1:i*Fs*bit_duration) = carrier_I((i-1)*Fs*bit_duration+1:i*Fs*bit_duration) + carrier_Q((i-1)*Fs*bit_duration+1:i*Fs*bit_duration);
    elseif symbols(i, 1) == 1 && symbols(i, 2) == 0
        qpsk_signal((i-1)*Fs*bit_duration+1:i*Fs*bit_duration) = -carrier_I((i-1)*Fs*bit_duration+1:i*Fs*bit_duration);
    else
        qpsk_signal((i-1)*Fs*bit_duration+1:i*Fs*bit_duration) = -carrier_I((i-1)*Fs*bit_duration+1:i*Fs*bit_duration) - carrier_Q((i-1)*Fs*bit_duration+1:i*Fs*bit_duration);
    end
end
freq_axis = linspace(-Fs/2, Fs/2, length(t));
fft_qpsk_signal = abs(fftshift(fft(qpsk_signal)));

figure; subplot(4, 1, 1);
message_signal = repelem(message_bits, length(t) / num_symbols); % Create message signal for plotting
plot(message_signal); title('Message Signal (Time Domain)');
xlabel('Time (s)'); ylabel('Amplitude'); grid on;

subplot(4, 1, 2);
plot(t, carrier_I); title('Carrier Signal I (Time Domain)');
xlabel('Time (s)'); ylabel('Amplitude'); grid on;

subplot(4, 1, 3); 
plot(t, qpsk_signal); title('QPSK Modulated Signal (Time Domain)');
xlabel('Time (s)'); ylabel('Amplitude'); grid on;

figure; subplot(2, 1, 1); 
plot(freq_axis, fft_qpsk_signal); title('QPSK Modulated Signal (Frequency Domain)');
xlabel('Frequency (Hz)'); ylabel('Amplitude'); grid on;
