% Drzewo decyzyjne 
X=[0.2 0.8; 0.4 0.8; 0.6 0.8; 0.8 0.8; 0.2 0.6; 0.4 0.6; 0.6 0.6; 0.8 0.6; 0.2 0.4; 0.6 0.4; 0.4 0.2; 0.8 0.2]; 
d= ['kl1'; 'kl2'; 'kl1'; 'kl1'; 'kl1'; 'kl1'; 'kl1'; 'kl2'; 'kl2'; 'kl2'; 'kl1'; 'kl2']; 
C=[0 10; 10 0];  
T=fitctree(X, d, 'splitcriterion', 'gdi','cost', C, 'Minparent',1); 
view(T,'Mode','graph') 
y=predict(T,[0.9 0.4]) 

 
X=[ 1.5*randn(1,4)+[1 2 3 4]; 4.5*randn(1,4)+[1 2 3 4]; 
    2.5*randn(1,4)+[1 2 3 4]; 0.5*randn(1,4)+[1 2 3 4]; 
    6.5*randn(1,4)+[1 2 3 4]; 4.5*randn(1,4)+[1 2 3 4];  
    1.5*randn(1,4)+[-1 -2 -3 -4]; 2.5*randn(1,4)+[-1 -2 -3 -4]; 
    0.5*randn(1,4)+[-1 -2 -3 -4]; 5.5*randn(1,4)+[-1 -2 -3 -4]; 
    2.5*randn(1,4)+[-1 -2 -3 -4]; 2.5*randn(1,4)+[-1 -2 -3 -4]; 
    5.5*randn(1,4)+[0 0 0 0 ]; 3.5*randn(1,4)+[0 0 0 0]; 
    3.5*randn(1,4)+[0 0 0 0]; 2.5*randn(1,4)+[0 0 0 0]; 
    1.5*randn(1,4)+[0 0 0 0]; 2.5*randn(1,4)+[0 0 0 0] ]; 
d=[ 'kl1'; 'kl1'; 'kl1'; 'kl1'; 'kl1'; 'kl1';  'kl2'; 'kl2'; 'kl2'; 'kl2'; 'kl2'; 'kl2';  'kl3'; 'kl3'; 'kl3'; 'kl3'; 'kl3'; 'kl3']; 
T=fitctree(X, d, 'splitcriterion', 'gdi', 'Minparent',1); view(T, 'Mode', 'graph')
X_test =[-1 -2.3 -2.8 -4.6] 