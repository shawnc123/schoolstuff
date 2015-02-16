%function R = romberg(f,a,b,n)
%Implementation of Romberg's method
% Input: - f: a handle to the function being integrated
%        - a & b are the limits of integration
%        - n is the number of rows of the table to be computed
%
% Output: - R: the table of values computed using Romberg's scheme.

function R = romberg(f,a,b,n)

R = zeros(n);
h = (b-a);

R(1,1) = h/2*(f(a) + f(b));  %the first value is the trapezoid rule applied over the whole interval.

%each subsequent iteration computes one row of the table
for j = 2:n
    h = h/2;
    new_points = a + (1:2:2^(j-1))*h;                    %new points being added for the trapezoid rule
    R(j,1) = 0.5*( R(j-1,1) + 2*h*sum( f(new_points) )); %compute the next trapezoid rule approximation using the old one.
    
    %compute the new romberg extrapolations in this row of the table
    for k = 2:j
        R(j,k) = 1/(4^(k-1)-1) * (4^(k-1)*R(j,k-1) - R(j-1,k-1));
    end    
end