clc; 
clear; 
close all;

%{
Author: J Branch
Date: 7/26/2022
Purpose: This code demostrates how get user input in the form of strings, how to 
open/create a file, and how to write user provided input into a text file in Matlab.

Tested on Windows 10 machine.

%}

userInput = strings; % initializes an empty string matrix
loopCondition = false;
idx = 1;

while (loopCondition == false)
prompt = "Enter some text to be stored into the file on a separate line from the previous, enter 0 to break: ";
userInput(idx) = input(prompt , "s");

if (userInput(idx) == '0')
    loopCondition = true;
end

idx = idx + 1; % need to increment idx right before next loop iteration

end

userInput = userInput(1:end-1);  % removes last array entry which is '0' for the break condition


fileID = fopen('C:\Temp\MatlabWriteExample-2.txt' , 'wt');
fprintf(fileID , '=================================================\n');
fprintf(fileID , 'Matlab Write to File Example-2\n');
fprintf(fileID , '=================================================\n');

for n = 1:length(userInput)
    tempString = strcat(userInput(n),'\n');
    fprintf(fileID , tempString);
end

fclose all;

clc
type C:\Temp\MatlabWriteExample-2.txt % display file contents on command window
