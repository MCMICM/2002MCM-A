function [X, V, R, theta, phi] = FountainNozzel(k,t)
%
% FountainNozzel  Generate X,V,R,theta,phi of different kind fountain.
%
% USAGE:  [r, v, x] = breakup(r, v, x, rmin)
%        k = kind of fountain  
%        t = current time
%
% zhou lvwen: zhou.lv.wen@gmail.com

switch k
    case 1
        X = [0 0 0.6]; 
        V = 20; 
        R = 0.01; 
        theta = pi/2;
        phi = 0;
    case 2
        V = [20;10;10;10];
        R = [0.01;0.005;0.005;0.005];
        beta = [120;240;360]/180*pi;
        X = [0 0 0 ;4*[cos(beta) sin(beta) 0.12*ones(3,1)]];
        theta = [ 90; 90; 90; 90]/180*pi;
        phi =   [  0;  0;  0;  0]/180*pi;
    case 3
        V = [20;10;10;10];
        R = [0.01;0.005;0.005;0.005];
        beta = [120;240;360]/180*pi;
        X = [0 0 0 ;4*[cos(beta) sin(beta) 0.12*ones(3,1)]];
        theta = [ 90;75;75;75]/180*pi;
        phi =   [  0;120;240;360]/180*pi;
    case 4
        V = [20;10;10;10];
        R = [0.01;0.005;0.005;0.005];
        beta = [120;240;360]/180*pi;
        X = [0 0 0 ;4*[cos(beta) sin(beta) 0.12*ones(3,1)]];
        theta = [ 90;105;105;105]/180*pi;
        phi =   [  0;120;240;360]/180*pi;
    case 5
        omega = 180;
        V = [20;10;10;10];
        R = [0.01;0.005;0.005;0.005];
        beta = [120;240;360]/180*pi;
        X = [0 0 0 ;4*[cos(beta) sin(beta) 0.12*ones(3,1)]];
        theta = [ 90;75;75;75]/180*pi;
        phi =   [  0;120+omega*t;240+omega*t;360+omega*t]/180*pi;
    case 6
        omega = pi;
        V = [15;8;8;8]*(1+0.6*sin(omega*t));
        R = [0.01;0.005;0.005;0.005];
        beta = [120;240;360;]/180*pi;
        X = [0 0 0 ;4*[cos(beta) sin(beta) 0.12*ones(3,1)]];
        theta = [ 90;90;90;90]/180*pi;
        phi =   [  0;120;240;360]/180*pi;
    case 7
        omega = pi;
        V = [20;10;10;10];
        R = [0.01;0.005;0.005;0.005];
        beta = [120;240;360;]/180*pi;
        X = [0 0 0 ;4*[cos(beta) sin(beta) 0.12*ones(3,1)]];
        theta = ([ 90;90;90;90]+[0;1;1;1]*15*sin(omega*t))/180*pi;
        phi =   [  0;120;240;360]/180*pi;
    case 8
        V = [10;15;10;10;10];
        R = [0.005;0.01;0.005;0.005;0.005];
        beta = [120;240;360;]/180*pi;
        X = [0 0 1;0 0 0.5 ;4*[cos(beta) sin(beta) 0.12*ones(3,1)]];
        theta = [45; 90;90;90;90]/180*pi;
        phi =   [ 90*t;0;120;240;360]/180*pi;
end