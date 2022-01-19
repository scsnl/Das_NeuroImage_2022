%Anup Das
%16 August, 2019
%PLV calculation for inter-DMN in the Yeo2011 atlas after including
%HIPP from the Brainnetome atlas

close all
clear all
clc

addpath(genpath('/oak/stanford/groups/menon/software/spm8/'))
addpath /oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_rest/Yeo2011/Anup_Create/Networks_7;
Str_Masks_Yeo = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_rest/Yeo2011/Anup_Create/Networks_7/';

%Yeo roiFile
roiFile_Yeo = 'Yeo2011_7Networks_MNI152_FreeSurferConformed1mm_7.nii';

%frequency bands
HighGamma = [80 160];
Delta = [0.5 4];
Theta = [4 8];
Alpha = [8 12];
Beta = [12 30];
Gamma = [30 80];
UltraSlow = 0.5;
UltraSlow_Delta = 4;
UltraSlow_Delta_Theta = 8;
Delta_Theta = [0.5 8];

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
StrSavePLVVals = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_rest/PLV_Results/Yeo_atlas/Inter_7/';
StrSaveSampFreq = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_rest/Sampling_Frequency_Results/Yeo_atlas/Inter_7/';
StrSaveSubjIndGlobal = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_rest/Subject_Indices/Yeo_atlas/Inter_7/';

for i_interDMN = 1:6
    
    %Sampling frequency
    SampFreq_interDMN = [];
    
    %PLV values
    PLVVals_interDMN_UltraSlow_Delta = [];
    PLVVals_interDMN_UltraSlow_Delta_Theta = [];
    PLVVals_interDMN_Delta_Theta = [];
    PLVVals_interDMN_UltraSlow = [];
    PLVVals_interDMN_HighGamma = [];
    PLVVals_interDMN_Delta = [];
    PLVVals_interDMN_Theta = [];
    PLVVals_interDMN_Alpha = [];
    PLVVals_interDMN_Beta = [];
    PLVVals_interDMN_Gamma = [];
    
    %Subject indices
    SubjIndGlobal_interDMN = {};
        
    NSubjects = size(MNIAllSubjectFilledBipolar,1);
    isinterDMNFilledCell1 = cell(NSubjects,1);
    isinterDMN1 = zeros(NSubjects,1);
    isinterDMNFilledCell2 = cell(NSubjects,1);
    isinterDMN2 = zeros(NSubjects,1);
    
    roiFile2 = strcat('Yeo2011_7Networks_MNI152_FreeSurferConformed1mm_', num2str(i_interDMN), '.nii');
    
    for i_Subject = 1:NSubjects
        
        temp1 = FindRegionHO(MNIAllSubjectFilledBipolar{i_Subject,1}, strcat(Str_Masks_Yeo,roiFile_Yeo), 7);
        if sum(temp1)>0
            isinterDMN1(i_Subject)=1;
        end
        isinterDMNFilledCell1{i_Subject,1}=temp1;
        
        
        
        temp2 = FindRegionHO(MNIAllSubjectFilledBipolar{i_Subject,1}, strcat(Str_Masks_Yeo,roiFile2), i_interDMN);
        if sum(temp2)>0
            isinterDMN2(i_Subject)=1;
        end
        isinterDMNFilledCell2{i_Subject,1}=temp2;
        
    end
    
    Inter_Index = intersect(find(isinterDMN1==1), find(isinterDMN2==1));
    
    %Extract subject indices
    if ~isempty(Inter_Index)
        
        for i=1:length(Inter_Index)
            
            d = dir(FileList(Inter_Index(i)).folder);
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
        
        if ~isempty(find(ismember(SubjInd,'R1229M')==1))
            
            SubjInd(find(ismember(SubjInd,'R1229M')==1),:) = [];
            
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
            
            for j=1:MinLen
                
                FileIdx = strcat('/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/data/Release_20171012_data/protocols/r1/subjects/',SubjInd{i,1},'/localizations/',Montage{CountStart(j),1}(1,1),'/montages/',Montage{CountStart(j),1}(1,3),'/neuroradiology/current_processed');
                MNICoordIdx = find(ismember(FolderNames,FileIdx) == 1);
                ChIDVec = ChID{MNICoordIdx,1};
                RegXVec = isinterDMNFilledCell1{MNICoordIdx,1};
                RegYVec = isinterDMNFilledCell2{MNICoordIdx,1};
                RegXIdx = find(RegXVec==1);
                RegYIdx = find(RegYVec==1);
                
                
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
                        
                        %Extract sampling frequency
                        SampIdx = find(ismember(SampTypes,EEGfile{CountStart(j),:}) == 1);
                        dynamicPath = {char(fieldnames(jsondecode(fileread(Sampjson))))};
                        D = getfield(jsondecode(fileread(Sampjson)), dynamicPath{1,1}(SampIdx,:));
                        SampFreq = [SampFreq; D.sample_rate];
                        
                    else
                       
                        RegXData{i_RegX, j, i} = [];
                        
                    end
                    
                end
                
                
                
                
                
                %Do for RegY
                for i_RegY = 1:length(RegYIdx)
                    
                    ChIDNum1 = ChIDVec(RegYIdx(i_RegY),1);
                    ChIDNum2 = ChIDVec(RegYIdx(i_RegY),2);
                    
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
                        RegYData{i_RegY, j, i} = DataTemp;
                        
                    else
                       
                        RegYData{i_RegY, j, i} = [];
                        
                    end
                    
                end
                
            end
            
            clear EEGfile EEGoffset Montage Type
            
        end
        
        SubjIndGlobal_interDMN = [SubjIndGlobal_interDMN; SubjInd];
        
        SampFreq_interDMN = [SampFreq_interDMN; SampFreq];
        
        PLVVals_interDMN_UltraSlow_Delta = [PLVVals_interDMN_UltraSlow_Delta; PLVCalc_PCCPrec_X_Random_UltraSlow(RegXData, RegYData, UltraSlow_Delta)];
        PLVVals_interDMN_UltraSlow_Delta_Theta = [PLVVals_interDMN_UltraSlow_Delta_Theta; PLVCalc_PCCPrec_X_Random_UltraSlow(RegXData, RegYData, UltraSlow_Delta_Theta)];
        PLVVals_interDMN_Delta_Theta = [PLVVals_interDMN_Delta_Theta; PLVCalc_PCCPrec_X_Random(RegXData, RegYData, Delta_Theta)];
        PLVVals_interDMN_UltraSlow = [PLVVals_interDMN_UltraSlow; PLVCalc_PCCPrec_X_Random_UltraSlow(RegXData, RegYData, UltraSlow)];
        PLVVals_interDMN_HighGamma = [PLVVals_interDMN_HighGamma; PLVCalc_PCCPrec_X_Random_HighGamma(RegXData, RegYData, HighGamma)];
        PLVVals_interDMN_Delta = [PLVVals_interDMN_Delta; PLVCalc_PCCPrec_X_Random(RegXData, RegYData, Delta)];
        PLVVals_interDMN_Theta = [PLVVals_interDMN_Theta; PLVCalc_PCCPrec_X_Random(RegXData, RegYData, Theta)];
        PLVVals_interDMN_Alpha = [PLVVals_interDMN_Alpha; PLVCalc_PCCPrec_X_Random(RegXData, RegYData, Alpha)];
        PLVVals_interDMN_Beta = [PLVVals_interDMN_Beta; PLVCalc_PCCPrec_X_Random(RegXData, RegYData, Beta)];
        PLVVals_interDMN_Gamma = [PLVVals_interDMN_Gamma; PLVCalc_PCCPrec_X_Random_Gamma(RegXData, RegYData, Gamma)];
        
        %Find non-empty subject indices
        count = 0;
        SubjIndTempNE = {};
        
        for i=1:size(SubjInd,1)
            
            TempDataX = RegXData(:,:,i);
            emptyCells1 = cellfun('isempty', TempDataX);
            TempDataX(all(emptyCells1,2),:) = [];
            TempDataX(:,all(emptyCells1,1)) = [];
            
            TempDataY = RegYData(:,:,i);
            emptyCells2 = cellfun('isempty', TempDataY);
            TempDataY(all(emptyCells2,2),:) = [];
            TempDataY(:,all(emptyCells2,1)) = [];
            
            if (~isempty(TempDataX) && ~isempty(TempDataY))
                
                count = count+1;
                SubjIndTempNE{count,1} = SubjInd{i,1};
                
            end
            
        end
        
        clear SubjInd
        SubjInd = SubjIndTempNE;
        save(strcat(StrSaveSubjIndGlobal,'SubjIndGlobal_interDMN_',num2str(i_interDMN),'_Yeo2011_ArtifactRemove.mat'),'SubjInd');
        
        save(strcat(StrSavePLVVals,'PLVVals_interDMN_',num2str(i_interDMN),'_Yeo2011_Random_Delta_Corrected_ArtifactRemove.mat'),'PLVVals_interDMN_Delta');
        save(strcat(StrSavePLVVals,'PLVVals_interDMN_',num2str(i_interDMN),'_Yeo2011_Random_Theta_Corrected_ArtifactRemove.mat'),'PLVVals_interDMN_Theta');
        save(strcat(StrSavePLVVals,'PLVVals_interDMN_',num2str(i_interDMN),'_Yeo2011_Random_Alpha_Corrected_ArtifactRemove.mat'),'PLVVals_interDMN_Alpha');
        save(strcat(StrSavePLVVals,'PLVVals_interDMN_',num2str(i_interDMN),'_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'),'PLVVals_interDMN_Beta');
        save(strcat(StrSavePLVVals,'PLVVals_interDMN_',num2str(i_interDMN),'_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'),'PLVVals_interDMN_Gamma');
        save(strcat(StrSavePLVVals,'PLVVals_interDMN_',num2str(i_interDMN),'_Yeo2011_Random_UltraSlow_Corrected_ArtifactRemove.mat'),'PLVVals_interDMN_UltraSlow');
        save(strcat(StrSavePLVVals,'PLVVals_interDMN_',num2str(i_interDMN),'_Yeo2011_Random_HighGamma_Corrected_ArtifactRemove.mat'),'PLVVals_interDMN_HighGamma');
        save(strcat(StrSavePLVVals,'PLVVals_interDMN_',num2str(i_interDMN),'_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'),'PLVVals_interDMN_UltraSlow_Delta');
        save(strcat(StrSavePLVVals,'PLVVals_interDMN_',num2str(i_interDMN),'_Yeo2011_Random_UltraSlow_Delta_Theta_Corrected_ArtifactRemove.mat'),'PLVVals_interDMN_UltraSlow_Delta_Theta');
        save(strcat(StrSavePLVVals,'PLVVals_interDMN_',num2str(i_interDMN),'_Yeo2011_Random_Delta_Theta_Corrected_ArtifactRemove.mat'),'PLVVals_interDMN_Delta_Theta');
        
        save(strcat(StrSaveSampFreq,'SampFreq_interDMN_',num2str(i_interDMN),'_Yeo2011_ArtifactRemove.mat'),'SampFreq_interDMN');
        
        %clear cells
        clear RegXData RegYData isinterDMNFilledCell1 isinterDMNFilledCell2 SubjInd SubjIndTemp
        
    end
    
end












