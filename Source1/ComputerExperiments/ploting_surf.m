%Script to plot the surface

A=textread('f.d0001s1013','%f');

M=reshape(A,[30,30]);

a=linspace(-200,1200,30);

[x,y]=meshgrid(a);

surf(x,y,M');
view(2)
caxis([0,1])

colorbar;

title('Deposition contour for the configuration (1,0,0,0)')
xlabel('x');ylabel('y')
