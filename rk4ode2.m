function [t,x,v] = rk4ode2(func, t, x, v, r, h,wind)
%
% Solution of 2nd order ODE using Runge-Kutta 4th order with constant step 
% size.  ODE solved is converted to two 1st order equations.  The RHS of the 
% system is
%      dv/dt = func(t, x, v)
%      dx/dt = v
% See OdeFountain.m
%
% USAGE:  [t, x, v] = rk4ode2(func,a,b,x0,xd0,h)
%        t = initial time
%        x = initial condition (position)
%        v = initial condition (velocity)
%        h = stepsize
% http://www.mece.ualberta.ca/Courses/mec390/390code/examples.htm
%
% Zhou lvwen: zhou.lv.wen@gmail.com


k1x = v;
k1v = feval(func, t    , x        , v         , r,wind);

k2x = v+k1v*h/2;
k2v = feval(func, t+h/2, x+k1x*h/2 , v+k1v*h/2, r,wind);

k3x = v+k2v*h/2;
k3v = feval(func, t+h/2, x+k2x*h/2 , v+k2v*h/2, r,wind);

k4x = v+k3v*h;
k4v = feval(func, t+h  , x+k3x*h   , v+k3v*h  , r,wind);

t = t + h;
x = x + (k1x + 2*k2x + 2*k3x + k4x)*h/6;
v = v + (k1v + 2*k2v + 2*k3v + k4v)*h/6;

