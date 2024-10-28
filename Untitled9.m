% Step 1: Generate a Signal with Two Sine Waves and Noise
Fs = 100;                     % Sampling frequency (Hz)
t = 0:1/Fs:1;                 % Time vector for 1 second
f1 = 5;                       % Frequency of first sine wave (Hz)
f2 = 20;                      % Frequency of second sine wave (Hz)
signal = sin(2 * pi * f1 * t) + 0.5 * sin(2 * pi * f2 * t) + 0.2 * randn(size(t)); % Signal with noise

% Step 2: Compute the FFT of the Signal
N = length(signal);           % Number of samples
signal_fft = fft(signal);     % FFT of the signal

% Calculate the Amplitude and Phase Spectra
signal_fft_mag = abs(signal_fft / N); % Amplitude spectrum
signal_fft_phase = angle(signal_fft); % Phase spectrum
f = (0:N-1) * (Fs / N);       % Frequency vector

% Step 3: Plot the Amplitude Spectrum
figure;
subplot(3, 1, 1);
plot(f(1:N/2), signal_fft_mag(1:N/2)); % Plot only the positive frequencies
title('Amplitude Spectrum of the Signal');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
grid on;

% Plot the Phase Spectrum
subplot(3, 1, 2);
plot(f(1:N/2), signal_fft_phase(1:N/2)); % Phase for positive frequencies
title('Phase Spectrum of the Signal');
xlabel('Frequency (Hz)');
ylabel('Phase (radians)');
grid on;

% Plot the Original Signal in Time Domain for Reference
subplot(3, 1, 3);
plot(t, signal);
title('Original Signal (Time Domain)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
