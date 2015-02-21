cd 'object_detection'
pos_dir = 'INRIAPerson/Train/cropped';
neg_dir = 'INRIAPerson/Train/neg';
addpath(pos_dir)

xml_filename = 'humanDetector.xml';

positive_instances = create_positive_instances(pos_dir);
trainCascadeObjectDetector(xml_filename, positive_instances, neg_dir,'FalseAlarmRate', 0.2, 'NumCascadeStages', 20,'TruePositiveRate', 0.95, 'FeatureType', 'HOG');
