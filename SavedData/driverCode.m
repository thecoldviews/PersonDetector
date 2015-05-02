function [DataMatrix,Labels] = driverCode(folderpathpositive,folderpathnegative)
    % Input: A Folder with Images of size 64*128
    % Output: A Matrix with HOG Features computed for each image, depending on
    % constants set in the HOG function
    positivecell=getFeatureCell(folderpathpositive,1);
    posL=ones(1,size(positivecell,2));
    negativecell=getFeatureCell(folderpathnegative,3);
    negL=zeros(1,ceil(size(negativecell,2)));
    save('MITCellData_Unnormalized_8x16','positivecell','negativecell');
    Labels=[posL negL]
    DataMatrix=[cell2matrix(positivecell);cell2matrix(negativecell)];
    save('MITMatrixData_Unnormalized_8x16','DataMatrix','Labels');
end