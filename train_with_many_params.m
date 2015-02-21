function train_with_many_params( xml_prefix, positive_instances, neg_dir )
%TRAIN_WITH_MANY_PARAMS train objects changing params

for f=0.1:0.1:1
    disp(f);
    xml_file = strcat(xml_prefix, strrep(num2str(f),'.','_'), '.xml');
    disp(xml_file);
    trainCascadeObjectDetector(xml_file, positive_instances, neg_dir,'FalseAlarmRate', f, 'NumCascadeStages', 20,'TruePositiveRate', 0.95, 'FeatureType', 'HOG');

end

