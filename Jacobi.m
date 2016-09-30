function [x, Iter, CondErro] = Jacobi(n, A, b, Tol, IterMax)
    x = zeros(n,1);
    v = zeros(n,1);
    for i=1:n
        r = 1/A(i,i);
        for j=1:n
            if i~=j
                A(i,j) = A(i,j)*r;
            end
        end
        b(i) = b(i)*r;
        x(i) = b(i);
    end
    Iter = 0;
    NormaRel = 1;
    while(NormaRel>=Tol && Iter<= IterMax)
        Iter = Iter + 1;
        for i=1:n
            Soma = 0;
            for j=1:n
                if i~=j
                    Soma = Soma + A(i,j)*x(j);
                end
            end
            v(i)= b(i) - Soma;
        end
        NormaNum = 0;
        NormaDen = 0;
        for i=1:n
            t = abs(v(i)-x(i));
            if t>NormaNum
                NormaNum = t;
            end
            if abs(v(i))>NormaDen
                NormaDen = abs(v(i));
            end
            x(i) = v(i);
        end
        NormaRel = NormaNum/NormaDen;
    end
    if  NormaRel <= Tol
        CondErro = 0;
    else CondErro = 1;
    end

% END Jacobi.m