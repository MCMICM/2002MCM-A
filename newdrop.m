function [x, v, r] = newdrop(x,v,r,X, V, R, theta, phi, dt)
%
% Newdrop  create new droplet for each nozzel and updated x, v, and r. 
%
% USAGE:  [x, v, r] = newdrop(x, v, r, X, V, R, theta, phi, dt)
%                X = [x y z] is the initial droplet postion
%                V = [vx vy vz] is the initial droplet velocity
%                R =  initial droplet radius
%                theta and phi = azimuth angles
%                dt = time step
%
% zhou lvwen: zhou.lv.wen@gmail.com

% compute how many droplets will out from the nozzel at between t and t+dt
s = V*dt;
n = ceil(V*dt.*pi.*R.^2./(4/3*pi*R.^3)/4);
% distance of two new closer droplets.
l = [s./n.*cos(theta).*cos(phi) s./n.*cos(theta).*sin(phi) s./n.*sin(theta)];

for i = 1:length(n)
    x_add = repmat(X(i,:),n(i),1)+cumsum(repmat(l(i,:),n(i),1));
    r_add = normrnd(R(i),0.1*R(i),n(i),1);
    v_add = normrnd(V(i),0.05*V(i),n(i),3).*...
            repmat([cos(theta(i)).*cos(phi(i)),...
                    cos(theta(i)).*sin(phi(i)) sin(theta(i))],n(i),1);
                
    x = [x;x_add];
    v = [v;v_add];
    r = [r;r_add];
end
