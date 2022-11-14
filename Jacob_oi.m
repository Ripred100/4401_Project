function [Jo3, Jo2, Jo1] = Jacob_oi(O_sym, z, q)

[jo3, ~] = Jacob_i(O_sym, z, 3);
[jo2, ~] = Jacob_i(O_sym, z, 2);
[jo1, ~] = Jacob_i(O_sym, z, 1);

jo3 = matlabFunction(jo3.');
jo2 = matlabFunction(jo2.');
jo1 = matlabFunction(jo1.');


Jo3 = jo3(q(1), q(2), q(3));
Jo2 = jo2(q(1), q(2));
Jo1 = jo1();

end



function [Jv, Jw] = Jacob_i(O, z, n)

% % Jv(i) = cross(z(i-1),(O(n) - O(i-1)))
% % 
% % Jw(i) = [z(i-1), 0]

Jv = sym([0 0 0; 0 0 0; 0 0 0]);
Jw = sym([0 0 0; 0 0 0; 0 0 0]);

%Number of joints in the manipulator
NUM_OF_JOINTS = n;

for i = 1:NUM_OF_JOINTS

if i == 1
Jv(:,i) = cross(sym([0;0;1]),O(:,NUM_OF_JOINTS));
Jw(:,i) = sym([0;0;1]);
continue
end

Jv(:,i) = cross(z(:,i-1),(O(:,NUM_OF_JOINTS) - O(:,i-1)));
Jw(:,i) = z(:,i-1);

end
end