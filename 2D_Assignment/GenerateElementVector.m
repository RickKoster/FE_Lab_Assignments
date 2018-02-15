
% Module for element mass matrix for reactive term
%
% Output: felem  ====== vector of two components
%
% felem(1), felem(2) to be computed in this routine.

clear xc
clear yc
clear felem

for index1=1:topology
	xc(index1) = x(elmat(i,index1));
	yc(index1) = y(elmat(i,index1));
end;

Delta = det([1 xc(1) yc(1);1 xc(2) yc(2);1 xc(3) yc(3)]);

B_mat = [1 xc(1) yc(1);1 xc(2) yc(2);1 xc(3) yc(3)] \  eye(3);

alpha = B_mat(1,1:3);
beta  = B_mat(2,1:3);
gamma = B_mat(3,1:3);

felem = zeros(1,topology);

% for N = 1:N_wells
%     Delta_23 = det([1 xp(N) yp(N);1 xc(2) yc(2);1 xc(3) yc(3)]);
%     Delta_13 = det([1 xc(1) yc(1);1 xp(N) yp(N);1 xc(3) yc(3)]);
%     Delta_12 = det([1 xc(1) yc(1);1 xc(2) yc(2);1 xp(N) yp(N)]);
%     
%     if Delta + epsilon1*Delta >= abs(Delta_23) + abs(Delta_13) + abs(Delta_12) || Delta - epsilon1*Delta >= abs(Delta_23) + abs(Delta_13) + abs(Delta_12) ;
%         N_Test = N_Test + 1;
%         for index1 = 1:topology
%             felem(index1) = felem(index1) + -Qp*(1-abs(beta(index1))*abs(xc(index1)-xp(index1))-abs(gamma(index1))*abs(yc(index1)-yp(index1))) ;
%             
%         end
%         
%     i
% % Components of f are zero except for those elements with a well! So no
% % other contributions!
% %     else        
% %         for index1 = 1:topology
% %         global_index = elmat(N,index1);
% %         
% %         
% %         end
%     end
% end
if ~exist('u','var')
    for N = 1:N_wells
        for index3 = 1:topology
            phi_p(index3) = alpha(index3) + beta(index3)*xp(N) + gamma(index3)*yp(N);
        end

        if (phi_p(1) <= 1) && (phi_p(1) >= 0) && (phi_p(2) <= 1) && (phi_p(2) >= 0) && (phi_p(3) <= 1) && (phi_p(3) >= 0);
            for index1 = 1:topology
                phi_p
                felem(index1) = felem(index1) + -Qp*phi_p(index1); %*(1-abs(beta(index1))*abs(xc(index1)-xp(index1))-abs(gamma(index1))*abs(yc(index1)-yp(index1))) ;
                felem
            end
            i

        N_Test = N_Test + 1;
    % Components of f are zero except for those elements with a well! So no
    % other contributions!
    %     else        
    %         for index1 = 1:topology
    %         global_index = elmat(N,index1);
    %         
    %         
    %         end
        end
    end
else
    switch direction
        case 1 % x direction
            for index1 = 1:topology
                        felem(index1) = felem(index1) + (abs(Delta)/6)*beta(index1)*(u(elmat(i,ind1)));
            end
        case 2 % y direction
            for index1 = 1:topology
                        felem(index1) = felem(index1) + (abs(Delta)/6)*gamma(index1)*(u(elmat(i,ind1)));
            end
    end
end

