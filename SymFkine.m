%Function to compute the homogeneous transformation matrix of a robotic
%manipulator from its DH Parameters

function [T, O, z, A] = SymFkine(a_val, d_val, alpha_val)

% T = [cos(theta), -sin(theta)*cosd(alpha), sin(theta)*sind(alpha), a*cos(theta);
%     sin(theta), cos(theta)*cosd(alpha), -cos(theta)*sind(alpha), a*sin(theta);
%     0, sind(alpha), cosd(alpha), d;
%     0,0,0,1]

%Number of joints in the manipulator
NUM_OF_JOINTS = 3;

%DH Constants
% a_val = [0, 1.25, 1.25];%in meters
% d_val = [0.25, 0, 0];%in meters
% alpha_val = [90, 0, 0];%in digrees

theta = sym('theta',[1 NUM_OF_JOINTS]);


z = sym('z',[3 NUM_OF_JOINTS]);
O = sym('O', [3 NUM_OF_JOINTS]);

    for i = 1:NUM_OF_JOINTS
    
    a = a_val(i);
    d = d_val(i);
    alpha = alpha_val(i);
    

    %if first frame, dont multiply
    if i == 1
            T = [cos(theta(i)), -sin(theta(i))*cosd(alpha), sin(theta(i))*sind(alpha), a*cos(theta(i));
            sin(theta(i)), cos(theta(i))*cosd(alpha), -cos(theta(i))*sind(alpha), a*sin(theta(i));
            0, sind(alpha), cosd(alpha), d;
            0,0,0,1];
            A(:,:,i) = T;
            z(:,i) = T(1:3,3);
            O(:,i) = T(1:3,4);
        continue
    end

    %Multiply the frame with the cumulative transformation
    A(:,:,i) = [cos(theta(i)), -sin(theta(i))*cosd(alpha), sin(theta(i))*sind(alpha), a*cos(theta(i));
            sin(theta(i)), cos(theta(i))*cosd(alpha), -cos(theta(i))*sind(alpha), a*sin(theta(i));
            0, sind(alpha), cosd(alpha), d;
            0,0,0,1];
    T = T*A(:,:,i);
    z(:,i) = T(1:3,3);
    O(:,i) = T(1:3,4);
    end
end