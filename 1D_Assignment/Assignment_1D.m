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
D = .1;

%% Solve BVP

% u = SolveBVP(N_elem, int, lambda, D);

%% Assemble Matrix & Vector

S = AssembleMatrix( N_elem, int, lambda, D);
f = AssembleVector( N_elem, int, lambda, D);

%% Calculate u
x = linspace(int(1),int(2),N_elem);

u = S\f;
plot(x,u); 


%% Assignment 13
figure 
hold on

for N_elem = [10, 20, 40, 80, 160]
    S = AssembleMatrix( N_elem, int, lambda, D);
    f = AssembleVector( N_elem, int, lambda, D);

    x = linspace(int(1),int(2),N_elem);

    u = S\f;
    plot(x,u);
end

    

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


