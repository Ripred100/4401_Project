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
[T, O_sym, z, A] = SymFkine(a_val, d_val, alpha_val)

%Functions for forward kinematics parameters
%---------------------------------------------------

%Origin of joint frames
theta = sym('theta',[1 NUM_OF_JOINTS]);
O(theta) = O_sym

%
q = [pi/2, pi/2, pi/2];
q_f = [pi/3, pi/3, pi/3];

Fatt(q, q_f, O)


%calculate Fatt for all joints

%calculate Frep for all joints


j = Jacob(O_sym,z);
j = simplify(j(1:3, :))
%calculate Tatt for all joints

%calculate Trep for all joints

