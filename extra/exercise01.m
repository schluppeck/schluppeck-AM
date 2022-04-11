%% Exercise01 - exercises on making vectors/matrices
%
%      usage: [  ] = exercise01(  )
%         by: lpzds1
%       date: Mar 26, 2014
%
%    purpose: simple exercises on creating and using numeric variables
%

%% Exercise 1 in the handout has a list command line exercises:
%  do these now!

% if you want to keep a record of all the things you are doing in an
% interactive session you can use the following command to save everything
% you type at the command prompt.

diary mySession01

% ---------------------------------------------------------------------- 
%     Try calculating the following on the command line:
% ---------------------------------------------------------------------- 
% 
%     1.	3/2 
%     2.	value of pi (what do you think this could be called in Matlab?)
%     3.	two times pi
%     4.	2 to the power of 8
%     5.	4 to the power of 3
%     6.	64 to the power of one third
%     7.	the square root of 81


%% Single numbers can be stored as you'd expect

x = 2.12

%% Lists of numbers are often stored in a vector
%  the list is delimited by square brackets [  ]
v = [1  2  3  4]

%% Defining variables a, b, c

% the variable a has 4 elements, in 2 rows and 2 columns (cf Excel!)

a = [1 2
     3 4]
 
% commas and spaces delimit elements across columns 
% line break and semi-colon move to next row

% an equivalent way of doing this would be
a = [1,2 ; 3,4]

% another variable with 2 rows and 2 columns
b = [7 8
     9 0]
 
% a variable with 1 row and 2 columns
% this is similar to v above !
c = [-1 pi]

% but be careful... as in Excel, you can have 
% * a row of numbers (that goes across many columns) or
% * a column of numbers (that goes across many rows)

d = [+1; 10]

% d has the same number of elements but its "SIZE" is different from c


% to access what is stored

% find value of a(2,1)
