close all
clear all

%% 2D Assignment
%   Lab Assignment 7

%% Create Mesh
WI4243Mesh

%% Parameters

Qp = 50;            % [m^2/s]
k = 10^-7;          % [m^2]
mu = 1.002*10^-3;   % [Pa*s]
K = 0;             % [m/s]
pH = 10^6;          % [Pa]
N_wells = 6;        % number of wells

% N_Test = 0; % used to check how many elements contain a well
%% Coordinates of wells

for i = 1:N_wells-1;
    xp(i) = 0.6*cos((2*pi)*(i-1)/(N_wells-1));
    yp(i) = 0.6*sin((2*pi)*(i-1)/(N_wells-1));
end

xp(N_wells) = 0;
yp(N_wells) = 0;
clear i;
%%

%% Compute Problem
WI4243Comp

%% Post
WI4243Post

%% 

Pressure_minimum = min(u)

max(vy)
max(vx)
