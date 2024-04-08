load cigar.mat 
nn=randperm(2200); 
xperm=x(nn,:); 
dperm=d(nn); 
Xucz=xperm(1:1000,:); 
Xtest=xperm(1001:2200,:); 
Tucz=dperm(1:1000); 
Ttest=dperm(1001:2200); 
knn = fitcknn(Xucz,Tucz,'NumNeighbors',9); 
y=predict(knn,Xtest); 
A = confusionmat(Ttest,predict(knn,Xtest));
B = diag(A);
a = sum(A);
c = sum(a);
b = sum(B);
accuracy = b/c;