% Generate a Signal with Two Sine Waves and Noise
Fs = 100;                  % Sampling frequency (Hz)
t = 0:1/Fs:1;              % Time vector for 1 second
signal = sin(2 * pi * 5 * t) + 0.5 * sin(2 * pi * 20 * t) + 0.2 * randn(size(t)); 

% Compute FFT and Amplitude/Phase Spectra
N = length(signal);        
signal_fft = fft(signal);
f = (0:N-1) * (Fs / N);    % Frequency vector
signal_fft_mag = abs(signal_fft / N);  
signal_fft_phase = angle(signal_fft);

% Plot Amplitude Spectrum
figure;
subplot(3, 1, 1);
plot(f(1:N/2), signal_fft_mag(1:N/2));
title('Amplitude Spectrum');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
grid on;

% Plot Phase Spectrum
subplot(3, 1, 2);
plot(f(1:N/2), signal_fft_phase(1:N/2));
title('Phase Spectrum');
xlabel('Frequency (Hz)');
ylabel('Phase (radians)');
grid on;

% Plot Original Signal in Time Domain
subplot(3, 1, 3);
plot(t, signal);
title('Original Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
