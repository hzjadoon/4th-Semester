% Define parameters for Case 3
A = 1.5;
alpha3 = 1.1;
x3 = A * (alpha3 .^ n);

% Plot for alpha = 1.1
figure;
stem(n, x3, 'b', 'filled');
title('Exponential Sequence for \alpha = 1.1');
xlabel('n'); ylabel('x[n]');
grid on;
