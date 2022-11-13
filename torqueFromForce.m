function Torque = torqueFromForce(Force)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%for all joint forces
for jointNum = 1:size(Force, 2)
    Torque = Jacob(jointNum)*Force(1:3, jointNum)

end

end