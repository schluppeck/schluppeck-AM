function  [myResult] = reverseMe(data)
% reverseMe - take a vector input and return the "flipped" version
%
%. takes in a list of numbers and return the reversed version
%. [1, 5, 7, 9] -> [9, 7, 5, 1]
%
%  see also: colon, flipud, fliplr, indexing
%
% ds 2022-04-20 / during matlab course

% idea: check if data input is nicely formatted
% isrow / iscolumn (TODO later, when we have some time)

% idea: if column or row vector, then we can use indexing, starting from
% last element to first and return that.

% how many elements are there in input
nElements = numel(data);
idx = nElements:-1:1;
myResult = data(idx); 

% end special word... can also use this version
% myResult = data(end:-1:1);


end