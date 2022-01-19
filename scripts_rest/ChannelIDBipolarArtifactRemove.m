%Anup Das
%13 June, 2019
%This program finds the channel indices in the pairs.json files excluding the artifactual channels

close all;
clear all;
clc;

Str = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_rest/Release_Metadata_20171010/electrode_categories/';

load('FileListBipolarSherlock.mat');
Njson = size(FileList,1);
ChID = cell(Njson,1);

for i=1:Njson
    
    d = dir(FileList(i).folder);
    Folder = FileList(i).folder;
    
    elec_categ_data = upper(importdata(strcat(Str,Folder(114:119),'_electrode_categories.txt')));
    elec_categ_data = strrep(elec_categ_data,' ','');
    elec_categ_data = strrep(elec_categ_data,'-','_');
    
    B = jsondecode(fileread(strcat(FileList(i).folder,'/',d(4).name)));
    dynamicPath = {char(fieldnames(B)) 'pairs'};
    D = getfield(B, dynamicPath{:});
    Nelec = size(fieldnames(D),1);
    E = fieldnames(D);
    ChIDTemp = zeros(Nelec,2);
    
    for j=1:Nelec
        
        dynamicPath1 = {char(E{j}) 'channel_1'};
        dynamicPath2 = {char(E{j}) 'channel_2'};
        
        dynamicPath3 = {char(E{j}) 'code'};
        newStr = upper(split(getfield(D, dynamicPath3{:}),'-'));
        
        if (isempty(find(ismember(elec_categ_data,newStr{1,1})))==1 && isempty(find(ismember(elec_categ_data,newStr{2,1})))==1)
        
            ChIDTemp(j,1) = getfield(D, dynamicPath1{:});
            ChIDTemp(j,2) = getfield(D, dynamicPath2{:});
            
        else
            
            ChIDTemp(j,1) = 0;
            ChIDTemp(j,2) = 0;
            
        end
        
    end
    
    ChID{i,1} = ChIDTemp;

end

save('ChIDBipolarArtifactRemove.mat','ChID');


