
%% ENVIRONMENT CONFIGURATION
% clear all
clear all
close all
clc

% Define source and destiny path
source_path = fullfile('..','..','Data\HSWVA\Images');
destiny_path = fullfile('..','..','Data\HSWVA\Images','Results','Blurred');
blur_lvl = 90;
kernels = [5, 15, 21];
disp('--- INFORMATION ---')
fprintf("Source path: '%s'\nDestiny path: '%s'\nBlur level: %s\n\n", source_path, destiny_path, num2str(blur_lvl));
%% MANIPULATING DATA
if 7 == exist(source_path, 'dir')
    % Create the new folder if it doesn't exist
    [status,msg] = mkdir(destiny_path);
    if status
        % GENERATE THE BLURRED COLLECTION
        disp("Generating blurred collection...");
        % generate blurred images
        blurrer(source_path, destiny_path, kernels);
        disp("DONE!\n");
        disp("Detecting blurred value...\n");
        % detect blurred level images
        blurdetect(destiny_path, blur_lvl);
    else
        fprintf(2, "Error in 'mkdir' function: %s\n",msg);
    end
else
    fprintf(2, "The path '%s' does not exist\n", source_path);
end
