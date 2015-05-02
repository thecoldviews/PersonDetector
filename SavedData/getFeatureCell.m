function tempCell=getFeatureCell(folderpath,step); 
    addpath('C:\Users\iiitd\Dropbox\Matlab Workspace\CV Project');
    files=dir(folderpath);
    usefulFiles=files(3:size(files,1));
    tempCell=[];
    
    for i=1:step:size(usefulFiles,1),
        usefulFiles(i).name;
        temp=imread(usefulFiles(i).name);
        tempCell{ceil(i/step)}=[HOG(temp)];
    end
end