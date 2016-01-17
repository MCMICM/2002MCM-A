function [r, v, x] = breakup(r, v, x, t, rmin, dt, wind)
%
% BREAKUP   split the droplet into two new droplets and divide the mass of 
% the parent in a random proportion (from a uniform distribution).
%
% USAGE:  [r, v, x] = breakup(r, v, x, rmin)
%        r =  radius of droplet
%        x = [x,y,z] is the position of droplet. 
%        v = [vx vy vy] is the velocity of droplet.
%        t = current time
%        rmin = radius of smallest droplet.
%        dt = time step
%        wind = wind velocity
%
% zhou lvwen: zhou.lv.wen@gmail.com

% Find the droplet which radius big than rmin (which can split)

[d1,d2] = size(v);
w = repmat(wind,d1,1) - v;

% breakup one droplet into two new droplets and divide the mass of the 
% parent in a random proportion (from a uniform distribution).
part1 = rand(d1,1);
part2 = (1-part1);
R = [r.^3.*part1  r.^3.*part2].^(1/3);

% droplet breakup is a modified Poisson process
lambda0 = 5000;
lambda = lambda0.*sqrt(dot(w',w'))'.*r.^2;
P = exp(-lambda*dt).*lambda*dt;
%P = lambda0.*sqrt(dot(w',w'))'.*r.^2;
ifbreak = rand(d1,1)<P;

% find the droplets which can and can not be breakup at current time.
I1 = find(R(:,1)<=rmin|R(:,2)<=rmin|~ifbreak);
I2 = find(R(:,1)>rmin&R(:,2)>rmin&ifbreak);

% We choose this velocity nudge to have magnitude 2% of the particle¡¯s 
% velocity relative to the air, and in a random perpendicular direction. 
% We give the two drops resulting from a breakup equal and opposite nudges.
w = w(I2,:);
u = v(I2,:);
b = rand(size(w))-0.5;
c = cross(w,b);
c = c./repmat(sum(c.^2,2).^0.5,1,3);
disturb = 0.02*repmat(sum(w.^2,2).^0.5,1,3).*c;
u = [u+disturb; u-disturb];

% renew the data
v = [u; v(I1,:)];
x = x([I2;I2;I1],:);
r = [R(I2,1);R(I2,2);r(I1)];



