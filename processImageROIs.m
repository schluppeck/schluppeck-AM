%% processImageROIs - load in and image and apply filter/change within ROI
% 
%      usage: processImageROIs
%         by: 
%       date: Apr 17, 2014
%
%    purpose: script for loading in an image (from file or webpage)
%             and applying filter / change to properties
%

%% clean slate
close all, clear all

%% define the images we want to deal with
% load one locally
% or from weblink! in this case, one of my "splash photos" from flickr

url = 'https://farm8.staticflickr.com/7202/6939062164_aeb3cb2562.jpg';
filename = 'lemon-splash.png'; % there are both JPG and PNG versions

%% first get some info about the files / url
%  then read them in

imfinfo(url)
imfinfo(filename)

im1 = imread(url);
im2 = imread(filename);


%% convert an RGB image to gray scale
im1gray = rgb2gray(im1);
im2gray = rgb2gray(im1);

%% histogram before adjustment
figure, imhist(im1gray), title('Image 1 - gray - before')

%% use the image processing toolbox to adjust image...
figure, imtool(im1gray)

% to save out after adjustments, you can use the 
% File -> Export to Workspace option . pick a variable name

% and do another imhist() call, to new image, so see how it has changed.


