%% clean up 

for i=1:22:127
    
    
    for j = 1:21
        
        i+j
        
        A = gdata{i+j};
        B = gdata{i+j-1};
        
        gdata{i+j} = A - B;
        
    end
end