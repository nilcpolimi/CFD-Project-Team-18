clear all
clc

%% Call all the variables

airfoil='6409';
saveFilename = '6409.txt';
chord = 1;
c=1;
n=100;  % number of points    
L=0.3; 

yc=zeros(n,1); %Column vector for the y position of the points in the camber line 
x = zeros(n,1); % Column vector for x values

x_airfoil=zeros(1,2*n-1); % Row vector of 199 points for the x-coordinate of the airfoil points
y_airfoil=zeros(1,2*n-1); %% Row vector of 199 points for the y-coordinate of the airfoil points
 
yt=zeros(1,n); % Row vector of 200 values for the y position of the 

%% Camber definition
% Maximum camber as a percentage of the chord 
f=str2double(airfoil(1));           
f=f/100; 

%% Position of max camber definition
% Position of maximum camber divided by 10 as a percentage of the chord
p=str2double(airfoil(2));
p=p/10; 

%% Maximum thickness
% Maximum thickness of the airfoil divided by 100 as a percentage of the
% chord 
t=str2double(airfoil(3:4));
t=t/100;

%% ---Thickness equation constants-----

k0=0.2969;
k1=-0.126;
k2=-0.3516;
k3=0.2843;
k4=-0.1015;

%% ----- x definition------
alpha = linspace(0, pi, n); % Vector of 200 points distributed evenly between 0 and pi
x = 0.5 * (1 + cos(alpha)); % X-Coordinate of each of these points. 0.5 is used to set the origin at the LE

%% -----Camber------

for i=1:1:n % 1 to 200 in increments of 1
if (0<=x(i)&& x(i)<p) % Equations to be used from 0 to location of max thickness
  yc(i)= (f/(p^2))*(2*p*x(i)-x(i)^2); %  Height of the points on the camber line corresponding 
  % to the values of x(i) 
  dyc_dx(i)=(2*f/(p^2))*(p-x(i)); % Camber gradient
end
if (p<=x(i) && 1>=x(i)) % Equations to be used from location of max thickness to 1 
  yc(i)= (f/(1-p)^2)*(1-2*p+2*p*x(i)-x(i)^2); % Camber 
  dyc_dx(i)=(2*f/(1-p)^2)*(p-x(i)); % Camber gradient
end
yt(i)=t/0.2*(k0*sqrt(x(i))+k1*x(i)+k2*x(i)^2+k3*x(i)^3+k4*x(i)^4); % Thickness distribution: 200 
% y-positions
theta(i)=atan(dyc_dx(i)); % Angle between the tangent to the camber line and the horizontal
end

%% ------Upper surface----- (200 points)

for i=1:1:n
xu(i)=x(i)-yt(i)*sin(theta(i)); % X-Coordinate of the points on the upper surface
yu(i)=yc(i)+yt(i)*cos(theta(i)); % Y-Coordinate of the points on the upper surface 
end

%% ------Lower surface----- (200 points)
for i=1:1:n
    xl(i)=x(i)+yt(i)*sin(theta(i)); % X-Coordinates of the points on the lower surface
    yl(i)=yc(i)-yt(i)*cos(theta(i)); % Y-Coordinate of the points on the lower surface
end

%% Flips the order of the points. 
% Instead of begining from the lower points on the trailing edge, we start
% from the lower points on the leading edge

    xl=flipud(xl');
    yl=flipud(yl');
    
%% Cluster the upper and lower surface airfoil coordinates into one single vector with 399 points 
% i = 0 at TE, i = 200 at LE, i = 399 at TE again.

for i=1:1:n
    x_airfoil(i)=xu(i);
    y_airfoil(i)=yu(i);
end
for i=1:1:n-1
    x_airfoil(n+i)=xl(i);
    y_airfoil(n+i)=yl(i);

% Write surface points coordinates into text file

fid = fopen(saveFilename, 'w'); % 'w' specifies write access
fprintf(fid, '%i \r\n', 2 * n - 1); % fprintf function to write data to text file
for i = 1:2 * n - 1 % for i from 1 to 399
    fprintf(fid, '%g   %g \r\n', x_airfoil(i), y_airfoil(i));
end
fclose(fid);
end

%% UPPER NORMALS

% Set x/c ratio

x_c = 0.7; 

% Length of the normal line for paraview 

Normal_Length = 0.1;

% Calculate point A = point immediately before x/c 

for i = 1:1:n
  
    if (x_airfoil(i) <= x_c)
        
        Ax = x_airfoil(i);
        Ay =y_airfoil(i);
        A = [Ax;Ay]
        break
    end
end

% Calculate point B = point immediately after x/c

for i = n:-1:1
    
    if (x_c <= x_airfoil(i))
        
        Bx = x_airfoil(i);
        By = y_airfoil(i);
        B = [Bx;By];
        break
    end
end
  
% Normal vector to the vector from A to B

normal_u = [Ay-By;Bx-Ax];
unit_normal_u = normal_u./sqrt(normal_u(1).^2 + normal_u(2).^2);

% Midpoint between the A and B, and initial point of the normal line

Midpoint_u = [(Bx+Ax)/2;(By+Ay)/2];

Final_Point_u = unit_normal_u.*Normal_Length + B

angle_u = atan (unit_normal_u(1)./unit_normal_u(2))

%% LOWER NORMALS

% Calculate point C = point immediately before x/c

for i = 2*n-1:-1:n
    
    if (x_airfoil(i) <= x_c)
        
        Cx = x_airfoil(i);
        Cy = y_airfoil(i);
        C = [Cx;Cy];
        break
    end
end

% Calculate point D = point immediately after x/c

for i = n:1:2*n-1
  
    if (x_airfoil(i) >= x_c)
        
        Dx = x_airfoil(i);
        Dy =y_airfoil(i);
        D = [Dx;Dy]
        break
    end
end


% Normal vector to the vector from A to B

normal_l = [Dy-Cy;Cx-Dx];
unit_normal_l = normal_l./sqrt(normal_l(1).^2 + normal_l(2).^2);

Final_Point_l = unit_normal_l.*Normal_Length + D;

angle_l = atan (unit_normal_l(1)./unit_normal_l(2));




