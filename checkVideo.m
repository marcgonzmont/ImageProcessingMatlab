function checkVideo( file_name )
%CHECKVIDEO Summary of this function goes here
%   Detailed explanation goes here
    formats = VideoReader.getFileFormats()
    filterSpec = getFilterSpec(formats)
    [filename,pathname] = uigetfile(filterSpec)
    info = aviinfo(filename)
end

