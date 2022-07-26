clc; 
clear; 
close all;

%{
Author: J Branch
Date: 7/26/2022
Purpose: This code demostrates how to open a text file, parse the text string using built-in Matlab functions, 
and compute 1 variable integration/diffrentiation based on the data read.

Scope: The code reads the data from the file EzCalc_txt1.txt into the variable 'data'.
The data variable is a cell array whose 1st cell contains the content of
the text file and is loaded to another variable called 'text' for further parsing.

The data in the text file is formatted in 3 columns seperated by spaces and each row delimted by the character(;)

column 1 - (operation string) Int - computes a integral for a function of 1
variable,  Der - computes a derivative for a function of 1 variable
column 2 - (function handle string) - String that will be converted to a function
handle in Matlab. Should be a function handle of the variable 'x' only.
column 3 - (bounds string) - For integration this parameter serves as the bounds to
compute a definite integral. For differentiation this parameter provides
the domain to compute the derivative over. The domain is spaced as 100
linear seperated points over the provided bounds.
%}

fileID = fopen("EzCalc_txt1.txt" , 'r');
data = textscan(fileID , '%s' , 'Delimiter', ';');
text = data{1};
fclose all;

intArray = [];
derArray = [];

figure;

for n = 0:length(text)-1
    splitIndices = strfind(text{n+1} , ' ');
    operation = extractBetween(text{n+1} , 1 , splitIndices(1)-1);
    func = extractBetween(text{n+1} , splitIndices(1)+1 , ' ');
    bounds = extractBetween(text{n+1} , splitIndices(2) , length(text{n+1}));

    b = str2num(bounds{1});
    x = linspace(b(1) , b(2) , 100);
    f = str2func(func{1});
  
    if(operation{1} == 'Int')
        intArray = [intArray ; integral(f , b(1) , b(2))]; % concatenate new computation into the array

        integralComputation = strcat('Integral of ' , {' '} , func{1}(5:end) , ' evaluated on the bounds of ' ...
         , {' '}, num2str(b(1)), ',' , num2str(b(2)) , ' = ' , {' '} , num2str(intArray(end)))
    end

    if(operation{1} == 'Der')
        dx = diff(x);
        dy = diff(f(x));
        der = dy./dx;
        derArray = [derArray ; der]; % concatenate new computation into the array

        subplot(1 , 2 , 1);
        title('Ez-Calc Function Plots')
        plot(x , f(x) , 'DisplayName' , ['func' num2str(n+1) ' = ' func{1}(5:end)] , LineWidth=1.5);
        hold on;
        xlabel('x');
        ylabel('f(x)');
        legend show;
        grid on;

        subplot(1 , 2 , 2);
        title('Ez-Calc 1st Order Derivative Plots')
        plot(x(1:end-1) , der , 'DisplayName' , ['Approx. Derivative of ' func{1}(5:end)] , LineWidth=1.5);
        hold on;
        xlabel('x');
        ylabel('df(x)/dx');
        legend show;
        grid on;
    end
end

