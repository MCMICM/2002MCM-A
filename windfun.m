function v = windfun(t0, T, dt, k)
%
% wind   wind founction, Generate the wind velocity.
%
% USAGE:  v = windfun(t, T, dt, k)
%        t0 = initial time
%        T = end time
%        dt = time step
%        k = 0 1,2,3 wind type
%
% zhou lvwen: zhou.lv.wen@gmail.com


mu_steady = 2.3;
mu_gust = 4.2;
t_gust = 4;
sigmma_gust = 2.2;

l = length(t0:dt:T);

switch k
    case 0
        v = zeros(l,3);
    case 1
        v = [2/3*mu_steady*ones(l,1) zeros(l,2)];
    case 2
        v = [2/3*mu_steady*sin(2*pi*[t:dt:T]') zeros(l,2)];
    case 3
        vx = poissrnd(mu_gust,t0+1,T/10+1);
        vx = interp1(t0:10:T,vx,t0:dt:T,'spline')';
        theta = pi/10*(rand(l,1)-0.5);
        theta = cumsum(theta);
        v = [vx.*cos(theta) vx.*sin(theta) zeros(l,1)];
end
