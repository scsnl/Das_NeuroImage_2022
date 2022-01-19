%Anup Das
%28 March, 2020
%This program finds the electrode types in the Yeo atlas for the seven
%networks

close all
clear all
clc

addpath(genpath('/oak/stanford/groups/menon/software/spm8/'))
addpath /oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_rest/Yeo2011/Anup_Create/Networks_7;
Str_Masks = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_rest/Yeo2011/Anup_Create/Networks_7/';
Str_Subj = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_rest/Subject_Indices/Yeo_atlas/Individual/';

%load MNI coordinates from UPenn data
load('MNIAllSubjectFilledBipolar.mat');

%Load electrode type for all subjects
load('ElectrodeTypeBipolarArtifactRemove.mat');

%load files
load('FileListBipolarSherlock.mat')
load('ChIDBipolarArtifactRemove.mat')

%Extract folder names from FileList
for i=1:size(FileList,1)
    
    FolderNames{i,1} = FileList(i,:).folder;
    
end

StrSave = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_rest/ElectrodeType_Results/Yeo_atlas/';

for i_interDMN = 1:7
    
    ElectrodeTypeGlobal = {};
    count = 0;
    
    load(strcat(Str_Subj, 'SubjIndGlobal_', num2str(i_interDMN),'_Yeo2011_ArtifactRemove'));
        
    NSubjects = size(MNIAllSubjectFilledBipolar,1);
    isinterDMNFilledCell1 = cell(NSubjects,1);
    
    roiFile1 = strcat('Yeo2011_7Networks_MNI152_FreeSurferConformed1mm_', num2str(i_interDMN), '.nii');
    
    for i_Subject = 1:NSubjects
        
        isinterDMNFilledCell1{i_Subject,1} = FindRegionHO(MNIAllSubjectFilledBipolar{i_Subject,1}, strcat(Str_Masks,roiFile1), i_interDMN);
        
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
        RegXVec = isinterDMNFilledCell1{MNICoordIdx,1};
        RegXIdx = find(RegXVec==1);
        ElectrodeTypeVec = ElectrodeType{MNICoordIdx,1};
        
        
        %Do for RegX
        for i_RegX = 1:length(RegXIdx)
            
            ChIDNum1 = ChIDVec(RegXIdx(i_RegX),1);
            ChIDNum2 = ChIDVec(RegXIdx(i_RegX),2);
            
            if ((ChIDNum1~=0) && (ChIDNum2~=0))
                
                count = count+1;
                ElectrodeTypeGlobal{count,1} = ElectrodeTypeVec(RegXIdx(i_RegX),:);
                
            end
            
        end
        
        clear EEGfile EEGoffset Montage Type
        
    end
    
    %clear cells
    clear isinterDMNFilledCell1
    
    save(strcat(StrSave,'ElectrodeTypeGlobalYeo_',num2str(i_interDMN),'_ArtifactRemove.mat'),'ElectrodeTypeGlobal');
    
end








% %Find electrode type percentage
% Temp = {};
% load('ElectrodeTypeGlobalYeo_1_ArtifactRemove.mat')
% Temp = [Temp; ElectrodeTypeGlobal];
% load('ElectrodeTypeGlobalYeo_2_ArtifactRemove.mat')
% Temp = [Temp; ElectrodeTypeGlobal];
% load('ElectrodeTypeGlobalYeo_3_ArtifactRemove.mat')
% Temp = [Temp; ElectrodeTypeGlobal];
% load('ElectrodeTypeGlobalYeo_4_ArtifactRemove.mat')
% Temp = [Temp; ElectrodeTypeGlobal];
% load('ElectrodeTypeGlobalYeo_5_ArtifactRemove.mat')
% Temp = [Temp; ElectrodeTypeGlobal];
% load('ElectrodeTypeGlobalYeo_6_ArtifactRemove.mat')
% Temp = [Temp; ElectrodeTypeGlobal];
% Others = Temp;
% 
% Temp = {};
% load('ElectrodeTypeGlobalYeo_7_ArtifactRemove_1229.mat')
% Temp = [Temp; ElectrodeTypeGlobal];
% load('ElectrodeTypeGlobalBrainnetome_HIPP_ArtifactRemove_1229.mat')
% Temp = [Temp; ElectrodeTypeGlobal];
% DMN = Temp;
% 
% Grid_N_Others = 0;
% Strip_N_Others = 0;
% Depth_N_Others = 0;
% 
% for i=1:length(Others)
%     
%     if strcmp(Others{i,1}, 'D')
%         
%         Depth_N_Others = Depth_N_Others + 1;
%         
%     end
%     
%     if strcmp(Others{i,1}, 'S')
%         
%         Strip_N_Others = Strip_N_Others + 1;
%         
%     end
%     
%     if strcmp(Others{i,1}, 'G')
%         
%         Grid_N_Others = Grid_N_Others + 1;
%         
%     end
%     
% end
% 
% All_N_Others = Grid_N_Others + Strip_N_Others + Depth_N_Others;
% Grid_Per_Others = Grid_N_Others*100/All_N_Others;
% Strip_Per_Others = Strip_N_Others*100/All_N_Others;
% Depth_Per_Others = Depth_N_Others*100/All_N_Others;
% 
% 
% 
% 
% Grid_N_DMN = 0;
% Strip_N_DMN = 0;
% Depth_N_DMN = 0;
% 
% for i=1:length(DMN)
%     
%     if strcmp(DMN{i,1}, 'D')
%         
%         Depth_N_DMN = Depth_N_DMN + 1;
%         
%     end
%     
%     if strcmp(DMN{i,1}, 'S')
%         
%         Strip_N_DMN = Strip_N_DMN + 1;
%         
%     end
%     
%     if strcmp(DMN{i,1}, 'G')
%         
%         Grid_N_DMN = Grid_N_DMN + 1;
%         
%     end
%     
% end
% 
% All_N_DMN = Grid_N_DMN + Strip_N_DMN + Depth_N_DMN;
% Grid_Per_DMN = Grid_N_DMN*100/All_N_DMN;
% Strip_Per_DMN = Strip_N_DMN*100/All_N_DMN;
% Depth_Per_DMN = Depth_N_DMN*100/All_N_DMN;














