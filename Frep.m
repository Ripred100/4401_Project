function Force = Frep(q, O)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

%---------------------------------------
%Frep for spheres 
%given a sphere origin p_sphere, and radius r
p_sphere = [1; 1; 1]
r = 1

%distance to center
dst_center = p_sphere - O(q(1), q(2), q(3));
gradient = dst_center/norm(dst_center);
distance = dst_center - gradient*r;

Force = eta*( (1/distance) - (1/p0))*(1/distance^2)*gradient;


%-----------------------------------------
%TODO
%Frep for walls
%given a wall center p_wall, height h, width w, and normal vector N
%This assumes 

end