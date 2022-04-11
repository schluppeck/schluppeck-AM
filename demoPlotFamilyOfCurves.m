% demoPlotFamilyOfCurves -demo showing how to plot families of curves
%
%      usage: [  ] = demoPlotFamilyOfCurves()
%         by: denis schluppeck
%       date: 2010-02-20
%        $Id: demoPlotFamilyOfCurves.m 262 2010-02-21 16:22:35Z lpzds1 $
%     inputs: 
%    outputs: 
%
%    purpose: plot some curves from different conditions (in this case
%    using different parameters in an hrf
%
%        e.g:
%
function [  ]=demoPlotFamilyOfCurves(  )

samplingT = 0.5; % in s
t = 0:samplingT:30; % time in s
hrf = fmribHRF(t); % with default params

delays = [6:1:10];
delayhrf = [];
tmp = [];

% pick some reasonable colors from a colormap
% colors = rainbow_colors(length(delays));

% or 
colors =  makeColorMap([0 0 0], [1 .1 .1], length(delays));


for iDelay = 1:length(delays)
  p = [delays(iDelay) 12 0.9 0.9 0.35];
  delayedhrf(iDelay,:) = fmribHRF(t, p ); 
  % use HIRF used by FSL / SPM will be similar
end

figure

for iDelay = 1:length(delays)
  plot(t,delayedhrf(iDelay,:),'color', colors(iDelay,:), 'linewidth', 2)
  hold on
end
xlabel('Time (s)')
ylabel('fMRI response')
title('HRF with different delays')
legstr = ['{' sprintf('''%ds'', ',delays) '}'];
legend(eval(legstr))




