clc; clear all; close all;
fs = 3600 ; % Matlab's sampling rate
t = 0:(1/fs):(0.5-1/fs); % Time Grid
% Define Message Signal
Am = 0.6; % Message Amplitude
fm = 4; % Message Frequency
M = @(t) Am*sin(2*pi*fm*t); % Sinusoidal Message, M(t)
Ac = 1; % Pulse amplitude
fp = 30 ; % Sampling rate per second/Pulse frequency
% Note that, (fs/fp) should be integer, it implies the time-points per sample
S = Ac*sawtooth(2*pi*fp*t); % Reference Sawtooth Signal
PWM = zeros(1, length(t)); % Define PWM Signal
% Generation of PWM Signal
for i=1:length(t)
if(M(t(i)) >=S(i))
PWM(i) = 1;
end
end
figure(1)
subplot(311);
plot(t, M(t), 'k', 'linewidth', 1);
grid on;
ylabel('M(t)');
title('Message Signal');
subplot(312);
plot(t, M(t), 'g'); hold on;
plot(t, S, 'k', 'linewidth', 1);
grid on;
ylabel('s_{sawtooth}(t)');
title('Sawtooth Reference Signal');
subplot(313);
plot(t, PWM, 'k', 'linewidth', 1);
ylabel('s_{PWM}(t)');
xlabel('Times (t) --->');
grid on;
title('PWM Signal');