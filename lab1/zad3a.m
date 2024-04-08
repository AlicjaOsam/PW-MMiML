 % Klasyfikator Bayesa 
% Generacja danych ucz�cych 2 klas 
x1=randn(20,2);                             % Klasa 1 
x2=repmat([1.5 2.1],20,1)+randn(20,2);      % Klasa 2 
xucz=[x1;x2]; 
figure, plot(x1(:,1),x1(:,2),'o',x2(:,1),x2(:,2),'rx'), grid, title('Dane ucz�ce') 
klasa=[repmat('klasa1',20,1); 
repmat('klasa2',20,1)]; 
% Budowa modelu klasyfikatora Bayes'a 
model = fitcnb(xucz,klasa);  
% Tryb odtwarzania danych ucz�cych 
Klas_ucz = model.predict(xucz); 
% Macierz niezgodno�ci 
CMatrix_ucz = confusionmat(klasa,Klas_ucz); 

% Generacja danych testuj�cych 2 klas 
x1=randn(20,2); 
x2=repmat([1.4 2.2],20,1)+randn(20,2); 
xtest=[x1;x2]; 
klasa=[repmat('klasa1',20,1); 
repmat('klasa2',20,1)]; 
figure, plot(x1(:,1),x1(:,2),'o',x2(:,1),x2(:,2),'rx'), grid, title('Dane testuj�ce') 
% Testowanie na danych testuj�cych 
Klas_test = model.predict(xtest); 
CMatrix_test = confusionmat(klasa,Klas_test);