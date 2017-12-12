function [ img_close ] = imgCleanC( img_thresh, k_close )
%IMGCLEANC Summary of this function goes here
%   Detailed explanation goes here
    SE = strel('rectangle', k_close);
    img_close = imclose(img_thresh, SE);

end

