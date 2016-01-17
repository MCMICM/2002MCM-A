function a = OdeFountain(t, x, v, r, wind)
%
% OdeFountain   ODE for Fountain system
% Fountain system is
%     mdv/dt = -mg + ita*w*|w|*r^2
%
% USAGE:  [a] = OdeFountain(t,x,xd,r)
%        t = initial time.
%        x = [x,y,z] is the initial position. 
%        xd = [vx vy vy] is the initial velocity. 
%        r = the radius of droplets.
%
% zhou lvwen: zhou.lv.wen@gmail.com

m = 4/3*pi*r.^3*1000; % droplet mass (kg)
w = repmat(wind,size(x,1),1) - v; % relative velocity (m/s)
eta = 0.855; % constant of proportionality (kg/m^3)

[d1,d2] = size(x);
a = eta*abs(w).*w.*repmat(r.^2./m,1,d2)-repmat([0 0 9.8],d1,1);



