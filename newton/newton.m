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
        err = fr / frd;
        if abs(err) < etol 
            break;
        end
        
        r = r - err;
    end
end

