% Given specifications
Fs = 10000;                  % Sampling frequency in Hz
fp = 1500;                   % Passband edge frequency in Hz
transition_width = 500;      % Transition width in Hz
N = 67;                      % Filter length

% Calculate the normalized cutoff frequency
fc = (fp + transition_width / 2) / (Fs / 2);

% Design the lowpass FIR filter using Blackman window
b = fir1(N - 1, fc, 'low', blackman(N));

% Plot frequency response of the filter
fvtool(b, 1);                % Visualizes the magnitude and phase response
title('Frequency Response of the Lowpass Filter with Blackman Window');

% Alternatively, plot using freqz for more control
figure;
freqz(b, 1, 1024, Fs);       % Frequency response plot with specific sample rate
title('Magnitude and Phase Response of the Lowpass Filter');
