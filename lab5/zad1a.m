X1=[ones(1,10)+0.7*randn(1,10); 2*ones(1,10)+0.5*randn(1,10); -2*ones(1,10)+0.9*randn(1,10);
5*ones(1,10)+1.4*randn(1,10); 5*ones(1,10)+1.4*randn(1,10)];
X2=[-2*ones(1,10)+randn(1,10); -2*ones(1,10)+0.7*randn(1,10); 2*ones(1,10)+0.8*randn(1,10);
-5*ones(1,10)+1.5*randn(1,10); -4*ones(1,10)+1.2*randn(1,10)];
X=[X1 X2]';
[V,Y,lambda]=pca(X);
W=V';
plot(Y(1:10,1),Y(1:10,2),'ro', Y(11:20,1),Y(11:20,2),'bx')