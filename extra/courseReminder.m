%% make timer

t = timer;

t.Period = 60*60;  % seconds / h
t.ExecutionMode = 'fixedRate';

t.TimerFcn = @(~,~)disp('... one hour CLOSER to matlab course!');

%% let's go
start(t)

%% clean up
stop(t)
delete(t)