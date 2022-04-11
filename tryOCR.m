%% script that demonstrates use of OCR
%
% 2019-04 denis schluppeck (based on mathworks demo)
%
% requires: Computer Vision System Toolbox
%

close all
clear all

%% Load an image.

% I = imread('2019-04-24-b-ocr.png'); % handwritten text (won't work)

I = imread('2019-04-24-c-ocr.png');
imshow(I, 'InitialMagnification', 125)

%% Perform OCR.
results = ocr(I)

%% Display the recognized words.

words = results.Words

if isempty(words)
    disp('no text recognised')
else
    fprintf('recognised %d tokens\nin \n%s', numel(words), results.Text);
end

% Location of the word in I
wordBBox = results.WordBoundingBoxes


%% Show the location of the word in the original image.
figure;
Iname = insertObjectAnnotation(I,'rectangle',wordBBox,words);
imshow(Iname, 'InitialMagnification', 250);

