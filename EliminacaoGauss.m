function x = EliminacaoGauss(a,b)
    % a matriz dos coeficientes
    % b vetor coluna
    % x solução do sistema
    ab=[a,b];
    [R,C]=size(ab);
    for j=1:R-1
        if ab(j,j)==0
            for k=j+1:R
                if ab(k,j)~=0
                    abtroca=ab(j,:);
                    ab(j,:)=ab(k,:);
                    ab(k,:)=abtroca;
                    break;
                end
            end
        end
        for i=j+1:R
            ab(i,j:C)=ab(i,j:C)-ab(i,j)/ab(j,j)*ab(j,j:C);
        end
    end
    x=zeros(R,1);
    x(R)=ab(R,C)/ab(R,R);
    for i=R-1:-1:1
        x(i)=(ab(i,C)-ab(i,i+1:R)*x(i+1:R))/ab(i,i);
    end
    x