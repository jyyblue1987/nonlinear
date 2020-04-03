% This script tests the newton method for finding solution of Kepler’s
% equation when time t is vary

a = 2.0;
b = 1.25;

maxit = 6;

% start the first solve off with an initial guess of x0 = 0
x0 = 0;
etol = 1e-6;

x = 0:0.001:10;
y = 0:0.001:10;
i = 1;
for t = 0:0.001:10
    w = newtont('f3', 'Df3', x0, maxit, etol, t);
    fprintf('t = %0.7f, w(t) = %0.7f\n', t, w);  
    
    % radial position of an object at angle ! in it’s elliptical orbit, 
    rw = a * b / sqrt((b * cos(w))^2 + (a * sin(w))^2);
    
    % the Cartesian coordinates of the object,
    xt = rw * cos(w);
    yt = rw * sin(w);
    
    % Store the values of t, x(t) and y(t)
    x(i) = xt;
    y(i) = yt;
    
    % The initial guess for each solve should be the solution from the previous value of t
    x0 = w;
    
    i = i + 1;
end

tt = 0:0.001:10;

figure

subplot(2,2,1)
plot(tt, x);
title('x(t) vs t')

subplot(2,2,2)
plot(tt, y);
title('y(t) vs t')

subplot(2,2,3)
plot(x, y);
title('x(t) vs y(t)')



