function [ f ] = AssembleVector( N_elem, mesh, elmat )
%AssembleVector Assembles vector f from element vector f_ek
%   Detailed explanation goes here

f = zeros(N_elem,1);

for i = 1:N_elem-1
    felem = GenerateElementVector(i, elmat, mesh);
    for j = 1:2
        f(elmat(i,j)) = f(elmat(i,j)) + felem(j);
    end
end

