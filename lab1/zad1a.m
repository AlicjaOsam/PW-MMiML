% Regresja liniowa 
x=1:20; 
d=[-0.69    -0.79   5.77    7.80    4.56    14.32   15.47   8.88    7.41    17.26   ...  
    14.83   20.47   20.39   27.04   22.53   23.36   29.35   23.86   31.22   28.13]; 
a=polyfit(x,d,1); 
y=a(1)*x+a(2); 
figure(1),subplot(2,1,1), plot(x,d,'ro',x, y,'b--'), grid, title('Polyfit') 
subplot(2,1,2), plot(x,d-y), grid 
blad=norm(y-d); 

%Regresja liniowa danych z dodanymi outliers 
d(4)=30; d(19)=500; 
a=polyfit(x,d,1); 
y=a(1)*x+a(2); 
figure(2),subplot(2,1,1), plot(x,d,'ro',x, y,'b--'), grid, title('Polyfit') 
subplot(2,1,2), plot(x,d-y), grid 
blad=norm(y-d);