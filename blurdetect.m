function blurdetect( blurred_path )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

imagefiles = dir(fullfile(blurred_path,'*.jpg'));
nfiles = length(imagefiles);    % Number of files found

for ii=1:nfiles
    currentfilename = fullfile(blurred_path, imagefiles(ii).name);
    currentimage = imread(currentfilename);
    lap = fspecial('laplacian', 0.2);
    img = imfilter(currentimage, lap);
    disp(size(currentimage));
    disp(size(img));
%     fprintf("Variance of the image: %1.4f\n", num2str(var(double(img))));
    fprintf("Variance of the image (lap): %1.4f\n", num2str(max(var(double(img(:))))));
    fprintf("Variance of the image (lap): %s\n", num2str(max(var(double(img(:))))));
    fprintf("Variance of the image (img): %1.4f\n", num2str(max(var(double(currentimage(:))))));
    fprintf("Variance of the image (img): %s\n", num2str(max(var(double(currentimage(:))))));
%     fprintf("Image %s has %1.4f of variance\n", imagefiles(ii).name, num2str(max(var(double(img)))));
%     fprintf("Image %s has %1.4f of variance (vect)\n\n", imagefiles(ii).name, num2str(max(var(double(img(:))))));
%     position = [10 10];
%     text_str = ['Variance: ' num2str(max(var(double(img(:)))),'%2.4f')];
%     img_text = insertText(currentimage, position,text_str,'FontSize',18,'BoxColor', 'white','BoxOpacity',0.7,'TextColor','red');
% %     imshow(img);
%     imshow(img_text);
%     k = waitforbuttonpress;
%     if ~k
%         pause;
%     elseif k == 1
%         continue;
%     end
    
end

end

    