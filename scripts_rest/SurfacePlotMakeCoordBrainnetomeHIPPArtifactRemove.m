%Anup Das
%20 September, 2019
%This program finds the coordinates for the hippocampus in the Brainnetome atlas for surface plotting

close all
clear all
clc

addpath(genpath('/oak/stanford/groups/menon/software/spm8/'))
Str_Subj = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_rest/Subject_Indices/Yeo_atlas/Individual/';

%Brainnetome roiFile
roiFile_Brainnetome = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_rest/BN_Atlas_246_2mm.nii';

%Brainnetome HIPP indices
HIPP = [215:218];

%load MNI coordinates from UPenn data
load('MNIAllSubjectFilledBipolar.mat');

%load files
load('FileListBipolarSherlock.mat')
load('ChIDBipolarArtifactRemove.mat')

%Extract folder names from FileList
for i=1:size(FileList,1)
    
    FolderNames{i,1} = FileList(i,:).folder;
    
end

    
SurfacePlotCoord = [];

load(strcat(Str_Subj, 'SubjIndGlobal_HIPP_Brainnetome_ArtifactRemove_1229'));

NSubjects = size(MNIAllSubjectFilledBipolar,1);
isFilledCell1 = cell(NSubjects,1);

for i_Subject = 1:NSubjects
    
    temp1 = 0;
    
    for j_Comb_Ind = 1:length(HIPP)
        
        temp1 = temp1 + FindRegionHO(MNIAllSubjectFilledBipolar{i_Subject,1}, roiFile_Brainnetome, HIPP(j_Comb_Ind));
        
    end

    isFilledCell1{i_Subject,1} = temp1;
    
end

%Extract necessary fields
for i=1:size(SubjInd,1)
    
    Sampjson = strcat('/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/data/Release_20171012_data/protocols/r1/subjects/',SubjInd{i,1},'/experiments/FR1/sessions/0/ephys/current_processed/sources.json');
    SampTypes = fields(jsondecode(fileread(Sampjson)));
    Strjson = strcat('/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/data/Release_20171012_data/protocols/r1/subjects/',SubjInd{i,1},'/experiments/FR1/sessions/0/behavioral/current_processed/task_events.json');
    Taskjson = jsondecode(fileread( Strjson));
    
    for j=1:size(Taskjson,1)
        
        EEGfile{j,1} = Taskjson(j,:).eegfile;
        EEGoffset{j,1} = Taskjson(j,:).eegoffset;
        Montage{j,1} = Taskjson(j,:).montage;
        Type{j,1} = Taskjson(j,:).type;
        
    end
    
    if strcmp(SubjInd{i,1}, 'R1216E')
        
        SizeEEGfile = size(EEGfile,1);
        EEGfile(1:SizeEEGfile) = {'R1216E_FR1_0_15Sep16_2125'};
        
    end
    
    CountStart = find(ismember(Type,'COUNTDOWN_START') == 1);
    CountEnd = find(ismember(Type,'COUNTDOWN_END') == 1);
    
    EEGfiletemp = EEGfile(~cellfun('isempty',EEGfile)) ;
    TypeEEGfiles = unique(EEGfiletemp);
    
    StrData = strcat('/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/data/Release_20171012_data/protocols/r1/subjects/',SubjInd{i,1},'/experiments/FR1/sessions/0/ephys/current_processed/noreref/');
    
    N_Samples1236 = 3218660;
    N_Samples1230 = 3334835;
    N_Samples1207 = 3622806;
    
    MinLen = min(length(CountStart), length(CountEnd));
    
    j=1;
    
    FileIdx = strcat('/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/data/Release_20171012_data/protocols/r1/subjects/',SubjInd{i,1},'/localizations/',Montage{CountStart(j),1}(1,1),'/montages/',Montage{CountStart(j),1}(1,3),'/neuroradiology/current_processed');
    MNICoordIdx = find(ismember(FolderNames,FileIdx) == 1);
    ChIDVec = ChID{MNICoordIdx,1};
    RegXVec = isFilledCell1{MNICoordIdx,1};
    RegXIdx = find(RegXVec==1);
    MNIAllSubjVec = MNIAllSubjectFilledBipolar{MNICoordIdx,1};
    
    
    %Do for RegX
    for i_RegX = 1:length(RegXIdx)
        
        ChIDNum1 = ChIDVec(RegXIdx(i_RegX),1);
        ChIDNum2 = ChIDVec(RegXIdx(i_RegX),2);
        
        if ((ChIDNum1~=0) && (ChIDNum2~=0))
            
            SurfacePlotCoord = [SurfacePlotCoord; MNIAllSubjVec(RegXIdx(i_RegX),:)];
            
        end
        
    end
    
    clear EEGfile EEGoffset Montage Type
    
end

%clear cells
clear isFilledCell1

save('SurfacePlotCoordBrainnetome_HIPP_ArtifactRemove_1229.mat','SurfacePlotCoord');










