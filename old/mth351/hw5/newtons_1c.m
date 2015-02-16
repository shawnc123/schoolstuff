% MTH 351, Spring 2014
% newtons.m
% A simple implementation of Newton's method for finding a root.
% Parameters:
%   x0 -- the starting point
%   tol -- the desired tolerance. The default is 1e-6
%   N   -- the desired number of iterations to run. The default is 50.
% The actual function must be specified in the .m file
%
% Returns:
%   x -- the root found by Newton's method
%   xs -- the sequence of all x values that were found

function [x, xarray] = newtons(x0, tol, N)

    switch(nargin)
        case 1
            N = 20; tol = 1e-6;     %use default values if the user doesn't specify any
        case 2
            N = inf;                %user wants to guarantee a specified tolerance
        otherwise
            %do nothing
    end

    % Enter your function and its derivative (fp) here!
    % These define anonymous functions -- type 'help function_handle' for
    % more info
    
    %Example 1
    f =  @(x) (x^2-2*x*exp(-x)+exp(-2*x)) / (2*x+2*x*exp(-x)-2*exp(-x)-2*exp(-2*x));
    fp = @(x) ( (2*x+2*x*exp(-x)-2*exp(-x)-2*exp(-2*x))^2 - (x^2-2*x*exp(-x)+exp(-2*x)) * (2-2*x*exp(-x)+4*exp(-x)+4*exp(-2*x)) ) / ((2*x+2*x*exp(-x)-2*exp(-x)-2*exp(-2*x))^2);
     
    %Example 2 (doesn't converge to nearest root -- use x0 = 0.4)
    %f =  @(x) x^5 + 7*x^2 - 7*x^3 - 3*x + 2;
    %fp = @(x) 5*x^4 + 14*x - 21*x^2 - 3;
    
    %Example 3 (doesn't converge at all -- use x0 = 1 )
    %f =  @(x) (1+x)*exp(-x^2);
    %fp = @(x) -(2*x^2+2*x-1)*exp(-x^2);
    
    %Example 4 (double root)
    %f =  @(x) exp(x)-x-1;
    %fp = @(x) exp(x)-1;    
    
    its = 0;                %number of iterations run so far
    
    fx = f(x0); fpx = fp(x0); %compute the first values of f and fp
    x = x0; x_old = inf;    %we set x_old to inf initially so that the while loop will run.
    xarray = [x];             %store the iteration history so that we can examine convergence
    qratio = 0; lratio = 0;
    
    fprintf('   n\t      x\t\t\t      f(x) \t\t     quad. ratio \t\t lin. ratio\n');
    fprintf('-------\t-------------\t-------------\t\t-------------\t    -------------\n')
    while ( abs(x-x_old) > tol && its < N)
        if (its >= 2)
            fprintf('   %d\t%1.8e\t%1.8e\t\t%1.8e\t\t%1.8e\n',its,x,fx,qratio,lratio);	%we can start looking at ratios after 2 iterations
        else
            fprintf('   %d\t%1.8e\t%1.8e\n',its,x,fx);
        end
        x_old = x;
        x = x - fx/fpx;             %update x
        fx = f(x); fpx = fp(x);     %update f and fp
        xarray = [xarray x];
         
        % In case we found the root exactly
        if ( abs(fx) < eps)
            its = its+1;
            break
        end
        its = its+1;
        if its >= 2
            qratio = (xarray(its+1)-xarray(its))/(xarray(its)-xarray(its-1))^2;   %compute the quadratic error ratio
            lratio = (xarray(its+1)-xarray(its))/(xarray(its)-xarray(its-1));	  %compute the linear error ratio
        end
    end
    fprintf('   %d\t%1.8e\t%1.8e\t\t%1.8e\t\t%1.8e\n',its,x,fx,qratio,lratio);   %print the last line after the loop exits
end