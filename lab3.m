% Filter specifications
M = 32;                      % Filter length (order + 1)
fp1 = 0.2;                   % Lower passband edge frequency (normalized)
fp2 = 0.35;                  % Upper passband edge frequency (normalized)
fs1 = 0.1;                   % Lower stopband edge frequency (normalized)
fs2 = 0.425;                 % Upper stopband edge frequency (normalized)

% Desired frequency bands and amplitude response
f = [0 fs1 fp1 fp2 fs2 1];   % Normalized frequency points
a = [0 0 1 1 0 0];           % Desired amplitude at each band

% Design the bandpass filter using Parks-McClellan algorithm
b = firpm(M - 1, f, a);      % FIR filter coefficients

% Plot frequency response
fvtool(b, 1);                % Frequency response visualization
title('Frequency Response of the Bandpass Filter');

% Alternatively, plot using freqz for more control
figure;
freqz(b, 1, 1024);           % Frequency response with 1024 points
title('Magnitude and Phase Response of the Bandpass Filter');
