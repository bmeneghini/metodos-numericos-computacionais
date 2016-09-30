function simpson1_3Composto
    fprintf('\n\nMÉTODO SIMPSON 1/3 COMPOSTO\n');
    f=input('Digite a função f(x). Ex: @(x) 1/(x*log(x))\n');
    a=input('Digite o limite inferior: ');
    b=input('Digite o limite superior: ');
    n=input('Digite a quantidade de intervalos: ' );                  
    h=(b-a)/n;                      %tamanho do intervalo
    soma1=0;
    soma2=0;
    xi=a+h;                         %valor inicial para x
     for i=1:n-1                    %Somando as partes de acordo com 1/3 de Simpson.
        if rem(i,2)~=0              %Se o resto de i por 2 for diferente de zero.
            soma1=soma1+f(xi);
            xi=xi+h;
        else
            soma2=soma2+f(xi);
            xi=xi+h;
        end                  
    end
    I=(h/3)*(f(a)+4*soma1+2*soma2+f(b));                  %Valor da Integral
    fprintf('O valor da Integral numérica é: %f \n\n',I); % imprime resultado
end