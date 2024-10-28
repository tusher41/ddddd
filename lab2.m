% Define the numerator and denominator for H1(z)
num_H1 = [1 0 1];                 % Coefficients for 1 + z^(-2)
den_H1 = [2 1 -0.5 0.25];         % Coefficients for 2 + z^(-1) - 0.5z^(-2) + 0.25z^(-3)

% Define the numerator and denominator for H2(z)
num_H2 = [1 1 (3/2) (1/2)];       % Coefficients for 1 + z^(-1) + (3/2)z^(-2) + (1/2)z^(-3)
den_H2 = [1 (3/2) (1/2)];         % Coefficients for 1 + (3/2)z^(-1) + (1/2)z^(-2)

% Plot pole-zero map for H1(z)
figure;
subplot(1, 2, 1);
zplane(num_H1, den_H1);           % Pole-zero plot for H1(z)
title('Pole-Zero Plot for H1(z)');

% Plot pole-zero map for H2(z)
subplot(1, 2, 2);
zplane(num_H2, den_H2);           % Pole-zero plot for H2(z)
title('Pole-Zero Plot for H2(z)');
