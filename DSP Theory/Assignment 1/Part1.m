% Define parameters for Case 1
A = 1.5;
alpha1 = -0.5;
n = -10:10;
x1 = A * (alpha1 .^ n);

% Plot for alpha = -0.5
figure;
stem(n, x1, 'r', 'filled');
title('Exponential Sequence for \alpha = -0.5');
xlabel('n'); ylabel('x[n]');
grid on;
