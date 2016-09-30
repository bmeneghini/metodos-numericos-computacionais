function [polinomio, coeficiente] = fitLinear(xdata,ydata,n)

%A l�gica do alritmo funciona da seguinte forma:
%� criado uma matriz n x n, onde n � n�mero de elemtos
%Depois, � adicionado elemento por elemento � primeira coluna (n vezes)
%Em seguida, essa coluna � duplicada e seu primeiro elemento � removido
%Mantendo sempre o padr�o estabelicido pelo PDF visto em sala de aula.
%Repetimos esses passos para n - 1 vezes at� obtermos a matriz
%correspondente e calcularmos os valores das n - 1 vari�veis. 

% Par�metros: 
% xdata = vetor composto por valores em x
% ydata = vetor composto por valores em y
% n = grau do polin�mio a ser gerado

% Sa�da:
% Termo Independente
% .
% .
% .
% n-2
% n-1
% n

    %Transformando o vetor em matrix 1:. (Matiz Coluna)
    xC = xdata(:);
    yC = ydata(:);    
    
    aux = xC; 
    ColX = sum(ones(size(xdata)));
 
    %La�o que ir� adicionar elemento por elemento � coluna
    for i = 1:1:n %Iterar at� n
        ColX = [ColX; sum(aux)]; %ColX ir� receber o novo elemento 
        aux = aux.*xC;
    end 
    %Adicionando a coluna � matrizX
    MatrizX = ColX;  
    %Duplica a coluna, retira o elemento e adiciona novamente � Matrix
    for i = 1:n 
        ColX(1) = []; ColX(n+1) = sum(aux); aux = aux.*xC;
        ColX = ColX(:); MatrizX = [MatrizX ColX];
    end
    %Repetindo os mesmos passos anterioris para a matrizY
    MatrizY = sum(yC);
    auxY = yC.*xC; 
    for i= 1:n
        MatrizY = [MatrizY; sum(auxY)]; auxY = auxY.*xC;
    end
    
    %Calculo da solu��o final:
    polinomio = inv(MatrizX)*MatrizY;
    
    %Calculo do desvio
    Res = polyval(polinomio,xC);
    desvio = sum((yC - Res).^2); 
    
    %Calculo do Coeficiente de Determina��o
    %Somat�rio dos elementos em 2 ao quadradro
    ySquare = sum(yC.^2); Ys = sum(yC);
    
    denominador = ySquare - ( ( Ys^2)/sum(ones(size(xdata)))); %Calculo do denominador da equa��o
    coeficiente = 1 - desvio/denominador; %Calculo do coeficiente de determina��o
end

