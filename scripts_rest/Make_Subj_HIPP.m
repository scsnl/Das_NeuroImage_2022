%Anup Das
%20 September, 2019
%Subejcts for the hippocampus in the Brainnetome atlas

close all
clear all
clc

addpath(genpath('/oak/stanford/groups/menon/software/spm8/'))

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

StrSaveSubjIndGlobal = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_rest/Subject_Indices/Yeo_atlas/Individual/';
    
NSubjects = size(MNIAllSubjectFilledBipolar,1);
isFilledCell1 = cell(NSubjects,1);
is1 = zeros(NSubjects,1);

for i_Subject = 1:NSubjects
    
    temp1 = 0;
    
    for j_Comb_Ind = 1:length(HIPP)
        
        temp1 = temp1 + FindRegionHO(MNIAllSubjectFilledBipolar{i_Subject,1}, roiFile_Brainnetome, HIPP(j_Comb_Ind));
        
    end
    
    if sum(temp1)>0
        is1(i_Subject)=1;
    end
    isFilledCell1{i_Subject,1}=temp1;
    
end

All_Index = find(is1==1);

%Extract subject indices
if ~isempty(All_Index)
    
    for i=1:length(All_Index)
        
        d = dir(FileList(All_Index(i)).folder);
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
    
%     if ~isempty(find(ismember(SubjInd,'R1229M')==1))
%         
%         SubjInd(find(ismember(SubjInd,'R1229M')==1),:) = [];
%         
%     end
    
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
    
    if ~isempty(find(ismember(SubjInd,'R1311T')==1))
        
        SubjInd(find(ismember(SubjInd,'R1311T')==1),:) = [];
        
    end
    
    if ~isempty(find(ismember(SubjInd,'R1313J')==1))
        
        SubjInd(find(ismember(SubjInd,'R1313J')==1),:) = [];
        
    end
    
else
    
    SubjInd = [];
    
end

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
        
        for j=1:MinLen
            
            FileIdx = strcat('/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/data/Release_20171012_data/protocols/r1/subjects/',SubjInd{i,1},'/localizations/',Montage{CountStart(j),1}(1,1),'/montages/',Montage{CountStart(j),1}(1,3),'/neuroradiology/current_processed');
            MNICoordIdx = find(ismember(FolderNames,FileIdx) == 1);
            ChIDVec = ChID{MNICoordIdx,1};
            RegXVec = isFilledCell1{MNICoordIdx,1};
            RegXIdx = find(RegXVec==1);
            
            
            %Do for RegX
            for i_RegX = 1:length(RegXIdx)
                
                ChIDNum1 = ChIDVec(RegXIdx(i_RegX),1);
                ChIDNum2 = ChIDVec(RegXIdx(i_RegX),2);
                
                if ((ChIDNum1~=0) && (ChIDNum2~=0))
                    
                    if numel(num2str(ChIDNum1))==1
                        
                        ChIDTemp1 = char(strcat('00',num2str(ChIDNum1)));
                        
                    end
                    
                    if numel(num2str(ChIDNum1))==2
                        
                        ChIDTemp1 = char(strcat('0',num2str(ChIDNum1)));
                        
                    end
                    
                    if numel(num2str(ChIDNum1))==3
                        
                        ChIDTemp1 = char(num2str(ChIDNum1));
                        
                    end
                    
                    
                    
                    
                    
                    if numel(num2str(ChIDNum2))==1
                        
                        ChIDTemp2 = char(strcat('00',num2str(ChIDNum2)));
                        
                    end
                    
                    if numel(num2str(ChIDNum2))==2
                        
                        ChIDTemp2 = char(strcat('0',num2str(ChIDNum2)));
                        
                    end
                    
                    if numel(num2str(ChIDNum2))==3
                        
                        ChIDTemp2 = char(num2str(ChIDNum2));
                        
                    end
                    
                    i_EEGfile = strcat(StrData,EEGfile{CountStart(j),:},'.',ChIDTemp1);
                    d=dir(i_EEGfile);
                    fileID = fopen(strcat(d.folder,'/',d.name));
                    A1 = fread(fileID,inf,'int16');
                    fclose('all');
                    
                    i_EEGfile = strcat(StrData,EEGfile{CountStart(j),:},'.',ChIDTemp2);
                    d=dir(i_EEGfile);
                    fileID = fopen(strcat(d.folder,'/',d.name));
                    A2 = fread(fileID,inf,'int16');
                    fclose('all');
                    
                    if strcmp(SubjInd{i,1}, 'R1207J')
                        
                        A1 = A1(1:N_Samples1207);
                        A2 = A2(1:N_Samples1207);
                        
                    end
                    
                    if strcmp(SubjInd{i,1}, 'R1230J')
                        
                        A1 = A1(1:N_Samples1230);
                        A2 = A2(1:N_Samples1230);
                        
                    end
                    
                    if strcmp(SubjInd{i,1}, 'R1236J')
                        
                        A1 = A1(1:N_Samples1236);
                        A2 = A2(1:N_Samples1236);
                        
                    end
                    
                    %Bipolar referencing
                    A=A1-A2;
                    
                    %Extract data
                    DataTemp = A(cell2mat(EEGoffset(CountStart(j))):cell2mat(EEGoffset(CountEnd(j))));
                    RegXData{i_RegX, j, i} = DataTemp;
                    
                else
                    
                    RegXData{i_RegX, j, i} = [];
                    
                end
                
            end
            
        end
        
        clear EEGfile EEGoffset Montage Type
        
    end
    
    %Find non-empty subject indices
    count = 0;
    SubjIndTempNE = {};
    
    for i=1:size(SubjInd,1)
        
        TempDataX = RegXData(:,:,i);
        emptyCells1 = cellfun('isempty', TempDataX);
        TempDataX(all(emptyCells1,2),:) = [];
        TempDataX(:,all(emptyCells1,1)) = [];
        
        if (~isempty(TempDataX))
            
            count = count+1;
            SubjIndTempNE{count,1} = SubjInd{i,1};
            
        end
        
    end
    
    clear SubjInd
    SubjInd = SubjIndTempNE;
    save(strcat(StrSaveSubjIndGlobal,'SubjIndGlobal_HIPP_Yeo2011_ArtifactRemove_1229.mat'),'SubjInd');
    
    %clear cells
    clear RegXData isFilledCell1 SubjInd SubjIndTemp
    
end









