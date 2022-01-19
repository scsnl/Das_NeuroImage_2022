%Anup Das
%30 August, 2019
%Power calculation for the other 6 networks in the Yeo2011 atlas

close all
clear all
clc

addpath(genpath('/oak/stanford/groups/menon/software/spm8/'))
addpath /oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_rest/Yeo2011/Anup_Create/Networks_7;
Str_Masks = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_rest/Yeo2011/Anup_Create/Networks_7/';

%load MNI coordinates from UPenn data
load('MNIAllSubjectFilledBipolar.mat');

%load files
load('FileListBipolarSherlock.mat')
load('ChIDBipolarArtifactRemove.mat')

%Extract folder names from FileList
for i=1:size(FileList,1)
    
    FolderNames{i,1} = FileList(i,:).folder;
    
end

%frequency bands
UltraSlow = 0.5;
UltraSlow_Delta = 4;
UltraSlow_Delta_Theta = 8;
Delta_Theta = [0.5 8];
HighGamma = [80 160];
Delta = [0.5 4];
Theta = [4 8];
Alpha = [8 12];
Beta = [12 30];
Gamma = [30 80];

%save variables
StrSavePowerVals = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_rest/Power_Results/Yeo_atlas/Networks_7/';
StrSaveSampFreq = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_rest/Sampling_Frequency_Results/Yeo_atlas/Individual/';
StrSaveSubjIndGlobal = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_rest/Subject_Indices/Yeo_atlas/Individual/';

for i_All = 1:6
        
    %Power values
    Power_UltraSlow_Delta = [];
    Power_UltraSlow_Delta_Theta = [];
    Power_Delta_Theta = [];
    Power_UltraSlow = [];
    Power_HighGamma = [];
    Power_Delta = [];
    Power_Theta = [];
    Power_Alpha = [];
    Power_Beta = [];
    Power_Gamma = [];
    
    %Sampling frequency
    SampFreq_All = [];
    
    %Subject indices
    SubjIndGlobal_All = {};
    
    NSubjects = size(MNIAllSubjectFilledBipolar,1);
    isFilledCell1 = cell(NSubjects,1);
    is1 = zeros(NSubjects,1);
    
    %roiFile
    roiFile1 = strcat('Yeo2011_7Networks_MNI152_FreeSurferConformed1mm_', num2str(i_All), '.nii');
    
    for i_Subject = 1:NSubjects
        
        temp1 = FindRegionHO(MNIAllSubjectFilledBipolar{i_Subject,1}, strcat(Str_Masks,roiFile1), i_All);
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
                        
                        %Extract sampling frequency
                        SampIdx = find(ismember(SampTypes,EEGfile{CountStart(j),:}) == 1);
                        dynamicPath = {char(fieldnames(jsondecode(fileread(Sampjson))))};
                        D = getfield(jsondecode(fileread(Sampjson)), dynamicPath{1,1}(SampIdx,:));
                        SampFreq = [SampFreq; D.sample_rate];
                    
                    else
                        
                        RegXData{i_RegX, j, i} = [];
                    
                    end
                    
                end
                
            end
            
            clear EEGfile EEGoffset Montage Type
            
        end
        
        SubjIndGlobal_All = [SubjIndGlobal_All; SubjInd];
        
        SampFreq_All = [SampFreq_All; SampFreq];
        
        Power_UltraSlow_Delta = [Power_UltraSlow_Delta; PowerCalc_PCCPrec_X_UltraSlow_Random(RegXData, UltraSlow_Delta)];
        Power_UltraSlow_Delta_Theta = [Power_UltraSlow_Delta_Theta; PowerCalc_PCCPrec_X_UltraSlow_Random(RegXData, UltraSlow_Delta_Theta)];
        Power_Delta_Theta = [Power_Delta_Theta; PowerCalc_PCCPrec_X_Random(RegXData, Delta_Theta)];
        Power_UltraSlow = [Power_UltraSlow; PowerCalc_PCCPrec_X_UltraSlow_Random(RegXData, UltraSlow)];
        Power_HighGamma = [Power_HighGamma; PowerCalc_PCCPrec_X_HighGamma_Random(RegXData, HighGamma)];
        Power_Delta = [Power_Delta; PowerCalc_PCCPrec_X_Random(RegXData, Delta)];
        Power_Theta = [Power_Theta; PowerCalc_PCCPrec_X_Random(RegXData, Theta)];
        Power_Alpha = [Power_Alpha; PowerCalc_PCCPrec_X_Random(RegXData, Alpha)];
        Power_Beta = [Power_Beta; PowerCalc_PCCPrec_X_Random(RegXData, Beta)];
        Power_Gamma = [Power_Gamma; PowerCalc_PCCPrec_X_Gamma_Random(RegXData, Gamma)];
        
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
        save(strcat(StrSaveSubjIndGlobal,'SubjIndGlobal_',num2str(i_All),'_Yeo2011_ArtifactRemove.mat'),'SubjInd');
        
        %clear cells
        clear RegXData isFilledCell1 SubjInd SubjIndTemp
        
    end
    
    save(strcat(StrSavePowerVals,'PowerVals_',num2str(i_All),'_Yeo2011_Delta_Corrected_Random_ArtifactRemove.mat'),'Power_Delta');
    save(strcat(StrSavePowerVals,'PowerVals_',num2str(i_All),'_Yeo2011_Theta_Corrected_Random_ArtifactRemove.mat'),'Power_Theta');
    save(strcat(StrSavePowerVals,'PowerVals_',num2str(i_All),'_Yeo2011_Alpha_Corrected_Random_ArtifactRemove.mat'),'Power_Alpha');
    save(strcat(StrSavePowerVals,'PowerVals_',num2str(i_All),'_Yeo2011_Beta_Corrected_Random_ArtifactRemove.mat'),'Power_Beta');
    save(strcat(StrSavePowerVals,'PowerVals_',num2str(i_All),'_Yeo2011_Gamma_Corrected_Random_ArtifactRemove.mat'),'Power_Gamma');
    save(strcat(StrSavePowerVals,'PowerVals_',num2str(i_All),'_Yeo2011_UltraSlow_Corrected_Random_ArtifactRemove.mat'),'Power_UltraSlow');
    save(strcat(StrSavePowerVals,'PowerVals_',num2str(i_All),'_Yeo2011_HighGamma_Corrected_Random_ArtifactRemove.mat'),'Power_HighGamma');
    save(strcat(StrSavePowerVals,'PowerVals_',num2str(i_All),'_Yeo2011_UltraSlow_Delta_Corrected_Random_ArtifactRemove.mat'),'Power_UltraSlow_Delta');
    save(strcat(StrSavePowerVals,'PowerVals_',num2str(i_All),'_Yeo2011_UltraSlow_Delta_Theta_Corrected_Random_ArtifactRemove.mat'),'Power_UltraSlow_Delta_Theta');
    save(strcat(StrSavePowerVals,'PowerVals_',num2str(i_All),'_Yeo2011_Delta_Theta_Corrected_Random_ArtifactRemove.mat'),'Power_Delta_Theta');
    
    save(strcat(StrSaveSampFreq,'SampFreq_',num2str(i_All),'_Yeo2011_ArtifactRemove.mat'),'SampFreq_All');

end








