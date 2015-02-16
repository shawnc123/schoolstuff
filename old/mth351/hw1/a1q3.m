% a1q3.m
% A file to help get you started on question 3. 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Part a: Plotting
x = 0:0.01:1;       %We define a 'reasonable' mesh of x values

%Plotting commands. Type 'help' followed by the command name to get more
%information on how these work
figure(1);
% Code to plot the integrand for n = 1 as a blue line. You need to plot n=2, n=5, n=10 and n=20 on the same axes
plot(x, x.*exp(x), 'b-', 'LineWidth',2); axis([0 1 0 exp(1)]);
hold on;
plot(x, x.^2.*exp(x), 'g-', 'LineWidth',2); axis([0 1 0 exp(1)]);
plot(x, x.^5.*exp(x), 'r-', 'LineWidth',2); axis([0 1 0 exp(1)]);
plot(x, x.^10.*exp(x), 'm-', 'LineWidth',2); axis([0 1 0 exp(1)]);
plot(x, x.^20.*exp(x), 'y-', 'LineWidth',2); axis([0 1 0 exp(1)]);

set(gca,'FontSize',16,'FontWeight','bold');                         %This line just increases font size so that it shows up better
xlabel('x'); ylabel('y'); title('Plot of x^n e^x for different n');
legend('n=1','n=2','n=5','n=10','n=25','Location','NorthWest');                               %You should update the legend too!




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Part c: forward recursion

%ENTER STARTING VALUE FOR I HERE. Hint: The number e is exp(1) in Matlab.
I = [ exp(1)-1 ]

for n = 1:25
    %ENTER RECURSIVE FORMULA HERE
    I = [ I (exp(1) - n*I(n)) ];          % This sticks the new value on the end of the array using concatenation
    
end

%display results
fprintf('   n \t  I_n \n-------\t--------\n');
fprintf('   %d\t%7.6f \n',[0:25; I]);


%%% HERERERERERERERERERERERERERRERER
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%Part e: backward recursion

%ENTER STARTING VALUE FOR I HERE
I = [ 0 ];
for n = 50:-1:1
    %ENTER BACKWARD RECURSIVE FORMULA HERE
    I = [(exp(1) - I(51 - n))/n I];          % This sticks the new value on the BEGINNING of the array using concatenation. 
                            % You can access the first element in the array with I(1).
end

fprintf('   n \t  I_n \n-------\t--------\n');
fprintf('   %d\t%7.6f \n',[0:50; I]);