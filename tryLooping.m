%% tryLooping - play around with loops
%
%         by: ds1
%       date: Apr 22, 2014
%
%    purpose: illustrate use / non-use of loops
%

%% loops are useful for iterating over many items in a vector, array

for iNumber = 1:10
    disp(['The current # is: ' num2str(iNumber) ]);
    % do more interesting things (on item "iNumber of a list")
end

 
h = waitbar(0,'Please wait - doing a silly loop...');
        
for iNumber = 1:50
    % disp(['The current # is: ' iNumber]);
    pause(0.1) % pause approximately 200ms
    % computation here instead of pause
    waitbar(iNumber/50,h)
    
    % do more interesting things (on item "iNumber of a list")
end
close(h)

%% can also loop over other data types (struct)
disp('Waiting for a key press...')
pause 

s(1).name = 'Amelie';
s(1).age = 24;
s(1).course = 'MSc Brain Imaging';

s(2).name = 'John';
s(2).age = 25;
s(2).course = 'MSc Computer Science';

s(3).name = 'Emma';
s(3).age = 23;
s(3).course = 'MSc Mechanical Engineering';


for iPerson = s
    iPerson.age
end

%% can also loop over other data types (struct)
c = {rand(3), nan(10,2), ones(10), randn(100)};

for iC = c
    
    size(iC{:})
    
end

% but actually there is a better way to do this in Matlab too.



%% a bit of code written by someone who came from C
% 

data = [1 2 3 4 3 2 1 2 7 6 5 7];
cSum(1) = data(1);
for ii = 2:numel(data)
    cSum(ii) = cSum(ii-1) + data(ii);
end
disp(['cSum = '])
cSum


%% Matlab has a function for this
%
% the loop above calculates the cumulative sum of the array.

cSumMatlab = cumsum(data); % one line, so much neater!
disp(['cSumMatlab = '])
cSumMatlab


%% compare the two in a plot
figure 
plot(data,'k-')
hold on
plot(cSum, 'r-') % the C version
plot(cSumMatlab, 'rs')
hold off
legend('data','Cumulative sum (loop)', 'Cumulative sum (Matlab)')
title('Comparing Matlab and C-style')
%% but this is not a fair comparison 
%
% ... because we just used a pre-fabricated function. What if we actually
% had to write a vectorized version?