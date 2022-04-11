function cMap = makeColorMap(varargin)
%% MAKECOLORMAP makes smoothly varying colormaps
% a = makeColorMap(beginColor, middleColor, endColor, numSteps);
% a = makeColorMap(beginColor, endColor, numSteps);
% a = makeColorMap(beginColor, middleColor, endColor);
% a = makeColorMap(beginColor, endColor);
%
% all colors are specified as RGB triples
% numSteps is a scalar saying howmany points are in the colormap
%
% Examples:
%
% peaks;
% a = makeColorMap([1 0 0],[1 1 1],[0 0 1],40);
% colormap(a)
% colorbar
%
% peaks;
% a = makeColorMap([1 0 0],[0 0 1],40);
% colormap(a)
% colorbar
%
% peaks;
% a = makeColorMap([1 0 0],[1 1 1],[0 0 1]);
% colormap(a)
% colorbar
%
% peaks;
% a = makeColorMap([1 0 0],[0 0 1]);
% colormap(a)
% colorbar

% This function was downloaded from the FileExchange:
%
% http://www.mathworks.co.uk/matlabcentral/fileexchange/17552-makecolormap
%
% Copyright (c) 2009, The MathWorks, Inc.
% All rights reserved.
% 
% Redistribution and use in source and binary forms, with or without
% modification, are permitted provided that the following conditions are
% met:
% 
%     * Redistributions of source code must retain the above copyright
%       notice, this list of conditions and the following disclaimer.
%     * Redistributions in binary form must reproduce the above copyright
%       notice, this list of conditions and the following disclaimer in
%       the documentation and/or other materials provided with the distribution
%     * Neither the name of the The MathWorks, Inc. nor the names
%       of its contributors may be used to endorse or promote products derived
%       from this software without specific prior written permission.
% 
% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
% AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
% IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
% ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
% LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
% CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
% SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
% INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
% CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
% ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
% POSSIBILITY OF SUCH DAMAGE.


% Reference:
% A. Light & P.J. Bartlein, "The End of the Rainbow? Color Schemes for
% Improved Data Graphics," Eos,Vol. 85, No. 40, 5 October 2004.
% http://geography.uoregon.edu/datagraphics/EOS/Light&Bartlein_EOS2004.pdf

defaultNum = 100;
errorMessage = 'See help MAKECOLORMAP for correct input arguments';

if nargin == 2 %endPoints of colormap only
    color.start  = varargin{1};
    color.middle = [];
    color.end    = varargin{2};
    color.num    = defaultNum;
elseif nargin == 4 %endPoints, midPoint, and N defined
    color.start  = varargin{1};
    color.middle = varargin{2};
    color.end    = varargin{3};
    color.num    = varargin{4};
elseif nargin == 3 %endPoints and num OR endpoints and Mid
    if numel(varargin{3}) == 3 %color
        color.start  = varargin{1};
        color.middle = varargin{2};
        color.end    = varargin{3};
        color.num    = defaultNum;
    elseif numel(varargin{3}) == 1 %numPoints
        color.start  = varargin{1};
        color.middle = [];
        color.end    = varargin{2};
        color.num    = varargin{3};
    else
        error(errorMessage)
    end
else
    error(errorMessage)
end
   
if color.num <= 1
    error(errorMessage)
end

if isempty(color.middle) %no midPoint
    cMap = interpMap(color.start, color.end, color.num);
else %midpointDefined
    [topN, botN] = sizePartialMaps(color.num);
    cMapTop = interpMap(color.start, color.middle, topN);
    cMapBot = interpMap(color.middle, color.end, botN);
    cMap = [cMapTop(1:end-1,:); cMapBot];
end
    

function cMap = interpMap(colorStart, colorEnd, n)

for i = 1:3
    cMap(1:n,i) = linspace(colorStart(i), colorEnd(i), n);
end

function [topN, botN] = sizePartialMaps(n)
n = n + 1;

topN =  ceil(n/2);
botN = floor(n/2);
% Copyright 2008 - 2009 The MathWorks, Inc.