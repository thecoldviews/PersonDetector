function [I1,I2,I3,I4,I5]=createPyramid(img),
    load('config.mat');
    I1 = imresize(img, scaleI1);
    I2 = imresize(img, scaleI2);
    I3 = imresize(img, scaleI3);
    I4 = imresize(img, scaleI4);
    I5 = imresize(img, scaleI5);
end