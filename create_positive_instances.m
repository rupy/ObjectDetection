function [ positive_instances ] = create_positive_instances( pos_dir )
%CREATE_POSITIVE_INSTANCES create positiveInstances for trainCascadeObjectDetector
%positive_instances is struct array of imageFilename and objectBoundingBoxes

positive_instances = struct([]);
pos_files = dir(pos_dir);

count = 1;
for i=1:length(pos_files)
    % skip hidden files , .. and .
    dot_file = regexp(pos_files(i).name, '^\.', 'ONCE');
    if ~isempty(dot_file)
        disp(strcat('skipping: ', pos_files(i).name));
        continue;
    end
    
    % get image file name
    path = strcat(pos_dir, '/', pos_files(i).name);
    positive_instances(count).imageFilename = path;
    
    % get bounding boxes
    img = imread(path);
    img_size = size(img);
    positive_instances(count).objectBoundingBoxes = [1 1 img_size(2) img_size(1)];
    
    count = count + 1;
end

end

