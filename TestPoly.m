function TestPoly(n)
    X = -1:0.001:1;
    Y = f(X);
    
    %Calculate x and y for chebyshev polynomial
    theta = zeros(1,n+1);
    for i = 0:n
        theta(i+1) = ((2*i+1)/(2*n+2))*pi;
    end
    x = cos(theta);
    y = f(x);
    
    L = LegPolyApprox(X,n);
    C = Pn(X,x,y);
    
    figure; 
    plot(X,Y,'r--','linewidth',2);hold on; grid on;
    plot(X,C,'k-','linewidth',2);hold on; grid on;
    plot(X,L,'b-','linewidth',2);hold on; grid on;
    set(gca,'fontsize',20);xlabel('x');ylabel('f(x)');
    title(['f(x) = exp(sin(5x)), n = ' num2str(n)]);
    legend('f(x)','c(x)','p(x)');
    
    figure;
    plot(X,abs(Y-C),'k-','linewidth',2);hold on; grid on;
    plot(X,abs(Y-L),'b-','linewidth',2);hold on; grid on;
    set(gca,'fontsize',20);xlabel('x');ylabel('Abs error');
    title(['f(x) = exp(sin(5x)), n = ' num2str(n)]);
    legend('|f(x)-c(x)|','|f(x)-p(x)|');
    
    err = [max(abs(f(X)-C)) max(abs(f(X)-L)) sqrt(mean((f(X)-C).^2)) sqrt(mean((f(X)-L).^2))]
    % keep this line as it is
end