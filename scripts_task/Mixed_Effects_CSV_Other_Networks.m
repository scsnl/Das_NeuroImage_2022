%Anup Das
%31 August, 2021
%This program generates CSV files for mixed effects model analysis in R

close all;
clear all;
clc;


%Generate .csv file
StrSubjPairsIntraEncode = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_task/Mixed_Effects_Results/Yeo_atlas/Intra_7/Encode/';
StrSubjPairsIntraRecall = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_task/Mixed_Effects_Results/Yeo_atlas/Intra_7/Recall/';
StrSubjPairsInterEncode = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_task/Mixed_Effects_Results/Yeo_atlas/Inter_7/Encode/';
StrSubjPairsInterRecall = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_task/Mixed_Effects_Results/Yeo_atlas/Inter_7/Recall/';

StrPLVIntraEncode = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_task/PLV_Results/Yeo_atlas/Intra_7/Encode/';
StrPLVIntraRecall = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_task/PLV_Results/Yeo_atlas/Intra_7/Recall/';
StrPLVInterEncode = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_task/PLV_Results/Yeo_atlas/Inter_7/Encode/';
StrPLVInterRecall = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_task/PLV_Results/Yeo_atlas/Inter_7/Recall/';
StrPLVIntraRest = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_rest/PLV_Results/Yeo_atlas/Intra_7/';
StrPLVInterRest = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_rest/PLV_Results/Yeo_atlas/Inter_7/';

StrPTEEncode = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_task/PTE_Results/Yeo_atlas/Networks_7/Encode/';
StrPTERecall = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_task/PTE_Results/Yeo_atlas/Networks_7/Recall/';
StrPTERest = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_rest/PTE_Results/Yeo_atlas/Networks_7/';

StrSave = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_task/CSV_Results/';







%Network1/Encode/UltraSlow_Delta
%load intra network
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraNet_1_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_UltraSlow_Delta;

%load inter network
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_1_2_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_1_3_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_1_4_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_1_5_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_1_6_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_1_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_UltraSlow_Delta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraNet_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interNet_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_1_Encode_Intra_Inter_UltraSlow_Delta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%Network1/Encode/Beta
%load intra network
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraNet_1_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Beta;

%load inter network
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_1_2_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_1_3_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_1_4_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_1_5_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_1_6_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_1_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Beta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraNet_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interNet_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_1_Encode_Intra_Inter_Beta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%Network1/Encode/Gamma
%load intra network
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraNet_1_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Gamma;

%load inter network
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_1_2_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_1_3_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_1_4_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_1_5_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_1_6_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_1_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Gamma;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraNet_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interNet_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_1_Encode_Intra_Inter_Gamma.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix






























%Network1/Recall/UltraSlow_Delta
%load intra network
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraNet_1_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_UltraSlow_Delta;

%load inter network
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_1_2_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_1_3_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_1_4_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_1_5_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_1_6_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_1_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_UltraSlow_Delta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraNet_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interNet_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_1_Recall_Intra_Inter_UltraSlow_Delta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%Network1/Recall/Beta
%load intra network
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraNet_1_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Beta;

%load inter network
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_1_2_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_1_3_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_1_4_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_1_5_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_1_6_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_1_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Beta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraNet_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interNet_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_1_Recall_Intra_Inter_Beta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%Network1/Recall/Gamma
%load intra network
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraNet_1_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Gamma;

%load inter network
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_1_2_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_1_3_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_1_4_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_1_5_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_1_6_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_1_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Gamma;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraNet_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interNet_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_1_Recall_Intra_Inter_Gamma.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



























%Network1/Rest/UltraSlow_Delta
%load intra network
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_1_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_UltraSlow_Delta;

%load inter network
load(strcat(StrPLVInterRest, 'PLVVals_interNet_1_2_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_1_3_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_1_4_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_1_5_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_1_6_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_1_Yeo2011_Random_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_interDMN_UltraSlow_Delta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraNet_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interNet_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_1_Rest_Intra_Inter_UltraSlow_Delta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%Network1/Rest/Beta
%load intra network
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_1_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Beta;

%load inter network
load(strcat(StrPLVInterRest, 'PLVVals_interNet_1_2_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_1_3_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_1_4_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_1_5_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_1_6_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_1_Yeo2011_Random_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_interDMN_Beta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraNet_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interNet_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_1_Rest_Intra_Inter_Beta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%Network1/Rest/Gamma
%load intra network
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_1_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Gamma;

%load inter network
load(strcat(StrPLVInterRest, 'PLVVals_interNet_1_2_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_1_3_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_1_4_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_1_5_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_1_6_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_1_Yeo2011_Random_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_interDMN_Gamma;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraNet_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interNet_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_1_Rest_Intra_Inter_Gamma.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix

























%Network2/Encode/UltraSlow_Delta
%load intra network
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraNet_2_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_UltraSlow_Delta;

%load inter network
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_1_2_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_2_3_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_2_4_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_2_5_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_2_6_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_2_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_UltraSlow_Delta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraNet_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interNet_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_2_Encode_Intra_Inter_UltraSlow_Delta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%Network2/Encode/Beta
%load intra network
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraNet_2_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Beta;

%load inter network
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_1_2_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_2_3_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_2_4_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_2_5_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_2_6_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_2_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Beta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraNet_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interNet_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_2_Encode_Intra_Inter_Beta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%Network2/Encode/Gamma
%load intra network
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraNet_2_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Gamma;

%load inter network
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_1_2_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_2_3_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_2_4_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_2_5_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_2_6_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_2_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Gamma;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraNet_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interNet_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_2_Encode_Intra_Inter_Gamma.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix
































%Network2/Recall/UltraSlow_Delta
%load intra network
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraNet_2_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_UltraSlow_Delta;

%load inter network
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_1_2_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_2_3_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_2_4_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_2_5_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_2_6_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_2_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_UltraSlow_Delta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraNet_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interNet_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_2_Recall_Intra_Inter_UltraSlow_Delta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%Network2/Recall/Beta
%load intra network
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraNet_2_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Beta;

%load inter network
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_1_2_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_2_3_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_2_4_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_2_5_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_2_6_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_2_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Beta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraNet_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interNet_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_2_Recall_Intra_Inter_Beta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%Network2/Recall/Gamma
%load intra network
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraNet_2_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Gamma;

%load inter network
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_1_2_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_2_3_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_2_4_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_2_5_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_2_6_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_2_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Gamma;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraNet_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interNet_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_2_Recall_Intra_Inter_Gamma.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix






























%Network2/Rest/UltraSlow_Delta
%load intra network
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_2_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_UltraSlow_Delta;

%load inter network
load(strcat(StrPLVInterRest, 'PLVVals_interNet_1_2_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_2_3_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_2_4_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_2_5_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_2_6_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_2_Yeo2011_Random_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_interDMN_UltraSlow_Delta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraNet_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interNet_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_2_Rest_Intra_Inter_UltraSlow_Delta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%Network2/Rest/Beta
%load intra network
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_2_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Beta;

%load inter network
load(strcat(StrPLVInterRest, 'PLVVals_interNet_1_2_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_2_3_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_2_4_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_2_5_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_2_6_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_2_Yeo2011_Random_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_interDMN_Beta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraNet_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interNet_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_2_Rest_Intra_Inter_Beta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%Network2/Rest/Gamma
%load intra network
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_2_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Gamma;

%load inter network
load(strcat(StrPLVInterRest, 'PLVVals_interNet_1_2_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_2_3_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_2_4_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_2_5_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_2_6_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_2_Yeo2011_Random_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_interDMN_Gamma;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraNet_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interNet_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_2_Rest_Intra_Inter_Gamma.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix
































%Network3/Encode/UltraSlow_Delta
%load intra network
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraNet_3_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_UltraSlow_Delta;

%load inter network
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_1_3_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_2_3_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_3_4_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_3_5_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_3_6_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_3_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_UltraSlow_Delta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraNet_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interNet_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_3_Encode_Intra_Inter_UltraSlow_Delta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%Network3/Encode/Beta
%load intra network
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraNet_3_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Beta;

%load inter network
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_1_3_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_2_3_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_3_4_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_3_5_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_3_6_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_3_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Beta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraNet_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interNet_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_3_Encode_Intra_Inter_Beta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%Network3/Encode/Gamma
%load intra network
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraNet_3_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Gamma;

%load inter network
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_1_3_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_2_3_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_3_4_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_3_5_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_3_6_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_3_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Gamma;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraNet_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interNet_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_3_Encode_Intra_Inter_Gamma.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix


































%Network3/Recall/UltraSlow_Delta
%load intra network
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraNet_3_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_UltraSlow_Delta;

%load inter network
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_1_3_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_2_3_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_3_4_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_3_5_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_3_6_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_3_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_UltraSlow_Delta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraNet_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interNet_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_3_Recall_Intra_Inter_UltraSlow_Delta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%Network3/Recall/Beta
%load intra network
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraNet_3_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Beta;

%load inter network
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_1_3_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_2_3_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_3_4_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_3_5_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_3_6_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_3_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Beta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraNet_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interNet_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_3_Recall_Intra_Inter_Beta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%Network3/Recall/Gamma
%load intra network
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraNet_3_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Gamma;

%load inter network
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_1_3_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_2_3_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_3_4_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_3_5_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_3_6_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_3_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Gamma;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraNet_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interNet_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_3_Recall_Intra_Inter_Gamma.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix































%Network3/Rest/UltraSlow_Delta
%load intra network
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_3_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_UltraSlow_Delta;

%load inter network
load(strcat(StrPLVInterRest, 'PLVVals_interNet_1_3_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_2_3_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_3_4_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_3_5_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_3_6_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_3_Yeo2011_Random_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_interDMN_UltraSlow_Delta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraNet_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interNet_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_3_Rest_Intra_Inter_UltraSlow_Delta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%Network3/Rest/Beta
%load intra network
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_3_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Beta;

%load inter network
load(strcat(StrPLVInterRest, 'PLVVals_interNet_1_3_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_2_3_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_3_4_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_3_5_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_3_6_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_3_Yeo2011_Random_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_interDMN_Beta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraNet_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interNet_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_3_Rest_Intra_Inter_Beta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%Network3/Rest/Gamma
%load intra network
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_3_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Gamma;

%load inter network
load(strcat(StrPLVInterRest, 'PLVVals_interNet_1_3_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_2_3_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_3_4_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_3_5_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_3_6_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_3_Yeo2011_Random_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_interDMN_Gamma;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraNet_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interNet_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_3_Rest_Intra_Inter_Gamma.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix































%Network4/Encode/UltraSlow_Delta
%load intra network
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraNet_4_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_UltraSlow_Delta;

%load inter network
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_1_4_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_2_4_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_3_4_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_4_5_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_4_6_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_4_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_UltraSlow_Delta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraNet_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interNet_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_4_Encode_Intra_Inter_UltraSlow_Delta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%Network4/Encode/Beta
%load intra network
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraNet_4_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Beta;

%load inter network
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_1_4_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_2_4_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_3_4_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_4_5_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_4_6_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_4_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Beta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraNet_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interNet_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_4_Encode_Intra_Inter_Beta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%Network4/Encode/Gamma
%load intra network
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraNet_4_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Gamma;

%load inter network
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_1_4_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_2_4_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_3_4_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_4_5_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_4_6_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_4_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Gamma;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraNet_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interNet_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_4_Encode_Intra_Inter_Gamma.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix


































%Network4/Recall/UltraSlow_Delta
%load intra network
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraNet_4_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_UltraSlow_Delta;

%load inter network
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_1_4_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_2_4_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_3_4_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_4_5_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_4_6_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_4_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_UltraSlow_Delta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraNet_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interNet_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_4_Recall_Intra_Inter_UltraSlow_Delta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%Network4/Recall/Beta
%load intra network
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraNet_4_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Beta;

%load inter network
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_1_4_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_2_4_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_3_4_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_4_5_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_4_6_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_4_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Beta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraNet_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interNet_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_4_Recall_Intra_Inter_Beta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%Network4/Recall/Gamma
%load intra network
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraNet_4_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Gamma;

%load inter network
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_1_4_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_2_4_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_3_4_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_4_5_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_4_6_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_4_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Gamma;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraNet_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interNet_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_4_Recall_Intra_Inter_Gamma.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix
































%Network4/Rest/UltraSlow_Delta
%load intra network
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_4_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_UltraSlow_Delta;

%load inter network
load(strcat(StrPLVInterRest, 'PLVVals_interNet_1_4_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_2_4_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_3_4_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_4_5_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_4_6_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_4_Yeo2011_Random_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_interDMN_UltraSlow_Delta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraNet_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interNet_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_4_Rest_Intra_Inter_UltraSlow_Delta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%Network4/Rest/Beta
%load intra network
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_4_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Beta;

%load inter network
load(strcat(StrPLVInterRest, 'PLVVals_interNet_1_4_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_2_4_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_3_4_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_4_5_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_4_6_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_4_Yeo2011_Random_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_interDMN_Beta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraNet_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interNet_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_4_Rest_Intra_Inter_Beta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%Network4/Rest/Gamma
%load intra network
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_4_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Gamma;

%load inter network
load(strcat(StrPLVInterRest, 'PLVVals_interNet_1_4_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_2_4_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_3_4_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_4_5_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_4_6_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_4_Yeo2011_Random_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_interDMN_Gamma;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraNet_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interNet_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_4_Rest_Intra_Inter_Gamma.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix









































%Network5/Encode/UltraSlow_Delta
%load intra network
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraNet_5_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_UltraSlow_Delta;

%load inter network
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_1_5_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_2_5_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_3_5_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_4_5_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_5_6_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_5_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_UltraSlow_Delta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraNet_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interNet_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_5_Encode_Intra_Inter_UltraSlow_Delta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%Network5/Encode/Beta
%load intra network
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraNet_5_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Beta;

%load inter network
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_1_5_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_2_5_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_3_5_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_4_5_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_5_6_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_5_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Beta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraNet_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interNet_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_5_Encode_Intra_Inter_Beta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%Network5/Encode/Gamma
%load intra network
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraNet_5_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Gamma;

%load inter network
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_1_5_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_2_5_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_3_5_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_4_5_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_5_6_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_5_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Gamma;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraNet_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interNet_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_5_Encode_Intra_Inter_Gamma.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix




































%Network5/Recall/UltraSlow_Delta
%load intra network
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraNet_5_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_UltraSlow_Delta;

%load inter network
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_1_5_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_2_5_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_3_5_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_4_5_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_5_6_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_5_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_UltraSlow_Delta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraNet_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interNet_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_5_Recall_Intra_Inter_UltraSlow_Delta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%Network5/Recall/Beta
%load intra network
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraNet_5_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Beta;

%load inter network
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_1_5_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_2_5_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_3_5_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_4_5_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_5_6_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_5_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Beta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraNet_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interNet_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_5_Recall_Intra_Inter_Beta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%Network5/Recall/Gamma
%load intra network
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraNet_5_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Gamma;

%load inter network
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_1_5_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_2_5_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_3_5_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_4_5_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_5_6_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_5_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Gamma;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraNet_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interNet_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_5_Recall_Intra_Inter_Gamma.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix
































%Network5/Rest/UltraSlow_Delta
%load intra network
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_5_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_UltraSlow_Delta;

%load inter network
load(strcat(StrPLVInterRest, 'PLVVals_interNet_1_5_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_2_5_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_3_5_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_4_5_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_5_6_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_5_Yeo2011_Random_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_interDMN_UltraSlow_Delta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraNet_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interNet_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_5_Rest_Intra_Inter_UltraSlow_Delta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%Network5/Rest/Beta
%load intra network
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_5_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Beta;

%load inter network
load(strcat(StrPLVInterRest, 'PLVVals_interNet_1_5_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_2_5_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_3_5_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_4_5_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_5_6_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_5_Yeo2011_Random_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_interDMN_Beta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraNet_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interNet_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_5_Rest_Intra_Inter_Beta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%Network5/Rest/Gamma
%load intra network
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_5_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Gamma;

%load inter network
load(strcat(StrPLVInterRest, 'PLVVals_interNet_1_5_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_2_5_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_3_5_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_4_5_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_5_6_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_5_Yeo2011_Random_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_interDMN_Gamma;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraNet_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interNet_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_5_Rest_Intra_Inter_Gamma.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix




























%Network6/Encode/UltraSlow_Delta
%load intra network
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraNet_6_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_UltraSlow_Delta;

%load inter network
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_1_6_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_2_6_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_3_6_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_4_6_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_5_6_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_6_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_UltraSlow_Delta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraNet_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interNet_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_6_Encode_Intra_Inter_UltraSlow_Delta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%Network6/Encode/Beta
%load intra network
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraNet_6_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Beta;

%load inter network
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_1_6_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_2_6_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_3_6_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_4_6_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_5_6_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_6_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Beta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraNet_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interNet_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_6_Encode_Intra_Inter_Beta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%Network6/Encode/Gamma
%load intra network
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraNet_6_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Gamma;

%load inter network
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_1_6_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_2_6_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_3_6_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_4_6_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interNet_5_6_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_6_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Gamma;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraNet_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interNet_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_6_Encode_Intra_Inter_Gamma.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix































%Network6/Recall/UltraSlow_Delta
%load intra network
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraNet_6_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_UltraSlow_Delta;

%load inter network
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_1_6_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_2_6_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_3_6_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_4_6_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_5_6_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_6_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_UltraSlow_Delta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraNet_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interNet_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_6_Recall_Intra_Inter_UltraSlow_Delta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%Network6/Recall/Beta
%load intra network
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraNet_6_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Beta;

%load inter network
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_1_6_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_2_6_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_3_6_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_4_6_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_5_6_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_6_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Beta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraNet_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interNet_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_6_Recall_Intra_Inter_Beta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%Network6/Recall/Gamma
%load intra network
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraNet_6_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Gamma;

%load inter network
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_1_6_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_2_6_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_3_6_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_4_6_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interNet_5_6_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_6_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Gamma;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraNet_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interNet_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_6_Recall_Intra_Inter_Gamma.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix




























%Network6/Rest/UltraSlow_Delta
%load intra network
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_6_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_UltraSlow_Delta;

%load inter network
load(strcat(StrPLVInterRest, 'PLVVals_interNet_1_6_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_2_6_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_3_6_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_4_6_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_5_6_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_6_Yeo2011_Random_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_interDMN_UltraSlow_Delta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraNet_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interNet_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_6_Rest_Intra_Inter_UltraSlow_Delta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%Network6/Rest/Beta
%load intra network
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_6_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Beta;

%load inter network
load(strcat(StrPLVInterRest, 'PLVVals_interNet_1_6_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_2_6_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_3_6_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_4_6_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_5_6_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_6_Yeo2011_Random_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_interDMN_Beta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraNet_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interNet_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_6_Rest_Intra_Inter_Beta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%Network6/Rest/Gamma
%load intra network
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_6_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Gamma;

%load inter network
load(strcat(StrPLVInterRest, 'PLVVals_interNet_1_6_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_2_6_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_3_6_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_4_6_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interNet_5_6_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_6_Yeo2011_Random_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_interDMN_Gamma;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraNet_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interNet_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra),1) = cellstr('Intra');
Regions(length(PLVVals_Intra)+1:...
    length(PLVVals_Intra) + length(PLVVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Network_6_Rest_Intra_Inter_Gamma.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix


















