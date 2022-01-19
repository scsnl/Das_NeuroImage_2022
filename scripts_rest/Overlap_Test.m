%Anup Das
%10 June, 2019
%Overlap test for Yeo and Brainnetome atlases

close all
clear all
clc

addpath(genpath('/oak/stanford/groups/menon/software/spm8/'))
addpath /oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_rest/Yeo2011/Anup_Create/Networks_7;
Str_Masks_Yeo = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_rest/Yeo2011/Anup_Create/Networks_7/';

%Brainnetome roiFile
roiFile_Brainnetome = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_rest/BN_Atlas_246_2mm.nii';

%Brainnetome PHG and HIPP indices
%PHG_HIPP = [109:116, 119:120, 215:218];
PHG_HIPP = [215:218];

%load MNI coordinates from UPenn data
load('MNIAllSubjectFilledBipolar.mat');

%load files
load('FileListBipolarSherlock.mat')
load('ChIDBipolar.mat')

%Extract folder names from FileList
for i=1:size(FileList,1)
    
    FolderNames{i,1} = FileList(i,:).folder;
    
end
        
NSubjects = size(MNIAllSubjectFilledBipolar,1);
isinterDMNFilledCell1 = cell(NSubjects,1);
isinterDMN1 = zeros(NSubjects,1);
isinterDMNFilledCell2 = cell(NSubjects,1);
isinterDMN2 = zeros(NSubjects,1);

i_Index = 1;

roiFile2 = strcat('Yeo2011_7Networks_MNI152_FreeSurferConformed1mm_', num2str(i_Index), '.nii');

Array = [];
Count = 0;

for i_Subject = 1:NSubjects
    
    temp1 = 0;
    
    for j_Comb_Ind = 1:length(PHG_HIPP)
        
        temp1 = temp1 + FindRegionHO(MNIAllSubjectFilledBipolar{i_Subject,1}, roiFile_Brainnetome, PHG_HIPP(j_Comb_Ind));
        
    end
    
    temp2 = FindRegionHO(MNIAllSubjectFilledBipolar{i_Subject,1}, strcat(Str_Masks_Yeo,roiFile2), i_Index);
    if sum(temp2)>0
        isinterDMN2(i_Subject)=1;
    end
    isinterDMNFilledCell2{i_Subject,1}=temp2;
    
    if ~isempty(intersect(find(temp1==1), find(temp2==1)))
    
        Count = Count+1;
        Array = [Array; intersect(find(temp1==1), find(temp2==1))];
        SubjInd{1, Count} = i_Subject;
        
    end
    
end













