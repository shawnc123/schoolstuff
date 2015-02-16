% Simple function implementing the composite trapezoid rule with node points
% given by x and the corresponding function values given by y.
% NOTE: we assume that the points x are equally spaced!! 

function I = comp_trap(x,y)
    % now implements composite simpsons rule
    h = x(2)-x(1);      %assume equal spacing
    I = y(1) + 4*sum(y(2:2:end-1)) + 2*sum(y(3:2:end-1)) + y(end);
    I = h/3*I;

end