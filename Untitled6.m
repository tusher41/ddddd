% Given specifications
M = 61;                        % Filter length
fp = 0.1;                      % Passband edge (normalized)
fs = 0.15;                     % Stopband edge (normalized)

% Calculate the normalized cutoff frequency (midpoint of passband and stopband)
fc = (fp + fs) / 2;

% Design the lowpass FIR filter using a Hamming window
b = fir1(M - 1, fc, 'low', hamming(M));

% Plot the frequency response of the filter
fvtool(b, 1);                  % Visualizes the magnitude and phase response
title('Frequency Response of the Lowpass Filter');

% Alternatively, plot using freqz for more control
figure;
freqz(b, 1, 1024);             % Frequency response plot with 1024 points
title('Magnitude and Phase Response of the Lowpass Filter');
