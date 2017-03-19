% import all data into a single 3D matrix 

numfiles = 128;
meshsize = 50;
fname = '../data/f.d0002.t';

%fname = '/Users/bamdadhosseini/Work/Research/atmosopenmp/solution/f.d0002.t';


gdata = cell(1,numfiles);

for i = 1:numfiles
   
    ss = strcat('0000000',num2str(i));
    ss = ss(end-2: end);
    
    thisfname = strcat(fname,ss);
    thisdata = importdata(thisfname);
    
    % remove NAN data
    thisdata = thisdata(find(~isnan(thisdata)));
    
    % reshape 
    thisdata =reshape(thisdata, meshsize, meshsize);
    
    % put it in global data matrix 
    gdata{i} = thisdata;
    %pause
    
end

