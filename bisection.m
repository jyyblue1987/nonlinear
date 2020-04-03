function c = bisection(Ffun, a, b, maxit, tol)

if (floor(maxit) < 1) 
   fprintf('warning: maxit = %i < 1. Resetting to 100\n',floor(maxit)); 
   maxit = 100;
end

if (a >= b)
   fprintf('error: illegal interval [%0.5g, %0.5g]!\n',a,b)
   return;
end
if (tol <= eps)
   fprintf('warning: tol is too small, resetting to %0.5g\n',10*eps)
   tol = 10*eps;
end

fa = feval(Ffun,a);
fb = feval(Ffun,b);
if (fa*fb > 0) 
   fprintf('error: illegal interval, f(a)=%0.5g, f(b)=%0.5g',fa,fb)
   return;
end

fprintf(' Bisection Method: initial |(b-a)/2| = %g\n',(b-a)/2);

for i=1:maxit

   c = (a+b)/2;
   fc = feval(Ffun,c);
	   
   err = b-c;
   fprintf('   iter %6i, [%0.7f,%0.7f], |(b-a)/2| = %g, f(c) = %g\n',i,a,b,err,fc);
   if (err < tol)
      break;
   end
	
   if (fa*fc < 0)
      b = c;
      fb = fc;
   else
      a = c;
      fa = fc;
   end
   
end

