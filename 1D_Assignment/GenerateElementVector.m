function [ felem ] = GenerateElementVector( i, elmat, int, N_elem )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here



felem = [0;0];

% k_i = [elmat(i,1), elmat(i,2)];
% 
% x_i = mesh(k_i);

k1 = elmat(i,1);
k2 = elmat(i,2);

mesh = GenerateMesh(int, N_elem);

x1 = mesh(k1);
x2 = mesh(k2);



element_length = abs(x1-x2);

felem = (element_length/2*arrayfun(@functionBVP,[x1,x2]))';

end

