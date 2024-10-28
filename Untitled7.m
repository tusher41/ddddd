% Load or simulate PPG signal
Fs = 100; % Sampling frequency (in Hz)
t = 0:1/Fs:10; % Time vector for 10 seconds
% For real applications, replace with actual PPG data
ppg_signal = 0.5 * sin(2 * pi * 1.2 * t) + 0.05 * randn(size(t)); % Simulated PPG with noise

% Step 1: Bandpass Filter to isolate heart rate range
fc_low = 0.5; % Low cutoff frequency for bandpass filter (Hz)
fc_high = 4;  % High cutoff frequency for bandpass filter (Hz)
[b, a] = butter(4, [fc_low, fc_high] / (Fs / 2), 'bandpass'); % 4th-order Butterworth filter
ppg_filtered = filtfilt(b, a, ppg_signal);

% Step 2: Peak Detection for Heart Rate Calculation
[peaks, locs] = findpeaks(ppg_filtered, 'MinPeakDistance', Fs / 2); % Detect peaks with minimum separation
time_intervals = diff(locs) / Fs; % Time intervals between peaks
heart_rate = 60 ./ time_intervals; % Convert intervals to heart rate (bpm)

% Step 3: Calculate Pulse Amplitude
troughs = -findpeaks(-ppg_filtered, 'MinPeakDistance', Fs / 2); % Detect troughs (invert signal to find negative peaks)
pulse_amplitude = peaks(1:length(troughs)) - troughs; % Calculate pulse amplitude

% Plot results
figure;
subplot(3,1,1);
plot(t, ppg_signal);
title('Original PPG Signal');
xlabel('Time (s)'); ylabel('Amplitude');

subplot(3,1,2);
plot(t, ppg_filtered);
title('Filtered PPG Signal');
xlabel('Time (s)'); ylabel('Amplitude');

subplot(3,1,3);
plot(locs(1:end-1)/Fs, heart_rate, '-o');
title('Heart Rate');
xlabel('Time (s)'); ylabel('Heart Rate (bpm)');
