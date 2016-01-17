function CreateFountainPlaza(Sizeplaza, x, Pool)
%
% CreateFountainPlaza   Create the fountain plaza
%  __________________
% |        _         |
% |     /     \      |
% |    |   o   |pool | plaza
% |     \  _  /      |
% |__________________|
%
% USAGE:  CreateFountainPlaza(Sizeplaza, x, Pool)
%        Sizeplaza =[xmin xmax ymin ymax zmin zmax] is the size of the
%        plaza.
%        x = [x,y,z] is the nozzle position. 
%        Pool = [x y z r] is the pool position and radius.
%
% zhou lvwen: zhou.lv.wen@gmail.com

% draw the nozzels;
[xc,yc,zc]=cylinder(0.5);
for i = 1:size(x,1)
    surf(0.5*xc+x(i,1),0.5*yc+x(i,2),zc);
end

px = Pool(1);
py = Pool(2);
pz = Pool(3);
r = Pool(4);
% draw the pool;
[xc1,yc1,zc1]=cylinder(r+1);
[xc2,yc2,zc2]=cylinder(r);
surf([xc1 xc2],[yc1 yc2],[zc1 zc2]*0.5);
fill3([xc1(1,:) fliplr(xc2(1,:))]+px,...
      [yc1(1,:) fliplr(yc2(1,:))]+py,[zc1(2,:) zc2(2,:)]*0.5,'b')

fill3(xc2(1,:)+px,yc2(1,:)+py,zc2(2,:)*0.2,[0.6 0.8 0.9])
set(gca,'color',[0.3 0.3 0.3])

% set the floor color as black
fill3(Sizeplaza([1 2 2 1]),Sizeplaza([3 3 4 4 ]),[0 0 0 0],'k')

view(30,30)
axis(Sizeplaza);
box on; 