function blurrer( in_path, out_path )
%BLURRER function applys a blur filter over all images in source path
% and saves the results in other path
%   in_path: source path
%   out_path: destiny path

% in_path = fullfile(in_path,'*.png');
imagefiles = dir(fullfile(in_path,'*.png'));
nfiles = length(imagefiles);    % Number of files found

for ii=1:nfiles
   currentfilename = imagefiles(ii).name;
   currentimage = imread(fullfile(in_path, currentfilename));
%    imshow(currentimage);
   
end

end