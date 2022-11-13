function Force = Frep(q, q_f)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

obstacles = []

eta = 1

for jointNum = 1:size(q, 2)
    for i = 1:size(obstacles)
        calculate DISTANCE_TO_OBS

        if DISTANCE_TO_OBS <= AOE_OF_OBS
            Force = eta*( 1/DISTANCE_TO_OBS - 1/AOE_OF_OBS )* (1/DISTANCE_TO_OBS)^2 * GRADIENT_DIRECTION
        end
    end

end

end