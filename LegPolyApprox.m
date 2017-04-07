function L = LegPolyApprox(X,n)

    mat = zeros(n+1,length(X));
    
    for i = 2:n+1
       mat(i,:) = repmat(i-1,1,1); 
    end
    
    for i = 1:n+1
        j = i-1;
        fun = @(x) f(x).*LegPoly(j,x);
        mat(i,:) = (j+0.5).*integral(fun,X(1),X(end)).*LegPoly(j,X);
    end
    
    L = sum(mat);
end