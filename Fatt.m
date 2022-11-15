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

function Force = Fatt_point(p_0, p_f)
%FATT_POINT takes points and calculates the virtual forces from an
%attractive potential field
%Returns a 3x1 force vector for 2 points passed in
%If an array of points is passed in, it returns a 3xn force vector


%parameters
d = 0.5;
zeta = 1;

%Important quantities
diff = double(p_0 - p_f);
distance = norm(diff);

%If the points are far away, use a conical potential field
if distance <= d
    Force = -zeta*diff;
%else, the points are close and you use a parabolic potential field
else
    Force = -d*zeta*diff/distance;
end

end
