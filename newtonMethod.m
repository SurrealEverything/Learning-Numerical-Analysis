function newtonMethod()
    plotMethod()
end

function plotMethod(y)
    close all;

    f = @(x) sin(x);
    n = 3; 
    a = -pi/2;
    b = pi/2;

    X = linspace(a, b, n+1)';
    Y = f(X);
    
    x = linspace(a, b, 100);
    y = f(x);
    y =  y(:);
    yNewton = newton(X, Y, x);
    yNewton =  yNewton(:);
    
    figure;
    
    plot(x, y);
    
    hold on;
    plot(X, Y, 'v');
    
    plot(x, yNewton); 
    
    
    line(xlim, [0, 0]);
    line([0, 0], ylim);
    
    title('Newton Method');
    xlabel('x');
    ylabel('y');
    
    hold off;
    
    figure;
    
    yLen = length(y);
    idx = [1:yLen];
    E = abs(y-yNewton);
    plot(idx, E);
    
    title('Approximation Error');
    xlabel('X Index');
    ylabel('Error');
    
end

function y = newton(X, Y, x)
    n = length(X);
    A = zeros(n, n);
    A(:, 1) = 1;
    for i = 2:n
        for j = 2:i
            A(i, j) = A(i, j-1) * (X(i) - X(j-1));
        end
    end
    [c] = SubsAsc(A, Y);
    xSize = length(x);
    elem = zeros(xSize, n);
    for k = 1:xSize
        for i = 1:n
            elem(k, i) = c(i);
            for j = 1:i-1
                elem(k, i) = elem(k, i) * (x(k)-X(j)); 
            end
        end
    end
    y = sum(elem, 2);
end

function [x]=SubsAsc(A, b)
    n=length(b);
    x(1)=b(1)/A(1,1);
    for k = 2:n
        sum=0;
        for j=1:k-1
            sum=sum+A(k,j)*x(j);
        end
        x(k)=1/A(k,k)*(b(k)-sum);  
    end
end