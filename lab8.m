% Step 1: Generate an analog signal (5 Hz sine wave) as an example
Fs_analog = 1000;                % Original high sampling rate for analog signal (Hz)
t = 0:1/Fs_analog:1;             % Time vector for 1 second duration
f_signal = 5;                    % Frequency of the analog signal (Hz)
analog_signal = sin(2 * pi * f_signal * t); % 5 Hz sine wave signal

% Step 2: ADC - Sampling and Quantization
Fs_sampling = 50;                % Sampling rate for ADC (Hz)
sampled_t = 0:1/Fs_sampling:1;   % Sample time points
sampled_signal = sin(2 * pi * f_signal * sampled_t); % Sampled signal

% Quantization (8-bit quantizer as an example)
n_bits = 8; 
max_val = 1;                     % Assuming signal range is normalized to [-1, 1]
levels = 2^n_bits;               % Number of quantization levels
quantized_signal = round((sampled_signal + max_val) * (levels / (2 * max_val))) * (2 * max_val / levels) - max_val;

% Step 3: DAC - Reconstruction and Filtering
reconstructed_t = 0:1/Fs_analog:1; % High-rate time vector for interpolation
reconstructed_signal = interp1(sampled_t, quantized_signal, reconstructed_t, 'linear'); % Linear interpolation for DAC
smooth_signal = lowpass(reconstructed_signal, Fs_sampling / 2, Fs_analog); % Low-pass filtering for smoothing

% Plot the results
figure;
subplot(3, 1, 1);
plot(t, analog_signal, 'b'); hold on;
stem(sampled_t, quantized_signal, 'r'); % Sampled and quantized points
title('Analog Signal and Sampled (Quantized) Signal');
xlabel('Time (s)'); ylabel('Amplitude'); legend('Analog Signal', 'Sampled & Quantized Signal');

subplot(3, 1, 2);
stairs(sampled_t, quantized_signal, 'r'); % Staircase plot for digital signal
title('Digital Signal After Quantization');
xlabel('Time (s)'); ylabel('Amplitude');

subplot(3, 1, 3);
plot(t, analog_signal, 'b', 'LineWidth', 1); hold on;
plot(reconstructed_t, smooth_signal, 'g--'); % Smooth reconstructed signal
title('Reconstructed Analog Signal');
xlabel('Time (s)'); ylabel('Amplitude'); legend('Original Analog Signal', 'Reconstructed Signal');
