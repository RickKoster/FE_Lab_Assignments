hold on
figure(2);
ax.BoxStyle = 'full';
hold off
trisurf(elmat,x,y,u)
figure(3);
trisurf(elmat,x,y,u);


view(2); shading interp; colormap jet; colorbar; set(gcf,'renderer','zbuffer')


figure(4); quiver(x,y,vx',vy'); axis([-1 1 -1 1]);