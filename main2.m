%% DEFINE THE ENVIRONMENT
close all, clear all, clc;
% video_name = '..\..\Data\HSWVA\lapiz.avi';
lower_color = [29 43 126];
upper_color = [88 255 255];
dim = 5; % dimension of squared structuring element

%% READ THE VIDEO AND WORK ON EACH FRAME
if exist(video_name) == 1 
    % checkVideo(file_name);
    % fmts = VideoReader.getFileFormats();

    video = VideoReader(video_name);
    while hasFrame(video)
        frame = readFrame(video);
        colorTracking(frame, lower_color, upper_color, dim);
        pause(0.033);
    end
else
%% READ FRAMES AND WORK ON EACH ONE
    % Using natsortfiles. See: https://goo.gl/q3EMM3
    path = '..\..\Data\HSWVA\frames';
    frame_inf = dir(fullfile(path,'*.jpg'));
    frame_name = natsortfiles({frame_inf.name});
%     pts = int8.empty(20);
    for frame = 1:numel(frame_name)
        file = fullfile(path, frame_name{frame});
        colorTracking(file, lower_color, upper_color, dim);
        pause(0.033);
    end
end
close all


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
