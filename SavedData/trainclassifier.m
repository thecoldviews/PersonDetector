function svm= trainclassifier(),
    disp('Obtaining Data.');
    [Matrix,Labels]=driverCode('./TrainingSet2/pos','./TrainingSet2/neg');
    disp('Obtained Data. Training Classifier.');
    svm=svmtrain(Labels',Matrix);
    save('MITSVM_Unnormalized_8x16','-struct','svm');
end