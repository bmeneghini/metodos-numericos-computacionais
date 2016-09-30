function simpson3_8Composto
    fprintf('\n\nMÉTODO SIMPSON 3/8 COMPOSTO\n');
    f=input('Digite a função f(x). Ex: @(x) 1/(x*log(x))\n');
    a=input('Digite o limite inferior: ');
    b=input('Digite o limite superior: ');
    n=input('Digite a quantidade de intervalos: ' );
    h=(b-a)/n;                         %tamanho do intervalo
    soma1=0;
    soma2=0;
    xi=a+h;                            %valor inicial para x    
    for i=1:n-1                        %Soma as parte de acordo com 3/8 de Simpson.
        if rem(i,3)~=0                 %Se o resto da divisão por 3 for diferente de zero
            soma1=soma1+f(xi);
            xi=xi+h;
        else
            soma2=soma2+f(xi);
            xi=xi+h;
        end
    end
    I=(3/8)*h*(f(a)+3*soma1+2*soma2+f(b));                %Valor da Integral
    fprintf('O valor da Integral numérica é: %f \n\n',I); % imprime resultado
end