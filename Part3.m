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
q = [pi/2, pi/4, -pi/4];
curr_pos = double(T(q(1), q(2), q(3)))
double(O(q(1), q(2), q(3)))
p_path(:,1) = curr_pos;
q_f = [0, pi/2, -pi/2];

desired_pos = double(T(q_f(1), q_f(2), q_f(3)));
Torque = [0 0 0]

while norm(q - q_f) > 0.1


    F_att = double(Fatt(q, q_f, O));


    %calculate Fatt for all joints

    %calculate Frep for all joints


    [Jo3, Jo2, Jo1] = Jacob_oi(O_sym, z, q);

    Torque = double(Jo1*F_att(:, 1) + Jo2*F_att(:, 2) + Jo3*F_att(:, 3)).'

    %min_step_size = 0.05;
    max_step_size = 0.005;
    

    q = q + max_step_size*Torque/norm(Torque)
    hold on
    plot(q)

    curr_pos = double(T(q(1), q(2), q(3)))
    desired_pos
        
    p_path = [p_path curr_pos];

    

end
hold off


%plot3(p_path(1,:), p_path(2,:), p_path(3,:), "Color","b")

%plot3(desired_pos(1),desired_pos(2),desired_pos(3), "Color","r")

% 
% curve = animatedline('LineWidth',1, "Color", "r")
% set(gca, "XLim", [-3 3], "YLim", [-3 3], "ZLim", [0 3])
% view(43,24)
% for i = 1:size(p_path,2)
%     addpoints(curve, p_path(1,i), p_path(2,i), p_path(3,i));
%     drawnow
%     pause(0.5);
% end
%calculate Tatt for all joints

%calculate Trep for all joints

