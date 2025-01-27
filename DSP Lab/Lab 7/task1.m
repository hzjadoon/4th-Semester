%% Parameters
fs = 100; % Sampling frequency in Hz
fc = 10;  % Carrier frequency in Hz
t = (0:1/fs:100)'; % Time vector for 100 seconds duration
% Task 2: Generate a single-tone sinusoidal signal (1 Hz)
x = sin(2 * pi * t); % Modulating signal
% Task 3: Generate the carrier signal (10 Hz)
yc = sin(2 * pi * fc * t); % Carrier signal
% Task 4: Plot modulating and carrier signals
figure;
plot(t, x, 'r', t, yc, 'b--');
xlabel('Time (s)');
ylabel('Amplitude');
legend('Original Signal', 'Carrier Signal');
title('Modulating and Carrier Signals');
grid on;

%% Task 5: Amplitude modulation
ydouble = ammod(x, fc, fs); % Double-sideband AM
lowerSidebandSignal = ssbmod(x, fc, fs); % Lower sideband (SSB)
upperSidebandSignal = ssbmod(x, fc, fs, 0, 'upper'); % Upper sideband (SSB)

% Task 6-8: Create spectrum analyzers and plot spectra
%% Spectrum of double-sideband signal
spectrumAnalyzerDouble = dsp.SpectrumAnalyzer('SampleRate', fs, ...
    'Title', 'Double-Sideband Spectrum', 'SpectrumUnits', 'dBW');
spectrumAnalyzerDouble(ydouble);

%% Spectrum of lower sideband signal
spectrumAnalyzerLower = dsp.SpectrumAnalyzer('SampleRate', fs, ...
    'Title', 'Lower Sideband Spectrum', 'SpectrumUnits', 'dBW');
spectrumAnalyzerLower(lowerSidebandSignal);

%% Spectrum of upper sideband signal
spectrumAnalyzerUpper = dsp.SpectrumAnalyzer('SampleRate', fs, ...
    'Title', 'Upper Sideband Spectrum', 'SpectrumUnits', 'dBW');
spectrumAnalyzerUpper(upperSidebandSignal);

%% Task 9: Demodulation of lower and upper sidebands
s1 = ssbdemod(lowerSidebandSignal, fc, fs); % Demodulated lower sideband
s2 = ssbdemod(upperSidebandSignal, fc, fs); % Demodulated upper sideband

% Task 10-11: Compare original and demodulated signals
figure;
plot(t, x, 'k', t, s1, 'r:', t, s2, 'g-.');
xlabel('Time (s)');
ylabel('Amplitude');
legend('Original Signal', 'Demodulated Lower Sideband', 'Demodulated Upper Sideband');
title('Comparison of Signals');
grid on;

%% Task 12: Analyze power density and plot power spectrum
figure;
pspectrum(x, fs, 'power', 'FrequencyLimits', [0 fs/2]);
title('Power Spectrum (Original Signal)');
xlabel('Frequency (Hz)');
ylabel('Power/Frequency (dB/Hz)');

% Answer the following Questions
Create and Explore the dsp.SpectrumAnalyzer object and set its properties.)
1.	Plot (Analyze the spectrum in terms of Power Density) the Power density 
2.	Plot both the Spectrum and Spectrogram
3.	Plot the Spectrum chose Spectrum Unit as dBW, dBm, and Watts.



Task 13: Spectrum and spectrogram
figure;
spectrogram(x, hamming(256), 128, 256, fs, 'yaxis');
title('Spectrogram (Original Signal)');

% Task 14: Spectrum in different units
spectrumAnalyzerDouble.SpectrumUnits = 'dBm'; % Change to dBm
spectrumAnalyzerDouble(ydouble);

spectrumAnalyzerDouble.SpectrumUnits = 'Watts'; % Change to Watts
spectrumAnalyzerDouble(ydouble);