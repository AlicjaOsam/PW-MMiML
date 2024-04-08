clear all 
X=0:0.05:10; 
X=X'; 
d=sin(X); 
T=fitrtree (X, d, 'minparentsize',10) 
view(T,'mode','graph')     
Xtest=0:0.126:10; 
Xtest=Xtest'; 
dtest=sin(Xtest); 
y=predict(T,Xtest) 
subplot(2,1,1),plot(Xtest,dtest,'r',Xtest,y,'b'), grid, xlabel('x'), ylabel('f(x)') 
subplot(2,1,2), plot(Xtest,y-dtest), grid, xlabel('x'), ylabel('y-dtest') 
error=norm(y-dtest) 
error_wzgl=error/norm(dtest) 

treedepth(T) 

sum(double(not(T.IsBranch))) 