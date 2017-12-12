function colorTracking( frame_name, lower_color, upper_color, dim )
%COLORTRACKING Summary of this function goes here
%   Detailed explanation goes here
%     imshow(fullfile(path, frame_name{frame}));
    img = imread(frame_name);
    [BW, ~] = maskHSV( img, lower_color, upper_color );
    img_cln = imgClean(BW, dim);
    stats = regionprops('table', img_cln, 'Centroid', 'Area', 'MajorAxisLength', 'MinorAxisLength');
    [maxValue,index] = max([stats.Area]);
    imshow(img);
    if maxValue >= 1000
        center = stats.Centroid(index,:);
        diameter = mean([stats.MajorAxisLength(index) stats.MinorAxisLength(index)],2);
        radio = diameter/2;
        hold on
        viscircles(center,radio,'Color','g');
        viscircles(center,radio*0.1,'Color','r');
        hold off
    end
    

end

