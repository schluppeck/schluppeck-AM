%% a handful of demos to showcase matlab / interactive use
% 
%
% ds 2018/04/12

%% start with a clean slate
clear all
close all


%% very simple command line things:

% simulate 500 roll or 2 dice
% what's their sum? on average? their distribution...?

d = randi(6, 2, 1000);
s = sum(d);

figure(1)
histogram(s, 'binmethod', 'integers')

xticks(2:12), xlabel('Combined score (2 dice)'), ylabel('Count') 
title(sprintf('# of throws = %d', numel(s)))

%% download an image and segment by color:

% a picture from my flickr stream...
% 'https://farm5.staticflickr.com/4026/4697729646_4bf10ab536_o.jpg'  --> https://goo.gl/85Mqvw


I = imread('https://goo.gl/85Mqvw');
imshow(I)

% then use APPS


%% interactive image viewer (part of mrTools)

fname = '/data/anatomy/freesurfer/subjects/ds/surfRelax/ds_mprage_pp.img';
mrVol(fname)

%% finding an isosurface from volume + render
% some code written by me (< 20 lines of script )

mlRenderAnat('subject=ds')