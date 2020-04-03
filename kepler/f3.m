function f = f3(x)
a = 2.0;
b = 1.25;
epslon = sqrt(1 - b * b / (a * a));
f = epslon * sin(x) - x;
