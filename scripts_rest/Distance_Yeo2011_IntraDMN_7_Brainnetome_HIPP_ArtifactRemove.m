%Anup Das
%21 March, 2020
%Distance calculation for intra-DMN in the Yeo2011 atlas after including
%HIPP from the Brainnetome atlas

close all
clear all
clc

addpath(genpath('/oak/stanford/groups/menon/software/spm8/'))
addpath /oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_rest/Yeo2011/Anup_Create/Networks_7/Network7;
Str_Masks_Yeo = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_rest/Yeo2011/Anup_Create/Networks_7/Network7/';

%Brainnetome roiFile
roiFile_Brainnetome = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_rest/BN_Atlas_246_2mm.nii';

%Brainnetome HIPP indices
HIPP = [215:218];

%Distance values
DistanceVals_intraDMN = [];

%load MNI coordinates from UPenn data
load('MNIAllSubjectFilledBipolar.mat');

%load files
load('FileListBipolarSherlock.mat')
load('ChIDBipolarArtifactRemove.mat')

%Extract folder names from FileList
for i=1:size(FileList,1)
    
    FolderNames{i,1} = FileList(i,:).folder;
    
end

%save variables
StrSaveDistanceVals = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_rest/Distance_Results/Yeo_atlas/Intra_7/';

for i_intraDMN = 20:27
        
    NSubjects = size(MNIAllSubjectFilledBipolar,1);
    isintraDMNFilledCell1 = cell(NSubjects,1);
    isintraDMN1 = zeros(NSubjects,1);
    isintraDMNFilledCell2 = cell(NSubjects,1);
    isintraDMN2 = zeros(NSubjects,1);
    
    roiFile_Yeo = strcat('Network7_Clustrers_', num2str(i_intraDMN), '.nii');
    
    for i_Subject = 1:NSubjects
        
        temp1 = 0;
        
        for j_Comb_Ind = 1:length(HIPP)
            
            temp1 = temp1 + FindRegionHO(MNIAllSubjectFilledBipolar{i_Subject,1}, roiFile_Brainnetome, HIPP(j_Comb_Ind));
        
        end
        
        if sum(temp1)>0
            isintraDMN1(i_Subject)=1;
        end
        isintraDMNFilledCell1{i_Subject,1}=temp1;
        
        
        temp2 = FindRegionHO(MNIAllSubjectFilledBipolar{i_Subject,1}, strcat(Str_Masks_Yeo,roiFile_Yeo), i_intraDMN);
        if sum(temp2)>0
            isintraDMN2(i_Subject)=1;
        end
        isintraDMNFilledCell2{i_Subject,1}=temp2;
        
    end
    
    Intra_Index = intersect(find(isintraDMN1==1), find(isintraDMN2==1));
    
    %Extract subject indices
    if ~isempty(Intra_Index)
        
        for i=1:length(Intra_Index)
            
            d = dir(FileList(Intra_Index(i)).folder);
            SubjDir = d(1).folder;
            SubjInd{i,1} = SubjDir(114:119);
            
        end
        SubjInd = unique(SubjInd);
        
        %Find subjects with FR1
        count=1;
        for i=1:length(SubjInd)
            
            StrSub = strcat('/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/data/Release_20171012_data/protocols/r1/subjects/',SubjInd{i,1},'/experiments/FR1/sessions/0');
            
            if 7==exist(StrSub)
                
                SubjIndTemp{count,1} = SubjInd{i,:};
                count=count+1;
                
            end
            
        end
        
    end
    
    if exist('SubjIndTemp')
        
        SubjInd = SubjIndTemp;
        
        %Remove subjects with issues
        if ~isempty(find(ismember(SubjInd,'R1192C')==1))
            
            SubjInd(find(ismember(SubjInd,'R1192C')==1),:) = [];
            
        end
                
        if ~isempty(find(ismember(SubjInd,'R1198M')==1))
            
            SubjInd(find(ismember(SubjInd,'R1198M')==1),:) = [];
            
        end
        
        if ~isempty(find(ismember(SubjInd,'R1208C')==1))
            
            SubjInd(find(ismember(SubjInd,'R1208C')==1),:) = [];
            
        end
        
        if ~isempty(find(ismember(SubjInd,'R1236J')==1))
            
            SubjInd(find(ismember(SubjInd,'R1236J')==1),:) = [];
            
        end
        
        if ~isempty(find(ismember(SubjInd,'R1240T')==1))
            
            SubjInd(find(ismember(SubjInd,'R1240T')==1),:) = [];
            
        end
        
        if ~isempty(find(ismember(SubjInd,'R1281E')==1))
            
            SubjInd(find(ismember(SubjInd,'R1281E')==1),:) = [];
            
        end
        
        if ~isempty(find(ismember(SubjInd,'R1307N')==1))
            
            SubjInd(find(ismember(SubjInd,'R1307N')==1),:) = [];
            
        end      
        
        if ~isempty(find(ismember(SubjInd,'R1308T')==1))
            
            SubjInd(find(ismember(SubjInd,'R1308T')==1),:) = [];
            
        end
        
        if ~isempty(find(ismember(SubjInd,'R1309M')==1))
            
            SubjInd(find(ismember(SubjInd,'R1309M')==1),:) = [];
            
        end
        
        if ~isempty(find(ismember(SubjInd,'R1310J')==1))
            
            SubjInd(find(ismember(SubjInd,'R1310J')==1),:) = [];
            
        end
        
        if ~isempty(find(ismember(SubjInd,'R1311T')==1))
            
            SubjInd(find(ismember(SubjInd,'R1311T')==1),:) = [];
            
        end
        
        if ~isempty(find(ismember(SubjInd,'R1313J')==1))
            
            SubjInd(find(ismember(SubjInd,'R1313J')==1),:) = [];
            
        end
        
    else
        
        SubjInd = [];
        
    end
    
    SampFreq = [];
    
    if (~isempty(SubjInd))
        
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
            RegXVec = isintraDMNFilledCell1{MNICoordIdx,1};
            RegYVec = isintraDMNFilledCell2{MNICoordIdx,1};
            RegXIdx = find(RegXVec==1);
            RegYIdx = find(RegYVec==1);
            CoordTemp = MNIAllSubjectFilledBipolar{MNICoordIdx,1};
            
            
            for i_RegX = 1:length(RegXIdx)
                
                ChIDNum1 = ChIDVec(RegXIdx(i_RegX),1);
                ChIDNum2 = ChIDVec(RegXIdx(i_RegX),2);
                
                for i_RegY = 1:length(RegYIdx)
                    
                    ChIDNum3 = ChIDVec(RegYIdx(i_RegY),1);
                    ChIDNum4 = ChIDVec(RegYIdx(i_RegY),2);
                    
                    if ((ChIDNum1~=0) && (ChIDNum2~=0) && (ChIDNum3~=0) && (ChIDNum4~=0))
                        
                        Coord1 = CoordTemp(RegXIdx(i_RegX), :);
                        Coord2 = CoordTemp(RegYIdx(i_RegY), :);
                        Dist = norm(Coord1-Coord2, 2);
                        DistanceVals_intraDMN = [DistanceVals_intraDMN; Dist];
                        
                    end
                    
                end
                
            end
            
            clear EEGfile EEGoffset Montage Type
            
        end
        
        %clear cells
        clear isintraDMNFilledCell1 isintraDMNFilledCell2 SubjInd SubjIndTemp
        
    end
    
end

save(strcat(StrSaveDistanceVals,'DistanceVals_intraDMN_Yeo2011_Brainnetome_HIPP_Corrected_ArtifactRemove.mat'),'DistanceVals_intraDMN');





