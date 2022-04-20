%% this is a boolean test
%
%
% ds 2022-04-20 / during matlab course

%%

% make a random number between 0, 1
a = rand(1)

% now test if this time s is > or < than 0.5
if a > 0.5
    disp('chance favours the prepared mind')
else
    disp('uhoh!')
end

%%

reply = input('Do you want more? Y/N [Y]:','s')

if isempty(reply) || strcmpi(reply, 'y')
    % if the reply variable is empty
    % or if the string comparision with lowercase 'y' is true
    
    disp('user pressed Y or enter (empty variable)')

    reply = 'the user said yes..';
end


%%

if false

    %
    %
    %
    %

end
