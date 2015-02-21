test_file = 'INRIAPerson/Test/pos/crop_000002.png';
test_dir = 'INRIAPerson/Test/pos/';
xml_filename = 'humanDetector.xml';
output_dir = 'detection_output/';

mkdir(out_dir)

detector = vision.CascadeObjectDetector('humanDetector.xml');
img = imread(test_file);
detector.MergeThreshold
bbox = step(detector, img);
detectedImg = insertObjectAnnotation(img, 'rectangle', bbox, 'human');
figure; imshow(detectedImg);

write_detection_result(test_dir, detector, output_dir, 'human')
