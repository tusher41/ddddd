% Define the numerator and denominator for H1(s)
num_H1 = [1 0 0 1];  % Coefficients of s^3 + 1
den_H1 = [1 0 2 0 1]; % Coefficients of s^4 + 2s^2 + 1

% Define the numerator and denominator for H2(s)
num_H2 = [4 8 10];   % Coefficients of 4s^2 + 8s + 10
den_H2 = [2 8 18 20]; % Coefficients of 2s^3 + 8s^2 + 18s + 20

% Find poles and zeros for H1(s)
poles_H1 = roots(den_H1);  % Poles of H1(s)
zeros_H1 = roots(num_H1);  % Zeros of H1(s)

% Find poles and zeros for H2(s)
poles_H2 = roots(den_H2);  % Poles of H2(s)
zeros_H2 = roots(num_H2);  % Zeros of H2(s)

% Display the results
disp('Poles of H1(s):');
disp(poles_H1);

disp('Zeros of H1(s):');
disp(zeros_H1);

disp('Poles of H2(s):');
disp(poles_H2);

disp('Zeros of H2(s):');
disp(zeros_H2);

% Manually plot poles and zeros for H1(s)
figure;
subplot(1,2,1);
plot(real(poles_H1), imag(poles_H1), 'rx', 'MarkerSize', 10, 'LineWidth', 2); % Plot poles as 'x'
hold on;
plot(real(zeros_H1), imag(zeros_H1), 'bo', 'MarkerSize', 10, 'LineWidth', 2); % Plot zeros as 'o'
xlabel('Real');
ylabel('Imaginary');
title('Pole-Zero Map for H1(s)');
legend('Poles', 'Zeros');
grid on;

% Manually plot poles and zeros for H2(s)
subplot(1,2,2);
plot(real(poles_H2), imag(poles_H2), 'rx', 'MarkerSize', 10, 'LineWidth', 2); % Plot poles as 'x'
hold on;
plot(real(zeros_H2), imag(zeros_H2), 'bo', 'MarkerSize', 10, 'LineWidth', 2); % Plot zeros as 'o'
xlabel('Real');
ylabel('Imaginary');
title('Pole-Zero Map for H2(s)');
legend('Poles', 'Zeros');
grid on;
