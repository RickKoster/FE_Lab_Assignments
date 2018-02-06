function [ S ] = AssembleMatrix( N_elem, int, lambda, D)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
% global N_elem 

elmat = GenerateTopology(N_elem);

S = zeros(N_elem,N_elem);

for i = 1:N_elem-1
    Selem = GenerateElementMatrix(i, elmat, int, N_elem, D, lambda);
    for j = 1:2
        for k = 1:2
            S(elmat(i,j), elmat(i,k)) = S(elmat(i,j), elmat(i,k)) + Selem(j,k);
        end
    end
end

end

