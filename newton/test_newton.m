% This script tests the newton method for finding root of a nonlinear function
% contained in the file f2.m and its derrivate function Df2.m.  
% and solves for the root to a tolerance of 1e-4.
% It uses an initial guestes of x0 = {-3, 1, 2, 4} and solves for the root to a tolerance of 1e-4.

x0_array = [-3 1 2 4];
tol_array = [1e-6, 1e-10];
maxit = 100;

for i = 1:4
    x0 = x0_array(i);
    for j =1:2        
        etol = tol_array(j);
        r = newton('f2', 'Df2', x0, maxit, etol, true);
        fprintf('\n Initial guest = %d, tol = %.16e,  The approximate root is %.16e \n\n', x0, etol, r);
    end
end


