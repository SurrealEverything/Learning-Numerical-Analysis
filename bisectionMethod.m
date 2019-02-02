function bisectionMethod()
    plotBisMet()
end

function plotBisMet()
    % Plots bisMet calls 
    f = @(x) x.^3 - 7*x.^2 + 14*x - 6;
    
    X = linspace(0, 4);
    Y = f(X);
    
    plot(X, Y);
    hold on;
    
    eps = 0.00001;
    
    xaprox1 = bisMet(f, 0, 1, eps);
    xaprox2 = bisMet(f, 1, 3.2, eps);
    xaprox3 = bisMet(f, 3.2, 4, eps);
    
    line(xlim, [0, 0]);
    line([0, 0], ylim);
    
    plot(xaprox1, f(xaprox1), 'v');
    text(xaprox1, f(xaprox1), 'xaprox1');
    
    plot(xaprox2, f(xaprox2), 'v');
    text(xaprox2, f(xaprox2), 'xaprox2');
    
    plot(xaprox3, f(xaprox3), 'v');
    text(xaprox3, f(xaprox3), 'xaprox3');
    
    xlabel('x');
    ylabel('y');
    title('Bisection Method');
    
    hold off;
end

function xaprox = bisMet(f, a, b, eps)
    assert(f(a) * f(b) <= 0);
    while true
        x = (a+b)/2;
        if f(a) * f(x) < 0
            b = x;
        else
            a = x;
        end
        if(abs(a-b) < eps)
            break;
        end
    end
    xaprox=x
end