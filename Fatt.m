function Force = Fatt(q, q_f)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

Force = zeros(1, size(q, 2))

%For every column (joint variable)
for i = 1:size(q, 2)
    Force(1, i) = Fatt_point(o(q(i)), o(q_f(i)))
end

    
end