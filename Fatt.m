function Force = Fatt(q, q_f, O)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

Force = zeros(3, size(q, 2));

%For every column (joint variable)
%Calculate attractive force on the joint
% for jointNum = 1:size(q, 2)
%     Force(1:3, jointNum) = Fatt_point(o(q(jointNum)), o(q_f(jointNum)))
% end

Force = Fatt_point(O(q(1),q(2),q(3)) , O(q_f(1),q_f(2),q_f(3)));

end

