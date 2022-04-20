function xy = plotFixations(data_x, data_y, trialNum )
% plotFixations - a function that takes x y (t) data and plots one trial
%
% input: data_x, data_y, trialNum (1...10)
% ouput: an array with lots of rows (1000), 2 columns (x,y)
% 
% ds 2022-04-20 / for matlab course.
 
% idea: defensive programming... 
%.      check number of input arguments, more importantly bounds errors

% check if trialNumber is ok
nTrials = size(data_x, 2);
nTimepoints = size(data_x, 1); % we are not using it now...

if trialNum > nTrials || trialNum < 1
    errmsg = ['trialNum needs to be between 1 and ' num2str(size(data_x,2)) ...
        ' but it was ' num2str(trialNum)];
    % error('trialNum needs to be between 1 and size(data_x,2)');
    error(errmsg)
end

%  - idea: grab the correct columns from data_x, data_y
x = data_x(:, trialNum );
y = data_y(:, trialNum );

% use x/y data to make plot (in three different panels)
subplot(4,1,1)
plot(x)

subplot(4,1,2)
plot(y)

subplot(4,1, [3,4] )
plot(x,y) 
% axis equal
axis('equal')
axis('tight')

%  - to return output.. combine those two columns
xy = [x, y]; % , and ; are the concise way... HORZCAT / VERTCAT

%  - what could possibly go wrong?!
%.   make a note / enact some defensive programming.

end