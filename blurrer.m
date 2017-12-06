function blurrer( in_path, out_path )
%BLURRER function applys a blur filter over all images in source path
% and saves the results in other path
%   in_path: source path
%   out_path: destiny path

imagefiles = dir(fullfile(in_path,'*.jpg'));
nfiles = length(imagefiles);    % Number of files found
kernels = [5, 15, 21];

fprintf("Kernel size available: ");
disp(kernels);

for ii=1:nfiles
    msize = numel(kernels);
    k = kernels(randperm(msize, 1));
    currentfilename = fullfile(in_path, imagefiles(ii).name);
    [~, name, ext] = fileparts(currentfilename);
    new_name = strcat(name,'_blurred',ext);
%     fprintf("Smoothed image '%s' with kernel size %d\n", currentfilename, k);
    currentimage = imread(currentfilename);
    img_blurred = imgaussfilt(currentimage,[k,k]);
%     img_blurred = imgaussfilt(currentimage,[k,k],'FilterSize', k);
    imwrite(img_blurred, fullfile(out_path, new_name));
end

end