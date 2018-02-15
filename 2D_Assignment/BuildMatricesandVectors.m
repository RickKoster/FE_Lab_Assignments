
%
% This routine constructs the large matrices and vector.
%
% The element matrices and vectors are also dealt with.
%
%
% First the internal element contributions
%
% First Initialisation of large discretisation matrix, right-hand side vector



%
% Treatment of the internal (triangular) elements
%

if ~exist('u', 'var')  
    
    S 		= sparse(n,n); % stiffness matrix

    f 		= zeros(n,1); % right-hand side vector
    
    for i = 1:length(elmat(:,1)) % for all internal elements
        GenerateElementMatrix; % Selem	
        for ind1 = 1:topology
            for ind2 = 1:topology
                S(elmat(i,ind1),elmat(i,ind2))	= S(elmat(i,ind1),elmat(i,ind2)) + Selem(ind1,ind2);
            end;
        end;
        GenerateElementVector; % felem
        for ind1 = 1:topology
            f(elmat(i,ind1)) = f(elmat(i,ind1)) + felem(ind1);
        end;
    end;

% Next the boundary contributions

    for i = 1:length(elmatbnd(:,1)); % for all boundary elements extension of mass matrix M and element vector f
        GenerateBoundaryElementMatrix; % BMelem
        for ind1 = 1:topologybnd
            for ind2 = 1:topologybnd
                S(elmatbnd(i,ind1),elmatbnd(i,ind2)) = S(elmatbnd(i,ind1),elmatbnd(i,ind2)) + BMelem(ind1,ind2);
            end;
        end;
        GenerateBoundaryElementVector; % bfelem   
        for ind1 = 1:topologybnd
            f(elmatbnd(i,ind1)) = f(elmatbnd(i,ind1)) + bfelem(ind1);
        end;
    end;
    
else
    
    
    
    Sx 		= sparse(n,n); % stiffness matrix

    fx 		= zeros(n,1); % right-hand side vector
    
    left_nodes = find(p(1,:) == -1); 
    top_nodes = find(p(2,:) == 1);
    right_nodes = find(p(1,:) == 1);
    bottom_nodes = find(p(2,:) == -1);
    
    bnd1_nodes = ismember(elmatbnd,left_nodes);
    bnd1 = find(bnd1_nodes(:,1) == 1 & bnd1_nodes(:,2) == 1);
    
    bnd2_nodes = ismember(elmatbnd,top_nodes);
    bnd2 = find(bnd2_nodes(:,1) == 1 & bnd2_nodes(:,2) == 1);
    
    bnd3_nodes = ismember(elmatbnd,right_nodes);
    bnd3 = find(bnd3_nodes(:,1) == 1 & bnd3_nodes(:,2) == 1);
    
    bnd4_nodes = ismember(elmatbnd,bottom_nodes);
    bnd4 = find(bnd4_nodes(:,1) == 1 & bnd4_nodes(:,2) == 1);
    
    
    direction = 1;
    
    for i = 1:length(elmat(:,1)) % for all internal elements
        GenerateElementMatrix; % Selem	
        for ind1 = 1:topology
            for ind2 = 1:topology
                if elmat(i,ind1) == elmat(i,ind2)
                    Sx(elmat(i,ind1),elmat(i,ind2))	= Sx(elmat(i,ind1),elmat(i,ind2)) + 2*Selem(ind1,ind2);
                else
                    Sx(elmat(i,ind1),elmat(i,ind2))	= Sx(elmat(i,ind1),elmat(i,ind2)) + Selem(ind1,ind2);
                end
            end;
        end;
        GenerateElementVector; % felem
        for ind1 = 1:topology
            fx(elmat(i,ind1)) = fx(elmat(i,ind1)) + felem(ind1);
        end;
    end;

% Next the boundary contributions

    

    for j = 1:length(bnd1); % left boundary
        i = bnd1(j);
        GenerateBoundaryElementMatrix; % BMelem
        for ind1 = 1:topologybnd
            for ind2 = 1:topologybnd
                if elmatbnd(i,ind1) == elmatbnd(i,ind2)
                    Sx(elmatbnd(i,ind1),elmatbnd(i,ind2)) = Sx(elmatbnd(i,ind1),elmatbnd(i,ind2)) + 2*BMelem(ind1,ind2);
                else
                    Sx(elmatbnd(i,ind1),elmatbnd(i,ind2)) = Sx(elmatbnd(i,ind1),elmatbnd(i,ind2)) + BMelem(ind1,ind2);
                end;
            end
        end;
        GenerateBoundaryElementVector; % bfelem   
        for ind1 = 1:topologybnd
            fx(elmatbnd(i,ind1)) = fx(elmatbnd(i,ind1)) + bfelem(ind1);
        end;
    end;
    
    for j = 1:length(bnd3); % right boundary
        i = bnd3(j);
        GenerateBoundaryElementMatrix; % BMelem
        for ind1 = 1:topologybnd
            for ind2 = 1:topologybnd
                if elmatbnd(i,ind1) == elmatbnd(i,ind2)
                    Sx(elmatbnd(i,ind1),elmatbnd(i,ind2)) = Sx(elmatbnd(i,ind1),elmatbnd(i,ind2)) + 2*BMelem(ind1,ind2);
                else
                    Sx(elmatbnd(i,ind1),elmatbnd(i,ind2)) = Sx(elmatbnd(i,ind1),elmatbnd(i,ind2)) + BMelem(ind1,ind2);
                end;
            end
        end;
        GenerateBoundaryElementVector; % bfelem   
        for ind1 = 1:topologybnd
            fx(elmatbnd(i,ind1)) = fx(elmatbnd(i,ind1)) - bfelem(ind1);
        end;
    end;
    
    direction = 2;
    
    Sy 		= sparse(n,n); % stiffness matrix

    fy 		= zeros(n,1); % right-hand side vector

    for i = 1:length(elmat(:,1)) % for all internal elements
        GenerateElementMatrix; % Selem	
        for ind1 = 1:topology
            for ind2 = 1:topology
                if elmat(i,ind1) == elmat(i,ind2)
                    Sy(elmat(i,ind1),elmat(i,ind2))	= Sy(elmat(i,ind1),elmat(i,ind2)) + 2*Selem(ind1,ind2);
                else
                    Sy(elmat(i,ind1),elmat(i,ind2))	= Sy(elmat(i,ind1),elmat(i,ind2)) + Selem(ind1,ind2);
                end
            end;
        end;
        GenerateElementVector; % felem
        for ind1 = 1:topology
            fy(elmat(i,ind1)) = fy(elmat(i,ind1)) + felem(ind1);
        end;
    end;

% Next the boundary contributions

    

    for j = 1:length(bnd2); % left boundary
        i = bnd2(j);
        GenerateBoundaryElementMatrix; % BMelem
        for ind1 = 1:topologybnd
            for ind2 = 1:topologybnd
                if elmatbnd(i,ind1) == elmatbnd(i,ind2)
                    Sy(elmatbnd(i,ind1),elmatbnd(i,ind2)) = Sy(elmatbnd(i,ind1),elmatbnd(i,ind2)) + 2*BMelem(ind1,ind2);
                else
                    Sy(elmatbnd(i,ind1),elmatbnd(i,ind2)) = Sy(elmatbnd(i,ind1),elmatbnd(i,ind2)) + BMelem(ind1,ind2);
                end;
            end
        end;
        GenerateBoundaryElementVector; % bfelem   
        for ind1 = 1:topologybnd
            fy(elmatbnd(i,ind1)) = fy(elmatbnd(i,ind1)) - bfelem(ind1);
        end;
    end;
    
    for j = 1:length(bnd4); % right boundary
        i = bnd4(j);
        GenerateBoundaryElementMatrix; % BMelem
        for ind1 = 1:topologybnd
            for ind2 = 1:topologybnd
                if elmatbnd(i,ind1) == elmatbnd(i,ind2)
                    Sy(elmatbnd(i,ind1),elmatbnd(i,ind2)) = Sy(elmatbnd(i,ind1),elmatbnd(i,ind2)) + 2*BMelem(ind1,ind2);
                else
                    Sy(elmatbnd(i,ind1),elmatbnd(i,ind2)) = Sy(elmatbnd(i,ind1),elmatbnd(i,ind2)) + BMelem(ind1,ind2);
                end;
            end
        end;
        GenerateBoundaryElementVector; % bfelem   
        for ind1 = 1:topologybnd
            fy(elmatbnd(i,ind1)) = fy(elmatbnd(i,ind1)) + bfelem(ind1);
        end;
    end;
end


