%Script to plot the surface

A=textread('f.d0001s2013','%f');

M=reshape(A,[30,30]);

a=linspace(-200,1200,30);

[x,y]=meshgrid(a);

contourf(x,y,M');

colorbar;

title('Deposition contour for the configuration (0,1,0,0)')
xlabel('x');ylabel('y')
