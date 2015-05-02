function [markedImage]=slidingWindow(image),
    load('config');
    clusterpoints=[];
    thisimage=image;
    if(datasetused==1 && normalized==0 && windowsize==816),
        load('InriaSVM_Unnormalized_8x16.mat');
    elseif(datasetused==1 && normalized==1 && windowsize==816),
        load('InriaSVM_normalized_8x16.mat');
    elseif(datasetused==1 && normalized==0 && windowsize==48),
        load('InriaSVM_Unnormalized_4x8.mat');
    elseif(datasetused==1 && normalized==1 && windowsize==48),
        load('InriaSVM_normalized_4x8.mat');
    elseif(datasetused==2 && normalized==0 && windowsize==816),
        load('MITSVM_Unnormalized_8x16.mat');
    elseif(datasetused==2 && normalized==1 && windowsize==816),
        load('MITSVM_normalized_8x16.mat');
    elseif(datasetused==2 && normalized==0 && windowsize==48),
        load('MITSVM_Unnormalized_4x8.mat');
    elseif(datasetused==2 && normalized==1 && windowsize==48),
        load('MITSVM_normalized_4x8.mat');
    elseif(datasetused==3 && normalized==0 && windowsize==816),
        load('CombinedSVM_Unnormalized_8x16.mat');
    elseif(datasetused==3 && normalized==1 && windowsize==816),
        load('CombinedSVM_normalized_8x16.mat');
    elseif(datasetused==3 && normalized==0 && windowsize==48),
        load('CombinedSVM_Unnormalized_4x8.mat');
    elseif(datasetused==3 && normalized==1 && windowsize==48),
        load('CombinedSVM_normalized_4x8.mat');
    end
    [I1,I2,I3,I4,I5]=createPyramid(image);
    
    for im=1:5,
        if(im==1),
            thisimage=I1;
            integralimage=integral(I1);
            step1=8*1;
        elseif(im==2),
            thisimage=I2;
            integralimage=integral(I2);
            step1=8*1;
        elseif(im==3),
            thisimage=I3;
            integralimage=integral(I3);
            step1=8*1;
        elseif(im==4),
            thisimage=I4;
            integralimage=integral(I4);
            step1=8*1;
        else,
            thisimage=I5;
            integralimage=integral(I5);
            step1=8*1;
        end
        figure(2);
        clf;
        imshow(thisimage);
        windowlimitx=size(thisimage,2)-64;
        windowlimity=size(thisimage,1)-128;
        shapeInserter = vision.ShapeInserter;
        for y=1:step1:windowlimity,
            for x=1:step1:windowlimitx,
                
                im=thisimage(y:y+127,x:x+63,:);
                %% Integral Implementation
                %% feature=extractFeature(im);
                feature=extractFeatureFromIntegral(im,integralimage,x,y);
                %% Integral Implementation
                prediction=svmpredict(0, feature, svm);
                if (prediction==1),
                    figure;
                    imshow(im);
                    if(im==1),
                        clusterpoints=[clusterpoints;(y+64)*(1/scaleI1),(x+32)*(1/scaleI1)];
                    elseif(im==2),
                        clusterpoints=[clusterpoints;(y+64)*(1/scaleI2),(x+32)*(1/scaleI2)];
                    elseif(im==3),
                        clusterpoints=[clusterpoints;(y+64)*(1/scaleI3),(x+32)*(1/scaleI3)];
                    elseif(im==4),
                        clusterpoints=[clusterpoints;(y+64)*(1/scaleI4),(x+32)*((1/scaleI4))];
                    else
                        clusterpoints=[clusterpoints;(y+64)*(1/scaleI5),(x+32)*(1/scaleI5)];
                    end
                    clusterpoints
                end
            end
        end
    end    
    figure;
    imshow(image);
    hold on;
    plot(clusterpoints(:,1),clusterpoints(:,2),'.r');
    %% Call Mean Shift
 end