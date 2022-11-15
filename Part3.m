%Written by Anuar Saenger in November 2022
%4401 Robotic Manipulators project part 3

clear
close all
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

%configurations
q = [pi/4, pi/6, -pi/6];
q_f = [-pi*2/3, pi/6, pi/4];


%Initializing variables
Torque = [0 0 0];
q_hist = q;

%Obstacle variables. p_spheres(:,n) corresponds to the 3x1 coordinates of
%the center of the n'th sphere
p_spheres = [-1 0.1 -0.67 1; 0 0.1 -0.85 1; .6 1.5 2.4 2];
radi = [0.6 0.2 0.4 0.3];

desired_pos = double(O(q_f(1), q_f(2), q_f(3)));
curr_pos_2 = double(O(q(1), q(2), q(3)));
joint_1 = [curr_pos_2(:,1)]
joint_2 = [curr_pos_2(:,2)]
joint_3 = [curr_pos_2(:,3)]


%Plot begining and end positions for manipulator 
%Begining points
plot3([joint_1(1,1) joint_2(1,1) joint_3(1,1)], ...
        [joint_1(2,1) joint_2(2,1) joint_3(2,1)], ...
        [joint_1(3,1) joint_2(3,1) joint_3(3,1)],...
        'r','linewidth',2);
hold on
%begining manipulator
scatter3(joint_1(1), joint_1(2), joint_1(3), "green")
scatter3(joint_2(1), joint_2(2), joint_2(3), "blue")
scatter3(joint_3(1), joint_3(2), joint_3(3), "red")
%final manipulator
plot3(desired_pos(1,:), ...
        desired_pos(2,:), ...
        desired_pos(3,:),...
        'g','linewidth',2);
plot3([0 0], [0 0], [0 0.25], 'r','linewidth',2)

%plot obstacles
[X,Y,Z] = sphere;
for i =  1:length(radi)
r=radi(i);
X2 = X * r;
Y2 = Y * r;
Z2 = Z * r;
s = surf(X2 + p_spheres(1,i),Y2 + p_spheres(2,i),Z2 + p_spheres(3,i))
end
ax = ancestor(s, "axes");
set(ax, "yLim", [-2.5, 2.5], "xLim", [-2.5 2.5], "zLim", [0 3])

while 1 

    %Calculate All forces
    F_att = double(Fatt(q, q_f, O));
    F_rep = double(Frep(q, O, p_spheres, radi));

    Force = F_att + F_rep;


    %Turn forces into torque
    [Jo3, Jo2, Jo1] = Jacob_oi(O_sym, z, q);
    Torque = double(Jo1*Force(:, 1) + Jo2*Force(:, 2) + Jo3*Force(:, 3)).'

    %Gradient descent to change q
    max_step_size = 0.05;
    q = q + max_step_size*Torque/norm(Torque)



    
    
    %log q and position, plot them
    q_hist = [q_hist q];
    curr_pos_2 = double(O(q(1), q(2), q(3)));
    joint_1 = [joint_1 curr_pos_2(:,1)];
    joint_2 = [joint_2 curr_pos_2(:,2)];
    joint_3 = [joint_3 curr_pos_2(:,3)];

    scatter3(joint_1(1,end), joint_1(2,end), joint_1(3,end), "green")
    scatter3(joint_2(1,end), joint_2(2,end), joint_2(3,end), "blue")
    scatter3(joint_3(1,end), joint_3(2,end), joint_3(3,end), "red")
    
    %Plot wireframe of the manipulator
    plot3([joint_1(1,end) joint_2(1,end) joint_3(1,end)], ...
        [joint_1(2,end) joint_2(2,end) joint_3(2,end)], ...
        [joint_1(3,end) joint_2(3,end) joint_3(3,end)],...
        'color',[0 0 1 0.3],'linewidth',2);


    pause(0.0001)
    hold on
   
    
    %Check if solution is good enough
    if norm(q - q_f) < 0.1 || norm(curr_pos_2 - desired_pos) < 0.1
        break
    end

end

    %plot end position
    plot3([joint_1(1,end) joint_2(1,end) joint_3(1,end)], ...
        [joint_1(2,end) joint_2(2,end) joint_3(2,end)], ...
        [joint_1(3,end) joint_2(3,end) joint_3(3,end)],...
        'b','linewidth',2);
    

hold off

