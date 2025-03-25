% Constants (you can update these based on your specific values)
W = 20;    % Weight (in Newtons)
rho = 1.225;   % Air density (in kg/m^3)
S = 50;        % Wing area (in m^2)
K = 1;         % Constant K (example value)
CD0 = 0.02;    % Zero-lift drag coefficient (example value)
np = 0.9;      % Propulsive efficiency (example value)
Pd = 500;      % Power available (in Watts)

% Define the range of L/D (Lift-to-Drag ratio)
LD_range = 5:0.1:20;  % L/D from 5 to 20, with step of 0.1

% Preallocate array for ROC (Rate of Climb)
ROC = zeros(size(LD_range));

% Loop through the L/D range
for i = 1:length(LD_range)
    LD = LD_range(i);
    
    % Compute Vbroc using the given equation
    Vbroc = sqrt((2 * W) / (rho * S)) * ((K / (3 * CD0))^0.25);
    
    % Compute thrust (T) from the equation
    T = (np * Pd) / Vbroc;
    
    % Compute sin(gamma) using the equation
    sin_gamma = (T / W) - (1 / LD);
    
    % Compute ROC (Rate of Climb)
    ROC(i) = Vbroc * sin_gamma;
end

% Plot ROC vs L/D
figure;
plot(LD_range, ROC, 'LineWidth', 2);
xlabel('L/D (Lift-to-Drag Ratio)');
ylabel('Rate of Climb (ROC) [m/s]');
title('ROC vs L/D');
grid on;
