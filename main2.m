%% DEFINE THE ENVIRONMENT
close all, clear all, clc;
file_name = '..\..\Data\HSWVA\lapiz.avi';
image = imread('..\..\Data\HSWVA\frame16.jpg');
% img_hsv = rgb2hsv(image);
% Define the lower and upper color (HSV)
lower_color = [29 43 126];
upper_color = [88 255 255];

%% READ THE VIDEO AND WORK ON EACH FRAME
% checkVideo(file_name);

% video = VideoReader('lapiz.avi');
% fmts = VideoReader.getFileFormats();
% while hasFrame(video)
%     frame = readFrame(video);
%     [BW, masked] = maskHSV( frame, lower_color, upper_color );
% end
% whos frame
% 
figure(1);
subplot(131);
imshow(image);
title("Original image");
subplot(132);
imshow(BW);
title("Binary image");
subplot(133);
imshow(masked);
title("Masked image");