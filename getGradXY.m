function [ img_grad ] = getGradXY( original )
%GETGRADXY Summary of this function goes here
%   Detailed explanation goes here
    img_r = rgb2gray(original);
    [Gmag, ~] = imgradient(img_r);
    img_grad = mat2gray(Gmag);
    
end

