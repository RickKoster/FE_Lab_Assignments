function [ elmat ] = GenerateTopology( n )
%GenerateTopology Creates the topology for a 1D problem given mesh 'x'.
%   Detailed explanation goes here

elmat = zeros(n,2);

    for i = 1:n-1
        elmat(i,1) = i;
        elmat(i,2) = i + 1;
    end
    
end

