% function Force = Frep_point(p_0, p_obs)
% %UNTITLED2 Summary of this function goes here
% %   Detailed explanation goes here
% 
% %parameters
% p0 = 0.5;
% eta = 1;
% 
% %Important quantities
% diff = p_0 - p_obs;
% distance = norm(diff);
% gradient = diff/distance
% 
% if norm(distance) <= p0
%     Force = eta*( (1/distance) - (1/p0))*(1/distance^2)*gradient
% else
%     Force = [0;0;0];
% end
% end