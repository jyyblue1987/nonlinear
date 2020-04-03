% r:        the final approximation of the root
% df:       the name of the derivative of that function
% x0:       the initial guess 
% nmax:     the number of allowed iterations
% etol:     the error tolerance
% ishow:    a flag to enable/disable printing of iteration information (such as the iteration step and the approximation at the step) to the screen during the Newton solve
function [r] = newton(f, df, x0, nmax, etol, ishow)
    r = x0;
    for i=1:nmax
        fr = feval(f, r);
        frd = feval(df, r);
        
        % err = f(r) / f'(r)
        err = fr / frd;
        
        if ishow
            fprintf('   iter %6i, r = %0.7f, f(r) = %0.7f, err = %0.7f\n', i, r, fr, err);
        end
        if abs(err) < etol 
            break;
        end
        
        % x(k + 1) = x(k) - f(x(k))/f'(x(k))
        r = r - err;
    end
end

