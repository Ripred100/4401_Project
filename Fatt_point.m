function Force = Fatt_point(p_0, p_f)
%Returns a 3x1 force vector 
%   Detailed explanation goes here

diff = p_0 - p_f
distance = norm(diff);

if distance <= d
    Force = -zeta*diff;
else
    Force = -d*zeta*diff/distance;
end

end