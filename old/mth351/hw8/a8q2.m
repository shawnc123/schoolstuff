% Data for question 2 of Assignment 8.

%The three functions we are integrating:
f1 = @(x) sin(x).*exp(x);             %integrate between 0 and pi
f2 = @(x) 1./(2-cos(pi*x));           %integrate between -2 and 2
f3 = @(x) sqrt(1-abs(x));             %integrate between -1 and 1


%the true values of each integral
truth1 = 0.5*(1+exp(pi));          
truth2 = 4*sqrt(3)/3;
truth3 = 4/3;
     
Romberg = romberg(f3, -1, 1, 6)
truth3 
errorCT = truth3 - Romberg(6,1)
errorRomberg = truth3 - Romberg(6,6)



