function [ elmat ] = GenerateTopology( N_elem )
%GenerateTopology Creates the topology for a 1D problem given mesh 'x'.
%   Detailed explanation goes here
% global N_elem

elmat = zeros(N_elem,2);

    for i = 1:N_elem-1
        elmat(i,1) = i;
        elmat(i,2) = i + 1;
    end
    
end

