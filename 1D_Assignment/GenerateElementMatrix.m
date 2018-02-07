function [ Selem ] = GenerateElementMatrix( k, elmat, D, lambda, mesh)
%GenerateElementMatrix Creates element matrix S_ek
%   Detailed explanation goes here

Selem = zeros(2,2);

i = elmat(k,1);
j = elmat(k,2);

x1 = mesh(i);
x2 = mesh(j);

element_length = abs(x1-x2);

slope = 1/element_length; 

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

