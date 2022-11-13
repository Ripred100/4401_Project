function Force = Fatt_point(p_0, p_f)
%FATT_POINT takes points and calculates the virtual forces from an
%attractive potential field
%Returns a 3x1 force vector for 2 points passed in
%If an array of points is passed in, it returns a 3xn force vector


%parameters
d = 1;
zeta = 1;

%Important quantities
diff = p_0 - p_f;
distance = norm(diff);

%If the points are far away, use a conical potential field
if distance <= d
    Force = -zeta*diff;
%else, the points are close and you use a parabolic potential field
else
    Force = -d*zeta*diff/distance;
end

end