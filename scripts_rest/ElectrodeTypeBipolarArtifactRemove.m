%Anup Das
%28 March, 2020
%This program finds the electrode types in the pairs.json files

close all;
clear all;
clc;

load('FileListBipolarSherlock.mat');
Njson = size(FileList,1);
ElectrodeType = cell(Njson,1);

for i=1:Njson
    
    d = dir(FileList(i).folder);
    Folder = FileList(i).folder;
    
    B = jsondecode(fileread(strcat(FileList(i).folder,'/',d(4).name)));
    dynamicPath = {char(fieldnames(B)) 'pairs'};
    D = getfield(B, dynamicPath{:});
    Nelec = size(fieldnames(D),1);
    E = fieldnames(D);
    ElectrodeTypeTemp = {};
    
    for j=1:Nelec
        
        dynamicPath1 = {char(E{j}) 'type_1'};
        ElectrodeTypeTemp{j,1} = upper(getfield(D, dynamicPath1{:}));
        
    end
    
    ElectrodeType{i,1} = ElectrodeTypeTemp;

end

save('ElectrodeTypeBipolarArtifactRemove.mat','ElectrodeType');




