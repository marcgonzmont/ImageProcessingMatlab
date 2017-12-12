%% DEFINE THE ENVIRONMENT
close all, clear all, clc;
video_name = '';
path = '..\..\Data\HSWVA\frames';
lower_color = [29 43 126];
upper_color = [88 255 255];
dim = 5; % dimension of squared structuring element
times = 2;

%% READ THE VIDEO AND WORK ON EACH FRAME
if exist(video_name, 'var') == 1
    % checkVideo(file_name);
    % fmts = VideoReader.getFileFormats();

    video = VideoReader(video_name);
    while hasFrame(video)
        frame = readFrame(video);
        colorTracking(frame, lower_color, upper_color, dim, times);
        pause(0.033);
    end
else
%% READ FRAMES AND WORK ON EACH ONE
    % Using natsortfiles. See: https://goo.gl/q3EMM3
    frame_inf = dir(fullfile(path,'*.jpg'));
    frame_name = natsortfiles({frame_inf.name});
    for frame = 1:numel(frame_name)
        file = fullfile(path, frame_name{frame});
        colorTracking(file, lower_color, upper_color, dim, times);
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
