function Force = Fatt(q, q_f, O)
%FATT calculates the attractive force on all joints.
%  Returns a 3x3 force vector where the i'th column represents the force on
%  the i'th joint

Force = zeros(3, size(q, 2));

%For every column (joint variable)
%Calculate attractive force on the joint
% for jointNum = 1:size(q, 2)
%     Force(1:3, jointNum) = Fatt_point(o(q(jointNum)), o(q_f(jointNum)))
% end

Force = Fatt_point(O(q(1),q(2),q(3)) , O(q_f(1),q_f(2),q_f(3)));

end

