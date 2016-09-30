function [polinomio, coeficiente] = fitLinear(xdata,ydata,n)

%A lógica do alritmo funciona da seguinte forma:
%É criado uma matriz n x n, onde n é número de elemtos
%Depois, é adicionado elemento por elemento à primeira coluna (n vezes)
%Em seguida, essa coluna é duplicada e seu primeiro elemento é removido
%Mantendo sempre o padrão estabelicido pelo PDF visto em sala de aula.
%Repetimos esses passos para n - 1 vezes até obtermos a matriz
%correspondente e calcularmos os valores das n - 1 variáveis. 

% Parâmetros: 
% xdata = vetor composto por valores em x
% ydata = vetor composto por valores em y
% n = grau do polinômio a ser gerado

% Saída:
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
 
    %Laço que irá adicionar elemento por elemento à coluna
    for i = 1:1:n %Iterar até n
        ColX = [ColX; sum(aux)]; %ColX irá receber o novo elemento 
        aux = aux.*xC;
    end 
    %Adicionando a coluna à matrizX
    MatrizX = ColX;  
    %Duplica a coluna, retira o elemento e adiciona novamente à Matrix
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
    
    %Calculo da solução final:
    polinomio = inv(MatrizX)*MatrizY;
    
    %Calculo do desvio
    Res = polyval(polinomio,xC);
    desvio = sum((yC - Res).^2); 
    
    %Calculo do Coeficiente de Determinação
    %Somatório dos elementos em 2 ao quadradro
    ySquare = sum(yC.^2); Ys = sum(yC);
    
    denominador = ySquare - ( ( Ys^2)/sum(ones(size(xdata)))); %Calculo do denominador da equação
    coeficiente = 1 - desvio/denominador; %Calculo do coeficiente de determinação
end

