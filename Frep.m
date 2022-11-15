function Force = Frep(q, O, p_spheres, radi)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

%---------------------------------------
%Frep for spheres 
%given a sphere origin p_sphere, and radius r
% p_spheres = [0.4 0 0.6; 1.5 0 0; 1.6 0.125 1.4];
% 
% radi = [0.2 0.3 0.2];
p0 = 2;
eta = 0.003;
Force = zeros(3,3);

for j = 1:length(radi)
p_sphere = p_spheres(:,j);
r = radi(j);

joint_o = double(O(q(1), q(2), q(3)));
for i = 2:3
    dst_center = double(p_sphere - joint_o(:,i));
    gradient = dst_center/norm(dst_center);
    distance = dst_center - gradient*r;
    p_obs = p_sphere + distance;
    distance = norm(distance);
    if norm(distance) <= p0
        Force(:,i) = Force(:,i) - (eta*( (1/distance) - (1/p0))*(1/distance^2)*gradient);
        i
        p_sphere
        %Draws the force vector
%         plot3([p_obs(1) p_obs(1) - gradient(1)], ...
%             [p_obs(2) p_obs(2) - gradient(2)], ...
%             [p_obs(3) p_obs(3) - gradient(3)])
    else
        Force(:,i) = Force(:,i) + [0;0;0];
    end

end
end



end