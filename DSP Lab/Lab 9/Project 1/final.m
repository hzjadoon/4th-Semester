t=0:0.001:2;
fs=44100;
%Load three voice signals into Matlab using the audioread function and play them using the sound function:
% Load the signals
[signal1, fs1] = audioread('female.mp3');
[signal2, fs2] = audioread('male.mp3');
[signal3, fs3] = audioread('love.mp3');

% Play the signals
sound(signal1, fs1);
pause(length(signal1)/fs1 + 1); % pause for duration of x1
sound(signal2, fs2);
pause(length(signal2)/fs2 + 1); % pause for duration of x2
sound(signal3, fs3);

%Use the fft function to compute the spectra of the signals and plot them using the plot function:
% Compute the spectra of the signals
s1 = fft(signal1);
n=length(signal1);
fshifts1= (-n/2:n/2-1)*(1000/n);
signal1shift= fftshift(s1);

s2 = fft(signal2);
n=length(signal2);
fshifts2= (-n/2:n/2-1)*(1000/n);
signal2shift= fftshift(s2);

s3 = fft(signal3);
n=length(signal3);
fshifts3= (-n/2:n/2-1)*(1000/n);
signal3shift= fftshift(s3);

% Plot the spectra
figure(1)
subplot(3,1,1)
plot(fshifts1,abs(signal1shift));
title('Spectrum of First Signal (Male)');

subplot(3,1,2)
plot(fshifts2,abs(signal2shift));
title('Spectrum of Second Signal (Female)');

subplot(3,1,3)
plot(fshifts3,abs(signal3shift));
title('Spectrum of Third Signal (Male)');

% Create a Spectrum Analyzer object and Visualize the spectra of the signals
spectrumAnalyzers1 = dsp.SpectrumAnalyzer('SpectrumType', 'Power', ...
                        'YLimits', [-100 0], ...
                        'Title', 'Spectrum of First Signal (Male)');
step(spectrumAnalyzers1, signal1);

spectrumAnalyzers2 = dsp.SpectrumAnalyzer('SpectrumType', 'Power', ...
                        'YLimits', [-100 -40], ...
                        'Title', 'Spectrum of Second Signal (Female)');
step(spectrumAnalyzers2, signal2);

spectrumAnalyzers3 = dsp.SpectrumAnalyzer('SpectrumType', 'Power', ...
                        'YLimits', [-100 0], ...
                        'Title', 'Spectrum of Third Signal (Male)');
step(spectrumAnalyzers3, signal3);

%Design a low pass filter using the fir1 function and apply it to the signals using the filter function.
%Plot the spectra of the filtered signals using the plot function:
% Design a low pass filter
lpf = fir1(100, 0.2);    %o.2 cuttoff frequency value between 0 & 1
% Filter the signals
filteredsignal1 = filter(lpf, 1, signal1);
filteredsignal2 = filter(lpf, 1, signal2);
filteredsignal3 = filter(lpf, 1, signal3);
% Compute the spectra of the filtered signals
Fs1 = fft(filteredsignal1);
n=length(filteredsignal1);
fshiftfs1= (-n/2:n/2-1)*(1000/n);
fs1shift= fftshift(Fs1);

Fs2 = fft(filteredsignal2);
n=length(filteredsignal2);
fshiftfs2= (-n/2:n/2-1)*(1000/n);
fs2shift= fftshift(Fs2);

Fs3 = fft(filteredsignal3);
n=length(filteredsignal3);
fshiftfs3= (-n/2:n/2-1)*(1000/n);
fs3shift= fftshift(Fs3);

% Plot the spectra
figure(2)
subplot(3,1,1)
plot(fshiftfs1,abs(fs1shift));
title('Spectrum of First Signal (Male) after passing through LPF');

subplot(3,1,2)
plot(fshiftfs2,abs(fs2shift));
title('Spectrum of Second Signal (Female) after passing through LPF');

subplot(3,1,3)
plot(fshiftfs3,abs(fs3shift));
title('Spectrum of Third Signal (Male) after passing through LPF');

%  Reproduce the signals after passing them through filter
 % Play the signals
sound(filteredsignal1, fs1);
pause(length(filteredsignal1)/fs1 + 1); % pause for duration of x1
sound(filteredsignal2, fs2);
pause(length(filteredsignal2)/fs2 + 1); % pause for duration of x2
sound(filteredsignal3, fs3);

 % Modulate the signals onto different carriers
 
fc1 = 5000; % carrier frequency for signal 1
fc2 = 10000; % carrier frequency for signal 2
fc3 = 15000; % carrier frequency for signal 3

modulated_signal1 = filteredsignal1*fc1;
modulated_signal2 = filteredsignal2*fc2;
modulated_signal3 = filteredsignal3*fc3;

% Plot the modulated signals
figure(3)
subplot(3,1,1)
plot(modulated_signal1);
title('Signal 1 (Male) after Modulation');

subplot(3,1,2)
plot(modulated_signal2);
title('Signal 2 (Female) after Modulation');

subplot(3,1,3)
plot(modulated_signal3);
title('Signal 3 (Male) after Modulation');

% Define the filters for each band
band1_filter = designfilt('bandpassfir','FilterOrder',20,'CutoffFrequency1',6000,'CutoffFrequency2',9000,'SampleRate',fs);
band2_filter = designfilt('bandpassfir','FilterOrder',20,'CutoffFrequency1',12000,'CutoffFrequency2',14000,'SampleRate',fs);
band3_filter = designfilt('bandpassfir','FilterOrder',20,'CutoffFrequency1',18000,'CutoffFrequency2',20000,'SampleRate',fs);

% Filter the modulated signals in their respective bands
filtered_mod_signal1 = filter(band1_filter, modulated_signal1);
filtered_mod_signal2 = filter(band2_filter, modulated_signal2);
filtered_mod_signal3 = filter(band3_filter, modulated_signal3);

% Add the filtered modulated signals together to create the multiplexed signal
multiplexed_signal = filtered_mod_signal1(1:23177) + filtered_mod_signal2(1:23177) + filtered_mod_signal3(1:23177);

% Add noise to the transmitted signal
noisy_signal = awgn(multiplexed_signal, 30);
figure;
plot(abs(fft(noisy_signal)));
title('Noisy Signal');

% Filter the received signal in the respective bands
received_signal1 = filter(band1_filter, noisy_signal);
received_signal2 = filter(band2_filter, noisy_signal);
received_signal3 = filter(band3_filter, noisy_signal);

% Plot the filtered signals
figure;
subplot(3,1,1);
plot(received_signal1);
title('First Signal');

subplot(3,1,2);
plot(received_signal2);
title('Second Signal');

subplot(3,1,3);
plot(received_signal3);
title('Third Signal');

% Demodulate the received signals
demod_signal1 = received_signal1.*fc1;
demod_signal2 = received_signal2.*fc2;
demod_signal3 = received_signal3.*fc3;

%plot demodulated signals
figure;
subplot(3,1,1);
plot(demod_signal1);
title('First Signal after demod');

subplot(3,1,2);
plot(demod_signal2);
title('Second Signal after demod');

subplot(3,1,3);
plot(demod_signal3);
title('Third Signal after demod');

% Apply low-pass filter to the demodulated signals
filtered_demod_signal1 = filter(lpf,1, demod_signal1);
filtered_demod_signal2 = filter(lpf,1, demod_signal2);
filtered_demod_signal3 = filter(lpf,1, demod_signal3);

% Plot the filtered demodulated signals
figure;
subplot(3,1,1);
plot(filtered_demod_signal1);
title('First Signal after passing through LPF');

subplot(3,1,2);
plot(filtered_demod_signal2);
title('Second Signal after passing through LPF');

subplot(3,1,3);
plot(filtered_demod_signal3);
title('Third Signal after passing through LPF');

% Reproduce the received signals
sound(filtered_demod_signal1, fs1);
pause(length(signal1)/fs1 + 1);
sound(filtered_demod_signal2, fs2);
pause(length(signal2)/fs2 + 1);
sound(filtered_demod_signal3, fs3);


