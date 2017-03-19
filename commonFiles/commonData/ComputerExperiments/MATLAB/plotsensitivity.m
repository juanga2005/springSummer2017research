%% plot sensitivity results (manually!)

% total dep
% x=[ 1.792399e-01 0.893872950
%  6.239799e-03 0.269200836
%  3.022516e-06 0.008244790
%  1.246857e-05 0.008502148
%  1.352472e-03 0.031620734 ]

% totaldep scaled 
% 
% x=[ 8.711706e-01 0.892520509
%  3.200774e-02 0.039183637
%  3.639086e-05 0.002725031
%  6.941542e-02 0.090943965
%  8.882257e-05 0.005486851 ]


% max dep scaled
x=[ 0.3852538117  0.41112156
 0.1532189005  0.18889346
 0.0001580593  0.02275912
 0.3948362745  0.45599983
 0.0001465126  0.04309493];

x = x;

figure(1);
bar(x)

h = get(gca);

xticks = {'\gamma', 'z_0', 'z_i', 'L', 'z_{cutoff}'};
yticks = {'0', '20', '40', '60' , '80', '100'};

%% Generate figure and remove ticklabels
%close all;
set(gca, 'xticklabel', []) %Remove tick labels
%% Get tick mark positions
yTicks = get(gca,'ytick');
xTicks = get(gca, 'xtick');
ax = axis; %Get left most x-position
HorizontalOffset = 0.1;

%% Reset the xtick labels in desired font 
minY = min(yTicks);
verticalOffset = 0.05;
% for xx = 1:length(xTicks)
% %Create text box and set appropriate properties
%      text(xTicks(xx), minY - verticalOffset, ['$', xticks{xx},'$'],...
%          'HorizontalAlignment','Right','interpreter', 'latex');   
% end

text(xTicks(1)+.1, minY - verticalOffset, ['$', xticks{1},'$'],...
         'HorizontalAlignment','Right','interpreter', 'latex');   
     text(xTicks(2)+.1, minY - verticalOffset, ['$', xticks{2},'$'],...
         'HorizontalAlignment','Right','interpreter', 'latex');   
     text(xTicks(3)+.1, minY - verticalOffset, ['$', xticks{3},'$'],...
         'HorizontalAlignment','Right','interpreter', 'latex');   
     text(xTicks(4)+.1, minY - verticalOffset, ['$', xticks{4},'$'],...
         'HorizontalAlignment','Right','interpreter', 'latex');   
     text(xTicks(5)+0.5, minY - verticalOffset, ['$', xticks{5},'$'],...
         'HorizontalAlignment','Right','interpreter', 'latex');   

legend('Main effect', 'Interactions')
ylabel('Effect on output variance')
axis([0 6 0 1])
