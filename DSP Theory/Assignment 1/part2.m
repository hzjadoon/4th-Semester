% Define parameters for Case 2
A = 1.5;
alpha = 0.7;
x2 = A*(alpha .^n);

% Plot for alpha = 0.7
figure;
stem(n, x2, 'g', 'filled');
title('Exponential Sequence for \alpha = 0.7');
xlabel('n'); ylabel('x[n]');
grid on;
