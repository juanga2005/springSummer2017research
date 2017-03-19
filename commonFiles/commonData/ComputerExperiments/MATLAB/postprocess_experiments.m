% post processing 
clear all
clc


%load global data
load('../data/globaldata.mat');

% total deposition around cite
meshsize = 50;
griddim = 160; %metres

s(1,1) = 748.0;   %  x- pos of source 1 (meters)
s(1,2)= 224.40;   %  y- pos of source 1 (meters)
s(2,1) =625.60;   %   x- pos of source 2
s(2,2) = 176.80;  %    y- pos of source 2
s(3,1) =  255.0;  %   x- pos of source 3
s(3,2) = 646.0;   %  y- pos of source 3
s(4,1)= 251.60;   %   x- pos of source 4
s(4,2) = 867.0;   %   y- pos of source 4

% take centroid 
cp = mean(s);

x = linspace(-4000 + griddim/2, 4000-griddim/2, meshsize);

[X,Y] = meshgrid(x,x);

ff = @(x,y,cp) (((x-cp(1)).^2 + (y-cp(2)).^2) < (2000^2));

ffz = ff(X,Y,cp);

for i =1:length(gdata)

    totaldep(i) = sum(sum( ffz.*gdata{i})).*griddim.*griddim;

end

save('../data/totaldep.mat', 'totaldep');
dlmwrite('../data/totaldep.dat', totaldep');

ffcom = @(x,y,cp) (((x-cp(1)).^2 + (y-cp(2)).^2) > (1000^2)).* ...
        (((x-cp(1)).^2 + (y-cp(2)).^2) < (3000^2));
        
ffcomz = ffcom(X,Y,cp);

for i =1:length(gdata)

    maxdep(i) = max(max( ffcomz.*gdata{i}));

end

save('../data/maxdep.mat', 'maxdep');
dlmwrite('../data/maxdep.dat', maxdep');

