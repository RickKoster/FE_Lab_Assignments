clear xc
clear yc
clear bfelem

for index1 = 1:topologybnd
	xc(index1) = x(elmatbnd(i,index1));
	yc(index1) = y(elmatbnd(i,index1));
end;

lek = sqrt((xc(2)-xc(1))^2+(yc(2)-yc(1))^2);

if ~exist('u','var')
    for index1 = 1:topologybnd
            bfelem(index1) = K*pH*lek/2*u_inf;   %what is u_inf?
    end;
else
    for index1 = 1:topologybnd
            bfelem(index1) = -((k*pH)/mu)*lek/2*u_inf;   %what is u_inf?
    end;
end

