% dataFitPlot - plot fit with data points overlayed
% 
%  dataFitPlot(x, y, e, xf, yf, [dataColor], [fitColor], ...
%                [plotSizes], [plotSymbol])
% 
%
%  IN x, y, e                   - data with errors
%     xf, yf                    - x,y for fit
%     dataColor, fitColor       - color vectors e.g. [1 0 0]
%     plotSizes:                - [linewidth, symbolsize] e.g. [2  15]
%     plotSymbol                - symbols e.g. '+', default 'o' 
%
% For example,
%             x = 0:0.2:(2*pi);
%             y = 2.*x+randn(size(x));
%             e = 0.2.*y;
%             f = 2.*x; 
%             % with line showing fit
%             figure, dataFitPlot(x,y,e,x,f, [1 0 0], [0 0 0]); 
%             % without ...
%             figure, dataFitPlot(x,y,e,[],[],[1 0 0],[0 0 0],[2 15], 'v'); 
%             
%
% movshon / carandini style plot - large symbols on top of a fit line
%
% denis schluppeck - 10-10-04 
function h = dataFitPlot(x, y, e, xf, yf, dataColor, fitColor, ...
			   plotSizes, plotSymbol)

if nargin < 9
  plotSymbol = 'o';
end

if nargin < 8
    plotSizes = [3 15];
end

if nargin < 7
  dataColor = [0 0 0];
  fitColor = [1 0 0 ];
end
if nargin == 3
    xf = []; yf = [];  
end
if nargin < 3
    error('need at least 3 inputs')
end

if ~(isempty(xf) | isempty (yf))
    % plot fit...
    f_ = plot(xf, yf, 'linewidth', plotSizes(1)+1, 'color', fitColor);
else
f_ = [];
end

% plot errorbars if they are given
hold on
if ~isempty(e)
  % the next three lines of code plot '.' at Y+E and Y-E
  %eb_ = plot(x,y(:)-abs(e(:)),'.');
  %et_ = plot(x,y(:)+abs(e(:)),'.');
  %set([et_;eb_], 'linewidth',2, 'color', dataColor, 'linestyle','none','markersize',5);
  l_ = line([x(:), x(:)]', [y(:)-abs(e(:))  y(:)+abs(e(:))  ]');
  set([l_], 'linewidth',plotSizes(1), 'color', dataColor);
else
    l_ = [];
end
% plot data points last
d_ = plot(x, y, 'color', dataColor, 'marker', plotSymbol);
set(d_, 'linewidth', plotSizes(1), ...
	'markersize', plotSizes(2), ...
	'markerfacecolor','w','linestyle','none');
% set(get(d_,'children') ,'alpha',1)
hold off

%return handles to data - errorbars - fit, if needed 
if nargout == 1
  h =[d_; l_; f_];
end