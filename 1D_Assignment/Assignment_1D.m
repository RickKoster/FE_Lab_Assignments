clear all
close all

%%Finite Element 1D Assignment
%
%
%

%% Parameters

N_elem = 100; %Number of elements
int = [0,1]; %Interval
lambda = 1;
D = 15;

%% Assemble Matrix & Vector

S = AssembleMatrix( N_elem, int, lambda, D);
f = AssembleVector( N_elem, int, lambda, D);

%% Calculate u
x = linspace(0,1,100);

u = S\f;
plot(x,u); 

%% Mesh & Topology

%  mesh = GenerateMesh(int,N_elem);
%  elmat = GenerateTopology(N_elem); %1D topology!!

%% Calculate Element Matrix
%overkill for this 1D problem with elements of equal length!


% [ S, element_length, slope ] = GenerateElementMatrix(3, elmat, mesh);

% for i = 1:n
%     for j = 1:n
%         S = GenerateElementMatrix(k, top, mesh)
%     end
% end


