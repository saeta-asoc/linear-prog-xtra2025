%constants
g=9.81; %GRAVITY
CL= 1.5; %LIFT COEFFICIENT
S=30; %WING AREA
OEM=3;
m=5; %total mass (kg)

%Define density range (air density variation from hight altitude to sea level)
rho_values=linspace(0.5, 1.5, 100); %kg/m^3

%Initialize MPL array
MPL_values=zeros(size(rho_values));

%Compute MPL for each density value

for i=1:length(rho_values)
    rho=rho_values(i);

    Weight=m*g;
    Vstall=sqrt((2*Weight)/(1.225*S*CL));
    V=1.22*Vstall; %Take off speed
    MPL_values(i)=((1/g)*(0.5*rho*(V^2)*S*CL))-OEM;
end 

   %Plot the result
   figure;
   plot(rho_values, MPL_values, 'b-', 'LineWidth',2);
   xlabel('Air Density \rho (kg/m^3)');
   ylabel('Maximum Pyload MPL (kg)');
   title('Maximum Payload vs Air Density');
   grid on;
   



