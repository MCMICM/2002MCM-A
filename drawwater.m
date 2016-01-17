function H = drawwater(r,x,R,rmin)
%
% drawwater  draw the water droplet, and the maker size and color base on
% it's radius.
%
% USAGE:  H = drawwater(r,x,R,rmin)
%        r =  radius of droplet
%        x = [x y z] is theposition of droplet.
%        R = initial radius; Max(r)<=R;
%        rmin = radius of smallest droplet.
%
% zhou lvwen: zhou.lv.wen@gmail.com

H = [];
for ri = rmin:0.0005:max(R)
    Ii = find(r<=ri);
    if ~isempty(Ii)
        h = plot3(x(Ii,1),x(Ii,2),x(Ii,3),'.','markersize',ri.^2/max(R.^2)*10);
        set(h,'color',[1 1 1]-0.6*ri.^2/max(R.^2));
        r(Ii)=[];
        x(Ii,:)=[];
        H = [H h];
    end
end
