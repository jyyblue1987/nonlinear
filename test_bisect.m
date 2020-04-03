% This script tests the function bisection.m on a nonlinear function
% contained in the file f1.m.  It uses an initial interval [-5,5],
% and solves for the root to a tolerance of 1e-4.
%
% set the initial interval, max iteration count, and the tolerance
a = -5; 
b = 5;
maxit = 1000000;
tol = 1e-4;

% call bisection to compute the root, and output result to screen
x = bisection('f1',a,b,maxit,tol);
fprintf('\n The approximate root is %.16e \n\n',x);
