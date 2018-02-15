clear xc
clear yc
clear BMelem

for index1=1:topologybnd
	xc(index1) = x(elmatbnd(i,index1));
	yc(index1) = y(elmatbnd(i,index1));
end;

lek = sqrt((xc(2)-xc(1))^2 + (yc(2)-yc(1))^2);

for index1=1:topologybnd
        if ~exist('u', 'var')
            BMelem(index1,index1) = K*lek/2;  % NC used! not HB!!
        else
            
            BMelem(index1,index1) = -(k/(mu*K))*lek/6;
        end
end;
