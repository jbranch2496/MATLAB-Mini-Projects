clc; 
clear; 
close all;

%{
Author: J Branch
Date: 7/26/2022
Purpose: This code demostrates how to open/create and write to a text file in Matlab.

Tested on Windows 10 machine.

%}


fileID = fopen('C:\Temp\MatlabWriteExample.txt' , 'wt');
fprintf(fileID , '=================================================\n');
fprintf(fileID , 'Matlab Write to File Example\n');
fprintf(fileID , '=================================================\n');
fprintf(fileID , 'Today''s date and time is: ');
fprintf(fileID , datestr(now));
fclose all;

clc
type C:\Temp\MatlabWriteExample.txt % display file contents on command window