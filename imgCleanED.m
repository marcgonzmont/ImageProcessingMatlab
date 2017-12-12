function [ bin_img ] = imgCleanED( bin_img, dim, times )
%IMGCLEAN Summary of this function goes here
%   Detailed explanation goes here
SE = strel('square', dim);
% 2 times erode
for i=1:times
    bin_img = imerode(bin_img, SE);
end
% 2 times dilated
for i=1:times
    bin_img = imdilate(bin_img, SE);
end
end

