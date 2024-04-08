x1=1+randn(20,5); 
x2=-2+randn(20,5); 
x3=3+randn(20,5); 
x=[x1;x2;x3]; 
d=[ones(20,1);2*ones(20,1);3*ones(20,1)]; 
b = TreeBagger(100,x,d,'oobPred','on','NVarToSample',3, 'oobvarimp', 'on' ) 
figure, plot(oobError(b)) 
xlabel('Liczba drzew') 
ylabel('B��d klasyfikacji na danych weryfikuj�cych') 
grid 
% Wa�no�� poszczeg�lnych zmiennych 
qq=b.OOBPermutedVarDeltaError; bar(qq), grid 