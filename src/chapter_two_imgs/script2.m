% Plot two impulse responses side by side
clear; close all;

% Antisymmetric impulse response (Type IV, even length)
h1 = [0.5032, 0.0513, 0.0485, 0.0421, 0.0326, 0.0206, 0.0070, -0.0070, -0.0206, -0.0326, -0.0421, -0.0485, -0.0513, -0.5032];
n1 = 0:length(h1)-1;

% Symmetric impulse response (Type I, odd length)
h2 = [0.0760, 0.0421, 0.0513, 0.0598, 0.0670, 0.0726, 0.0761, 0.0773, 0.0761, 0.0726, 0.0670, 0.0598, 0.0513, 0.0421, 0.0760];
n2 = 0:length(h2)-1;

% Plotting
figure('Position', [100, 100, 1000, 400]);

% --- Left: Antisymmetric ---
subplot(1,2,1);
stem(n1, h1, 'r', 'LineWidth', 2, 'MarkerSize', 8);
xlabel('n');
ylabel('h[n]');
title('Antisymmetric');
grid on;
% Highlight center (between two middle samples)
hold on;
mid1 = length(h1)/2 - 1;
mid2 = length(h1)/2;
stem([mid1, mid2], [h1(mid1+1), h1(mid2+1)], 'k', 'LineWidth', 2, 'MarkerSize', 10);
legend('h[n]', 'Center pair', 'Location', 'northeast');
% Add zero line for clarity
plot([0, length(h1)-1], [0, 0], 'k--', 'LineWidth', 0.5);

% --- Right: Symmetric ---
subplot(1,2,2);
stem(n2, h2, 'b', 'LineWidth', 2, 'MarkerSize', 8);
xlabel('n');
ylabel('h[n]');
title('Symmetric');
grid on;
% Highlight center
hold on;
center2 = floor(length(h2)/2);
stem(center2, h2(center2+1), 'r', 'LineWidth', 2, 'MarkerSize', 10);
legend('h[n]', 'Center', 'Location', 'northeast');
% Add zero line for clarity
plot([0, length(h2)-1], [0, 0], 'k--', 'LineWidth', 0.5);
pause;
