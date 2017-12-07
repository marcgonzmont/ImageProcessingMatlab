%% DEFINE THE ENVIRONMENT
close all, clear all, clc;
file_name = '..\..\Data\HSWVA\lapiz.avi';
% image = imread('..\..\Data\HSWVA\frame16.jpg');
path = '..\..\Data\HSWVA\frames';
% img_hsv = rgb2hsv(image);
% Define the lower and upper color (HSV)
lower_color = [29 43 126];
upper_color = [88 255 255];
dim = 5; %dimension of squared structuring element

%% READ THE VIDEO AND WORK ON EACH FRAME
% checkVideo(file_name);

% video = VideoReader('lapiz.avi');
% fmts = VideoReader.getFileFormats();
% while hasFrame(video)
%     frame = readFrame(video);
%     [BW, masked] = maskHSV( frame, lower_color, upper_color );
% end
% whos frame
%% READ FRAMES AND WORK ON EACH ONE
% Using natsortfiles. See: https://goo.gl/q3EMM3
frame_inf = dir(fullfile(path,'*.jpg'));
frame_name = natsortfiles({frame_inf.name});

for frame = 1:numel(frame_name(1))
%     imshow(fullfile(path, frame_name{frame}));
    img = imread(fullfile(path, frame_name{frame}));
    [BW, ~] = maskHSV( img, lower_color, upper_color );
    img_cln = imgClean(BW, dim);
    stats = regionprops('table',img_cln,'Centroid',...
    'Area')
    pause(0.033);
end


% figure(1);
% subplot(131);
% imshow(image);
% title("Original image");
% subplot(132);
% imshow(BW);
% title("Binary image");
% subplot(133);
% imshow(img_cln);
% title("Cleaned image");
