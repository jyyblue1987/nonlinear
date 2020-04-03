function c = bisection(Ffun, a, b, maxit, tol)

% check if max iteration count is positive
if (floor(maxit) < 1) 
   fprintf('warning: maxit = %i < 1. Resetting to 100\n',floor(maxit)); 
   maxit = 100;
end

% check if starting interval is valid
if (a >= b)
   fprintf('error: illegal interval [%0.5g, %0.5g]!\n',a,b)
   return;
end

% check if toleance is smllaer than matlab eps
if (tol <= eps)
   fprintf('warning: tol is too small, resetting to %0.5g\n',10*eps)
   tol = 10*eps;
end

% check if there is a root between starting interval fa * fb <= 0 by "The
% Intermediate Value Theorem"
fa = feval(Ffun,a);
fb = feval(Ffun,b);
if (fa*fb > 0) 
   fprintf('error: illegal interval, f(a)=%0.5g, f(b)=%0.5g',fa,fb)
   return;
end

fprintf(' Bisection Method: initial |(b-a)/2| = %g\n',(b-a)/2);

for i=1:maxit
   % Approximate the root r by the middle point c 
   c = (a+b)/2;
   fc = feval(Ffun,c);
	   
   err = b-c;
   fprintf('   iter %6i, [%0.7f,%0.7f], |(b-a)/2| = %g, f(c) = %g\n',i,a,b,err,fc);
   if (err < tol) % check error tolerance
      break;
   end
	
   if (fa*fc < 0)  % if f(a) and f(c) have different signs, root r is in [a, c]
      b = c;   % assign c to a new b
      fb = fc;  
   else % otherwise(i.e f(c) and f(b) have different signs), the root r is in [c, b]
      a = c;    % assign c to a new a
      fa = fc;
   end
   
end

