
%% ENVIRONMENT CONFIGURATION
% clear all
clear all
close all
clc

% Define source and destiny path
source_path = fullfile('..','Data\HSWVA\Images');
destiny_path = fullfile('..','Data\HSWVA\Images','Results','Blurred');
disp('--- INFORMATION ---')
fprintf('Source path: %s\nDestiny path: %s\n', source_path, destiny_path);

if 7 == exist(source_path, 'dir')
    % Create the new folder if it doesn't exist
    [status,msg] = mkdir(destiny_path);
    if status
        blurrer(source_path, destiny_path)
    else
        fprintf("Error in 'mkdir' function: %s",msg);
    end
else
    fprintf('The path %s does not exist', source_path);
end
