% r:        the final approximation of the root
% df:       the name of the derivative of that function
% x0:       the initial guess 
% nmax:     the number of allowed iterations
% etol:     the error tolerance
% t:        time 
function [r] = newton(f, df, x0, nmax, etol, t)
    r = x0;
    for i=1:nmax
        fr = feval(f, r) - t;
        frd = feval(df, r);
        
        % err = f(r) / f'(r)
        err = fr / frd;
        
        if abs(err) < etol 
            break;
        end
        
        % x(k + 1) = x(k) - f(x(k))/f'(x(k))
        r = r - err;
    end
end

