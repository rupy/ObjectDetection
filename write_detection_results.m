function write_detection_results( test_dir, detector, output_dir, title )
%WRITE_DETECTION_RESULTS write detection results with bounding box
test_files = dir(test_dir);
for i=1:length(test_files)
    
    % skip hidden files , .. and .
    si = regexp(test_files(i).name, '^\.', 'ONCE');
    if ~isempty(si)
        disp(strcat('skipping: ', test_files(i).name))
        continue;
    end

    % add boundingbox annotations
    disp(test_files(i).name)
    img = imread(strcat(test_dir, test_files(i).name));
    bbox = step(detector, img);
    detectedImg = insertObjectAnnotation(img, 'rectangle', bbox, title);
    
    % write a result
    path = strcat(output_dir, '/', test_files(i).name);
    imwrite(detectedImg, path);
end

end

