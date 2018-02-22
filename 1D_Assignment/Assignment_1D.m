clear all
close all

%%Finite Element 1D Assignment

%% Parameters

N_elem = 100; %Number of elements
int = [0,1]; %Interval
lambda = 1;
D = .1;

%% Mesh & Topology

mesh = GenerateMesh(int,N_elem);
elmat = GenerateTopology(N_elem); %1D topology!!

%% Assemble Matrix & Vector

S = AssembleMatrix( N_elem, lambda, D, mesh, elmat);
f = AssembleVector( N_elem, mesh, elmat);

%% Calculate u
x = linspace(int(1),int(2),N_elem);

u = S\f;
hold on
plot(x,u); 
legend('N=100')
title('Solution for u')
xlabel('x')
ylabel('u')
ax.box='on'
hold off

%% Assignment 13
% For this assigment change the function in functionBVP.m to 'f = sin(20*x)'

figure 
hold on

for N_elem = [10 20 40 80 100 160]
    mesh = GenerateMesh(int,N_elem);
    elmat = GenerateTopology(N_elem);
    S = AssembleMatrix( N_elem, lambda, D, mesh, elmat);
    f = AssembleVector( N_elem, mesh, elmat);

    x = linspace(int(1),int(2),N_elem);

    u = S\f;
    plot(x,u);
    

end

legend('N=10','N=20','N=40','N= 80','N=100','N=160')
title('Solution for u')
xlabel('x')
ylabel('u')
ax.box='on'
hold off
