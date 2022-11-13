function Force = Fatt(q, q_f)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

Force = zeros(3, size(q, 2))

%For every column (joint variable)
%Calculate attractive force on the joint
for jointNum = 1:size(q, 2)
    Force(1:3, jointNum) = Fatt_point(o(q(jointNum)), o(q_f(jointNum)))
end

    
end

Force