%% plot exp against parameters

clear all
clc
close all

load expeimentresults.mat
load design.mat

Designlabels={'\gamma', 'z_0', 'z_i', 'L', 'z_{cutoff}'};

for i=1:5
    figure('position', [503   305   361   280])
    
    plot(Design(:,i), totaldep./1000, 'o') 
    %plot(Design(:,i), maxdep*1000, 'o') 
    ylabel('total deposition (tons)')
    %ylabel('maximum deposition (g/m^2)')
    xlabel(Designlabels{i})
    
end
