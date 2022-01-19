%Anup Das
%25 September, 2018
%This program finds the MNI coordinates of bipolar electrodes

close all;
clear all;
clc;

Folder   = 'Y:\projects\a1das\2018_ECoG_Project\Release_20171012\protocols\r1\subjects\';
load('FileListBipolar.mat');%FileList = dir(fullfile(Folder, '**', 'pairs.json'));
Njson = size(FileList,1);
MNIAllSubjectBipolar = cell(Njson,1);

for i=1:Njson
    
    d = dir(FileList(i).folder);
    B = jsondecode(fileread(strcat(FileList(i).folder,'\',d(4).name)));
    dynamicPath = {char(fieldnames(B)) 'pairs'};
    D = getfield(B, dynamicPath{:});
    Npairs = size(fieldnames(D),1);
    E = fieldnames(D);
    MNITemp = zeros(Npairs,3);
    
    for j=1:Npairs
        
        dynamicPath = {char(E{j}) 'atlases'};
        AtlasTemp=getfield(D, dynamicPath{:});
        
        if find(ismember( fieldnames(AtlasTemp),'mni'))
        
            dynamicPath = {char(E{j}) 'atlases' 'mni' 'x'};
            MNITemp(j,1) = getfield(D, dynamicPath{:});
            dynamicPath = {char(E{j}) 'atlases' 'mni' 'y'};
            MNITemp(j,2) = getfield(D, dynamicPath{:});
            dynamicPath = {char(E{j}) 'atlases' 'mni' 'z'};
            MNITemp(j,3) = getfield(D, dynamicPath{:});
            
        end
   
    end
    
    MNIAllSubjectBipolar{i} = MNITemp;
    
end

save('MNIAllSubjectBipolar.mat','MNIAllSubjectBipolar');


