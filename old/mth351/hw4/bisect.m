% MTH 351, Spring 2014
% bisect.m
% A simple implementation of the bisection method for finding a root.
% Parameters:
%   a -- the left side of the desired interval
%   b -- the right side of the interval
%   tol -- the desired tolerance. The default is 1e-6
%   N   -- the desired number of iterations to run. The default is 50.
% The actual function must be specified in the .m file

function c = bisect(a, b, tol, N)

    switch(nargin)
        case 2
            N = 50; tol = 1e-6;     %use default values if the user doesn't specify any
        case 3
            N = inf;                %user wants to guarantee a specified tolerance
        otherwise
            %do nothing
    end

    % ENTER THE APPROPRIATE FUNCTION HERE
    % This defines an anonymous function -- type 'help function_handle' for
    % more info
    f = @(x) x^3 - 20;
    
    fa = f(a); fb = f(b);
    
    %Check to make sure the input was valid
    if(a >=b)
        error('We require a < b');
    elseif(sign(fa)*sign(fb) > 0)
        error('The sign of f is the same at a and b');
    end
    
    its = 1;            %number of iterations run so far
    c = 0.5*(a+b); fc = f(c);
    fprintf('   n\t      a\t\t\t      b\t\t\t      c\t\t\t       f(c)\n-------\t-------------\t-------------\t-------------\t-------------\n');
    while ( (b-c) > tol && its < N)
        fprintf('   %d\t%1.8e\t%1.8e\t%1.8e\t%1.8e\n',its,a,b,c,fc);
        
        %if this is satisfied then we've found the root to machine precision
        if (abs(fc) < eps)
            break;
        end
        
        if(sign(fc)*sign(fb) < 0)
            a = c; fa = fc;
        else
            b = c; fb = fc;
        end
        c = 0.5*(a+b); fc = f(c);
        its = its+1;
    end
    fprintf('   %d\t%1.8e\t%1.8e\t%1.8e\t%1.8e\n',its,a,b,c,fc);

end
