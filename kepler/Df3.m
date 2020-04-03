function f = Df3(x)
a = 2.0;
b = 1.25;
epslon = sqrt(1 - b * b / (a * a));
f = epslon * cos(x) - 1;
