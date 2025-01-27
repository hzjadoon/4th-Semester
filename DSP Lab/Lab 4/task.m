frequencies = [10, 20, 30, 40, 50, 60]; 
t = 0:0.001:1;

figure;
for i = 1:length(frequencies)
    y = sin(2*pi*frequencies(i)*t);
    subplot(3, 2, i);
    plot(t, y);
    title(['Time Domain: ' num2str(frequencies(i)) ' Hz']);
    xlabel('Time (s)');
    ylabel('Amplitude');
end

figure;
for i = 1:length(frequencies)
    y = sin(2*pi*frequencies(i)*t);
    Y = fft(y); 
    Y_shifted = fftshift(abs(Y)); 
    freq = linspace(-500, 500, length(Y_shifted));
    subplot(3, 2, i);
    plot(freq, Y_shifted);
    title(['Frequency Domain: ' num2str(frequencies(i)) ' Hz']);
    xlabel('Frequency (Hz)');
    ylabel('Magnitude');
end

composite_signal = sum(sin(2*pi*frequencies' * t), 1);

figure;
subplot(2,1,1);
plot(t, composite_signal);
title('Composite Signal in Time Domain (10+20+30+40+50+60 Hz)');
xlabel('Time (s)');
ylabel('Amplitude');

composite_fft = fft(composite_signal);
composite_fft_shifted = fftshift(abs(composite_fft));
subplot(2,1,2);
plot(freq, composite_fft_shifted);
title('Frequency Domain of Composite Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

noise_frequencies = [80, 100];
noise_amplitudes = [0.5, 0.7];
noise_signal = sum(noise_amplitudes' .* sin(2*pi*noise_frequencies' * t), 1);

figure;
subplot(2,1,1);
plot(t, noise_signal);
title('Noise Signal in Time Domain (80 Hz and 100 Hz)');
xlabel('Time (s)');
ylabel('Amplitude');

noise_fft = fft(noise_signal);
noise_fft_shifted = fftshift(abs(noise_fft));
subplot(2,1,2);
plot(freq, noise_fft_shifted);
title('Frequency Domain of Noise Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

signal_with_noise = composite_signal + noise_signal;

figure;
subplot(2,1,1);
plot(t, signal_with_noise);
title('Composite Signal with Noise in Time Domain');
xlabel('Time (s)');
ylabel('Amplitude');

signal_with_noise_fft = fft(signal_with_noise);
signal_with_noise_fft_shifted = fftshift(abs(signal_with_noise_fft));
subplot(2,1,2);
plot(freq, signal_with_noise_fft_shifted);
title('Frequency Domain of Composite Signal with Noise');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
