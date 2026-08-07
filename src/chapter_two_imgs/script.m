% Linear-phase FIR filter verification
% Symmetric impulse response
h = [0.1339, 0.1526, 0.1592, 0.1526, 0.1339];

n = 0:25;

%% Case 1: omega1 = pi/3 (A > 0, no inversion)
omega1 = pi/3;

x1 = cos(omega1 * n);
y1 = filter(h, 1, x1);

% Steady-state samples: n = 4,...,19
n1 = 4:19;
y1_steady = y1(n1 + 1);

% Theoretical steady-state response
A1 = 0.1592 + 2*(0.1339*cos(2*omega1) + 0.1526*cos(omega1));
y1_theory = A1 * cos(omega1 * (n1 - 2));


%% Case 2: omega2 = pi/2 (A < 0, inverted)
omega2 = pi/2;

x2 = cos(omega2 * n);
y2 = filter(h, 1, x2);

% Steady-state samples: n = 4,...,19
n2 = 4:19;
y2_steady = y2(n2 + 1);

% Theoretical steady-state response
A2 = 0.1592 + 2*(0.1339*cos(2*omega2) + 0.1526*cos(omega2));
y2_theory = abs(A2) * cos(omega2 * (n2 - 2) + pi);


%% Plotting
figure;

% Case 1
subplot(2,1,1);
stem(n1, cos(omega1*n1), 'b', 'LineWidth', 2, 'MarkerSize', 8);
hold on;
stem(n1, y1_steady, 'r', 'LineWidth', 2, 'MarkerSize', 8);
plot(n1, y1_theory, '--k', 'LineWidth', 1);
hold off;

xlabel('n');
ylabel('Amplitude');
title('Case 1: \omega = \pi/3 (A(\omega) > 0, NO FLIP)');
legend('Input x[n]', 'Output y[n]', 'Theory', 'Location', 'northeast');
grid on;
ylim([-1.2, 1.2]);
xlim([4, 19]);


% Case 2
subplot(2,1,2);
stem(n2, cos(omega2*n2), 'b', 'LineWidth', 2, 'MarkerSize', 8);
hold on;
stem(n2, y2_steady, 'r', 'LineWidth', 2, 'MarkerSize', 8);
plot(n2, y2_theory, '--k', 'LineWidth', 1);
hold off;

xlabel('n');
ylabel('Amplitude');
title('Case 2: \omega = \pi/2 (A(\omega) < 0, FLIPPED)');
legend('Input x[n]', 'Output y[n]', 'Theory', 'Location', 'northeast');
grid on;
ylim([-1.2, 1.2]);
xlim([4, 19]);
pause;
