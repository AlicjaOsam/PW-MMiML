% Zastosowanie regress i robustfit 
% Dane bez outliers   
x = (1:20)';  
y = 5 - 3*x + 2.5*randn(20,1);     
bls = regress(y,[ones(20,1) x]);    
brob = robustfit(x,y);    
figure    
hold on    
plot(x,brob(1)+brob(2)*x,'r-', x,bls(1)+bls(2)*x,'b:')    
legend('robustfit', 'regress')    
plot(x,y, 'o'), grid   

% %Dane zawierajce outlier 
x = (1:20)';  
y = 5 - 3*x + 5*randn(20,1);  
y(3)= -2000;y(10) = 1000; 
bls = regress(y,[ones(20,1) x]); 
brob = robustfit(x,y); 
figure 
hold on 
plot(x,brob(1)+brob(2)*x,'r-', x,bls(1)+bls(2)*x,'b:') 
legend('robustfit', 'regress') 
plot(x,y, 'o'), grid 