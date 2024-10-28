% Define parameters
Fs = 200;            % Sampling frequency (Hz)
T = 1/Fs;            % Sampling period
L = 1000;            % Length of the signal
t = (0:L-1)*T;       % Time vector

% Generate the example signal: 10 Hz and 50 Hz sine waves
x = sin(2*pi*10*t) + 0.5*sin(2*pi*50*t);

% Plot the time-domain signal
figure;
plot(t, x);
title('Time Domain Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% Perform Fourier Transform
X = fft(x);

% Compute the two-sided spectrum and single-sided spectrum
P2 = abs(X/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

% Define the frequency domain f-axis
f = Fs*(0:(L/2))/L;

% Plot the Frequency Response (Magnitude Spectrum)
figure;
subplot(2,1,1);
plot(f, P1);
title('Frequency Response - Amplitude');
xlabel('Frequency (Hz)');
ylabel('|P1(f)|');

% Phase Response
phase = angle(X(1:L/2+1));
subplot(2,1,2);
plot(f, phase);
title('Frequency Response - Phase');
xlabel('Frequency (Hz)');
ylabel('Phase (radians)');

% Interpretation of the results can be added here
