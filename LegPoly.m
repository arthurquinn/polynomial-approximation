function y = LegPoly(n, x)

    pn = ones(n+1,length(x));
    pn(2,:) = x;
    
    for i = 2:n
       nn = i-1;
       pn(i+1,:) = ((2*nn+1)/(nn+1)).*x.*pn(i,:) - (nn/(nn+1)).*pn(i-1,:);
    end
    
    y = pn(n+1,:);
end