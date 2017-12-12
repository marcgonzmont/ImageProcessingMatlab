clear all, close all, clc
%% READ IMAGES AND WORK ON EACH ONE
path = '..\..\Data\HSWVA\barcodeimages';
img_inf = dir(fullfile(path,'*.jpg'));
img_name = natsortfiles({img_inf.name});
scale = 0.5;
k_med = [9,9];
k_close = [21,7];
k_e_c = 3;
times = 4;
threshold = 200;
for img = 1:numel(img_name)
    file = fullfile(path, img_name{img});
    barCodeDetect( file, scale, threshold, k_med, k_close, k_e_c, times )
    
    k = waitforbuttonpress;
    if ~k
        pause;
    elseif k == 1
        continue;
    end
    
end
close all