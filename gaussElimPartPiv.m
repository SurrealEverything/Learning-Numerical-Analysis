function gaussElimPartPiv()
    A = [2 1 2; 4 4 5; 6 5 10];
    b = [2 6 14]';
    gaussPartPiv(A, b)
end

function gaussPartPiv(A, b)
% Gaussian Elimination with Partial Pivoting 
    n = size(A, 1);
    A = [A b];
    for k = 1 : n-1
       [apk, p] = max(abs(A(k:n, k)));
       p = p + k-1;
       if apk == 0
          disp('Sist. incomp. sau comp. nedet.');
          break;
       end
       if p ~= k
          A([p k], :) = A([k p], :);
       end
       for l = k+1 : n
          m = A(l, k)/A(k, k);
          A(l, :) = A(l, :) - m * A(k, :); 
       end
    end
    if A(n, n) == 0
        disp('Sist. incomp. sau comp. nedet.');
    else
        x = descSub(A(:, 1:n), A(:, n+1)) 
    end
end

function [x] = descSub(A, b)
    n = size(A, 1);
    x(n) = b(n) / A(n, n);
    for k = n-1 : -1 : 1
        currSum = sum(A(k, k+1:n).*x(k+1:n));
        x(k) = (b(k) - currSum) / A(k, k);
    end
end