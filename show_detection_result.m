function show_detection_result( test_file, detector )
%SHOW_DETECTION_RESULT show a detection result in new window

img = imread(test_file);
detector.MergeThreshold
bbox = step(detector, img);
detectedImg = insertObjectAnnotation(img, 'rectangle', bbox, 'human');
figure; imshow(detectedImg);

end

