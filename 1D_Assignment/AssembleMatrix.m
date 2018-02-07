function [ S ] = AssembleMatrix( N_elem, lambda, D, mesh, elmat)
%AssembleMatrix Assembles matrix S from element matrix S_ek
%   Detailed explanation goes here

S = zeros(N_elem,N_elem);

for i = 1:N_elem-1
    Selem = GenerateElementMatrix(i, elmat, D, lambda, mesh);
    for j = 1:2
        for k = 1:2
            S(elmat(i,j), elmat(i,k)) = S(elmat(i,j), elmat(i,k)) + Selem(j,k);
        end
    end
end

end

