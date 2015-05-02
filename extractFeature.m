function featurevector = extractFeature(im),
    [cellrep,Im]=HOG(im);
    featurevector=[];
    for j=1:size(cellrep,1),
        for k=1:size(cellrep,2),
            featurevector=[featurevector, reshape(cellrep(j,k,:),[1,9])];
        end
    end
    figure(1);
    clf;
    subplot(1,2,1), subimage(hogDraw(cellrep));
    subplot(1,2,2), subimage(Im);
end