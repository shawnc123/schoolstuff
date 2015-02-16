function [yy] = mySpline()

x=1:.01:3;

s0 = (x >= 1 & x <= 2) .* (1+.25.*(x-1) -.25.*(x-1).^3);
s1 = (x > 2 & x <= 3) .* (1-.5.*(x-2) -.75.*(x-2).^2 +.25.*(x-2).^3);

sTot = s0+s1;
plot(x, sTot); hold on;

yy = spline([1,2,3], [1,1,0], 1:.01:3);

plot(x,yy, '-g');

legend('my cubic spline', 'matlab cubic spline');

plot(1,1, 'x -r');
plot(2,1, 'x -r');
plot(3,0, 'x -r');
