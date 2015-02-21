cd 'object_detection'
pos_dir = 'INRIAPerson/Train/cropped';
neg_dir = 'INRIAPerson/Train/neg';
addpath(pos_dir)

xml_filename = 'humanDetector.xml';

positive_instances = create_positive_instances(pos_dir);
trainCascadeObjectDetector(xml_filename, positive_instances, neg_dir,'FalseAlarmRate', 0.5, 'NumCascadeStages', 20,'TruePositiveRate', 0.95, 'FeatureType', 'HOG');

xml_prefix = 'humanDetector';
train_with_many_params(xml_prefix, positive_instances, neg_dir);