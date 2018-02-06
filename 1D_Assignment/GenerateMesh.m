function [ x ] = GenerateMesh(int, N_elem)
%GenerateMesh Creates a mesh for 1D problems
%   Detailed explanation goes here

% global int
% global N_elem

% int = [0,1];
% N_elem = 100;

    x = linspace(int(1,1),int(1,2),N_elem);

end

