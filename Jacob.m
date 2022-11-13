function J = Jacob(O, z)

% % Jv(i) = cross(z(i-1),(O(n) - O(i-1)))
% % 
% % Jw(i) = [z(i-1), 0]

%Number of joints in the manipulator
NUM_OF_JOINTS = 3;

for i = 1:NUM_OF_JOINTS

if i == 1
Jv(:,i) = cross(sym([0;0;1]),O(:,NUM_OF_JOINTS));
Jw(:,i) = sym([0;0;1]);
continue
end

Jv(:,i) = cross(z(:,i-1),(O(:,NUM_OF_JOINTS) - O(:,i-1)));
Jw(:,i) = z(:,i-1);

end
J = [Jv;Jw];
%simplify(J);
%simplified = simplify(det(J))

end