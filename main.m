% Main.m
% ********************************************
% This is a main script to simulate the water fountain under the wind.
%
% zhou lvwen: zhou.lv.wen@gmail.com
%
% June 23, 2010 

clear;clc

x = []; % droplet position
v = []; % droplet velocity
r = []; % droplet radius
vol = [];
dt = 0.02; % Time step
T = 100; % end time
t = 0; % initial time
fk = 5; % kind of fountain
wk = 3; % wind type
rmin = 0.001; % smallest droplets radii
Sizeplaza = [-15 15 -15 15 0 20]; 
% Sizeplaza =[xmin xmax ymin ymax zmin zmax] is the size of the plaza.
Pool = [ 0 0 0 5];% Pool position and radius; Pool = [x y z r];

figure('name','Water fountain(made by Zhou Lvwen)','Doublebuffer','on')
hold on;
[X, V, R, theta, phi] = FountainNozzel(fk,t);
CreateFountainPlaza(Sizeplaza, X, Pool)
[x, v, r] = newdrop(x,v,r,X, V, R,theta,phi,dt);
Wind = windfun(t,T,dt,wk);

while t<T
    wind = Wind(fix(t/dt+1),:);
    [t,x,v]=rk4ode2(@OdeFountain, t , x, v, r, dt,wind);
    
    % Delete and draw the droplets which arrive floor.
    [h1, x, v, r, Vol] = ArriveFloor(x, v, r, Pool);
    vol = [vol;Vol];
    [r, v, x] = breakup(r,v,x,t,rmin,dt,wind);
    
    % generat and add new droplets
    [X, V, R, theta, phi] = FountainNozzel(fk,t);
    [x, v, r] = newdrop(x,v,r,X, V, R,theta,phi,dt);
    
    % draw the droplets in the air.
    h2 = drawwater(r,x,R,rmin);
    
    %% draw the wind
    h3 = arrow([0 0 20],[wind(1)*1.5 wind(2)*1.5 20],'Width',3);
    set(h3,'EdgeColor',[1,0,0],'FaceColor',[1,0,0])
    
    drawnow
    delete([h1 h2 h3])
end
