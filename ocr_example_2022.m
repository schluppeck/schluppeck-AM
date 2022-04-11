%% OCR example
%
% showing how a few lines of code can 
% achieve quite a lot in matlab
%
% optical character recognition from images
%
% ds 2022-demo


%% read in an image

I = imread('flickr-text-example.png');
imshow(I);

%% do OCR
%
% optical character recognition, literally 1 line of code!

ocrResults = ocr(I);


%% make an image that has annotations
Iocr = insertObjectAnnotation(I, 'rectangle', ...
                           ocrResults.WordBoundingBoxes, ...
                           ocrResults.WordConfidences, 'color', 'cyan');
figure() 
imshow(Iocr);

%% and highlight which bits are text w/ high confidence
confidences = ocrResults.WordConfidences;

highConfidence = confidences > 0.5;

bboxes = ocrResults.WordBoundingBoxes;

Iocr2 = insertShape(I, 'FilledRectangle', bboxes(highConfidence,:), 'color', 'r');

% could use this to highlight low confidence words.
Iocr2 = insertShape(Iocr2, 'FilledRectangle', bboxes(~highConfidence,:), 'color','y');

figure()
imshow(Iocr2)