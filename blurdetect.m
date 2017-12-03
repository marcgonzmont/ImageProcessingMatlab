function blurdetect( blurred_path )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

imagefiles = dir(fullfile(blurred_path,'*.png'));
nfiles = length(imagefiles);    % Number of files found

for ii=1:nfiles
    currentfilename = fullfile(blurred_path, imagefiles(ii).name);
    currentimage = imread(currentfilename);
    lap = fspecial('laplacian', 0.2);
    img = imfilter(currentimage, lap);
    fprintf("Image %s has %1.5f of variance\n", imagefiles(ii).name, max(var(double(img(:)))));
    position = [10 10];
    text_str = ['Variance: ' num2str(max(var(double(img(:)))),'%1.4f')];
    img_text = insertText(currentimage, position,text_str,'FontSize',18,'BoxColor', 'white','BoxOpacity',0.7,'TextColor','red');
    imshow(img_text);
    k = waitforbuttonpress;
    if ~k
        pause;
    elseif k == 1
        continue;
%     elseif strcmp(k, 'esc')
%         breack;
    end
    
end

end

    