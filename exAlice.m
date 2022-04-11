%% this is Alice's script

% fix it up to be better code and to keep additional information around.

clear all, close all

for participant = 1:20

    load(['Alice_p',num2str(participant),'.mat'])  
    
    errors = mean(d(:,3));  

    if(errors>0.1)  
        disp('Lots of errors here')
    else  
        
        for condition = 1:3 
            
            good = d(:,1)==condition;   
            
            mcond(participant,condition) = mean( d(good,2) );   
        end
    end
end

figure(1), clf
plot(mcond','b-o');


