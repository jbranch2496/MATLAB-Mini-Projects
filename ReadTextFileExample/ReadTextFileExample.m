clc; 
clear; 
close all;

%{
Author: J Branch
Date: 7/26/2022
Purpose: This code demostrates how to open and read from a text file and parse the read text strings in Matlab
such that each line in the text file is a string element of the textStrings matrix.

Tested on Windows 10 machine.

Scope: The code reads the data from the file the example ReadFile.txt into the variable 'data'.
The data variable is a cell array whose 1st cell contains the content of
the text file. The for-loop takes the content of the data variable and
stores each line from the test file as an element of a (nx1) matrix call textStrings.

n = number of rows inside the text file, data is newline (\n) delimited
%}


fileID = fopen("MatlabReadFileExample.txt" , 'r');
data = textscan(fileID , '%s' , 'Delimiter' , '\n');
fclose all;

textStrings = strings; % initializes an empty string matrix

for i = 1:length(data{1})

text = data{1}{i};
textStrings(i,1) = text;

end

textStrings


