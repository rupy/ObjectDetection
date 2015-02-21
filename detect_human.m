test_file = 'INRIAPerson/Test/pos/crop_000002.png';
test_dir = 'INRIAPerson/Test/pos/';
xml_filename = 'humanDetector.xml';
output_dir = 'detection_output/';

mkdir(output_dir)

detector = vision.CascadeObjectDetector('humanDetector.xml');

show_detection_results(test_file, detector)

write_detection_results(test_dir, detector, output_dir, 'human')
