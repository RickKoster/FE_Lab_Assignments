function [ u ] = SolveBVP(  N_elem, int, lambda, D )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

S = AssembleMatrix( N_elem, int, lambda, D);
f = AssembleVector( N_elem, int, lambda, D);

%% Calculate u
x = linspace(int(1),int(2),100);

u = S\f;
plot(x,u); 


end

