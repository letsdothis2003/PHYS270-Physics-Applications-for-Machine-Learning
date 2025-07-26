








%From lines 10 to 26 is where all the algorithm requirements for the 
%assignment 
%This defines the range of the x-values, in this assignment, it 
%should be -10 to 10 
x = linspace(-10, 10, 100); 
% Define the first function listed 
f1 = @(x) x.^2 - 4; 
% Find the roots of said function using the coefficients of the function using matlab’s “root” function 
rootsf1 = roots([1, 0, -4]); 
% Ditto(same as before but for second function) 
f2 = @(x) x.^4 - 3*x.^3 - 10*x.^2 + x + 2; 
rootsf2 = roots([1, -3, -10, 1, 2]); 
% Output  the roots 
disp('Roots of y = x^2 - 4:'); 
disp(rootsf1); 
disp('Roots of y = x^4 - 3x^3 - 10x^2 + x + 2:'); 
disp(rootsf2); 
%Everything after here is just so a graph is outputted 
%along with the roots in command window  as I just want a visual representation 
% just to see if the output from the preceding code is correct or not.  
% Plot both functions  
plot(x, f1(x)); 
hold on; 
plot(x, f2(x)); 
hold off; 
% This should add the roots marked as green circles(hence the 'go' or ‘g’  in the plot functions) 
hold on; 
plot(rootsf1, zeros(size(rootsf1)), 'go', 'MarkerSize', 10); 
plot(rootsf2, zeros(size(rootsf2)), 'go', 'MarkerSize', 10); 
hold off; 
% This just makes both functions visible, without this 'ylim', the graph 
% just cuts off when y is less than 0(atleast on my screen)  
ylim([-10, 10]); 
% Just basic graph interface and appearance 
title('HW 1 PHYS 270: Graph of y = x^2 - 4   and y = x^4 - 3x^3 - 10x^2 + x + 2  '); 
xlabel('x'); 
ylabel('y'); 
legend('y = x^2 - 4', 'y = x^4 - 3x^3 - 10x^2 + x + 2', 'Roots'); 
grid on; % Enable grid lines