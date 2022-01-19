%Anup Das
%30 August, 2019
%Surrogate PLV calculation for intra-DMN in the Yeo2011 atlas for 7-Networks
%for encode periods in the FR1 task

close all
clear all
clc

addpath(genpath('/oak/stanford/groups/menon/software/spm8/'))
addpath /oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_rest/Yeo2011/Anup_Create/Networks_7/Network7;
Str_Masks = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_rest/Yeo2011/Anup_Create/Networks_7/Network7/';

%PLV values
PLVVals_intra_UltraSlow_Delta = [];
PLVVals_intra_UltraSlow_Delta_Theta = [];
PLVVals_intra_Delta_Theta = [];
PLVVals_intra_UltraSlow = [];
PLVVals_intra_HighGamma = [];
PLVVals_intra_Delta = [];
PLVVals_intra_Theta = [];
PLVVals_intra_Alpha = [];
PLVVals_intra_Beta = [];
PLVVals_intra_Gamma = [];

%frequency bands
UltraSlow_Delta = 4;
UltraSlow_Delta_Theta = 8;
Delta_Theta = [0.5 8];
UltraSlow = 0.5;
HighGamma = [80 160];
Delta = [0.5 4];
Theta = [4 8];
Alpha = [8 12];
Beta = [12 30];
Gamma = [30 80];

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
StrSavePLVVals = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_task/PLV_Results/Yeo_atlas/Intra_7/Encode/';

for i_intraDMN = 20:26
    
    for j_intraDMN = i_intraDMN+1:27
        
        NSubjects = size(MNIAllSubjectFilledBipolar,1);
        isintraDMNFilledCell1 = cell(NSubjects,1);
        isintraDMN1 = zeros(NSubjects,1);
        isintraDMNFilledCell2 = cell(NSubjects,1);
        isintraDMN2 = zeros(NSubjects,1);
        
        roiFile1 = strcat('Network7_Clustrers_', num2str(i_intraDMN), '.nii');
        roiFile2 = strcat('Network7_Clustrers_', num2str(j_intraDMN), '.nii');
        
        for i_Subject = 1:NSubjects
            
            temp1 = FindRegionHO(MNIAllSubjectFilledBipolar{i_Subject,1}, strcat(Str_Masks,roiFile1), i_intraDMN);
            if sum(temp1)>0
                isintraDMN1(i_Subject)=1;
            end
            isintraDMNFilledCell1{i_Subject,1}=temp1;
            
            temp2 = FindRegionHO(MNIAllSubjectFilledBipolar{i_Subject,1}, strcat(Str_Masks,roiFile2), j_intraDMN);
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
            
            display(strcat(num2str(i_intraDMN), ',', num2str(j_intraDMN)));
            
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
                    Recalled{j,1} = Taskjson(j,:).recalled;
                    
                end
                
                if strcmp(SubjInd{i,1}, 'R1216E')
                    
                    SizeEEGfile = size(EEGfile,1);
                    EEGfile(1:SizeEEGfile) = {'R1216E_FR1_0_15Sep16_2125'};
                    
                end
                
                CountStartTemp = find(ismember(Type,'WORD') == 1);
                Recalled_Mat = cell2mat(Recalled);
                Recalled_Mat_Word = Recalled_Mat(CountStartTemp);
                Recalled_Correct = CountStartTemp(Recalled_Mat_Word==1 | Recalled_Mat_Word==0);
                
                EEGfiletemp = EEGfile(~cellfun('isempty',EEGfile)) ;
                TypeEEGfiles = unique(EEGfiletemp);
                
                StrData = strcat('/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/data/Release_20171012_data/protocols/r1/subjects/',SubjInd{i,1},'/experiments/FR1/sessions/0/ephys/current_processed/noreref/');
                
                N_Samples1236 = 3218660;
                N_Samples1230 = 3334835;
                N_Samples1207 = 3622806;
                
                MinLen = length(Recalled_Correct);
                
                for j=1:MinLen
                    
                    FileIdx = strcat('/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/data/Release_20171012_data/protocols/r1/subjects/',SubjInd{i,1},'/localizations/',Montage{Recalled_Correct(j),1}(1,1),'/montages/',Montage{Recalled_Correct(j),1}(1,3),'/neuroradiology/current_processed');
                    MNICoordIdx = find(ismember(FolderNames,FileIdx) == 1);
                    ChIDVec = ChID{MNICoordIdx,1};
                    RegXVec = isintraDMNFilledCell1{MNICoordIdx,1};
                    RegYVec = isintraDMNFilledCell2{MNICoordIdx,1};
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
                            
                            i_EEGfile = strcat(StrData,EEGfile{Recalled_Correct(j),:},'.',ChIDTemp1);
                            d=dir(i_EEGfile);
                            fileID = fopen(strcat(d.folder,'/',d.name));
                            A1 = fread(fileID,inf,'int16');
                            fclose('all');
                            
                            i_EEGfile = strcat(StrData,EEGfile{Recalled_Correct(j),:},'.',ChIDTemp2);
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
                            DataTemp = A(cell2mat(EEGoffset(Recalled_Correct(j))):cell2mat(EEGoffset(Recalled_Correct(j)+1)));
                            RegXData{i_RegX, j, i} = DataTemp;
                            
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
                            
                            i_EEGfile = strcat(StrData,EEGfile{Recalled_Correct(j),:},'.',ChIDTemp1);
                            d=dir(i_EEGfile);
                            fileID = fopen(strcat(d.folder,'/',d.name));
                            A1 = fread(fileID,inf,'int16');
                            fclose('all');
                            
                            i_EEGfile = strcat(StrData,EEGfile{Recalled_Correct(j),:},'.',ChIDTemp2);
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
                            DataTemp = A(cell2mat(EEGoffset(Recalled_Correct(j))):cell2mat(EEGoffset(Recalled_Correct(j)+1)));
                            RegYData{i_RegY, j, i} = DataTemp;
                            
                        else
                            
                            RegYData{i_RegY, j, i} = [];            
                            
                        end
                        
                    end
                    
                end
                
                clear EEGfile EEGoffset Montage Type Recalled Recalled_Mat Recalled_Mat_Word
                
            end
            
            PLVVals_intra_UltraSlow_Delta = [PLVVals_intra_UltraSlow_Delta; PLVCalc_PCCPrec_X_UltraSlow_NA(RegXData, RegYData, UltraSlow_Delta)];
            PLVVals_intra_UltraSlow_Delta_Theta = [PLVVals_intra_UltraSlow_Delta_Theta; PLVCalc_PCCPrec_X_UltraSlow_NA(RegXData, RegYData, UltraSlow_Delta_Theta)];
            PLVVals_intra_Delta_Theta = [PLVVals_intra_Delta_Theta; PLVCalc_PCCPrec_X_NA(RegXData, RegYData, Delta_Theta)];         
            PLVVals_intra_UltraSlow = [PLVVals_intra_UltraSlow; PLVCalc_PCCPrec_X_UltraSlow_NA(RegXData, RegYData, UltraSlow)];
            PLVVals_intra_HighGamma = [PLVVals_intra_HighGamma; PLVCalc_PCCPrec_X_HighGamma_NA(RegXData, RegYData, HighGamma)];
            PLVVals_intra_Delta = [PLVVals_intra_Delta; PLVCalc_PCCPrec_X_NA(RegXData, RegYData, Delta)];
            PLVVals_intra_Theta = [PLVVals_intra_Theta; PLVCalc_PCCPrec_X_NA(RegXData, RegYData, Theta)];
            PLVVals_intra_Alpha = [PLVVals_intra_Alpha; PLVCalc_PCCPrec_X_NA(RegXData, RegYData, Alpha)];
            PLVVals_intra_Beta = [PLVVals_intra_Beta; PLVCalc_PCCPrec_X_NA(RegXData, RegYData, Beta)];
            PLVVals_intra_Gamma = [PLVVals_intra_Gamma; PLVCalc_PCCPrec_X_Gamma_NA(RegXData, RegYData, Gamma)];
            
            %clear cells
            clear RegXData RegYData isintraDMNFilledCell1 isintraDMNFilledCell2 SubjInd SubjIndTemp
            
        end
        
    end
    
end

save(strcat(StrSavePLVVals,'NA_CorrIncorr_PLVVals_intraDMN_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'),'PLVVals_intra_UltraSlow_Delta');
save(strcat(StrSavePLVVals,'NA_CorrIncorr_PLVVals_intraDMN_Yeo2011_UltraSlow_Delta_Theta_Corrected_ArtifactRemove.mat'),'PLVVals_intra_UltraSlow_Delta_Theta');
save(strcat(StrSavePLVVals,'NA_CorrIncorr_PLVVals_intraDMN_Yeo2011_Delta_Theta_Corrected_ArtifactRemove.mat'),'PLVVals_intra_Delta_Theta');
save(strcat(StrSavePLVVals,'NA_CorrIncorr_PLVVals_intraDMN_Yeo2011_UltraSlow_Corrected_ArtifactRemove.mat'),'PLVVals_intra_UltraSlow');
save(strcat(StrSavePLVVals,'NA_CorrIncorr_PLVVals_intraDMN_Yeo2011_Delta_Corrected_ArtifactRemove.mat'),'PLVVals_intra_Delta');
save(strcat(StrSavePLVVals,'NA_CorrIncorr_PLVVals_intraDMN_Yeo2011_Theta_Corrected_ArtifactRemove.mat'),'PLVVals_intra_Theta');
save(strcat(StrSavePLVVals,'NA_CorrIncorr_PLVVals_intraDMN_Yeo2011_Alpha_Corrected_ArtifactRemove.mat'),'PLVVals_intra_Alpha');
save(strcat(StrSavePLVVals,'NA_CorrIncorr_PLVVals_intraDMN_Yeo2011_Beta_Corrected_ArtifactRemove.mat'),'PLVVals_intra_Beta');
save(strcat(StrSavePLVVals,'NA_CorrIncorr_PLVVals_intraDMN_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'),'PLVVals_intra_Gamma');
save(strcat(StrSavePLVVals,'NA_CorrIncorr_PLVVals_intraDMN_Yeo2011_HighGamma_Corrected_ArtifactRemove.mat'),'PLVVals_intra_HighGamma');











