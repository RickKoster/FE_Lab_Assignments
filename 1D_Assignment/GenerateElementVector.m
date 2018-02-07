function [ felem ] = GenerateElementVector( i, elmat, mesh )
%GenerateElementVector Creates element vector f_ek
%   Detailed explanation goes here

felem = [0;0];

k1 = elmat(i,1);
k2 = elmat(i,2);

x1 = mesh(k1);
x2 = mesh(k2);

element_length = abs(x1-x2);

felem = (element_length/2*arrayfun(@functionBVP,[x1,x2]))';

end

