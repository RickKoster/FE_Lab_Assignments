function [ f ] = AssembleVector( N_elem, int, lambda, D )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

f = zeros(N_elem,1);

elmat = GenerateTopology(N_elem);

for i = 1:N_elem-1
    felem = GenerateElementVector(i, elmat, int, N_elem);
    for j = 1:2
        f(elmat(i,j)) = f(elmat(i,j)) + felem(j);
    end
end

