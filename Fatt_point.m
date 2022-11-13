function Force = Fatt_point(p_0, p_f)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

diff = p_0 - p_f
distance = norm(diff);

if distance <= d
    Force = -zeta*diff;
else
    Force = -d*zeta*diff/distance;
end

end