% Define a digital transfer function
numerator = [1 -0.5];  % Example numerator coefficients
denominator = [1 -0.8];  % Example denominator coefficients
H = tf(numerator, denominator, -1);  % Define the transfer function

% Plot poles and zeros
pzmap(H);
title('Poles and Zeros of the Digital Filter');
