clear all
close all

%%Finite Element 1D Assignment
%
%
%

%% Parameters

n = 100; %Number of elements
int = [0,1]; %Interval

lambda = 1;
D = 10;

%% Mesh & Topology

mesh = GenerateMesh(int,n);
top = GenerateTopology(n); %1D topology!!


%% Calculate Element Matrix


S = zeros(n,n);
for i = 1:n
    for j = 1:n
        S(i,j) = 0;
    end
end


