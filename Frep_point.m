function Force = Frep_point(p_0, p_obs)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%parameters
p0 = 1;
eta = 1;

%Important quantities
diff = p_0 - p_f;
distance = norm(diff);
gradient = diff/distance

Force = eta*( (1/distance) - (1/p0))*(1/distance^2)*gradient

end