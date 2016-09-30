function [xs] = newton(f,fd,a,tolerancia)

% A funcionalidade desse algoritmo é exatamente igual aos procedimentos
% realizados em sala de aula, mas os comandos foram traduzidos para a forma
% de algoritmo.

% Parâmetros:
% f = função Ex: inline('2*x*2+x-5')
% fd = derivada primeira da função Ex: inline('4*x+1'
% a = limite inferior Ex: 0
% tolerancia = tolerancia máxima desejada Ex: 10^-4

% Saída:
% Raíz das funções + interação correspondente + erro
% Tempo gasto para realizar a operação

%Formatando as entradas
xA=a; %Limite inferior
dx=-feval(f,xA)/feval(fd,xA); %feval valida a função
xA = xA + dx;

tic; %Função para auxiliar na medição do tempo gasto
%Executando o algoritmo de Newtown
for i=1:1/eps
    dx=-feval(f,xA)/feval(fd,xA); x0=xA;
    xA=xA+dx; xt(i)=xA; fxs(i)=feval(f,xt(i));
    erro(i) = abs((xA-x0)/xA) ; %Calculando a tolerância
    if erro(i) < tolerancia, break; %Quando a tolerancia é alcançada, parar a iteração.
    end
end

t=toc; %Atribuindo a variavel t o tempo gasto
%Imprimindo as iteraçãoes em forma de tabela
fprintf('Iteração\t|\t\tx\t\t\t|\t\tf(x)\t\t|\t\terro\n');
fprintf('--------------------------------------------------------------------------\n');
for i=2:length(xt) %Imprimir todos os elementos do vetor
    fprintf('%5d\t\t|\t%10.5f\t\t|\t%10.5f\t\t|\t%10.5f\n',i-1,xt(i),fxs(i),erro(i));
end
fprintf('--------------------------------------------------------------------------\n');
format long; xs=xt(length(xt));
fprintf('\nSolução: \n\tx = %-10.10f\n',xt(length(xt))); %Retorna o valor da raiz
fprintf('Tempo gasto (ms): \n\tt = %-10.10f\n',t*10^3); %Retorna o tempo gasto para realizar a iteração
end