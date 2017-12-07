function [ bin_img ] = imgClean( bin_img, dim )
%IMGCLEAN Summary of this function goes here
%   Detailed explanation goes here
SE = strel('square', dim);
% 2 times erode
bin_img = imerode(bin_img, SE);
bin_img = imerode(bin_img, SE);
% 2 times dilated
bin_img = imdilate(bin_img, SE);
bin_img = imdilate(bin_img, SE);
end

