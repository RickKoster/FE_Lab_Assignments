hold on
figure(2);
ax.BoxStyle = 'full';
hold off
trisurf(elmat,x,y,u)
xlabel('x'); ylabel('y'); zlabel('Pressure [Pa]');
title(['\bf\fontsize{16}3D Surface plot  \fontsize{10} K = ' num2str(K,'%10.2e\n') ' [m/s]  \it Minimal pressure = ' num2str(min(u), '%10.2e\n') ' [Pa]']);

lgd = legend();
% title(lgd,['3D Surface plot, K = ' num2str(K) '\it Minimal pressure = ' num2str(Pressure_minimum)]);

% title( {'Title';'subtitle'} )

figure(3); 
trisurf(elmat,x,y,u);
xlabel('x'); ylabel('y');
title(['\bf\fontsize{16}Contour plot, \fontsize{10} K = ',num2str(K,'%10.2e\n')]);
view(2); shading interp; colormap jet; colorbar; set(gcf,'renderer','zbuffer')
h = colorbar; ylabel(h, 'Pressure [Pa]');


figure(4); quiver(x,y,vx',vy'); axis([-1 1 -1 1]);
xlabel('x'); ylabel('y');
title(['\bf\fontsize{16}Velocity field, \fontsize{10} K = ' num2str(K,'%10.2e\n') ' [m/s]']);


