function [hj, x, v, r, Vol] = ArriveFloor(x, v, r, Pool)
%
% ArriveFloor  Find and show the droplet which arrive the floor, then delete 
% them form x, v and r. plot the droplet which fall into pool as 'o'.
%
% USAGE:  [hj, x, v, r, Vol] = ArriveFloor(x, v, r, Pool)
%        x = [x,y,z] is the droplet position. 
%        v = [vx vy vy] is the droplet velocity. 
%        r = the radius of droplets.
%        Pool = [x y z r]; Pool position and radius.
%
% zhou lvwen: zhou.lv.wen@gmail.com

% find and delete the droplets which arrive the floor or pool.
I = find(x(:,3)<=0);
dx = x(I,1);
dy = x(I,2);
dr = r(I);
x(I,:)=[];
v(I,:)=[];
r(I,:)=[];

% find and draw the droplets which arrive the pool.
px = Pool(1);
py = Pool(2);
pr = Pool(4);
VolJ = 0;
J = find((dx-px).^2+(dy-py).^2 < pr^2);
hj = [];
if ~isempty(J)
    hj=plot3(dx(J),dy(J),0.5*ones(size(dx(J))),'ow','markersize',2.5);
    VolJ = 4/3*pi*dr(J)'*dr(J);
end

% find and draw the droplets which arrive the floor
VolK = 0;
K = find((dx-px).^2+(dy-py).^2 > (pr+1)^2);
if ~isempty(K)
   hk = drawwater(dr(K),[dx(K),dy(K),zeros(size(K))],0.01,0.001);
   set(hk,'color',[0.4 0.4 0.4])
   VolK = 4/3*pi*dr(K)'*dr(K);
end

Vol = [VolJ VolK];


