function Matrix = cell2matrix(Cell)
Matrix=[];
for i=1:size(Cell,2),
    TrainPosRow=[];
    mat=cell2mat(Cell(i));
    for j=1:size(mat,1),
        for k=1:size(mat,2),
            TrainPosRow=[TrainPosRow, reshape(mat(j,k,:),[1,9])];
        end
    end
    Matrix=[Matrix;TrainPosRow];
end