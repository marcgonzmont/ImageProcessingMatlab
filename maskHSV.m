function [ BW, maskedRGBImage ] = maskHSV( img_RGB, lower_color, upper_color )
%MASKHSV Summary of this function goes here
%   Detailed explanation goes here
% Convert RGB image to HSV image
img_HSV = rgb2hsv(img_RGB);
channel1Min = lower_color(1)/178;
channel1Max = upper_color(1)/178;

% Define thresholds for 'Saturation'
channel2Min = lower_color(2)/256;
channel2Max = upper_color(2)/256;

% Define thresholds for 'Value'
channel3Min = lower_color(3)/256;
channel3Max = upper_color(3)/256;

% Create mask based on chosen histogram thresholds
BW = ( (img_HSV(:,:,1) >= channel1Min) & (img_HSV(:,:,1) <= channel1Max) ) & ...
    (img_HSV(:,:,2) >= channel2Min ) & (img_HSV(:,:,2) <= channel2Max) & ...
    (img_HSV(:,:,3) >= channel3Min ) & (img_HSV(:,:,3) <= channel3Max);



% Initialize output masked image based on input image.
maskedRGBImage = img_RGB;

% Set background pixels where BW is false to zero.
maskedRGBImage(repmat(~BW,[1 1 3])) = 0;

end

