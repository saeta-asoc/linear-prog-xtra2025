% Constants (you can adjust these values based on your system)
Weight = 19.6;   % Weight in Newtons (Example value)
S = 1;            % Wing area in m^2 (Example value)
CL = 0.24;          % Lift coefficient (Example value)
CDO = 0.02;        % Zero-lift drag coefficient (Example value)
g = 9.81;          % Gravitational constant (m/s^2)
rho = 1.225;       % Air density (kg/m^3)
T=18.3;
e=0.5;
b=2.2;
mu_range = 0:0.01:0.3; % Range of mu (friction coefficient), from 0 to 0.3

% Preallocate array for SG (distance)
SG = zeros(size(mu_range));

% Loop through the mu range
for i = 1:length(mu_range)
    mu = mu_range(i);
  
    
    % Compute the velocity V (1.22 times Vstall)
    V = 1.22 * 11;
    
    % Compute KT using the formula
    KT = (T / Weight) - mu; % Assuming T is predefined, or this can be based on some logic
    AR=((b)^2)/S;
    K=1/(e*pi*AR);
    % Compute KA
    KA = (rho / ((2 * Weight) / S)) * (mu * CL - CDO - K * CL^2); % Assuming K is predefined
    
    % Compute SG (distance)
         SG(i) = (1 / (2 * g * KA)) * log((KT + KA * V^2) / KT);
         
end

% Plot SG vs mu
figure;
plot(mu_range, SG, 'LineWidth', 2);
xlabel('Coefficient of Friction (\mu)');
ylabel('Distance (SG) [m]');
title('SG vs \mu');
grid on;



