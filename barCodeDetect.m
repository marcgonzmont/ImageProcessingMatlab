function barCodeDetect( file, scale, k_med, k_close, k_e_c, times )
%BARCODEDETECT Summary of this function goes here
%   Detailed explanation goes here
    % Gradient computation
    original = imresize(imread(file), scale);
    img_grad = getGradXY(original);
    % Median filter
    img_cln = medfilt2(img_grad, k_med);
    % img_cln = imgaussfilt(img_grad, k_med);
    % Use Otsu threshold due to the poor results with a threshold 200/255
    [counts,~] = imhist(img_cln);
    thr = otsuthresh(counts);
    img_thresh = imbinarize(img_cln, thr);
    img_thresh = imgCleanC(img_thresh, k_close);
    img_thresh = imgCleanED( img_thresh, k_e_c, times );
    figure('Name','Codebar Detection','NumberTitle','off');
    imshow(original);
    hold on;
    stats = sortrows(regionprops('table', img_thresh, 'Area', 'BoundingBox'), 1, 'descend');
    [~,index] = max([stats.Area]);
    
    bbox = stats.BoundingBox(index,:);
    rectangle('Position', [bbox(1),bbox(2),bbox(3),bbox(4)], ...
         'EdgeColor','r','LineWidth',2 );
    
%     for k=1:length(stats.BoundingBox)
%         bbox = stats.BoundingBox(k, :);
%         rectangle('Position', [bbox(1),bbox(2),bbox(3),bbox(4)],...
%         'EdgeColor','r','LineWidth',2 )
%     end

    hold off;

end

