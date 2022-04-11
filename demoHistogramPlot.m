% demoHistogramPlot - demo the histogramPlot function
%
%      usage: [  ] = demoHistogramPlot(  )
%         by: denis schluppeck
%       date: 2006-05-03
%     inputs: r1, r2 - two distributions
%    outputs: 
%
%    purpose: plot histogram with some defaults.
%
% 
function [  ]=demoHistogramPlot(r1, r2)

if nargin ~=2
    error('this demo function requires 2 input arguments');
end

disp('shows one way to display 2 histograms together?')

% data
minX = min( min(r1(:), min(r2(:))) ); % the min of either
maxX = max( max(r1(:), max(r2(:))) ); % the max of either

nBins = round( sqrt( numel(r1)+numel(2) ./ 2) ); % maybe a good default!?

edges = linspace(minX, maxX, nBins);
nx = histc(r1, edges);
ny = histc(r2, edges);

figure
% plot one
p.style =  'bar';
p.linewidth = 0.5;
p.bgcolor = [0    0.3906    1.0000];
p.linecolor = [0    0.3906    1.0000];

histogramPlot( edges, nx, p)

% plot one
p.style = 'line'; % 'bar'
p.linewidth = 2;
p.bgcolor = 'none' %[0    0.3906    1.0000];
p.linecolor = [0 0 0]; %[0    0.3906    1.0000];

% plot another
hold on
histogramPlot( edges, ny, p)
hold off
axis([-inf inf -inf inf])


end

% ---- a helper function within this m-file

% histogramPlot - plot histogram with some pleasant default settings
%
%      usage: [ h_ ] = histogramPlot( x, nx, p )
%         by: denis schluppeck
%       date: 2006-05-03
%     inputs: x, p
%    outputs: h_
%
%    purpose: plot histogram
%
% 
function [ h_ ]=histogramPlot( x, nx, p )

if nargin == 0
  help histogramPlot
  return
end

if ~exist('p', 'var'); 
  p = []; 
  return
end

if strcmp(p.style,'bar')
  b_ = bar(x, nx);
  %get(b_)
  %pause
  set(b_, 'barwidth', 1, 'facecolor', p.bgcolor, 'edgecolor', p.linecolor, ...
	  'linewidth', p.linewidth, 'showbaseline', 'on')
elseif strcmp(p.style,'area')
  b_ = area(x, nx);
  get(b_)
  %pause
  set(b_,  'facecolor', p.bgcolor, 'edgecolor', p.linecolor, ...
	  'linewidth', p.linewidth)
elseif strcmp(p.style,'line')
  xshift = diff(x)/2;
  xshift = [xshift xshift(end)];
  b_ = stairs(x-xshift, nx);
  %get(b_)
  set(b_, 'color', p.linecolor, ...
	  'linewidth', p.linewidth)
end

end
