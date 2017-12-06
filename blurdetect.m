function blurdetect( blurred_path, blur_lvl )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

imagefiles = dir(fullfile(blurred_path,'*.png'));
nfiles = length(imagefiles);    % Number of files found

for ii=1:nfiles
    currentfilename = fullfile(blurred_path, imagefiles(ii).name);
    currentimage = imread(currentfilename);
    gray = rgb2gray(currentimage);
    lap = fspecial('laplacian', 0.2);
    lap_img = imfilter(double(gray), lap);
    
    position = [10 10];
    text_str = ['Variance: ' num2str(var(lap_img(:)))];
    img_text = insertText(gray, position,text_str,'FontSize',18,'BoxColor', 'white','BoxOpacity',0.7,'TextColor','red');
    
    figure(1);
    subplot(121);
    imshow(img_text);
    title("Blurred image");
    subplot(122);
    imshow(lap_img);
    title("Laplacian image");
    
    if var(double(lap_img(:))) > blur_lvl
        fprintf(2, "Image '%s' has %s of variance\n", imagefiles(ii).name, num2str(var(double(lap_img(:)))));
        fprintf(2, "Dleting image...\n\n");
        delete(currentfilename)
    else
        fprintf("Image '%s' has %s of variance\n", imagefiles(ii).name, num2str(var(double(lap_img(:)))));
    end
    
    k = waitforbuttonpress;
    if ~k
        pause;
    elseif k == 1
        continue;
    end
    
end

end

    