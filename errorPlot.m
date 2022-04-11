% errorPlot - combine errorsurface and line into an elegant plot
%
%  h = errorplot(x, y, e, [plotColor], [ebColor], [ebAlpha])
% 
%  For example,
%
%     x = 0:0.2:(2*pi);
%     y = 2.*x+randn(size(x));
%     e = 0.2.*y;
%     figure, errorPlot(x,y,e, [1 0 0], 0.7*[1 1 1])   
%
% denis schluppeck - 07-27-2004 - written
function h = errorPlot(x, y, e, plotColor, ebColor, ebAlpha, lw)

if nargin < 7
  lw = 2;
end

if nargin < 6
    ebAlpha = 1;
end

if nargin < 5
    ebColor = [1 1 1]*0.7;
end

if nargin < 4
    plotColor = [0 0 0];
end

% check for minimal # of input arguments
if nargin < 3 || isempty(x) || isempty(y) || isempty(e)
    help errorPlot
    return
end

hold on
es_ = errorSurface(x, y, e, ebColor, ebAlpha);
hold on
p_ = plot(x,y,'color', plotColor, 'linewidth',lw);
hold off

if nargout == 1
  h = p_;
elseif nargout == 2
  h = {p_; es_};
end

end

