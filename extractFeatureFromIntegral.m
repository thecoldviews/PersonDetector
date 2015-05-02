function featurevector= extractFeatureFromIntegral(Im,integralImage,x,y),
    if(windowsize==816),
        blockx=int32(x/8)+1;
        blocky=int32(y/8)+1;
        featurevector=[];
        for j=1:15,
            for k=1:7,
                featurevector=[featurevector, reshape(integralImage(blocky+j,blockx+k,:),[1,9])];
            end
        end
        figure(1);
        clf;
        subplot(1,2,1), subimage(hogDraw(integralImage(blocky:blocky+15,blockx:blockx+7,:)));
        subplot(1,2,2), subimage(Im);
    else,
        blockx=int32(x/16)+1;
        blocky=int32(y/16)+1;
        featurevector=[];
        for j=1:7,
            for k=1:3,
                featurevector=[featurevector, reshape(integralImage(blocky+j,blockx+k,:),[1,9])];
            end
        end
        figure(1);
        clf;
        subplot(1,2,1), subimage(hogDraw(integralImage(blocky:blocky+7,blockx:blockx+3,:)));
        subplot(1,2,2), subimage(Im);
    end
    
    drawnow;
end