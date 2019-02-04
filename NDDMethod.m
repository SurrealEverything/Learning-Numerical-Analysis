function NDDMethod()
    plotMethod();
end

function plotMethod()
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
    yNDD = NDD(X, Y, x);
    yNDD =  yNDD(:);
    
    figure;
    
    plot(x, y);
    
    hold on;
    plot(X, Y, 'v');
    
    plot(x, yNDD); 
    
    
    line(xlim, [0, 0]);
    line([0, 0], ylim);
    
    title('NDD Method');
    xlabel('x');
    ylabel('y');
    
    hold off;
    
    figure;
    
    yLen = length(y);
    idx = [1:yLen];
    E = abs(y-yNDD);
    plot(idx, E);
    
    title('Approximation Error');
    xlabel('X Index');
    ylabel('Error');
end

function y = NDD(X, Y, x)
     n = length(X);
     
     DD = zeros(n, n);
     DD(1, :) = Y(:);
     
     for i = 2:n
         for j = 1:n-i+1
             DD(i, j) = (DD(i-1, j+1) - DD(i-1, j)) / (X(i+j-1) - X(j));
         end
     end
     
     xSize = length(x);
     P(:, :) = repmat(DD(:, 1)', xSize, 1);
     
     for k = 1:xSize
         for i = 2:n
            P(k, i:n) = P(k, i:n) * (x(k) - X(i-1));
         end
     end
     P;
     y = sum(P, 2);
end