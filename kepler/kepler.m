% This script tests the newton method for finding solution of Kepler�s
% equation when time t is vary
maxit = 6;

% start the first solve off with an initial guess of x0 = 0
x0 = 0;
etol = 1e-6;
for t = 0:0.001:10
    r = newton('f3', 'Df3', x0, maxit, etol, t);
    fprintf('t = %0.7f, w(t) = %0.7f\n', t, r);    
    
    % The initial guess for each solve should be the solution from the previous value of t
    x0 = r;
end


