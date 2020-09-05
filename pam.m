clc; clear all; close all;
fs = 1800 ; % Matlab's sampling rate
t = 0:(1/fs):(0.5-1/fs); % Time Grid
% Define Message Signal
Am = 0.5; % Message Amplitude
fm = 5; % Message Frequency
M = @(t) Am*sin(2*pi*fm*t); % Sinusoidal Message, M(t)
fp = 60 ; % Sampling rate per second/Pulse frequency
% Note that, (fs/fp) should be integer, it implies the time-points per sample
duty = 40; % Duty Cycle (20% here)
S = 0.5*(1 + square(2*pi*fp*t, duty)); % Define Square Pulse (from 0 to 1)
sam_val = zeros(1, length(t)/(fs/fp) ); % Define an array to store the sampled values
tsm = zeros(size(sam_val)); % Define an array to store the times at when the sampling occurs
PAM_FT = zeros(1, length(S)); % Define Flat Topped PAM Signal
PAM_Nat = zeros(1, length(S)); % Define Natural PAM Signal
% Generation of Flat-topped PAM signal
for i=1:((length(t))/(fs/fp))
tsm(i) = t(1 + (i-1)*(fs/fp));
sam_val(i) = M(t(1 + (i-1)*(fs/fp)));
PAM_FT( 1+(i-1)*(fs/fp) : (fs/fp)*i ) = sam_val(i) * S( 1+(i-1)*(fs/fp) : (fs/fp)*i );
end
% Generation of Natural PAM Signal
PAM_Nat = M(t).*S;
figure(1)
subplot(411);
plot(t, M(t), 'k', 'linewidth', 1);
ylabel('M(t)');
xlabel('Times (t) --->');
title('Message Signal');
subplot(412);
stem(0:(length(tsm)-1), sam_val, '.k', 'linewidth', 1);
ylabel('M[n]');
xlabel('Samples (n) --->');
title('Sampled Message Signal');
subplot(413);
plot(t, M(t), 'g'); hold on;
plot(t, PAM_FT, 'k', 'linewidth', 1);
ylabel('s_{PAM}(t)');
xlabel('Times (t) --->');
title('PAM Signal (Flat Topped)');
subplot(414);
plot(t, M(t), 'g'); hold on;
plot(t, PAM_Nat, 'k', 'linewidth', 1);
ylabel('s_{PAM}(t)');
xlabel('Times (t) --->');
title('PAM Signal (Natural)');