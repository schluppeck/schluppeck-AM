%% aFirstScript - a simple script that plots a noisy line
%
%        A bit more detail about what this function does.
%        This is a version of a script that would end up 
%        being called myFirstScript if you follow the materials
% 
% ds - 20140306 - (who wrote it and when)
%    - 20140312 - fixed problem with the noisy line
%
% see also: randn, colon

%% create a variable n with a value of 20
n = 20;

%% a vector t containing 1 to n (in steps of 1) 
t = 1:n;     % 
% t = 1:1:n; % is also correct

%% a vector sig that is equal to 0.3 times the square of t
sig = 0.3 .* (t.^2);

%% make a new figure window and plot
figure
plot(t, sig)

xlabel('Time (s)')
ylabel('Signal (my units)')
title('My first Matlab plot of y(t) = 0.3 * t^2')

%% plot symbols and line styles
plot(t, sig, 'rs-' ) % red, square symbols, solid line

plot(t, sig, 'rs-', ...
     t, sig./2, 'b:' ) 
