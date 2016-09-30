function [xs] = bissecao(f,a,b,tolerancia)

% A funcionalidade desse algoritmo � exatamente igual aos procedimentos
% realizados em sala de aula, mas os comandos foram traduzidos para a forma
% de algoritmos.

% Par�metros:
% f = fun��o Ex: inline('2*x*2+x-5')
% a = limite inferior Ex: 0
% b = limite superior Ex: 3
% tolerancia = tolerancia m�xima desejada Ex: 10^-4

% Sa�da:
% Ra�z das fun��es + intera��o correspondente + erro
% Tempo gasto para realizar a opera��o

%Formatando as entradas
xA=a; %Limite inferior
f1=feval(f,xA); %feval valida a fun��o
xB=b; %Limite superior
f2=feval(f,xB); %feval valida a fun��o

if f1*f2>=0 %Realizando uma verifica��o
    error('N�o h� ra�zes no intervalo dado.');
end

tic; %Fun��o para auxiliar na medi��o do tempo gasto
%Executando o algoritmo da Bisse��o
for n=1:1/eps
    if f1*f2<0 %Aqui ele define se ir� substituir em A ou B o novo termo
        x3=0.5*(xA+xB); fx(n)=feval(f,x3);
        if f1*fx(n)<0 %Neste caso, substituir em B
            xB=x3; x3=0.5*(xA+xB); fx(n)=feval(f,x3); end
        if f2*fx(n)<0 %Neste caso, substituir em A
            xA=x3; x3=0.5*(xA+xB); end
    end
    xt(n)=x3; erro(n)=abs((xB-xA)/xB); %Calculando a torel�ncia
    if (erro(n) < tolerancia), break;  end %Quando a tolerancia � alcan�ada, parar a itera��o.
end

t=toc; %Atribuindo a variavel t o tempo gasto
%Imprimindo as itera��oes em forma de tabela
fprintf('Itera��o\t|\t\tx\t\t\t|\t\tf(x)\t\t|\t\terro\n');
fprintf('--------------------------------------------------------------------------\n');
for i=2:length(xt) %Imprimir todos os elementos do vetor
    fprintf('%5d\t\t|\t%10.5f\t\t|\t%10.5f\t\t|\t%10.5f\n',i-1,xt(i),fx(i),erro(i));
end
fprintf('--------------------------------------------------------------------------\n');
format long; xs=xt(length(xt));
fprintf('\nSolu��o: \n\tx = %-10.10f\n',xt(length(xt))); %Retorna o valor da raiz
fprintf('Tempo gasto (ms): \n\tt = %-10.10f\n',t*10^3); %Retorna o tempo gasto para realizar a itera��o
end