% Given specifications
Fs = 20000;                  % Sampling frequency in Hz
fp = 2000;                   % Passband edge frequency in Hz
fs = 5000;                   % Stopband edge frequency in Hz
N = 21;                      % Filter length

% Calculate the normalized cutoff frequency
fc = ((fp + fs) / 2) / (Fs / 2);

% Design the FIR filter using Hanning window
b = fir1(N - 1, fc, 'low', hanning(N));

% Plot frequency response of the filter
fvtool(b, 1);                % Visualizes the magnitude and phase response
title('Frequency Response of the FIR Filter with Hanning Window');

% Alternatively, plot using freqz for more detailed response
figure;
freqz(b, 1, 1024, Fs);       % Frequency response plot with specified sample rate
title('Magnitude and Phase Response of the FIR Filter');
