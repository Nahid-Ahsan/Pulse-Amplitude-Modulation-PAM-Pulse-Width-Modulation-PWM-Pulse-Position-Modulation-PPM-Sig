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
%Generate PWM Signal
for i=1:length(t)
if(M(t(i)) >=S(i))
PWM(i) = 1;
end
end
% Reference Pulse Positions (optional, just for graphical impact)
RS = 0.5*(1 + square(2*pi*fp*t , 0.1));
PWM_NE = zeros(size(PWM)); % Define an array to store the Negative Edge (NE) points in PWM Signal
PPM = zeros(size(PWM)); % Define PPM Signal
duty = 10; %Duty cycle of the single PPM Pulse
P = ones(1, (duty/100)*(fs/fp)); % Define the Single Pulse for PPM Signal, P(t)
% Generate Negative Edge (NE) impulses & PPM Signal
for i=2:length(t)
if (PWM(i-1) - PWM(i) == 1) % Condition for Negative Edge (NE) point
PWM_NE(i-1) = 1; % Mark the Negative Edge (NE) point
PPM( i - 1 : i -2 + length(P) ) = P; % Insert P(t) here starting from the NE point
end
end
figure(1)
subplot(411);
plot(t, M(t), 'k', 'linewidth', 1);
grid on;
ylabel('M(t)');
title('Message Signal');
subplot(412);
plot(t, PWM, 'k', 'linewidth', 1);
ylabel('s_{PWM}(t)');
grid on;
title('PWM Signal');
subplot(413);
stem(t, PWM_NE, '.k', 'linewidth', 1);
ylabel('Neg Edge of PWM');
grid on;
title('PWM Negative Edges');
subplot(414);
plot(t, PPM, 'k', 'linewidth', 1); hold on;
plot(t, RS, 'r');
ylabel('s_{PPM}(t)');
grid on;
title('PPM Signal');