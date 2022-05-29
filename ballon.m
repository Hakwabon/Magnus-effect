clear all; close all; clc;
global g S P R rho m 

g = 9.81;
R = 0.11;
S = 4*pi*R*R;
Pa = 101325;
rho = 1.2;
m = 0.25;

x = 0;  y = 0;                  z = 0;                  #m
vx = 0;  vy = 90/3.6*cos(pi/4);  vz = 90/3.6*sin(pi/4) ;  #m/s
d_theta = 10;   #rad/s

v = [vx,vy,vz];

choix = 'z';
if choix == "x";
  theta = [d_theta,0,0];
elseif choix == "y";
    theta = [0,d_theta,0];
else 
    theta = [0,0,d_theta];
endif

P = 2*rho*d_theta*4/3*pi*R^3;

t_f = 2*vz/g;
a = t_f*vy;
b = vz*vz/(2*g);

CI = [x,y,z,vx,vy,vz];
t = [1:0.01:t_f];
options=odeset('RelTol',1.e-4);
[t,y]=ode45('ball',t,CI,options);

figure 1
plot3(y(:,1),y(:,2),y(:,3));
xlabel('Coordonnees de x');
ylabel('Coordonnees de y');
zlabel('Coordonnees de z');

figure 2

for i = 1:length(y(:,1));
  plot3(y(:,1),y(:,2),y(:,3));
  hold on
  scatter3(y(i,1),y(i,2),y(i,3),300,'filled');
  axis ([0 a 0 a 0 b])
  axis manual
  xlabel ("x");
  ylabel ("y");
  zlabel ("z");
  drawnow
  hold off
  pause(0.01)

endfor