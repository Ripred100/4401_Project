%Written by Anuar Saenger in November 2022
%4401 Robotic Manipulators project part 3

%DH Parameters
a_val = [0, 1.25, 1.25];%in meters
d_val = [0.25, 0, 0];%in meters
alpha_val = [90, 0, 0];%in digrees

%Number of joints in the manipulator
NUM_OF_JOINTS = 3;

%Forward kinematics function. 
%Returns:
%Homogeneous transformation matrix T
%Joint origins O
%Joint z axis direction z
%Joint specific transformation matricies A
[T, O_sym, z, A] = SymFkine(a_val, d_val, alpha_val);

%Functions for forward kinematics parameters
%---------------------------------------------------

%Origin of joint frames
theta = sym('theta',[1 NUM_OF_JOINTS]);
O(theta) = O_sym

T = T(1:3, 4)
T(theta) = T

%Temporary configurations
q = [pi/2, pi/2, pi/2];
p_path(:,1) = double(T(q(1), q(2), q(3)));
q_f = [pi/3, pi/3, pi/3];


while norm(q - q_f) > 0.05


    F_att = double(Fatt(q, q_f, O));


    %calculate Fatt for all joints

    %calculate Frep for all joints


    [Jo3, Jo2, Jo1] = Jacob_oi(O_sym, z, q);

    Torque = double(Jo1*F_att(:, 1) + Jo2*F_att(:, 2) + Jo3*F_att(:, 3)).'


    step_size = 0.05;

    q = q + Torque*step_size
    
    p_path = [p_path double(T(q(1), q(2), q(3)))];

end

curve = animatedline('LineWidth',1)
set(gca, "XLim", [-0.1 0.1], "YLim", [-2 1], "ZLim", [0 3])
view(43,24)
for i = 1:size(p_path,2)
    addpoints(curve, p_path(1,i), p_path(2,i), p_path(3,i));
    drawnow
    pause(0.5);
end
%calculate Tatt for all joints

%calculate Trep for all joints

