function [ Selem ] = GenerateElementMatrix( k, elmat, int, N_elem, D, lambda)
%GenerateElementMatrix Creates element matrix S_ek
%   Detailed explanation goes here

% global D
% global lambda
% global N_elem

Selem = zeros(2,2);

i = elmat(k,1);
j = elmat(k,2);

mesh = GenerateMesh(int, N_elem);

x1 = mesh(i);
x2 = mesh(j);

element_length = abs(x1-x2);

slope = 1/element_length; 

% MUCH FASTER for some reason

% Selem(1,1) = element_length*((-1)^(abs(1-1))*D*slope^2 + (1+1)*lambda/6);
% Selem(1,2) = element_length*((-1)^(abs(1-2))*D*slope^2 + (1)*lambda/6);
% Selem(2,1) = element_length*((-1)^(abs(2-1))*D*slope^2 + (1)*lambda/6);
% Selem(2,2) = element_length*((-1)^(abs(2-2))*D*slope^2 + (1+1)*lambda/6);

for m = 1:2
    for n = 1:2
        if m == n
            Selem(m,n) = element_length*((-1)^(abs(m-n))*D*slope^2 + (2)*lambda/6);
        else
            Selem(m,n) = element_length*((-1)^(abs(m-n))*D*slope^2 + (1)*lambda/6);
        end
    end
    
end

end

