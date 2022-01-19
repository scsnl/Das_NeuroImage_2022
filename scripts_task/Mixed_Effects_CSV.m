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

StrGammaIntraEncode = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_task/Gamma_Results/Yeo_atlas/Encode/Intra_7/';
StrGammaIntraRecall = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_task/Gamma_Results/Yeo_atlas/Recall/Intra_7/';
StrGammaInterEncode = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_task/Gamma_Results/Yeo_atlas/Encode/Inter_7/';
StrGammaInterRecall = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_task/Gamma_Results/Yeo_atlas/Recall/Inter_7/';
StrGammaIntraRest = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_rest/Gamma_Results/Yeo_atlas/Intra_7/';
StrGammaInterRest = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_rest/Gamma_Results/Yeo_atlas/Inter_7/';

StrPTEEncode = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_task/PTE_Results/Yeo_atlas/Networks_7/Encode/';
StrPTERecall = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_task/PTE_Results/Yeo_atlas/Networks_7/Recall/';
StrPTERest = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_rest/PTE_Results/Yeo_atlas/Networks_7/';

StrPowerEncode = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_task/Power_Results/Yeo_atlas/Networks_7/Encode/';
StrPowerRecall = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_task/Power_Results/Yeo_atlas/Networks_7/Recall/';
StrPowerRest = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_rest/Power_Results/Yeo_atlas/Networks_7/';

StrIntraDistance = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_rest/Distance_Results/Yeo_atlas/Intra_7/';
StrInterDistance = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_rest/Distance_Results/Yeo_atlas/Inter_7/';

StrSave = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_task/CSV_Results/';







%DMN/Encode/UltraSlow_Delta
%load intra network
load(strcat(StrPLVIntraEncode, 'PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_UltraSlow_Delta;
load(strcat(StrPLVIntraEncode, 'PLVVals_intraDMN_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = [PLVVals_Intra; PLVVals_intra_UltraSlow_Delta];

%load inter network
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_1_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_2_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_3_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_4_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_5_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_6_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_UltraSlow_Delta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

%load inter network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'DMN_HIPP_Encode_Intra_Inter_UltraSlow_Delta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%DMN/Encode/UltraSlow_Delta_Theta
%load intra network
load(strcat(StrPLVIntraEncode, 'PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_UltraSlow_Delta_Theta;
load(strcat(StrPLVIntraEncode, 'PLVVals_intraDMN_Yeo2011_UltraSlow_Delta_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = [PLVVals_Intra; PLVVals_intra_UltraSlow_Delta_Theta];

%load inter network
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_1_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_UltraSlow_Delta_Theta;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_2_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_UltraSlow_Delta_Theta;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_3_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_UltraSlow_Delta_Theta;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_4_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_UltraSlow_Delta_Theta;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_5_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_UltraSlow_Delta_Theta;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_6_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_UltraSlow_Delta_Theta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

%load inter network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'DMN_HIPP_Encode_Intra_Inter_UltraSlow_Delta_Theta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%DMN/Encode/Theta
%load intra network
load(strcat(StrPLVIntraEncode, 'PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Theta;
load(strcat(StrPLVIntraEncode, 'PLVVals_intraDMN_Yeo2011_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = [PLVVals_Intra; PLVVals_intra_Theta];

%load inter network
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_1_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Theta;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_2_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Theta;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_3_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Theta;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_4_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Theta;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_5_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Theta;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_6_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Theta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

%load inter network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'DMN_HIPP_Encode_Intra_Inter_Theta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%DMN/Encode/Alpha
%load intra network
load(strcat(StrPLVIntraEncode, 'PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Alpha;
load(strcat(StrPLVIntraEncode, 'PLVVals_intraDMN_Yeo2011_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = [PLVVals_Intra; PLVVals_intra_Alpha];

%load inter network
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_1_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Alpha;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_2_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Alpha;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_3_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Alpha;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_4_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Alpha;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_5_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Alpha;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_6_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Alpha;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

%load inter network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'DMN_HIPP_Encode_Intra_Inter_Alpha.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%DMN/Encode/Beta
%load intra network
load(strcat(StrPLVIntraEncode, 'PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Beta;
load(strcat(StrPLVIntraEncode, 'PLVVals_intraDMN_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = [PLVVals_Intra; PLVVals_intra_Beta];

%load inter network
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_1_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_2_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_3_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_4_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_5_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_6_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Beta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

%load inter network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'DMN_HIPP_Encode_Intra_Inter_Beta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%DMN/Encode/Gamma
%load intra network
load(strcat(StrPLVIntraEncode, 'PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Gamma;
load(strcat(StrPLVIntraEncode, 'PLVVals_intraDMN_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = [PLVVals_Intra; PLVVals_intra_Gamma];

%load inter network
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_1_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_2_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_3_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_4_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_5_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_6_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Gamma;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

%load inter network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'DMN_HIPP_Encode_Intra_Inter_Gamma.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 






















%DMN/Recall/UltraSlow_Delta
%load intra network
load(strcat(StrPLVIntraRecall, 'PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_UltraSlow_Delta;
load(strcat(StrPLVIntraRecall, 'PLVVals_intraDMN_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = [PLVVals_Intra; PLVVals_intra_UltraSlow_Delta];

%load inter network
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_1_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_2_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_3_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_4_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_5_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_6_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_UltraSlow_Delta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'DMN_HIPP_Recall_Intra_Inter_UltraSlow_Delta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%DMN/Recall/UltraSlow_Delta_Theta
%load intra network
load(strcat(StrPLVIntraRecall, 'PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_UltraSlow_Delta_Theta;
load(strcat(StrPLVIntraRecall, 'PLVVals_intraDMN_Yeo2011_UltraSlow_Delta_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = [PLVVals_Intra; PLVVals_intra_UltraSlow_Delta_Theta];

%load inter network
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_1_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_UltraSlow_Delta_Theta;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_2_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_UltraSlow_Delta_Theta;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_3_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_UltraSlow_Delta_Theta;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_4_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_UltraSlow_Delta_Theta;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_5_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_UltraSlow_Delta_Theta;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_6_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_UltraSlow_Delta_Theta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'DMN_HIPP_Recall_Intra_Inter_UltraSlow_Delta_Theta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%DMN/Recall/Theta
%load intra network
load(strcat(StrPLVIntraRecall, 'PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Theta;
load(strcat(StrPLVIntraRecall, 'PLVVals_intraDMN_Yeo2011_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = [PLVVals_Intra; PLVVals_intra_Theta];

%load inter network
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_1_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Theta;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_2_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Theta;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_3_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Theta;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_4_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Theta;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_5_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Theta;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_6_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Theta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'DMN_HIPP_Recall_Intra_Inter_Theta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%DMN/Recall/Alpha
%load intra network
load(strcat(StrPLVIntraRecall, 'PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Alpha;
load(strcat(StrPLVIntraRecall, 'PLVVals_intraDMN_Yeo2011_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = [PLVVals_Intra; PLVVals_intra_Alpha];

%load inter network
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_1_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Alpha;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_2_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Alpha;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_3_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Alpha;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_4_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Alpha;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_5_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Alpha;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_6_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Alpha;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'DMN_HIPP_Recall_Intra_Inter_Alpha.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%DMN/Recall/Beta
%load intra network
load(strcat(StrPLVIntraRecall, 'PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Beta;
load(strcat(StrPLVIntraRecall, 'PLVVals_intraDMN_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = [PLVVals_Intra; PLVVals_intra_Beta];

%load inter network
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_1_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_2_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_3_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_4_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_5_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_6_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Beta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'DMN_HIPP_Recall_Intra_Inter_Beta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%DMN/Recall/Gamma
%load intra network
load(strcat(StrPLVIntraRecall, 'PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Gamma;
load(strcat(StrPLVIntraRecall, 'PLVVals_intraDMN_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = [PLVVals_Intra; PLVVals_intra_Gamma];

%load inter network
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_1_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_2_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_3_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_4_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_5_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_6_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Gamma;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'DMN_HIPP_Recall_Intra_Inter_Gamma.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 





























%DMN/Rest/UltraSlow_Delta
%load intra network
load(strcat(StrPLVIntraRest, 'PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intraDMN_UltraSlow_Delta;
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = [PLVVals_Intra; PLVVals_intra_UltraSlow_Delta];

%load inter network
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_1_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_interDMN_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_2_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_interDMN_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_3_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_interDMN_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_4_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_interDMN_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_5_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_interDMN_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_6_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_interDMN_UltraSlow_Delta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'DMN_HIPP_Rest_Intra_Inter_UltraSlow_Delta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%DMN/Rest/Theta
%load intra network
load(strcat(StrPLVIntraRest, 'PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intraDMN_Theta;
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = [PLVVals_Intra; PLVVals_intra_Theta];

%load inter network
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_1_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_interDMN_Theta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_2_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_interDMN_Theta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_3_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_interDMN_Theta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_4_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_interDMN_Theta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_5_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_interDMN_Theta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_6_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_interDMN_Theta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'DMN_HIPP_Rest_Intra_Inter_Theta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%DMN/Rest/Alpha
%load intra network
load(strcat(StrPLVIntraRest, 'PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intraDMN_Alpha;
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = [PLVVals_Intra; PLVVals_intra_Alpha];

%load inter network
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_1_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_interDMN_Alpha;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_2_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_interDMN_Alpha;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_3_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_interDMN_Alpha;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_4_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_interDMN_Alpha;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_5_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_interDMN_Alpha;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_6_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_interDMN_Alpha;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'DMN_HIPP_Rest_Intra_Inter_Alpha.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%DMN/Rest/Beta
%load intra network
load(strcat(StrPLVIntraRest, 'PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intraDMN_Beta;
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = [PLVVals_Intra; PLVVals_intra_Beta];

%load inter network
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_1_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_interDMN_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_2_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_interDMN_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_3_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_interDMN_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_4_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_interDMN_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_5_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_interDMN_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_6_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_interDMN_Beta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'DMN_HIPP_Rest_Intra_Inter_Beta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%DMN/Rest/Gamma
%load intra network
load(strcat(StrPLVIntraRest, 'PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intraDMN_Gamma;
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = [PLVVals_Intra; PLVVals_intra_Gamma];

%load inter network
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_1_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_interDMN_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_2_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_interDMN_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_3_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_interDMN_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_4_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_interDMN_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_5_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_interDMN_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_6_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_interDMN_Gamma;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'DMN_HIPP_Rest_Intra_Inter_Gamma.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 





























%Random epochs
%DMN/Rest/UltraSlow_Delta
%load intra network
load(strcat(StrPLVIntraRest, 'PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intraDMN_UltraSlow_Delta;
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = [PLVVals_Intra; PLVVals_intra_UltraSlow_Delta];

%load inter network
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_1_Yeo2011_Random_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_interDMN_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_2_Yeo2011_Random_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_interDMN_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_3_Yeo2011_Random_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_interDMN_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_4_Yeo2011_Random_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_interDMN_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_5_Yeo2011_Random_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_interDMN_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_6_Yeo2011_Random_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_interDMN_UltraSlow_Delta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'Random_DMN_HIPP_Rest_Intra_Inter_UltraSlow_Delta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%DMN/Rest/Theta
%load intra network
load(strcat(StrPLVIntraRest, 'PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intraDMN_Theta;
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_Random_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = [PLVVals_Intra; PLVVals_intra_Theta];

%load inter network
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_1_Yeo2011_Random_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_interDMN_Theta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_2_Yeo2011_Random_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_interDMN_Theta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_3_Yeo2011_Random_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_interDMN_Theta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_4_Yeo2011_Random_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_interDMN_Theta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_5_Yeo2011_Random_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_interDMN_Theta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_6_Yeo2011_Random_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_interDMN_Theta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'Random_DMN_HIPP_Rest_Intra_Inter_Theta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%DMN/Rest/Alpha
%load intra network
load(strcat(StrPLVIntraRest, 'PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intraDMN_Alpha;
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_Random_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = [PLVVals_Intra; PLVVals_intra_Alpha];

%load inter network
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_1_Yeo2011_Random_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_interDMN_Alpha;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_2_Yeo2011_Random_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_interDMN_Alpha;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_3_Yeo2011_Random_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_interDMN_Alpha;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_4_Yeo2011_Random_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_interDMN_Alpha;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_5_Yeo2011_Random_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_interDMN_Alpha;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_6_Yeo2011_Random_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_interDMN_Alpha;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'Random_DMN_HIPP_Rest_Intra_Inter_Alpha.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%DMN/Rest/Beta
%load intra network
load(strcat(StrPLVIntraRest, 'PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intraDMN_Beta;
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = [PLVVals_Intra; PLVVals_intra_Beta];

%load inter network
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_1_Yeo2011_Random_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_interDMN_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_2_Yeo2011_Random_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_interDMN_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_3_Yeo2011_Random_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_interDMN_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_4_Yeo2011_Random_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_interDMN_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_5_Yeo2011_Random_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_interDMN_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_6_Yeo2011_Random_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_interDMN_Beta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'Random_DMN_HIPP_Rest_Intra_Inter_Beta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%DMN/Rest/Gamma
%load intra network
load(strcat(StrPLVIntraRest, 'PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intraDMN_Gamma;
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = [PLVVals_Intra; PLVVals_intra_Gamma];

%load inter network
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_1_Yeo2011_Random_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_interDMN_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_2_Yeo2011_Random_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_interDMN_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_3_Yeo2011_Random_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_interDMN_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_4_Yeo2011_Random_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_interDMN_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_5_Yeo2011_Random_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_interDMN_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_6_Yeo2011_Random_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_interDMN_Gamma;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'Random_DMN_HIPP_Rest_Intra_Inter_Gamma.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 


















































%CorrIncorr/DMN/Encode/UltraSlow_Delta
%load intra network
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_UltraSlow_Delta;
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = [PLVVals_Intra; PLVVals_intra_UltraSlow_Delta];

%load inter network
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_1_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_2_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_3_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_4_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_5_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_6_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_UltraSlow_Delta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

%load inter network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_DMN_HIPP_Encode_Intra_Inter_UltraSlow_Delta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%CorrIncorr/DMN/Encode/UltraSlow_Delta_Theta
%load intra network
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_UltraSlow_Delta_Theta;
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_UltraSlow_Delta_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = [PLVVals_Intra; PLVVals_intra_UltraSlow_Delta_Theta];

%load inter network
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_1_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_UltraSlow_Delta_Theta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_2_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_UltraSlow_Delta_Theta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_3_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_UltraSlow_Delta_Theta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_4_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_UltraSlow_Delta_Theta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_5_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_UltraSlow_Delta_Theta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_6_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_UltraSlow_Delta_Theta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

%load inter network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_DMN_HIPP_Encode_Intra_Inter_UltraSlow_Delta_Theta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%CorrIncorr/DMN/Encode/Theta
%load intra network
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Theta;
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = [PLVVals_Intra; PLVVals_intra_Theta];

%load inter network
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_1_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Theta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_2_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Theta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_3_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Theta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_4_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Theta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_5_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Theta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_6_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Theta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

%load inter network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_DMN_HIPP_Encode_Intra_Inter_Theta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%CorrIncorr/DMN/Encode/Alpha
%load intra network
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Alpha;
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = [PLVVals_Intra; PLVVals_intra_Alpha];

%load inter network
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_1_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Alpha;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_2_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Alpha;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_3_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Alpha;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_4_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Alpha;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_5_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Alpha;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_6_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Alpha;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

%load inter network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_DMN_HIPP_Encode_Intra_Inter_Alpha.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%CorrIncorr/DMN/Encode/Beta
%load intra network
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Beta;
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = [PLVVals_Intra; PLVVals_intra_Beta];

%load inter network
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_1_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_2_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_3_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_4_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_5_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_6_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Beta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

%load inter network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_DMN_HIPP_Encode_Intra_Inter_Beta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%CorrIncorr/DMN/Encode/Gamma
%load intra network
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Gamma;
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = [PLVVals_Intra; PLVVals_intra_Gamma];

%load inter network
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_1_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_2_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_3_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_4_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_5_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_6_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Gamma;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

%load inter network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_DMN_HIPP_Encode_Intra_Inter_Gamma.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 


























%CorrIncorr/DMN/Recall/UltraSlow_Delta
%load intra network
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_UltraSlow_Delta;
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = [PLVVals_Intra; PLVVals_intra_UltraSlow_Delta];

%load inter network
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_1_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_2_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_3_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_4_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_5_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_6_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_UltraSlow_Delta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_DMN_HIPP_Recall_Intra_Inter_UltraSlow_Delta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%CorrIncorr/DMN/Recall/UltraSlow_Delta_Theta
%load intra network
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_UltraSlow_Delta_Theta;
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_UltraSlow_Delta_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = [PLVVals_Intra; PLVVals_intra_UltraSlow_Delta_Theta];

%load inter network
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_1_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_UltraSlow_Delta_Theta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_2_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_UltraSlow_Delta_Theta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_3_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_UltraSlow_Delta_Theta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_4_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_UltraSlow_Delta_Theta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_5_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_UltraSlow_Delta_Theta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_6_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_UltraSlow_Delta_Theta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_DMN_HIPP_Recall_Intra_Inter_UltraSlow_Delta_Theta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%CorrIncorr/DMN/Recall/Theta
%load intra network
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Theta;
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = [PLVVals_Intra; PLVVals_intra_Theta];

%load inter network
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_1_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Theta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_2_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Theta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_3_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Theta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_4_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Theta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_5_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Theta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_6_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Theta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_DMN_HIPP_Recall_Intra_Inter_Theta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%CorrIncorr/DMN/Recall/Alpha
%load intra network
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Alpha;
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = [PLVVals_Intra; PLVVals_intra_Alpha];

%load inter network
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_1_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Alpha;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_2_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Alpha;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_3_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Alpha;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_4_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Alpha;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_5_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Alpha;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_6_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Alpha;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_DMN_HIPP_Recall_Intra_Inter_Alpha.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%CorrIncorr/DMN/Recall/Beta
%load intra network
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Beta;
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = [PLVVals_Intra; PLVVals_intra_Beta];

%load inter network
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_1_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_2_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_3_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_4_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_5_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_6_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Beta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_DMN_HIPP_Recall_Intra_Inter_Beta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%CorrIncorr/DMN/Recall/Gamma
%load intra network
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Gamma;
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = [PLVVals_Intra; PLVVals_intra_Gamma];

%load inter network
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_1_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_2_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_3_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_4_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_5_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_6_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Gamma;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_DMN_HIPP_Recall_Intra_Inter_Gamma.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 




































%DMN/SansHIPP/Encode/UltraSlow_Delta
%load intra network
load(strcat(StrPLVIntraEncode, 'PLVVals_intraDMN_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_UltraSlow_Delta;

%load inter network
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_1_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_2_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_3_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_4_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_5_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_6_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_UltraSlow_Delta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'DMN_Encode_Intra_Inter_UltraSlow_Delta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%DMN/SansHIPP/Encode/Theta
%load intra network
load(strcat(StrPLVIntraEncode, 'PLVVals_intraDMN_Yeo2011_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Theta;

%load inter network
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_1_Yeo2011_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Theta;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_2_Yeo2011_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Theta;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_3_Yeo2011_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Theta;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_4_Yeo2011_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Theta;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_5_Yeo2011_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Theta;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_6_Yeo2011_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Theta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'DMN_Encode_Intra_Inter_Theta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%DMN/SansHIPP/Encode/Alpha
%load intra network
load(strcat(StrPLVIntraEncode, 'PLVVals_intraDMN_Yeo2011_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Alpha;

%load inter network
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_1_Yeo2011_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Alpha;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_2_Yeo2011_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Alpha;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_3_Yeo2011_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Alpha;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_4_Yeo2011_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Alpha;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_5_Yeo2011_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Alpha;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_6_Yeo2011_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Alpha;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'DMN_Encode_Intra_Inter_Alpha.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%DMN/SansHIPP/Encode/Beta
%load intra network
load(strcat(StrPLVIntraEncode, 'PLVVals_intraDMN_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Beta;

%load inter network
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_1_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_2_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_3_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_4_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_5_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_6_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Beta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'DMN_Encode_Intra_Inter_Beta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%DMN/SansHIPP/Encode/Gamma
%load intra network
load(strcat(StrPLVIntraEncode, 'PLVVals_intraDMN_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Gamma;

%load inter network
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_1_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_2_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_3_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_4_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_5_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'PLVVals_interDMN_6_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Gamma;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'DMN_Encode_Intra_Inter_Gamma.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 






























%DMN/SansHIPP/Recall/UltraSlow_Delta
%load intra network
load(strcat(StrPLVIntraRecall, 'PLVVals_intraDMN_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_UltraSlow_Delta;

%load inter network
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_1_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_2_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_3_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_4_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_5_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_6_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_UltraSlow_Delta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'DMN_Recall_Intra_Inter_UltraSlow_Delta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%DMN/SansHIPP/Recall/Theta
%load intra network
load(strcat(StrPLVIntraRecall, 'PLVVals_intraDMN_Yeo2011_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Theta;

%load inter network
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_1_Yeo2011_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Theta;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_2_Yeo2011_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Theta;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_3_Yeo2011_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Theta;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_4_Yeo2011_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Theta;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_5_Yeo2011_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Theta;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_6_Yeo2011_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Theta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'DMN_Recall_Intra_Inter_Theta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%DMN/SansHIPP/Recall/Alpha
%load intra network
load(strcat(StrPLVIntraRecall, 'PLVVals_intraDMN_Yeo2011_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Alpha;

%load inter network
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_1_Yeo2011_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Alpha;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_2_Yeo2011_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Alpha;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_3_Yeo2011_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Alpha;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_4_Yeo2011_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Alpha;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_5_Yeo2011_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Alpha;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_6_Yeo2011_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Alpha;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'DMN_Recall_Intra_Inter_Alpha.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%DMN/SansHIPP/Recall/Beta
%load intra network
load(strcat(StrPLVIntraRecall, 'PLVVals_intraDMN_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Beta;

%load inter network
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_1_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_2_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_3_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_4_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_5_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_6_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Beta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'DMN_Recall_Intra_Inter_Beta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%DMN/SansHIPP/Recall/Gamma
%load intra network
load(strcat(StrPLVIntraRecall, 'PLVVals_intraDMN_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Gamma;

%load inter network
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_1_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_2_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_3_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_4_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_5_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'PLVVals_interDMN_6_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Gamma;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'DMN_Recall_Intra_Inter_Gamma.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 




































 

%DMN/SansHIPP/Rest/UltraSlow_Delta
%load intra network
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_UltraSlow_Delta;

%load inter network
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_1_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_interDMN_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_2_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_interDMN_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_3_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_interDMN_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_4_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_interDMN_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_5_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_interDMN_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_6_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_interDMN_UltraSlow_Delta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'DMN_Rest_Intra_Inter_UltraSlow_Delta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%DMN/SansHIPP/Rest/Theta
%load intra network
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Theta;

%load inter network
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_1_Yeo2011_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_interDMN_Theta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_2_Yeo2011_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_interDMN_Theta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_3_Yeo2011_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_interDMN_Theta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_4_Yeo2011_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_interDMN_Theta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_5_Yeo2011_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_interDMN_Theta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_6_Yeo2011_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_interDMN_Theta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'DMN_Rest_Intra_Inter_Theta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%DMN/SansHIPP/Rest/Alpha
%load intra network
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Alpha;

%load inter network
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_1_Yeo2011_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_interDMN_Alpha;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_2_Yeo2011_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_interDMN_Alpha;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_3_Yeo2011_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_interDMN_Alpha;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_4_Yeo2011_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_interDMN_Alpha;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_5_Yeo2011_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_interDMN_Alpha;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_6_Yeo2011_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_interDMN_Alpha;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'DMN_Rest_Intra_Inter_Alpha.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%DMN/SansHIPP/Rest/Beta
%load intra network
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Beta;

%load inter network
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_1_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_interDMN_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_2_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_interDMN_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_3_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_interDMN_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_4_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_interDMN_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_5_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_interDMN_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_6_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_interDMN_Beta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'DMN_Rest_Intra_Inter_Beta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%DMN/SansHIPP/Rest/Gamma
%load intra network
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Gamma;

%load inter network
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_1_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_interDMN_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_2_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_interDMN_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_3_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_interDMN_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_4_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_interDMN_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_5_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_interDMN_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_6_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_interDMN_Gamma;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'DMN_Rest_Intra_Inter_Gamma.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix




































%DMN/Encode/Recall/Compare/UltraSlow_Delta
%load intra network
load(strcat(StrPLVIntraEncode, 'PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Encode = PLVVals_intra_UltraSlow_Delta;
load(strcat(StrPLVIntraEncode, 'PLVVals_intraDMN_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Encode = [PLVVals_Intra_Encode; PLVVals_intra_UltraSlow_Delta];

load(strcat(StrPLVIntraRecall, 'PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Recall = PLVVals_intra_UltraSlow_Delta;
load(strcat(StrPLVIntraRecall, 'PLVVals_intraDMN_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Recall = [PLVVals_Intra_Recall; PLVVals_intra_UltraSlow_Delta];


Matrix = [PLVVals_Intra_Encode; PLVVals_Intra_Recall];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Encode = Subj_Pairs;
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Encode = [Subj_Pairs_Intra_Encode; Subj_Pairs];

load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Recall = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Recall = [Subj_Pairs_Intra_Recall; Subj_Pairs];


Subj_Pairs_Stack = [Subj_Pairs_Intra_Encode; Subj_Pairs_Intra_Recall];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra_Encode),1) = cellstr('Encode');
Regions(length(PLVVals_Intra_Encode)+1:...
    length(PLVVals_Intra_Encode) + length(PLVVals_Intra_Recall),1) = cellstr('Recall');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'DMN_HIPP_Encode_Recall_UltraSlow_Delta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%DMN/Encode/Rest/Compare/UltraSlow_Delta
%load intra network
load(strcat(StrPLVIntraEncode, 'PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Encode = PLVVals_intra_UltraSlow_Delta;
load(strcat(StrPLVIntraEncode, 'PLVVals_intraDMN_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Encode = [PLVVals_Intra_Encode; PLVVals_intra_UltraSlow_Delta];

load(strcat(StrPLVIntraRest, 'PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Rest = PLVVals_intraDMN_UltraSlow_Delta;
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Rest = [PLVVals_Intra_Rest; PLVVals_intra_UltraSlow_Delta];


Matrix = [PLVVals_Intra_Encode; PLVVals_Intra_Rest];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Encode = Subj_Pairs;
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Encode = [Subj_Pairs_Intra_Encode; Subj_Pairs];

load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Rest = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Rest = [Subj_Pairs_Intra_Rest; Subj_Pairs];


Subj_Pairs_Stack = [Subj_Pairs_Intra_Encode; Subj_Pairs_Intra_Rest];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra_Encode),1) = cellstr('Encode');
Regions(length(PLVVals_Intra_Encode)+1:...
    length(PLVVals_Intra_Encode) + length(PLVVals_Intra_Rest),1) = cellstr('Rest');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'DMN_HIPP_Encode_Rest_UltraSlow_Delta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%DMN/Recall/Rest/Compare/UltraSlow_Delta
%load intra network
load(strcat(StrPLVIntraRecall, 'PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Recall = PLVVals_intra_UltraSlow_Delta;
load(strcat(StrPLVIntraRecall, 'PLVVals_intraDMN_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Recall = [PLVVals_Intra_Recall; PLVVals_intra_UltraSlow_Delta];

load(strcat(StrPLVIntraRest, 'PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Rest = PLVVals_intraDMN_UltraSlow_Delta;
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Rest = [PLVVals_Intra_Rest; PLVVals_intra_UltraSlow_Delta];


Matrix = [PLVVals_Intra_Recall; PLVVals_Intra_Rest];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Recall = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Recall = [Subj_Pairs_Intra_Recall; Subj_Pairs];

load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Rest = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Rest = [Subj_Pairs_Intra_Rest; Subj_Pairs];


Subj_Pairs_Stack = [Subj_Pairs_Intra_Recall; Subj_Pairs_Intra_Rest];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra_Recall),1) = cellstr('Recall');
Regions(length(PLVVals_Intra_Recall)+1:...
    length(PLVVals_Intra_Recall) + length(PLVVals_Intra_Rest),1) = cellstr('Rest');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'DMN_HIPP_Recall_Rest_UltraSlow_Delta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%DMN/Encode/Recall/Compare/Theta
%load intra network
load(strcat(StrPLVIntraEncode, 'PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Encode = PLVVals_intra_Theta;
load(strcat(StrPLVIntraEncode, 'PLVVals_intraDMN_Yeo2011_Random_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Encode = [PLVVals_Intra_Encode; PLVVals_intra_Theta];

load(strcat(StrPLVIntraRecall, 'PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Recall = PLVVals_intra_Theta;
load(strcat(StrPLVIntraRecall, 'PLVVals_intraDMN_Yeo2011_Random_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Recall = [PLVVals_Intra_Recall; PLVVals_intra_Theta];


Matrix = [PLVVals_Intra_Encode; PLVVals_Intra_Recall];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Encode = Subj_Pairs;
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Encode = [Subj_Pairs_Intra_Encode; Subj_Pairs];

load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Recall = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Recall = [Subj_Pairs_Intra_Recall; Subj_Pairs];


Subj_Pairs_Stack = [Subj_Pairs_Intra_Encode; Subj_Pairs_Intra_Recall];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra_Encode),1) = cellstr('Encode');
Regions(length(PLVVals_Intra_Encode)+1:...
    length(PLVVals_Intra_Encode) + length(PLVVals_Intra_Recall),1) = cellstr('Recall');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'DMN_HIPP_Encode_Recall_Theta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%DMN/Encode/Rest/Compare/Theta
%load intra network
load(strcat(StrPLVIntraEncode, 'PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Encode = PLVVals_intra_Theta;
load(strcat(StrPLVIntraEncode, 'PLVVals_intraDMN_Yeo2011_Random_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Encode = [PLVVals_Intra_Encode; PLVVals_intra_Theta];

load(strcat(StrPLVIntraRest, 'PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Rest = PLVVals_intraDMN_Theta;
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Rest = [PLVVals_Intra_Rest; PLVVals_intra_Theta];


Matrix = [PLVVals_Intra_Encode; PLVVals_Intra_Rest];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Encode = Subj_Pairs;
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Encode = [Subj_Pairs_Intra_Encode; Subj_Pairs];

load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Rest = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Rest = [Subj_Pairs_Intra_Rest; Subj_Pairs];


Subj_Pairs_Stack = [Subj_Pairs_Intra_Encode; Subj_Pairs_Intra_Rest];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra_Encode),1) = cellstr('Encode');
Regions(length(PLVVals_Intra_Encode)+1:...
    length(PLVVals_Intra_Encode) + length(PLVVals_Intra_Rest),1) = cellstr('Rest');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'DMN_HIPP_Encode_Rest_Theta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%DMN/Recall/Rest/Compare/Theta
%load intra network
load(strcat(StrPLVIntraRecall, 'PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Recall = PLVVals_intra_Theta;
load(strcat(StrPLVIntraRecall, 'PLVVals_intraDMN_Yeo2011_Random_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Recall = [PLVVals_Intra_Recall; PLVVals_intra_Theta];

load(strcat(StrPLVIntraRest, 'PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Rest = PLVVals_intraDMN_Theta;
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Rest = [PLVVals_Intra_Rest; PLVVals_intra_Theta];


Matrix = [PLVVals_Intra_Recall; PLVVals_Intra_Rest];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Recall = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Recall = [Subj_Pairs_Intra_Recall; Subj_Pairs];

load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Rest = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Rest = [Subj_Pairs_Intra_Rest; Subj_Pairs];


Subj_Pairs_Stack = [Subj_Pairs_Intra_Recall; Subj_Pairs_Intra_Rest];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra_Recall),1) = cellstr('Recall');
Regions(length(PLVVals_Intra_Recall)+1:...
    length(PLVVals_Intra_Recall) + length(PLVVals_Intra_Rest),1) = cellstr('Rest');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'DMN_HIPP_Recall_Rest_Theta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%DMN/Encode/Recall/Compare/Alpha
%load intra network
load(strcat(StrPLVIntraEncode, 'PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Encode = PLVVals_intra_Alpha;
load(strcat(StrPLVIntraEncode, 'PLVVals_intraDMN_Yeo2011_Random_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Encode = [PLVVals_Intra_Encode; PLVVals_intra_Alpha];

load(strcat(StrPLVIntraRecall, 'PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Recall = PLVVals_intra_Alpha;
load(strcat(StrPLVIntraRecall, 'PLVVals_intraDMN_Yeo2011_Random_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Recall = [PLVVals_Intra_Recall; PLVVals_intra_Alpha];


Matrix = [PLVVals_Intra_Encode; PLVVals_Intra_Recall];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Encode = Subj_Pairs;
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Encode = [Subj_Pairs_Intra_Encode; Subj_Pairs];

load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Recall = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Recall = [Subj_Pairs_Intra_Recall; Subj_Pairs];


Subj_Pairs_Stack = [Subj_Pairs_Intra_Encode; Subj_Pairs_Intra_Recall];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra_Encode),1) = cellstr('Encode');
Regions(length(PLVVals_Intra_Encode)+1:...
    length(PLVVals_Intra_Encode) + length(PLVVals_Intra_Recall),1) = cellstr('Recall');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'DMN_HIPP_Encode_Recall_Alpha.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%DMN/Encode/Rest/Compare/Alpha
%load intra network
load(strcat(StrPLVIntraEncode, 'PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Encode = PLVVals_intra_Alpha;
load(strcat(StrPLVIntraEncode, 'PLVVals_intraDMN_Yeo2011_Random_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Encode = [PLVVals_Intra_Encode; PLVVals_intra_Alpha];

load(strcat(StrPLVIntraRest, 'PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Rest = PLVVals_intraDMN_Alpha;
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Rest = [PLVVals_Intra_Rest; PLVVals_intra_Alpha];


Matrix = [PLVVals_Intra_Encode; PLVVals_Intra_Rest];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Encode = Subj_Pairs;
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Encode = [Subj_Pairs_Intra_Encode; Subj_Pairs];

load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Rest = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Rest = [Subj_Pairs_Intra_Rest; Subj_Pairs];


Subj_Pairs_Stack = [Subj_Pairs_Intra_Encode; Subj_Pairs_Intra_Rest];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra_Encode),1) = cellstr('Encode');
Regions(length(PLVVals_Intra_Encode)+1:...
    length(PLVVals_Intra_Encode) + length(PLVVals_Intra_Rest),1) = cellstr('Rest');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'DMN_HIPP_Encode_Rest_Alpha.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%DMN/Recall/Rest/Compare/Alpha
%load intra network
load(strcat(StrPLVIntraRecall, 'PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Recall = PLVVals_intra_Alpha;
load(strcat(StrPLVIntraRecall, 'PLVVals_intraDMN_Yeo2011_Random_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Recall = [PLVVals_Intra_Recall; PLVVals_intra_Alpha];

load(strcat(StrPLVIntraRest, 'PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Rest = PLVVals_intraDMN_Alpha;
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Rest = [PLVVals_Intra_Rest; PLVVals_intra_Alpha];


Matrix = [PLVVals_Intra_Recall; PLVVals_Intra_Rest];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Recall = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Recall = [Subj_Pairs_Intra_Recall; Subj_Pairs];

load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Rest = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Rest = [Subj_Pairs_Intra_Rest; Subj_Pairs];


Subj_Pairs_Stack = [Subj_Pairs_Intra_Recall; Subj_Pairs_Intra_Rest];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra_Recall),1) = cellstr('Recall');
Regions(length(PLVVals_Intra_Recall)+1:...
    length(PLVVals_Intra_Recall) + length(PLVVals_Intra_Rest),1) = cellstr('Rest');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'DMN_HIPP_Recall_Rest_Alpha.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%DMN/Encode/Recall/Compare/Beta
%load intra network
load(strcat(StrPLVIntraEncode, 'PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Encode = PLVVals_intra_Beta;
load(strcat(StrPLVIntraEncode, 'PLVVals_intraDMN_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Encode = [PLVVals_Intra_Encode; PLVVals_intra_Beta];

load(strcat(StrPLVIntraRecall, 'PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Recall = PLVVals_intra_Beta;
load(strcat(StrPLVIntraRecall, 'PLVVals_intraDMN_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Recall = [PLVVals_Intra_Recall; PLVVals_intra_Beta];


Matrix = [PLVVals_Intra_Encode; PLVVals_Intra_Recall];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Encode = Subj_Pairs;
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Encode = [Subj_Pairs_Intra_Encode; Subj_Pairs];

load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Recall = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Recall = [Subj_Pairs_Intra_Recall; Subj_Pairs];


Subj_Pairs_Stack = [Subj_Pairs_Intra_Encode; Subj_Pairs_Intra_Recall];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra_Encode),1) = cellstr('Encode');
Regions(length(PLVVals_Intra_Encode)+1:...
    length(PLVVals_Intra_Encode) + length(PLVVals_Intra_Recall),1) = cellstr('Recall');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'DMN_HIPP_Encode_Recall_Beta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%DMN/Encode/Rest/Compare/Beta
%load intra network
load(strcat(StrPLVIntraEncode, 'PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Encode = PLVVals_intra_Beta;
load(strcat(StrPLVIntraEncode, 'PLVVals_intraDMN_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Encode = [PLVVals_Intra_Encode; PLVVals_intra_Beta];

load(strcat(StrPLVIntraRest, 'PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Rest = PLVVals_intraDMN_Beta;
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Rest = [PLVVals_Intra_Rest; PLVVals_intra_Beta];


Matrix = [PLVVals_Intra_Encode; PLVVals_Intra_Rest];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Encode = Subj_Pairs;
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Encode = [Subj_Pairs_Intra_Encode; Subj_Pairs];

load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Rest = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Rest = [Subj_Pairs_Intra_Rest; Subj_Pairs];


Subj_Pairs_Stack = [Subj_Pairs_Intra_Encode; Subj_Pairs_Intra_Rest];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra_Encode),1) = cellstr('Encode');
Regions(length(PLVVals_Intra_Encode)+1:...
    length(PLVVals_Intra_Encode) + length(PLVVals_Intra_Rest),1) = cellstr('Rest');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'DMN_HIPP_Encode_Rest_Beta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%DMN/Recall/Rest/Compare/Beta
%load intra network
load(strcat(StrPLVIntraRecall, 'PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Recall = PLVVals_intra_Beta;
load(strcat(StrPLVIntraRecall, 'PLVVals_intraDMN_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Recall = [PLVVals_Intra_Recall; PLVVals_intra_Beta];

load(strcat(StrPLVIntraRest, 'PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Rest = PLVVals_intraDMN_Beta;
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Rest = [PLVVals_Intra_Rest; PLVVals_intra_Beta];


Matrix = [PLVVals_Intra_Recall; PLVVals_Intra_Rest];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Recall = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Recall = [Subj_Pairs_Intra_Recall; Subj_Pairs];

load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Rest = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Rest = [Subj_Pairs_Intra_Rest; Subj_Pairs];


Subj_Pairs_Stack = [Subj_Pairs_Intra_Recall; Subj_Pairs_Intra_Rest];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra_Recall),1) = cellstr('Recall');
Regions(length(PLVVals_Intra_Recall)+1:...
    length(PLVVals_Intra_Recall) + length(PLVVals_Intra_Rest),1) = cellstr('Rest');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'DMN_HIPP_Recall_Rest_Beta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix


%DMN/Encode/Recall/Compare/Gamma
%load intra network
load(strcat(StrPLVIntraEncode, 'PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Encode = PLVVals_intra_Gamma;
load(strcat(StrPLVIntraEncode, 'PLVVals_intraDMN_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Encode = [PLVVals_Intra_Encode; PLVVals_intra_Gamma];

load(strcat(StrPLVIntraRecall, 'PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Recall = PLVVals_intra_Gamma;
load(strcat(StrPLVIntraRecall, 'PLVVals_intraDMN_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Recall = [PLVVals_Intra_Recall; PLVVals_intra_Gamma];


Matrix = [PLVVals_Intra_Encode; PLVVals_Intra_Recall];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Encode = Subj_Pairs;
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Encode = [Subj_Pairs_Intra_Encode; Subj_Pairs];

load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Recall = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Recall = [Subj_Pairs_Intra_Recall; Subj_Pairs];


Subj_Pairs_Stack = [Subj_Pairs_Intra_Encode; Subj_Pairs_Intra_Recall];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra_Encode),1) = cellstr('Encode');
Regions(length(PLVVals_Intra_Encode)+1:...
    length(PLVVals_Intra_Encode) + length(PLVVals_Intra_Recall),1) = cellstr('Recall');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'DMN_HIPP_Encode_Recall_Gamma.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%DMN/Encode/Rest/Compare/Gamma
%load intra network
load(strcat(StrPLVIntraEncode, 'PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Encode = PLVVals_intra_Gamma;
load(strcat(StrPLVIntraEncode, 'PLVVals_intraDMN_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Encode = [PLVVals_Intra_Encode; PLVVals_intra_Gamma];

load(strcat(StrPLVIntraRest, 'PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Rest = PLVVals_intraDMN_Gamma;
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Rest = [PLVVals_Intra_Rest; PLVVals_intra_Gamma];


Matrix = [PLVVals_Intra_Encode; PLVVals_Intra_Rest];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Encode = Subj_Pairs;
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Encode = [Subj_Pairs_Intra_Encode; Subj_Pairs];

load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Rest = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Rest = [Subj_Pairs_Intra_Rest; Subj_Pairs];


Subj_Pairs_Stack = [Subj_Pairs_Intra_Encode; Subj_Pairs_Intra_Rest];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra_Encode),1) = cellstr('Encode');
Regions(length(PLVVals_Intra_Encode)+1:...
    length(PLVVals_Intra_Encode) + length(PLVVals_Intra_Rest),1) = cellstr('Rest');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'DMN_HIPP_Encode_Rest_Gamma.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%DMN/Recall/Rest/Compare/Gamma
%load intra network
load(strcat(StrPLVIntraRecall, 'PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Recall = PLVVals_intra_Gamma;
load(strcat(StrPLVIntraRecall, 'PLVVals_intraDMN_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Recall = [PLVVals_Intra_Recall; PLVVals_intra_Gamma];

load(strcat(StrPLVIntraRest, 'PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Rest = PLVVals_intraDMN_Gamma;
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Rest = [PLVVals_Intra_Rest; PLVVals_intra_Gamma];


Matrix = [PLVVals_Intra_Recall; PLVVals_Intra_Rest];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Recall = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Recall = [Subj_Pairs_Intra_Recall; Subj_Pairs];

load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Rest = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Rest = [Subj_Pairs_Intra_Rest; Subj_Pairs];


Subj_Pairs_Stack = [Subj_Pairs_Intra_Recall; Subj_Pairs_Intra_Rest];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra_Recall),1) = cellstr('Recall');
Regions(length(PLVVals_Intra_Recall)+1:...
    length(PLVVals_Intra_Recall) + length(PLVVals_Intra_Rest),1) = cellstr('Rest');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'DMN_HIPP_Recall_Rest_Gamma.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix




























%Trial level
%DMN/Encode/Recall/Compare/UltraSlow_Delta
%load intra network
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Encode = PLVVals_intra_UltraSlow_Delta;
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Encode = [PLVVals_Intra_Encode; PLVVals_intra_UltraSlow_Delta];

load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Recall = PLVVals_intra_UltraSlow_Delta;
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Recall = [PLVVals_Intra_Recall; PLVVals_intra_UltraSlow_Delta];


Matrix = [PLVVals_Intra_Encode; PLVVals_Intra_Recall];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Encode = Subj_Pairs;
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Encode = [Subj_Pairs_Intra_Encode; Subj_Pairs];

load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Recall = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Recall = [Subj_Pairs_Intra_Recall; Subj_Pairs];


Subj_Pairs_Stack = [Subj_Pairs_Intra_Encode; Subj_Pairs_Intra_Recall];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra_Encode),1) = cellstr('Encode');
Regions(length(PLVVals_Intra_Encode)+1:...
    length(PLVVals_Intra_Encode) + length(PLVVals_Intra_Recall),1) = cellstr('Recall');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_DMN_HIPP_Encode_Recall_UltraSlow_Delta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%DMN/Encode/Rest/Compare/UltraSlow_Delta
%load intra network
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Encode = PLVVals_intra_UltraSlow_Delta;
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Encode = [PLVVals_Intra_Encode; PLVVals_intra_UltraSlow_Delta];

load(strcat(StrPLVIntraRest, 'PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Rest = PLVVals_intraDMN_UltraSlow_Delta;
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Rest = [PLVVals_Intra_Rest; PLVVals_intra_UltraSlow_Delta];


Matrix = [PLVVals_Intra_Encode; PLVVals_Intra_Rest];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Encode = Subj_Pairs;
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Encode = [Subj_Pairs_Intra_Encode; Subj_Pairs];

load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Rest = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Rest = [Subj_Pairs_Intra_Rest; Subj_Pairs];


Subj_Pairs_Stack = [Subj_Pairs_Intra_Encode; Subj_Pairs_Intra_Rest];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra_Encode),1) = cellstr('Encode');
Regions(length(PLVVals_Intra_Encode)+1:...
    length(PLVVals_Intra_Encode) + length(PLVVals_Intra_Rest),1) = cellstr('Rest');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_DMN_HIPP_Encode_Rest_UltraSlow_Delta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%DMN/Recall/Rest/Compare/UltraSlow_Delta
%load intra network
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Recall = PLVVals_intra_UltraSlow_Delta;
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Recall = [PLVVals_Intra_Recall; PLVVals_intra_UltraSlow_Delta];

load(strcat(StrPLVIntraRest, 'PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Rest = PLVVals_intraDMN_UltraSlow_Delta;
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Rest = [PLVVals_Intra_Rest; PLVVals_intra_UltraSlow_Delta];


Matrix = [PLVVals_Intra_Recall; PLVVals_Intra_Rest];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Recall = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Recall = [Subj_Pairs_Intra_Recall; Subj_Pairs];

load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Rest = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Rest = [Subj_Pairs_Intra_Rest; Subj_Pairs];


Subj_Pairs_Stack = [Subj_Pairs_Intra_Recall; Subj_Pairs_Intra_Rest];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra_Recall),1) = cellstr('Recall');
Regions(length(PLVVals_Intra_Recall)+1:...
    length(PLVVals_Intra_Recall) + length(PLVVals_Intra_Rest),1) = cellstr('Rest');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_DMN_HIPP_Recall_Rest_UltraSlow_Delta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%DMN/Encode/Recall/Compare/Theta
%load intra network
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Encode = PLVVals_intra_Theta;
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Encode = [PLVVals_Intra_Encode; PLVVals_intra_Theta];

load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Recall = PLVVals_intra_Theta;
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Recall = [PLVVals_Intra_Recall; PLVVals_intra_Theta];


Matrix = [PLVVals_Intra_Encode; PLVVals_Intra_Recall];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Encode = Subj_Pairs;
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Encode = [Subj_Pairs_Intra_Encode; Subj_Pairs];

load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Recall = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Recall = [Subj_Pairs_Intra_Recall; Subj_Pairs];


Subj_Pairs_Stack = [Subj_Pairs_Intra_Encode; Subj_Pairs_Intra_Recall];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra_Encode),1) = cellstr('Encode');
Regions(length(PLVVals_Intra_Encode)+1:...
    length(PLVVals_Intra_Encode) + length(PLVVals_Intra_Recall),1) = cellstr('Recall');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_DMN_HIPP_Encode_Recall_Theta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%DMN/Encode/Rest/Compare/Theta
%load intra network
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Encode = PLVVals_intra_Theta;
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Encode = [PLVVals_Intra_Encode; PLVVals_intra_Theta];

load(strcat(StrPLVIntraRest, 'PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Rest = PLVVals_intraDMN_Theta;
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_Random_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Rest = [PLVVals_Intra_Rest; PLVVals_intra_Theta];


Matrix = [PLVVals_Intra_Encode; PLVVals_Intra_Rest];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Encode = Subj_Pairs;
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Encode = [Subj_Pairs_Intra_Encode; Subj_Pairs];

load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Rest = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Rest = [Subj_Pairs_Intra_Rest; Subj_Pairs];


Subj_Pairs_Stack = [Subj_Pairs_Intra_Encode; Subj_Pairs_Intra_Rest];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra_Encode),1) = cellstr('Encode');
Regions(length(PLVVals_Intra_Encode)+1:...
    length(PLVVals_Intra_Encode) + length(PLVVals_Intra_Rest),1) = cellstr('Rest');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_DMN_HIPP_Encode_Rest_Theta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%DMN/Recall/Rest/Compare/Theta
%load intra network
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Recall = PLVVals_intra_Theta;
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Recall = [PLVVals_Intra_Recall; PLVVals_intra_Theta];

load(strcat(StrPLVIntraRest, 'PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Rest = PLVVals_intraDMN_Theta;
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_Random_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Rest = [PLVVals_Intra_Rest; PLVVals_intra_Theta];


Matrix = [PLVVals_Intra_Recall; PLVVals_Intra_Rest];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Recall = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Recall = [Subj_Pairs_Intra_Recall; Subj_Pairs];

load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Rest = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Rest = [Subj_Pairs_Intra_Rest; Subj_Pairs];


Subj_Pairs_Stack = [Subj_Pairs_Intra_Recall; Subj_Pairs_Intra_Rest];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra_Recall),1) = cellstr('Recall');
Regions(length(PLVVals_Intra_Recall)+1:...
    length(PLVVals_Intra_Recall) + length(PLVVals_Intra_Rest),1) = cellstr('Rest');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_DMN_HIPP_Recall_Rest_Theta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%DMN/Encode/Recall/Compare/Alpha
%load intra network
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Encode = PLVVals_intra_Alpha;
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Encode = [PLVVals_Intra_Encode; PLVVals_intra_Alpha];

load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Recall = PLVVals_intra_Alpha;
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Recall = [PLVVals_Intra_Recall; PLVVals_intra_Alpha];


Matrix = [PLVVals_Intra_Encode; PLVVals_Intra_Recall];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Encode = Subj_Pairs;
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Encode = [Subj_Pairs_Intra_Encode; Subj_Pairs];

load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Recall = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Recall = [Subj_Pairs_Intra_Recall; Subj_Pairs];


Subj_Pairs_Stack = [Subj_Pairs_Intra_Encode; Subj_Pairs_Intra_Recall];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra_Encode),1) = cellstr('Encode');
Regions(length(PLVVals_Intra_Encode)+1:...
    length(PLVVals_Intra_Encode) + length(PLVVals_Intra_Recall),1) = cellstr('Recall');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_DMN_HIPP_Encode_Recall_Alpha.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%DMN/Encode/Rest/Compare/Alpha
%load intra network
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Encode = PLVVals_intra_Alpha;
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Encode = [PLVVals_Intra_Encode; PLVVals_intra_Alpha];

load(strcat(StrPLVIntraRest, 'PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Rest = PLVVals_intraDMN_Alpha;
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_Random_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Rest = [PLVVals_Intra_Rest; PLVVals_intra_Alpha];


Matrix = [PLVVals_Intra_Encode; PLVVals_Intra_Rest];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Encode = Subj_Pairs;
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Encode = [Subj_Pairs_Intra_Encode; Subj_Pairs];

load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Rest = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Rest = [Subj_Pairs_Intra_Rest; Subj_Pairs];


Subj_Pairs_Stack = [Subj_Pairs_Intra_Encode; Subj_Pairs_Intra_Rest];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra_Encode),1) = cellstr('Encode');
Regions(length(PLVVals_Intra_Encode)+1:...
    length(PLVVals_Intra_Encode) + length(PLVVals_Intra_Rest),1) = cellstr('Rest');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_DMN_HIPP_Encode_Rest_Alpha.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%DMN/Recall/Rest/Compare/Alpha
%load intra network
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Recall = PLVVals_intra_Alpha;
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Recall = [PLVVals_Intra_Recall; PLVVals_intra_Alpha];

load(strcat(StrPLVIntraRest, 'PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Rest = PLVVals_intraDMN_Alpha;
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_Random_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Rest = [PLVVals_Intra_Rest; PLVVals_intra_Alpha];


Matrix = [PLVVals_Intra_Recall; PLVVals_Intra_Rest];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Recall = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Recall = [Subj_Pairs_Intra_Recall; Subj_Pairs];

load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Rest = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Rest = [Subj_Pairs_Intra_Rest; Subj_Pairs];


Subj_Pairs_Stack = [Subj_Pairs_Intra_Recall; Subj_Pairs_Intra_Rest];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra_Recall),1) = cellstr('Recall');
Regions(length(PLVVals_Intra_Recall)+1:...
    length(PLVVals_Intra_Recall) + length(PLVVals_Intra_Rest),1) = cellstr('Rest');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_DMN_HIPP_Recall_Rest_Alpha.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%DMN/Encode/Recall/Compare/Beta
%load intra network
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Encode = PLVVals_intra_Beta;
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Encode = [PLVVals_Intra_Encode; PLVVals_intra_Beta];

load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Recall = PLVVals_intra_Beta;
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Recall = [PLVVals_Intra_Recall; PLVVals_intra_Beta];


Matrix = [PLVVals_Intra_Encode; PLVVals_Intra_Recall];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Encode = Subj_Pairs;
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Encode = [Subj_Pairs_Intra_Encode; Subj_Pairs];

load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Recall = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Recall = [Subj_Pairs_Intra_Recall; Subj_Pairs];


Subj_Pairs_Stack = [Subj_Pairs_Intra_Encode; Subj_Pairs_Intra_Recall];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra_Encode),1) = cellstr('Encode');
Regions(length(PLVVals_Intra_Encode)+1:...
    length(PLVVals_Intra_Encode) + length(PLVVals_Intra_Recall),1) = cellstr('Recall');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_DMN_HIPP_Encode_Recall_Beta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%DMN/Encode/Rest/Compare/Beta
%load intra network
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Encode = PLVVals_intra_Beta;
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Encode = [PLVVals_Intra_Encode; PLVVals_intra_Beta];

load(strcat(StrPLVIntraRest, 'PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Rest = PLVVals_intraDMN_Beta;
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Rest = [PLVVals_Intra_Rest; PLVVals_intra_Beta];


Matrix = [PLVVals_Intra_Encode; PLVVals_Intra_Rest];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Encode = Subj_Pairs;
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Encode = [Subj_Pairs_Intra_Encode; Subj_Pairs];

load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Rest = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Rest = [Subj_Pairs_Intra_Rest; Subj_Pairs];


Subj_Pairs_Stack = [Subj_Pairs_Intra_Encode; Subj_Pairs_Intra_Rest];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra_Encode),1) = cellstr('Encode');
Regions(length(PLVVals_Intra_Encode)+1:...
    length(PLVVals_Intra_Encode) + length(PLVVals_Intra_Rest),1) = cellstr('Rest');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_DMN_HIPP_Encode_Rest_Beta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%DMN/Recall/Rest/Compare/Beta
%load intra network
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Recall = PLVVals_intra_Beta;
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Recall = [PLVVals_Intra_Recall; PLVVals_intra_Beta];

load(strcat(StrPLVIntraRest, 'PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Rest = PLVVals_intraDMN_Beta;
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Rest = [PLVVals_Intra_Rest; PLVVals_intra_Beta];


Matrix = [PLVVals_Intra_Recall; PLVVals_Intra_Rest];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Recall = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Recall = [Subj_Pairs_Intra_Recall; Subj_Pairs];

load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Rest = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Rest = [Subj_Pairs_Intra_Rest; Subj_Pairs];


Subj_Pairs_Stack = [Subj_Pairs_Intra_Recall; Subj_Pairs_Intra_Rest];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra_Recall),1) = cellstr('Recall');
Regions(length(PLVVals_Intra_Recall)+1:...
    length(PLVVals_Intra_Recall) + length(PLVVals_Intra_Rest),1) = cellstr('Rest');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_DMN_HIPP_Recall_Rest_Beta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%DMN/Encode/Recall/Compare/Gamma
%load intra network
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Encode = PLVVals_intra_Gamma;
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Encode = [PLVVals_Intra_Encode; PLVVals_intra_Gamma];

load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Recall = PLVVals_intra_Gamma;
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Recall = [PLVVals_Intra_Recall; PLVVals_intra_Gamma];


Matrix = [PLVVals_Intra_Encode; PLVVals_Intra_Recall];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Encode = Subj_Pairs;
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Encode = [Subj_Pairs_Intra_Encode; Subj_Pairs];

load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Recall = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Recall = [Subj_Pairs_Intra_Recall; Subj_Pairs];


Subj_Pairs_Stack = [Subj_Pairs_Intra_Encode; Subj_Pairs_Intra_Recall];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra_Encode),1) = cellstr('Encode');
Regions(length(PLVVals_Intra_Encode)+1:...
    length(PLVVals_Intra_Encode) + length(PLVVals_Intra_Recall),1) = cellstr('Recall');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_DMN_HIPP_Encode_Recall_Gamma.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%DMN/Encode/Rest/Compare/Gamma
%load intra network
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Encode = PLVVals_intra_Gamma;
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Encode = [PLVVals_Intra_Encode; PLVVals_intra_Gamma];

load(strcat(StrPLVIntraRest, 'PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Rest = PLVVals_intraDMN_Gamma;
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Rest = [PLVVals_Intra_Rest; PLVVals_intra_Gamma];


Matrix = [PLVVals_Intra_Encode; PLVVals_Intra_Rest];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Encode = Subj_Pairs;
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Encode = [Subj_Pairs_Intra_Encode; Subj_Pairs];

load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Rest = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Rest = [Subj_Pairs_Intra_Rest; Subj_Pairs];


Subj_Pairs_Stack = [Subj_Pairs_Intra_Encode; Subj_Pairs_Intra_Rest];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra_Encode),1) = cellstr('Encode');
Regions(length(PLVVals_Intra_Encode)+1:...
    length(PLVVals_Intra_Encode) + length(PLVVals_Intra_Rest),1) = cellstr('Rest');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_DMN_HIPP_Encode_Rest_Gamma.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%DMN/Recall/Rest/Compare/Gamma
%load intra network
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Recall = PLVVals_intra_Gamma;
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Recall = [PLVVals_Intra_Recall; PLVVals_intra_Gamma];

load(strcat(StrPLVIntraRest, 'PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Rest = PLVVals_intraDMN_Gamma;
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Rest = [PLVVals_Intra_Rest; PLVVals_intra_Gamma];


Matrix = [PLVVals_Intra_Recall; PLVVals_Intra_Rest];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Recall = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Recall = [Subj_Pairs_Intra_Recall; Subj_Pairs];

load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra_Rest = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra_Rest = [Subj_Pairs_Intra_Rest; Subj_Pairs];


Subj_Pairs_Stack = [Subj_Pairs_Intra_Recall; Subj_Pairs_Intra_Rest];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra_Recall),1) = cellstr('Recall');
Regions(length(PLVVals_Intra_Recall)+1:...
    length(PLVVals_Intra_Recall) + length(PLVVals_Intra_Rest),1) = cellstr('Rest');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_DMN_HIPP_Recall_Rest_Gamma.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix








































%DMN/Encode/Correct/Incorrect/Compare/UltraSlow_Delta
%load intra network
load(strcat(StrPLVIntraEncode, 'Correct_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Correct = PLVVals_intra_UltraSlow_Delta;
load(strcat(StrPLVIntraEncode, 'Correct_PLVVals_intraDMN_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Correct = [PLVVals_Intra_Correct; PLVVals_intra_UltraSlow_Delta];

load(strcat(StrPLVIntraEncode, 'Incorrect_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Incorrect = PLVVals_intra_UltraSlow_Delta;
load(strcat(StrPLVIntraEncode, 'Incorrect_PLVVals_intraDMN_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Incorrect = [PLVVals_Intra_Incorrect; PLVVals_intra_UltraSlow_Delta];


Matrix = [PLVVals_Intra_Correct; PLVVals_Intra_Incorrect];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Intra];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra_Correct),1) = cellstr('Correct');
Regions(length(PLVVals_Intra_Correct)+1:...
    length(PLVVals_Intra_Correct) + length(PLVVals_Intra_Incorrect),1) = cellstr('Incorrect');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'DMN_HIPP_Encode_Correct_Incorrect_UltraSlow_Delta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%DMN/Recall/Correct/Incorrect/Compare/UltraSlow_Delta
%load intra network
load(strcat(StrPLVIntraRecall, 'Correct_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Correct = PLVVals_intra_UltraSlow_Delta;
load(strcat(StrPLVIntraRecall, 'Correct_PLVVals_intraDMN_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Correct = [PLVVals_Intra_Correct; PLVVals_intra_UltraSlow_Delta];

load(strcat(StrPLVIntraRecall, 'Incorrect_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Incorrect = PLVVals_intra_UltraSlow_Delta;
load(strcat(StrPLVIntraRecall, 'Incorrect_PLVVals_intraDMN_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Incorrect = [PLVVals_Intra_Incorrect; PLVVals_intra_UltraSlow_Delta];


Matrix = [PLVVals_Intra_Correct; PLVVals_Intra_Incorrect];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Intra];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra_Correct),1) = cellstr('Correct');
Regions(length(PLVVals_Intra_Correct)+1:...
    length(PLVVals_Intra_Correct) + length(PLVVals_Intra_Incorrect),1) = cellstr('Incorrect');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'DMN_HIPP_Recall_Correct_Incorrect_UltraSlow_Delta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%DMN/Encode/Correct/Incorrect/Compare/UltraSlow_Delta_Theta
%load intra network
load(strcat(StrPLVIntraEncode, 'Correct_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Correct = PLVVals_intra_UltraSlow_Delta_Theta;
load(strcat(StrPLVIntraEncode, 'Correct_PLVVals_intraDMN_Yeo2011_UltraSlow_Delta_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Correct = [PLVVals_Intra_Correct; PLVVals_intra_UltraSlow_Delta_Theta];

load(strcat(StrPLVIntraEncode, 'Incorrect_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Incorrect = PLVVals_intra_UltraSlow_Delta_Theta;
load(strcat(StrPLVIntraEncode, 'Incorrect_PLVVals_intraDMN_Yeo2011_UltraSlow_Delta_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Incorrect = [PLVVals_Intra_Incorrect; PLVVals_intra_UltraSlow_Delta_Theta];


Matrix = [PLVVals_Intra_Correct; PLVVals_Intra_Incorrect];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Intra];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra_Correct),1) = cellstr('Correct');
Regions(length(PLVVals_Intra_Correct)+1:...
    length(PLVVals_Intra_Correct) + length(PLVVals_Intra_Incorrect),1) = cellstr('Incorrect');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'DMN_HIPP_Encode_Correct_Incorrect_UltraSlow_Delta_Theta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%DMN/Recall/Correct/Incorrect/Compare/UltraSlow_Delta_Theta
%load intra network
load(strcat(StrPLVIntraRecall, 'Correct_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Correct = PLVVals_intra_UltraSlow_Delta_Theta;
load(strcat(StrPLVIntraRecall, 'Correct_PLVVals_intraDMN_Yeo2011_UltraSlow_Delta_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Correct = [PLVVals_Intra_Correct; PLVVals_intra_UltraSlow_Delta_Theta];

load(strcat(StrPLVIntraRecall, 'Incorrect_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Incorrect = PLVVals_intra_UltraSlow_Delta_Theta;
load(strcat(StrPLVIntraRecall, 'Incorrect_PLVVals_intraDMN_Yeo2011_UltraSlow_Delta_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Incorrect = [PLVVals_Intra_Incorrect; PLVVals_intra_UltraSlow_Delta_Theta];


Matrix = [PLVVals_Intra_Correct; PLVVals_Intra_Incorrect];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Intra];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra_Correct),1) = cellstr('Correct');
Regions(length(PLVVals_Intra_Correct)+1:...
    length(PLVVals_Intra_Correct) + length(PLVVals_Intra_Incorrect),1) = cellstr('Incorrect');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'DMN_HIPP_Recall_Correct_Incorrect_UltraSlow_Delta_Theta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%DMN/Encode/Correct/Incorrect/Compare/Delta_Theta
%load intra network
load(strcat(StrPLVIntraEncode, 'Correct_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Delta_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Correct = PLVVals_intra_Delta_Theta;
load(strcat(StrPLVIntraEncode, 'Correct_PLVVals_intraDMN_Yeo2011_Delta_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Correct = [PLVVals_Intra_Correct; PLVVals_intra_Delta_Theta];

load(strcat(StrPLVIntraEncode, 'Incorrect_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Delta_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Incorrect = PLVVals_intra_Delta_Theta;
load(strcat(StrPLVIntraEncode, 'Incorrect_PLVVals_intraDMN_Yeo2011_Delta_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Incorrect = [PLVVals_Intra_Incorrect; PLVVals_intra_Delta_Theta];


Matrix = [PLVVals_Intra_Correct; PLVVals_Intra_Incorrect];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Intra];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra_Correct),1) = cellstr('Correct');
Regions(length(PLVVals_Intra_Correct)+1:...
    length(PLVVals_Intra_Correct) + length(PLVVals_Intra_Incorrect),1) = cellstr('Incorrect');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'DMN_HIPP_Encode_Correct_Incorrect_Delta_Theta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%DMN/Recall/Correct/Incorrect/Compare/Delta_Theta
%load intra network
load(strcat(StrPLVIntraRecall, 'Correct_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Delta_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Correct = PLVVals_intra_Delta_Theta;
load(strcat(StrPLVIntraRecall, 'Correct_PLVVals_intraDMN_Yeo2011_Delta_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Correct = [PLVVals_Intra_Correct; PLVVals_intra_Delta_Theta];

load(strcat(StrPLVIntraRecall, 'Incorrect_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Delta_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Incorrect = PLVVals_intra_Delta_Theta;
load(strcat(StrPLVIntraRecall, 'Incorrect_PLVVals_intraDMN_Yeo2011_Delta_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_Incorrect = [PLVVals_Intra_Incorrect; PLVVals_intra_Delta_Theta];


Matrix = [PLVVals_Intra_Correct; PLVVals_Intra_Incorrect];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];


Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Intra];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra_Correct),1) = cellstr('Correct');
Regions(length(PLVVals_Intra_Correct)+1:...
    length(PLVVals_Intra_Correct) + length(PLVVals_Intra_Incorrect),1) = cellstr('Incorrect');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'DMN_HIPP_Recall_Correct_Incorrect_Delta_Theta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix




































%PTE/DMN/Encode
%load inter network
load(strcat(StrPTEEncode, 'PTEVals_DMNHIPP_1_Yeo2011_Random_ArtifactRemove.mat'));
PTEVals1 = PTEVals_12;
load(strcat(StrPTEEncode, 'PTEVals_DMNHIPP_2_Yeo2011_Random_ArtifactRemove.mat'));
PTEVals2 = PTEVals_12;
load(strcat(StrPTEEncode, 'PTEVals_DMNHIPP_3_Yeo2011_Random_ArtifactRemove.mat'));
PTEVals3 = PTEVals_12;
load(strcat(StrPTEEncode, 'PTEVals_DMNHIPP_4_Yeo2011_Random_ArtifactRemove.mat'));
PTEVals4 = PTEVals_12;
load(strcat(StrPTEEncode, 'PTEVals_DMNHIPP_5_Yeo2011_Random_ArtifactRemove.mat'));
PTEVals5 = PTEVals_12;
load(strcat(StrPTEEncode, 'PTEVals_DMNHIPP_6_Yeo2011_Random_ArtifactRemove.mat'));
PTEVals6 = PTEVals_12;

PTEVals_DMNHIPP_Others = [PTEVals1; PTEVals2; PTEVals3;PTEVals4; PTEVals5; PTEVals6];


load(strcat(StrPTEEncode, 'PTEVals_1_DMNHIPP_Yeo2011_Random_ArtifactRemove.mat'));
PTEVals1 = PTEVals_21;
load(strcat(StrPTEEncode, 'PTEVals_2_DMNHIPP_Yeo2011_Random_ArtifactRemove.mat'));
PTEVals2 = PTEVals_21;
load(strcat(StrPTEEncode, 'PTEVals_3_DMNHIPP_Yeo2011_Random_ArtifactRemove.mat'));
PTEVals3 = PTEVals_21;
load(strcat(StrPTEEncode, 'PTEVals_4_DMNHIPP_Yeo2011_Random_ArtifactRemove.mat'));
PTEVals4 = PTEVals_21;
load(strcat(StrPTEEncode, 'PTEVals_5_DMNHIPP_Yeo2011_Random_ArtifactRemove.mat'));
PTEVals5 = PTEVals_21;
load(strcat(StrPTEEncode, 'PTEVals_6_DMNHIPP_Yeo2011_Random_ArtifactRemove.mat'));
PTEVals6 = PTEVals_21;

PTEVals_Others_DMNHIPP = [PTEVals1; PTEVals2; PTEVals3;PTEVals4; PTEVals5; PTEVals6];

Matrix = [PTEVals_DMNHIPP_Others; PTEVals_Others_DMNHIPP];

%load SubjPairs
%load inter network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

Subj_Pairs_Stack = [Subj_Pairs_Inter; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PTEVals_DMNHIPP_Others),1) = cellstr('DMNHIPP_Others');
Regions(length(PTEVals_DMNHIPP_Others)+1:...
    length(PTEVals_DMNHIPP_Others) + length(PTEVals_Others_DMNHIPP),1) = cellstr('Others_DMNHIPP');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PTE' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'PTE_DMN_HIPP_Encode.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%PTE/DMN/Recall
%load inter network
load(strcat(StrPTERecall, 'PTEVals_DMNHIPP_1_Yeo2011_Random_ArtifactRemove.mat'));
PTEVals1 = PTEVals_12;
load(strcat(StrPTERecall, 'PTEVals_DMNHIPP_2_Yeo2011_Random_ArtifactRemove.mat'));
PTEVals2 = PTEVals_12;
load(strcat(StrPTERecall, 'PTEVals_DMNHIPP_3_Yeo2011_Random_ArtifactRemove.mat'));
PTEVals3 = PTEVals_12;
load(strcat(StrPTERecall, 'PTEVals_DMNHIPP_4_Yeo2011_Random_ArtifactRemove.mat'));
PTEVals4 = PTEVals_12;
load(strcat(StrPTERecall, 'PTEVals_DMNHIPP_5_Yeo2011_Random_ArtifactRemove.mat'));
PTEVals5 = PTEVals_12;
load(strcat(StrPTERecall, 'PTEVals_DMNHIPP_6_Yeo2011_Random_ArtifactRemove.mat'));
PTEVals6 = PTEVals_12;

PTEVals_DMNHIPP_Others = [PTEVals1; PTEVals2; PTEVals3;PTEVals4; PTEVals5; PTEVals6];


load(strcat(StrPTERecall, 'PTEVals_1_DMNHIPP_Yeo2011_Random_ArtifactRemove.mat'));
PTEVals1 = PTEVals_21;
load(strcat(StrPTERecall, 'PTEVals_2_DMNHIPP_Yeo2011_Random_ArtifactRemove.mat'));
PTEVals2 = PTEVals_21;
load(strcat(StrPTERecall, 'PTEVals_3_DMNHIPP_Yeo2011_Random_ArtifactRemove.mat'));
PTEVals3 = PTEVals_21;
load(strcat(StrPTERecall, 'PTEVals_4_DMNHIPP_Yeo2011_Random_ArtifactRemove.mat'));
PTEVals4 = PTEVals_21;
load(strcat(StrPTERecall, 'PTEVals_5_DMNHIPP_Yeo2011_Random_ArtifactRemove.mat'));
PTEVals5 = PTEVals_21;
load(strcat(StrPTERecall, 'PTEVals_6_DMNHIPP_Yeo2011_Random_ArtifactRemove.mat'));
PTEVals6 = PTEVals_21;

PTEVals_Others_DMNHIPP = [PTEVals1; PTEVals2; PTEVals3;PTEVals4; PTEVals5; PTEVals6];

Matrix = [PTEVals_DMNHIPP_Others; PTEVals_Others_DMNHIPP];

%load SubjPairs
%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

Subj_Pairs_Stack = [Subj_Pairs_Inter; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PTEVals_DMNHIPP_Others),1) = cellstr('DMNHIPP_Others');
Regions(length(PTEVals_DMNHIPP_Others)+1:...
    length(PTEVals_DMNHIPP_Others) + length(PTEVals_Others_DMNHIPP),1) = cellstr('Others_DMNHIPP');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PTE' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'PTE_DMN_HIPP_Recall.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%PTE/DMN/Encode/Recall/Compare
%load inter network
load(strcat(StrPTEEncode, 'PTEVals_DMNHIPP_1_Yeo2011_Random_ArtifactRemove.mat'));
PTEVals1 = PTEVals_12;
load(strcat(StrPTEEncode, 'PTEVals_DMNHIPP_2_Yeo2011_Random_ArtifactRemove.mat'));
PTEVals2 = PTEVals_12;
load(strcat(StrPTEEncode, 'PTEVals_DMNHIPP_3_Yeo2011_Random_ArtifactRemove.mat'));
PTEVals3 = PTEVals_12;
load(strcat(StrPTEEncode, 'PTEVals_DMNHIPP_4_Yeo2011_Random_ArtifactRemove.mat'));
PTEVals4 = PTEVals_12;
load(strcat(StrPTEEncode, 'PTEVals_DMNHIPP_5_Yeo2011_Random_ArtifactRemove.mat'));
PTEVals5 = PTEVals_12;
load(strcat(StrPTEEncode, 'PTEVals_DMNHIPP_6_Yeo2011_Random_ArtifactRemove.mat'));
PTEVals6 = PTEVals_12;

PTEVals_DMNHIPP_Others_Encode = [PTEVals1; PTEVals2; PTEVals3;PTEVals4; PTEVals5; PTEVals6];


load(strcat(StrPTERecall, 'PTEVals_DMNHIPP_1_Yeo2011_Random_ArtifactRemove.mat'));
PTEVals1 = PTEVals_12;
load(strcat(StrPTERecall, 'PTEVals_DMNHIPP_2_Yeo2011_Random_ArtifactRemove.mat'));
PTEVals2 = PTEVals_12;
load(strcat(StrPTERecall, 'PTEVals_DMNHIPP_3_Yeo2011_Random_ArtifactRemove.mat'));
PTEVals3 = PTEVals_12;
load(strcat(StrPTERecall, 'PTEVals_DMNHIPP_4_Yeo2011_Random_ArtifactRemove.mat'));
PTEVals4 = PTEVals_12;
load(strcat(StrPTERecall, 'PTEVals_DMNHIPP_5_Yeo2011_Random_ArtifactRemove.mat'));
PTEVals5 = PTEVals_12;
load(strcat(StrPTERecall, 'PTEVals_DMNHIPP_6_Yeo2011_Random_ArtifactRemove.mat'));
PTEVals6 = PTEVals_12;

PTEVals_DMNHIPP_Others_Recall = [PTEVals1; PTEVals2; PTEVals3;PTEVals4; PTEVals5; PTEVals6];


Matrix = [PTEVals_DMNHIPP_Others_Encode; PTEVals_DMNHIPP_Others_Recall];

%load SubjPairs
%load inter network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter_Encode = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];


load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter_Recall = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

Subj_Pairs_Stack = [Subj_Pairs_Inter_Encode; Subj_Pairs_Inter_Recall];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PTEVals_DMNHIPP_Others_Encode),1) = cellstr('Encode');
Regions(length(PTEVals_DMNHIPP_Others_Encode)+1:...
    length(PTEVals_DMNHIPP_Others_Encode) + length(PTEVals_DMNHIPP_Others_Recall),1) = cellstr('Recall');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PTE' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'PTE_DMN_HIPP_Encode_Recall.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%PTE/DMN/Encode/Rest/Compare
%load inter network
load(strcat(StrPTEEncode, 'PTEVals_DMNHIPP_1_Yeo2011_Random_ArtifactRemove.mat'));
PTEVals1 = PTEVals_12;
load(strcat(StrPTEEncode, 'PTEVals_DMNHIPP_2_Yeo2011_Random_ArtifactRemove.mat'));
PTEVals2 = PTEVals_12;
load(strcat(StrPTEEncode, 'PTEVals_DMNHIPP_3_Yeo2011_Random_ArtifactRemove.mat'));
PTEVals3 = PTEVals_12;
load(strcat(StrPTEEncode, 'PTEVals_DMNHIPP_4_Yeo2011_Random_ArtifactRemove.mat'));
PTEVals4 = PTEVals_12;
load(strcat(StrPTEEncode, 'PTEVals_DMNHIPP_5_Yeo2011_Random_ArtifactRemove.mat'));
PTEVals5 = PTEVals_12;
load(strcat(StrPTEEncode, 'PTEVals_DMNHIPP_6_Yeo2011_Random_ArtifactRemove.mat'));
PTEVals6 = PTEVals_12;

PTEVals_DMNHIPP_Others_Encode = [PTEVals1; PTEVals2; PTEVals3;PTEVals4; PTEVals5; PTEVals6];


load(strcat(StrPTERest, 'PTEVals_DMNHIPP_1_Yeo2011_ArtifactRemove.mat'));
PTEVals1 = PTEVals_12;
load(strcat(StrPTERest, 'PTEVals_DMNHIPP_2_Yeo2011_ArtifactRemove.mat'));
PTEVals2 = PTEVals_12;
load(strcat(StrPTERest, 'PTEVals_DMNHIPP_3_Yeo2011_ArtifactRemove.mat'));
PTEVals3 = PTEVals_12;
load(strcat(StrPTERest, 'PTEVals_DMNHIPP_4_Yeo2011_ArtifactRemove.mat'));
PTEVals4 = PTEVals_12;
load(strcat(StrPTERest, 'PTEVals_DMNHIPP_5_Yeo2011_ArtifactRemove.mat'));
PTEVals5 = PTEVals_12;
load(strcat(StrPTERest, 'PTEVals_DMNHIPP_6_Yeo2011_ArtifactRemove.mat'));
PTEVals6 = PTEVals_12;

PTEVals_DMNHIPP_Others_Rest = [PTEVals1; PTEVals2; PTEVals3;PTEVals4; PTEVals5; PTEVals6];

Matrix = [PTEVals_DMNHIPP_Others_Encode; PTEVals_DMNHIPP_Others_Rest];

%load SubjPairs
%load inter network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter_Encode = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];


load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter_Recall = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

Subj_Pairs_Stack = [Subj_Pairs_Inter_Encode; Subj_Pairs_Inter_Recall];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PTEVals_DMNHIPP_Others_Encode),1) = cellstr('Encode');
Regions(length(PTEVals_DMNHIPP_Others_Encode)+1:...
    length(PTEVals_DMNHIPP_Others_Encode) + length(PTEVals_DMNHIPP_Others_Rest),1) = cellstr('Rest');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PTE' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'PTE_DMN_HIPP_Encode_Rest.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%PTE/DMN/Recall/Rest/Compare
%load inter network
load(strcat(StrPTERecall, 'PTEVals_DMNHIPP_1_Yeo2011_Random_ArtifactRemove.mat'));
PTEVals1 = PTEVals_12;
load(strcat(StrPTERecall, 'PTEVals_DMNHIPP_2_Yeo2011_Random_ArtifactRemove.mat'));
PTEVals2 = PTEVals_12;
load(strcat(StrPTERecall, 'PTEVals_DMNHIPP_3_Yeo2011_Random_ArtifactRemove.mat'));
PTEVals3 = PTEVals_12;
load(strcat(StrPTERecall, 'PTEVals_DMNHIPP_4_Yeo2011_Random_ArtifactRemove.mat'));
PTEVals4 = PTEVals_12;
load(strcat(StrPTERecall, 'PTEVals_DMNHIPP_5_Yeo2011_Random_ArtifactRemove.mat'));
PTEVals5 = PTEVals_12;
load(strcat(StrPTERecall, 'PTEVals_DMNHIPP_6_Yeo2011_Random_ArtifactRemove.mat'));
PTEVals6 = PTEVals_12;

PTEVals_DMNHIPP_Others_Recall = [PTEVals1; PTEVals2; PTEVals3;PTEVals4; PTEVals5; PTEVals6];


load(strcat(StrPTERest, 'PTEVals_DMNHIPP_1_Yeo2011_ArtifactRemove.mat'));
PTEVals1 = PTEVals_12;
load(strcat(StrPTERest, 'PTEVals_DMNHIPP_2_Yeo2011_ArtifactRemove.mat'));
PTEVals2 = PTEVals_12;
load(strcat(StrPTERest, 'PTEVals_DMNHIPP_3_Yeo2011_ArtifactRemove.mat'));
PTEVals3 = PTEVals_12;
load(strcat(StrPTERest, 'PTEVals_DMNHIPP_4_Yeo2011_ArtifactRemove.mat'));
PTEVals4 = PTEVals_12;
load(strcat(StrPTERest, 'PTEVals_DMNHIPP_5_Yeo2011_ArtifactRemove.mat'));
PTEVals5 = PTEVals_12;
load(strcat(StrPTERest, 'PTEVals_DMNHIPP_6_Yeo2011_ArtifactRemove.mat'));
PTEVals6 = PTEVals_12;

PTEVals_DMNHIPP_Others_Rest = [PTEVals1; PTEVals2; PTEVals3;PTEVals4; PTEVals5; PTEVals6];

Matrix = [PTEVals_DMNHIPP_Others_Recall; PTEVals_DMNHIPP_Others_Rest];

%load SubjPairs
%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter_Recall = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

Subj_Pairs_Stack = [Subj_Pairs_Inter_Recall; Subj_Pairs_Inter_Recall];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PTEVals_DMNHIPP_Others_Recall),1) = cellstr('Recall');
Regions(length(PTEVals_DMNHIPP_Others_Recall)+1:...
    length(PTEVals_DMNHIPP_Others_Recall) + length(PTEVals_DMNHIPP_Others_Rest),1) = cellstr('Rest');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PTE' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'PTE_DMN_HIPP_Recall_Rest.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix
















































%Trials
%PTE/DMN/Encode
%load inter network
load(strcat(StrPTEEncode, 'CorrIncorr_PTEVals_DMNHIPP_1_Yeo2011_ArtifactRemove.mat'));
PTEVals1 = PTEVals_12;
load(strcat(StrPTEEncode, 'CorrIncorr_PTEVals_DMNHIPP_2_Yeo2011_ArtifactRemove.mat'));
PTEVals2 = PTEVals_12;
load(strcat(StrPTEEncode, 'CorrIncorr_PTEVals_DMNHIPP_3_Yeo2011_ArtifactRemove.mat'));
PTEVals3 = PTEVals_12;
load(strcat(StrPTEEncode, 'CorrIncorr_PTEVals_DMNHIPP_4_Yeo2011_ArtifactRemove.mat'));
PTEVals4 = PTEVals_12;
load(strcat(StrPTEEncode, 'CorrIncorr_PTEVals_DMNHIPP_5_Yeo2011_ArtifactRemove.mat'));
PTEVals5 = PTEVals_12;
load(strcat(StrPTEEncode, 'CorrIncorr_PTEVals_DMNHIPP_6_Yeo2011_ArtifactRemove.mat'));
PTEVals6 = PTEVals_12;

PTEVals_DMNHIPP_Others = [PTEVals1; PTEVals2; PTEVals3;PTEVals4; PTEVals5; PTEVals6];


load(strcat(StrPTEEncode, 'CorrIncorr_PTEVals_1_DMNHIPP_Yeo2011_ArtifactRemove.mat'));
PTEVals1 = PTEVals_21;
load(strcat(StrPTEEncode, 'CorrIncorr_PTEVals_2_DMNHIPP_Yeo2011_ArtifactRemove.mat'));
PTEVals2 = PTEVals_21;
load(strcat(StrPTEEncode, 'CorrIncorr_PTEVals_3_DMNHIPP_Yeo2011_ArtifactRemove.mat'));
PTEVals3 = PTEVals_21;
load(strcat(StrPTEEncode, 'CorrIncorr_PTEVals_4_DMNHIPP_Yeo2011_ArtifactRemove.mat'));
PTEVals4 = PTEVals_21;
load(strcat(StrPTEEncode, 'CorrIncorr_PTEVals_5_DMNHIPP_Yeo2011_ArtifactRemove.mat'));
PTEVals5 = PTEVals_21;
load(strcat(StrPTEEncode, 'CorrIncorr_PTEVals_6_DMNHIPP_Yeo2011_ArtifactRemove.mat'));
PTEVals6 = PTEVals_21;

PTEVals_Others_DMNHIPP = [PTEVals1; PTEVals2; PTEVals3;PTEVals4; PTEVals5; PTEVals6];

Matrix = [PTEVals_DMNHIPP_Others; PTEVals_Others_DMNHIPP];

%load SubjPairs
%load inter network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

Subj_Pairs_Stack = [Subj_Pairs_Inter; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PTEVals_DMNHIPP_Others),1) = cellstr('DMNHIPP_Others');
Regions(length(PTEVals_DMNHIPP_Others)+1:...
    length(PTEVals_DMNHIPP_Others) + length(PTEVals_Others_DMNHIPP),1) = cellstr('Others_DMNHIPP');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PTE' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_PTE_DMN_HIPP_Encode.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%PTE/DMN/Recall
%load inter network
load(strcat(StrPTERecall, 'CorrIncorr_PTEVals_DMNHIPP_1_Yeo2011_ArtifactRemove.mat'));
PTEVals1 = PTEVals_12;
load(strcat(StrPTERecall, 'CorrIncorr_PTEVals_DMNHIPP_2_Yeo2011_ArtifactRemove.mat'));
PTEVals2 = PTEVals_12;
load(strcat(StrPTERecall, 'CorrIncorr_PTEVals_DMNHIPP_3_Yeo2011_ArtifactRemove.mat'));
PTEVals3 = PTEVals_12;
load(strcat(StrPTERecall, 'CorrIncorr_PTEVals_DMNHIPP_4_Yeo2011_ArtifactRemove.mat'));
PTEVals4 = PTEVals_12;
load(strcat(StrPTERecall, 'CorrIncorr_PTEVals_DMNHIPP_5_Yeo2011_ArtifactRemove.mat'));
PTEVals5 = PTEVals_12;
load(strcat(StrPTERecall, 'CorrIncorr_PTEVals_DMNHIPP_6_Yeo2011_ArtifactRemove.mat'));
PTEVals6 = PTEVals_12;

PTEVals_DMNHIPP_Others = [PTEVals1; PTEVals2; PTEVals3;PTEVals4; PTEVals5; PTEVals6];


load(strcat(StrPTERecall, 'CorrIncorr_PTEVals_1_DMNHIPP_Yeo2011_ArtifactRemove.mat'));
PTEVals1 = PTEVals_21;
load(strcat(StrPTERecall, 'CorrIncorr_PTEVals_2_DMNHIPP_Yeo2011_ArtifactRemove.mat'));
PTEVals2 = PTEVals_21;
load(strcat(StrPTERecall, 'CorrIncorr_PTEVals_3_DMNHIPP_Yeo2011_ArtifactRemove.mat'));
PTEVals3 = PTEVals_21;
load(strcat(StrPTERecall, 'CorrIncorr_PTEVals_4_DMNHIPP_Yeo2011_ArtifactRemove.mat'));
PTEVals4 = PTEVals_21;
load(strcat(StrPTERecall, 'CorrIncorr_PTEVals_5_DMNHIPP_Yeo2011_ArtifactRemove.mat'));
PTEVals5 = PTEVals_21;
load(strcat(StrPTERecall, 'CorrIncorr_PTEVals_6_DMNHIPP_Yeo2011_ArtifactRemove.mat'));
PTEVals6 = PTEVals_21;

PTEVals_Others_DMNHIPP = [PTEVals1; PTEVals2; PTEVals3;PTEVals4; PTEVals5; PTEVals6];

Matrix = [PTEVals_DMNHIPP_Others; PTEVals_Others_DMNHIPP];

%load SubjPairs
%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

Subj_Pairs_Stack = [Subj_Pairs_Inter; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PTEVals_DMNHIPP_Others),1) = cellstr('DMNHIPP_Others');
Regions(length(PTEVals_DMNHIPP_Others)+1:...
    length(PTEVals_DMNHIPP_Others) + length(PTEVals_Others_DMNHIPP),1) = cellstr('Others_DMNHIPP');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PTE' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_PTE_DMN_HIPP_Recall.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix









































%CorrIncorr/PTE/DMN/Encode/Recall/Compare
%load inter network
load(strcat(StrPTEEncode, 'CorrIncorr_PTEVals_DMNHIPP_1_Yeo2011_ArtifactRemove.mat'));
PTEVals1 = PTEVals_12;
load(strcat(StrPTEEncode, 'CorrIncorr_PTEVals_DMNHIPP_2_Yeo2011_ArtifactRemove.mat'));
PTEVals2 = PTEVals_12;
load(strcat(StrPTEEncode, 'CorrIncorr_PTEVals_DMNHIPP_3_Yeo2011_ArtifactRemove.mat'));
PTEVals3 = PTEVals_12;
load(strcat(StrPTEEncode, 'CorrIncorr_PTEVals_DMNHIPP_4_Yeo2011_ArtifactRemove.mat'));
PTEVals4 = PTEVals_12;
load(strcat(StrPTEEncode, 'CorrIncorr_PTEVals_DMNHIPP_5_Yeo2011_ArtifactRemove.mat'));
PTEVals5 = PTEVals_12;
load(strcat(StrPTEEncode, 'CorrIncorr_PTEVals_DMNHIPP_6_Yeo2011_ArtifactRemove.mat'));
PTEVals6 = PTEVals_12;

PTEVals_DMNHIPP_Others_Encode = [PTEVals1; PTEVals2; PTEVals3;PTEVals4; PTEVals5; PTEVals6];


load(strcat(StrPTERecall, 'CorrIncorr_PTEVals_DMNHIPP_1_Yeo2011_ArtifactRemove.mat'));
PTEVals1 = PTEVals_12;
load(strcat(StrPTERecall, 'CorrIncorr_PTEVals_DMNHIPP_2_Yeo2011_ArtifactRemove.mat'));
PTEVals2 = PTEVals_12;
load(strcat(StrPTERecall, 'CorrIncorr_PTEVals_DMNHIPP_3_Yeo2011_ArtifactRemove.mat'));
PTEVals3 = PTEVals_12;
load(strcat(StrPTERecall, 'CorrIncorr_PTEVals_DMNHIPP_4_Yeo2011_ArtifactRemove.mat'));
PTEVals4 = PTEVals_12;
load(strcat(StrPTERecall, 'CorrIncorr_PTEVals_DMNHIPP_5_Yeo2011_ArtifactRemove.mat'));
PTEVals5 = PTEVals_12;
load(strcat(StrPTERecall, 'CorrIncorr_PTEVals_DMNHIPP_6_Yeo2011_ArtifactRemove.mat'));
PTEVals6 = PTEVals_12;

PTEVals_DMNHIPP_Others_Recall = [PTEVals1; PTEVals2; PTEVals3;PTEVals4; PTEVals5; PTEVals6];


Matrix = [PTEVals_DMNHIPP_Others_Encode; PTEVals_DMNHIPP_Others_Recall];

%load SubjPairs
%load inter network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter_Encode = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];


load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter_Recall = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

Subj_Pairs_Stack = [Subj_Pairs_Inter_Encode; Subj_Pairs_Inter_Recall];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PTEVals_DMNHIPP_Others_Encode),1) = cellstr('Encode');
Regions(length(PTEVals_DMNHIPP_Others_Encode)+1:...
    length(PTEVals_DMNHIPP_Others_Encode) + length(PTEVals_DMNHIPP_Others_Recall),1) = cellstr('Recall');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PTE' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_PTE_DMN_HIPP_Encode_Recall.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%CorrIncorr/PTE/DMN/Encode/Rest/Compare
%load inter network
load(strcat(StrPTEEncode, 'CorrIncorr_PTEVals_DMNHIPP_1_Yeo2011_ArtifactRemove.mat'));
PTEVals1 = PTEVals_12;
load(strcat(StrPTEEncode, 'CorrIncorr_PTEVals_DMNHIPP_2_Yeo2011_ArtifactRemove.mat'));
PTEVals2 = PTEVals_12;
load(strcat(StrPTEEncode, 'CorrIncorr_PTEVals_DMNHIPP_3_Yeo2011_ArtifactRemove.mat'));
PTEVals3 = PTEVals_12;
load(strcat(StrPTEEncode, 'CorrIncorr_PTEVals_DMNHIPP_4_Yeo2011_ArtifactRemove.mat'));
PTEVals4 = PTEVals_12;
load(strcat(StrPTEEncode, 'CorrIncorr_PTEVals_DMNHIPP_5_Yeo2011_ArtifactRemove.mat'));
PTEVals5 = PTEVals_12;
load(strcat(StrPTEEncode, 'CorrIncorr_PTEVals_DMNHIPP_6_Yeo2011_ArtifactRemove.mat'));
PTEVals6 = PTEVals_12;

PTEVals_DMNHIPP_Others_Encode = [PTEVals1; PTEVals2; PTEVals3;PTEVals4; PTEVals5; PTEVals6];


load(strcat(StrPTERest, 'PTEVals_DMNHIPP_1_Random_Yeo2011_ArtifactRemove.mat'));
PTEVals1 = PTEVals_12;
load(strcat(StrPTERest, 'PTEVals_DMNHIPP_2_Random_Yeo2011_ArtifactRemove.mat'));
PTEVals2 = PTEVals_12;
load(strcat(StrPTERest, 'PTEVals_DMNHIPP_3_Random_Yeo2011_ArtifactRemove.mat'));
PTEVals3 = PTEVals_12;
load(strcat(StrPTERest, 'PTEVals_DMNHIPP_4_Random_Yeo2011_ArtifactRemove.mat'));
PTEVals4 = PTEVals_12;
load(strcat(StrPTERest, 'PTEVals_DMNHIPP_5_Random_Yeo2011_ArtifactRemove.mat'));
PTEVals5 = PTEVals_12;
load(strcat(StrPTERest, 'PTEVals_DMNHIPP_6_Random_Yeo2011_ArtifactRemove.mat'));
PTEVals6 = PTEVals_12;

PTEVals_DMNHIPP_Others_Rest = [PTEVals1; PTEVals2; PTEVals3;PTEVals4; PTEVals5; PTEVals6];

Matrix = [PTEVals_DMNHIPP_Others_Encode; PTEVals_DMNHIPP_Others_Rest];

%load SubjPairs
%load inter network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter_Encode = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];


load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter_Recall = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

Subj_Pairs_Stack = [Subj_Pairs_Inter_Encode; Subj_Pairs_Inter_Recall];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PTEVals_DMNHIPP_Others_Encode),1) = cellstr('Encode');
Regions(length(PTEVals_DMNHIPP_Others_Encode)+1:...
    length(PTEVals_DMNHIPP_Others_Encode) + length(PTEVals_DMNHIPP_Others_Rest),1) = cellstr('Rest');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PTE' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_PTE_DMN_HIPP_Encode_Rest.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%CorrIncorr/PTE/DMN/Recall/Rest/Compare
%load inter network
load(strcat(StrPTERecall, 'CorrIncorr_PTEVals_DMNHIPP_1_Yeo2011_ArtifactRemove.mat'));
PTEVals1 = PTEVals_12;
load(strcat(StrPTERecall, 'CorrIncorr_PTEVals_DMNHIPP_2_Yeo2011_ArtifactRemove.mat'));
PTEVals2 = PTEVals_12;
load(strcat(StrPTERecall, 'CorrIncorr_PTEVals_DMNHIPP_3_Yeo2011_ArtifactRemove.mat'));
PTEVals3 = PTEVals_12;
load(strcat(StrPTERecall, 'CorrIncorr_PTEVals_DMNHIPP_4_Yeo2011_ArtifactRemove.mat'));
PTEVals4 = PTEVals_12;
load(strcat(StrPTERecall, 'CorrIncorr_PTEVals_DMNHIPP_5_Yeo2011_ArtifactRemove.mat'));
PTEVals5 = PTEVals_12;
load(strcat(StrPTERecall, 'CorrIncorr_PTEVals_DMNHIPP_6_Yeo2011_ArtifactRemove.mat'));
PTEVals6 = PTEVals_12;

PTEVals_DMNHIPP_Others_Recall = [PTEVals1; PTEVals2; PTEVals3;PTEVals4; PTEVals5; PTEVals6];


load(strcat(StrPTERest, 'PTEVals_DMNHIPP_1_Random_Yeo2011_ArtifactRemove.mat'));
PTEVals1 = PTEVals_12;
load(strcat(StrPTERest, 'PTEVals_DMNHIPP_2_Random_Yeo2011_ArtifactRemove.mat'));
PTEVals2 = PTEVals_12;
load(strcat(StrPTERest, 'PTEVals_DMNHIPP_3_Random_Yeo2011_ArtifactRemove.mat'));
PTEVals3 = PTEVals_12;
load(strcat(StrPTERest, 'PTEVals_DMNHIPP_4_Random_Yeo2011_ArtifactRemove.mat'));
PTEVals4 = PTEVals_12;
load(strcat(StrPTERest, 'PTEVals_DMNHIPP_5_Random_Yeo2011_ArtifactRemove.mat'));
PTEVals5 = PTEVals_12;
load(strcat(StrPTERest, 'PTEVals_DMNHIPP_6_Random_Yeo2011_ArtifactRemove.mat'));
PTEVals6 = PTEVals_12;

PTEVals_DMNHIPP_Others_Rest = [PTEVals1; PTEVals2; PTEVals3;PTEVals4; PTEVals5; PTEVals6];

Matrix = [PTEVals_DMNHIPP_Others_Recall; PTEVals_DMNHIPP_Others_Rest];

%load SubjPairs
%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter_Recall = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

Subj_Pairs_Stack = [Subj_Pairs_Inter_Recall; Subj_Pairs_Inter_Recall];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PTEVals_DMNHIPP_Others_Recall),1) = cellstr('Recall');
Regions(length(PTEVals_DMNHIPP_Others_Recall)+1:...
    length(PTEVals_DMNHIPP_Others_Recall) + length(PTEVals_DMNHIPP_Others_Rest),1) = cellstr('Rest');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PTE' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_PTE_DMN_HIPP_Recall_Rest.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix




















































%CorrIncorr/DMN/Sans/HIPP/Encode/UltraSlow_Delta
%load intra network
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_UltraSlow_Delta;

%load inter network
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_1_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_2_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_3_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_4_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_5_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_6_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_UltraSlow_Delta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_DMN_Encode_Intra_Inter_UltraSlow_Delta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%CorrIncorr/DMN/Sans/HIPP/Encode/Beta
%load intra network
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Beta;

%load inter network
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_1_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_2_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_3_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_4_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_5_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_6_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Beta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_DMN_Encode_Intra_Inter_Beta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%CorrIncorr/DMN/Sans/HIPP/Encode/Gamma
%load intra network
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Gamma;

%load inter network
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_1_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_2_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_3_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_4_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_5_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'CorrIncorr_PLVVals_interDMN_6_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Gamma;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_DMN_Encode_Intra_Inter_Gamma.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%CorrIncorr/DMN/Sans/HIPP/Recall/UltraSlow_Delta
%load intra network
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_UltraSlow_Delta;

%load inter network
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_1_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_2_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_3_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_4_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_5_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_6_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_UltraSlow_Delta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_DMN_Recall_Intra_Inter_UltraSlow_Delta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%CorrIncorr/DMN/Sans/HIPP/Recall/Beta
%load intra network
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Beta;

%load inter network
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_1_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_2_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_3_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_4_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_5_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_6_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Beta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_DMN_Recall_Intra_Inter_Beta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%CorrIncorr/DMN/Sans/HIPP/Recall/Gamma
%load intra network
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Gamma;

%load inter network
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_1_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_2_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_3_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_4_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_5_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'CorrIncorr_PLVVals_interDMN_6_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Gamma;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_DMN_Recall_Intra_Inter_Gamma.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%CorrIncorr/DMN/Sans/HIPP/Rest/UltraSlow_Delta
%load intra network
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_UltraSlow_Delta;

%load inter network
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_1_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_interDMN_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_2_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_interDMN_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_3_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_interDMN_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_4_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_interDMN_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_5_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_interDMN_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_6_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_interDMN_UltraSlow_Delta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_DMN_Rest_Intra_Inter_UltraSlow_Delta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%CorrIncorr/DMN/Sans/HIPP/Rest/Beta
%load intra network
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Beta;

%load inter network
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_1_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_interDMN_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_2_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_interDMN_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_3_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_interDMN_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_4_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_interDMN_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_5_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_interDMN_Beta;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_6_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_interDMN_Beta;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_DMN_Rest_Intra_Inter_Beta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



%CorrIncorr/DMN/Sans/HIPP/Rest/Gamma
%load intra network
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Gamma;

%load inter network
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_1_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_interDMN_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_2_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_interDMN_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_3_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_interDMN_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_4_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_interDMN_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_5_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_interDMN_Gamma;
load(strcat(StrPLVInterRest, 'PLVVals_interDMN_6_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_interDMN_Gamma;

PLVVals_Inter = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];

Matrix = [PLVVals_Intra; PLVVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

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
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_DMN_Rest_Intra_Inter_Gamma.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 



























%DMN/Distance
%load intra network
load(strcat(StrIntraDistance, 'DistanceVals_intraDMN_Yeo2011_Brainnetome_HIPP_Corrected_ArtifactRemove.mat'));
DistanceVals_Intra = DistanceVals_intraDMN;
load(strcat(StrIntraDistance, 'DistanceVals_intraDMN_Yeo2011_Corrected_ArtifactRemove.mat'));
DistanceVals_Intra = [DistanceVals_Intra; DistanceVals_intraDMN];

%load inter network
load(strcat(StrInterDistance, 'DistanceVals_interDMN_1_Yeo2011_Brainnetome_HIPP_Corrected_ArtifactRemove.mat'));
DistanceVals_Inter1 = DistanceVals_interDMN;
load(strcat(StrInterDistance, 'DistanceVals_interDMN_2_Yeo2011_Brainnetome_HIPP_Corrected_ArtifactRemove.mat'));
DistanceVals_Inter2 = DistanceVals_interDMN;
load(strcat(StrInterDistance, 'DistanceVals_interDMN_3_Yeo2011_Brainnetome_HIPP_Corrected_ArtifactRemove.mat'));
DistanceVals_Inter3 = DistanceVals_interDMN;
load(strcat(StrInterDistance, 'DistanceVals_interDMN_4_Yeo2011_Brainnetome_HIPP_Corrected_ArtifactRemove.mat'));
DistanceVals_Inter4 = DistanceVals_interDMN;
load(strcat(StrInterDistance, 'DistanceVals_interDMN_5_Yeo2011_Brainnetome_HIPP_Corrected_ArtifactRemove.mat'));
DistanceVals_Inter5 = DistanceVals_interDMN;
load(strcat(StrInterDistance, 'DistanceVals_interDMN_6_Yeo2011_Brainnetome_HIPP_Corrected_ArtifactRemove.mat'));
DistanceVals_Inter6 = DistanceVals_interDMN;

DistanceVals_Inter = [DistanceVals_Inter1; DistanceVals_Inter2; DistanceVals_Inter3;...
    DistanceVals_Inter4; DistanceVals_Inter5; DistanceVals_Inter6];

Matrix = [DistanceVals_Intra; DistanceVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(DistanceVals_Intra),1) = cellstr('Intra');
Regions(length(DistanceVals_Intra)+1:...
    length(DistanceVals_Intra) + length(DistanceVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'Distance' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'DMN_HIPP_Distance_Intra_Inter.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix 

































%Power/Encode/UltraSlow_Delta
%load intra network
load(strcat(StrPowerEncode, 'CorrIncorr_PowerVals_7_Yeo2011_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove_1229.mat'));
Power_DMN = Power_UltraSlow_Delta;

%load inter network
load(strcat(StrPowerEncode, 'CorrIncorr_PowerVals_1_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
Power1 = Power_UltraSlow_Delta;
load(strcat(StrPowerEncode, 'CorrIncorr_PowerVals_2_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
Power2 = Power_UltraSlow_Delta;
load(strcat(StrPowerEncode, 'CorrIncorr_PowerVals_3_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
Power3 = Power_UltraSlow_Delta;
load(strcat(StrPowerEncode, 'CorrIncorr_PowerVals_4_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
Power4 = Power_UltraSlow_Delta;
load(strcat(StrPowerEncode, 'CorrIncorr_PowerVals_5_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
Power5 = Power_UltraSlow_Delta;
load(strcat(StrPowerEncode, 'CorrIncorr_PowerVals_6_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
Power6 = Power_UltraSlow_Delta;

Power_Other = [Power1; Power2; Power3; Power4; Power5; Power6];

Matrix = [Power_DMN; Power_Other];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_Individual_7_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_Individual_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_Individual_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_Individual_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_Individual_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_Individual_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_Individual_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(Power_DMN),1) = cellstr('Power_DMN');
Regions(length(Power_DMN)+1:...
    length(Power_DMN) + length(Power_Other),1) = cellstr('Power_Other');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'Power' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Power_DMN_HIPP_Other_Encode_UltraSlow_Delta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix




%Power/Encode/Beta
%load intra network
load(strcat(StrPowerEncode, 'CorrIncorr_PowerVals_7_Yeo2011_HIPP_Beta_Corrected_ArtifactRemove_1229.mat'));
Power_DMN = Power_Beta;

%load inter network
load(strcat(StrPowerEncode, 'CorrIncorr_PowerVals_1_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
Power1 = Power_Beta;
load(strcat(StrPowerEncode, 'CorrIncorr_PowerVals_2_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
Power2 = Power_Beta;
load(strcat(StrPowerEncode, 'CorrIncorr_PowerVals_3_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
Power3 = Power_Beta;
load(strcat(StrPowerEncode, 'CorrIncorr_PowerVals_4_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
Power4 = Power_Beta;
load(strcat(StrPowerEncode, 'CorrIncorr_PowerVals_5_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
Power5 = Power_Beta;
load(strcat(StrPowerEncode, 'CorrIncorr_PowerVals_6_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
Power6 = Power_Beta;

Power_Other = [Power1; Power2; Power3; Power4; Power5; Power6];

Matrix = [Power_DMN; Power_Other];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_Individual_7_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_Individual_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_Individual_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_Individual_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_Individual_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_Individual_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_Individual_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(Power_DMN),1) = cellstr('Power_DMN');
Regions(length(Power_DMN)+1:...
    length(Power_DMN) + length(Power_Other),1) = cellstr('Power_Other');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'Power' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Power_DMN_HIPP_Other_Encode_Beta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%Power/Encode/Gamma
%load intra network
load(strcat(StrPowerEncode, 'CorrIncorr_PowerVals_7_Yeo2011_HIPP_Gamma_Corrected_ArtifactRemove_1229.mat'));
Power_DMN = Power_Gamma;

%load inter network
load(strcat(StrPowerEncode, 'CorrIncorr_PowerVals_1_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
Power1 = Power_Gamma;
load(strcat(StrPowerEncode, 'CorrIncorr_PowerVals_2_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
Power2 = Power_Gamma;
load(strcat(StrPowerEncode, 'CorrIncorr_PowerVals_3_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
Power3 = Power_Gamma;
load(strcat(StrPowerEncode, 'CorrIncorr_PowerVals_4_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
Power4 = Power_Gamma;
load(strcat(StrPowerEncode, 'CorrIncorr_PowerVals_5_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
Power5 = Power_Gamma;
load(strcat(StrPowerEncode, 'CorrIncorr_PowerVals_6_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
Power6 = Power_Gamma;

Power_Other = [Power1; Power2; Power3; Power4; Power5; Power6];

Matrix = [Power_DMN; Power_Other];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_Individual_7_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_Individual_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_Individual_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_Individual_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_Individual_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_Individual_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_Individual_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(Power_DMN),1) = cellstr('Power_DMN');
Regions(length(Power_DMN)+1:...
    length(Power_DMN) + length(Power_Other),1) = cellstr('Power_Other');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'Power' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Power_DMN_HIPP_Other_Encode_Gamma.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix

































%Power/Recall/UltraSlow_Delta
%load intra network
load(strcat(StrPowerRecall, 'CorrIncorr_PowerVals_7_Yeo2011_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove_1229.mat'));
Power_DMN = Power_UltraSlow_Delta;

%load inter network
load(strcat(StrPowerRecall, 'CorrIncorr_PowerVals_1_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
Power1 = Power_UltraSlow_Delta;
load(strcat(StrPowerRecall, 'CorrIncorr_PowerVals_2_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
Power2 = Power_UltraSlow_Delta;
load(strcat(StrPowerRecall, 'CorrIncorr_PowerVals_3_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
Power3 = Power_UltraSlow_Delta;
load(strcat(StrPowerRecall, 'CorrIncorr_PowerVals_4_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
Power4 = Power_UltraSlow_Delta;
load(strcat(StrPowerRecall, 'CorrIncorr_PowerVals_5_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
Power5 = Power_UltraSlow_Delta;
load(strcat(StrPowerRecall, 'CorrIncorr_PowerVals_6_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
Power6 = Power_UltraSlow_Delta;

Power_Other = [Power1; Power2; Power3; Power4; Power5; Power6];

Matrix = [Power_DMN; Power_Other];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_Individual_7_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_Individual_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_Individual_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_Individual_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_Individual_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_Individual_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_Individual_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(Power_DMN),1) = cellstr('Power_DMN');
Regions(length(Power_DMN)+1:...
    length(Power_DMN) + length(Power_Other),1) = cellstr('Power_Other');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'Power' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Power_DMN_HIPP_Other_Recall_UltraSlow_Delta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix




%Power/Recall/Beta
%load intra network
load(strcat(StrPowerRecall, 'CorrIncorr_PowerVals_7_Yeo2011_HIPP_Beta_Corrected_ArtifactRemove_1229.mat'));
Power_DMN = Power_Beta;

%load inter network
load(strcat(StrPowerRecall, 'CorrIncorr_PowerVals_1_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
Power1 = Power_Beta;
load(strcat(StrPowerRecall, 'CorrIncorr_PowerVals_2_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
Power2 = Power_Beta;
load(strcat(StrPowerRecall, 'CorrIncorr_PowerVals_3_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
Power3 = Power_Beta;
load(strcat(StrPowerRecall, 'CorrIncorr_PowerVals_4_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
Power4 = Power_Beta;
load(strcat(StrPowerRecall, 'CorrIncorr_PowerVals_5_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
Power5 = Power_Beta;
load(strcat(StrPowerRecall, 'CorrIncorr_PowerVals_6_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
Power6 = Power_Beta;

Power_Other = [Power1; Power2; Power3; Power4; Power5; Power6];

Matrix = [Power_DMN; Power_Other];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_Individual_7_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_Individual_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_Individual_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_Individual_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_Individual_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_Individual_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_Individual_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(Power_DMN),1) = cellstr('Power_DMN');
Regions(length(Power_DMN)+1:...
    length(Power_DMN) + length(Power_Other),1) = cellstr('Power_Other');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'Power' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Power_DMN_HIPP_Other_Recall_Beta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%Power/Recall/Gamma
%load intra network
load(strcat(StrPowerRecall, 'CorrIncorr_PowerVals_7_Yeo2011_HIPP_Gamma_Corrected_ArtifactRemove_1229.mat'));
Power_DMN = Power_Gamma;

%load inter network
load(strcat(StrPowerRecall, 'CorrIncorr_PowerVals_1_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
Power1 = Power_Gamma;
load(strcat(StrPowerRecall, 'CorrIncorr_PowerVals_2_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
Power2 = Power_Gamma;
load(strcat(StrPowerRecall, 'CorrIncorr_PowerVals_3_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
Power3 = Power_Gamma;
load(strcat(StrPowerRecall, 'CorrIncorr_PowerVals_4_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
Power4 = Power_Gamma;
load(strcat(StrPowerRecall, 'CorrIncorr_PowerVals_5_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
Power5 = Power_Gamma;
load(strcat(StrPowerRecall, 'CorrIncorr_PowerVals_6_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
Power6 = Power_Gamma;

Power_Other = [Power1; Power2; Power3; Power4; Power5; Power6];

Matrix = [Power_DMN; Power_Other];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_Individual_7_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_Individual_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_Individual_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_Individual_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_Individual_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_Individual_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_Individual_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(Power_DMN),1) = cellstr('Power_DMN');
Regions(length(Power_DMN)+1:...
    length(Power_DMN) + length(Power_Other),1) = cellstr('Power_Other');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'Power' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Power_DMN_HIPP_Other_Recall_Gamma.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix
































%Power/Rest/UltraSlow_Delta
%load intra network
load(strcat(StrPowerRest, 'PowerVals_7_Yeo2011_HIPP_UltraSlow_Delta_Corrected_Random_ArtifactRemove_1229.mat'));
Power_DMN = Power_UltraSlow_Delta;

%load inter network
load(strcat(StrPowerRest, 'PowerVals_1_Yeo2011_UltraSlow_Delta_Corrected_Random_ArtifactRemove.mat'));
Power1 = Power_UltraSlow_Delta;
load(strcat(StrPowerRest, 'PowerVals_2_Yeo2011_UltraSlow_Delta_Corrected_Random_ArtifactRemove.mat'));
Power2 = Power_UltraSlow_Delta;
load(strcat(StrPowerRest, 'PowerVals_3_Yeo2011_UltraSlow_Delta_Corrected_Random_ArtifactRemove.mat'));
Power3 = Power_UltraSlow_Delta;
load(strcat(StrPowerRest, 'PowerVals_4_Yeo2011_UltraSlow_Delta_Corrected_Random_ArtifactRemove.mat'));
Power4 = Power_UltraSlow_Delta;
load(strcat(StrPowerRest, 'PowerVals_5_Yeo2011_UltraSlow_Delta_Corrected_Random_ArtifactRemove.mat'));
Power5 = Power_UltraSlow_Delta;
load(strcat(StrPowerRest, 'PowerVals_6_Yeo2011_UltraSlow_Delta_Corrected_Random_ArtifactRemove.mat'));
Power6 = Power_UltraSlow_Delta;

Power_Other = [Power1; Power2; Power3; Power4; Power5; Power6];

Matrix = [Power_DMN; Power_Other];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_Individual_7_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_Individual_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_Individual_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_Individual_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_Individual_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_Individual_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_Individual_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(Power_DMN),1) = cellstr('Power_DMN');
Regions(length(Power_DMN)+1:...
    length(Power_DMN) + length(Power_Other),1) = cellstr('Power_Other');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'Power' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Power_DMN_HIPP_Other_Rest_UltraSlow_Delta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix




%Power/Rest/Beta
%load intra network
load(strcat(StrPowerRest, 'PowerVals_7_Yeo2011_HIPP_Beta_Corrected_Random_ArtifactRemove_1229.mat'));
Power_DMN = Power_Beta;

%load inter network
load(strcat(StrPowerRest, 'PowerVals_1_Yeo2011_Beta_Corrected_Random_ArtifactRemove.mat'));
Power1 = Power_Beta;
load(strcat(StrPowerRest, 'PowerVals_2_Yeo2011_Beta_Corrected_Random_ArtifactRemove.mat'));
Power2 = Power_Beta;
load(strcat(StrPowerRest, 'PowerVals_3_Yeo2011_Beta_Corrected_Random_ArtifactRemove.mat'));
Power3 = Power_Beta;
load(strcat(StrPowerRest, 'PowerVals_4_Yeo2011_Beta_Corrected_Random_ArtifactRemove.mat'));
Power4 = Power_Beta;
load(strcat(StrPowerRest, 'PowerVals_5_Yeo2011_Beta_Corrected_Random_ArtifactRemove.mat'));
Power5 = Power_Beta;
load(strcat(StrPowerRest, 'PowerVals_6_Yeo2011_Beta_Corrected_Random_ArtifactRemove.mat'));
Power6 = Power_Beta;

Power_Other = [Power1; Power2; Power3; Power4; Power5; Power6];

Matrix = [Power_DMN; Power_Other];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_Individual_7_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_Individual_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_Individual_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_Individual_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_Individual_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_Individual_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_Individual_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(Power_DMN),1) = cellstr('Power_DMN');
Regions(length(Power_DMN)+1:...
    length(Power_DMN) + length(Power_Other),1) = cellstr('Power_Other');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'Power' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Power_DMN_HIPP_Other_Rest_Beta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%Power/Rest/Gamma
%load intra network
load(strcat(StrPowerRest, 'PowerVals_7_Yeo2011_HIPP_Gamma_Corrected_Random_ArtifactRemove_1229.mat'));
Power_DMN = Power_Gamma;

%load inter network
load(strcat(StrPowerRest, 'PowerVals_1_Yeo2011_Gamma_Corrected_Random_ArtifactRemove.mat'));
Power1 = Power_Gamma;
load(strcat(StrPowerRest, 'PowerVals_2_Yeo2011_Gamma_Corrected_Random_ArtifactRemove.mat'));
Power2 = Power_Gamma;
load(strcat(StrPowerRest, 'PowerVals_3_Yeo2011_Gamma_Corrected_Random_ArtifactRemove.mat'));
Power3 = Power_Gamma;
load(strcat(StrPowerRest, 'PowerVals_4_Yeo2011_Gamma_Corrected_Random_ArtifactRemove.mat'));
Power4 = Power_Gamma;
load(strcat(StrPowerRest, 'PowerVals_5_Yeo2011_Gamma_Corrected_Random_ArtifactRemove.mat'));
Power5 = Power_Gamma;
load(strcat(StrPowerRest, 'PowerVals_6_Yeo2011_Gamma_Corrected_Random_ArtifactRemove.mat'));
Power6 = Power_Gamma;

Power_Other = [Power1; Power2; Power3; Power4; Power5; Power6];

Matrix = [Power_DMN; Power_Other];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_Individual_7_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_Individual_1_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_Individual_2_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_Individual_3_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_Individual_4_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_Individual_5_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_Individual_6_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(Power_DMN),1) = cellstr('Power_DMN');
Regions(length(Power_DMN)+1:...
    length(Power_DMN) + length(Power_Other),1) = cellstr('Power_Other');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'Power' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Power_DMN_HIPP_Other_Rest_Gamma.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix







































%Power/Recall/Rest/UltraSlow_Delta
%load intra network
load(strcat(StrPowerRecall, 'CorrIncorr_PowerVals_7_Yeo2011_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove_1229.mat'));
Power_Recall = Power_UltraSlow_Delta;

%load intra network
load(strcat(StrPowerRest, 'PowerVals_7_Yeo2011_HIPP_UltraSlow_Delta_Corrected_Random_ArtifactRemove_1229.mat'));
Power_Rest = Power_UltraSlow_Delta;

Matrix = [Power_Recall; Power_Rest];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_Individual_7_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs; Subj_Pairs];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(Power_Recall),1) = cellstr('Power_Recall');
Regions(length(Power_Recall)+1:...
    length(Power_Recall) + length(Power_Rest),1) = cellstr('Power_Rest');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'Power' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Power_DMN_HIPP_Recall_Rest_UltraSlow_Delta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%Power/Encode/Rest/UltraSlow_Delta
%load intra network
load(strcat(StrPowerEncode, 'CorrIncorr_PowerVals_7_Yeo2011_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove_1229.mat'));
Power_Encode = Power_UltraSlow_Delta;

%load intra network
load(strcat(StrPowerRest, 'PowerVals_7_Yeo2011_HIPP_UltraSlow_Delta_Corrected_Random_ArtifactRemove_1229.mat'));
Power_Rest = Power_UltraSlow_Delta;

Matrix = [Power_Encode; Power_Rest];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_Individual_7_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Encode = Subj_Pairs;

load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_Individual_7_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Rest = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Encode; Subj_Pairs_Rest];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(Power_Encode),1) = cellstr('Power_Encode');
Regions(length(Power_Encode)+1:...
    length(Power_Encode) + length(Power_Rest),1) = cellstr('Power_Rest');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'Power' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Power_DMN_HIPP_Encode_Rest_UltraSlow_Delta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%Power/Recall/Rest/Beta
%load intra network
load(strcat(StrPowerRecall, 'CorrIncorr_PowerVals_7_Yeo2011_HIPP_Beta_Corrected_ArtifactRemove_1229.mat'));
Power_Recall = Power_Beta;

%load intra network
load(strcat(StrPowerRest, 'PowerVals_7_Yeo2011_HIPP_Beta_Corrected_Random_ArtifactRemove_1229.mat'));
Power_Rest = Power_Beta;

Matrix = [Power_Recall; Power_Rest];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_Individual_7_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs; Subj_Pairs];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(Power_Recall),1) = cellstr('Power_Recall');
Regions(length(Power_Recall)+1:...
    length(Power_Recall) + length(Power_Rest),1) = cellstr('Power_Rest');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'Power' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Power_DMN_HIPP_Recall_Rest_Beta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%Power/Encode/Rest/Beta
%load intra network
load(strcat(StrPowerEncode, 'CorrIncorr_PowerVals_7_Yeo2011_HIPP_Beta_Corrected_ArtifactRemove_1229.mat'));
Power_Encode = Power_Beta;

%load intra network
load(strcat(StrPowerRest, 'PowerVals_7_Yeo2011_HIPP_Beta_Corrected_Random_ArtifactRemove_1229.mat'));
Power_Rest = Power_Beta;

Matrix = [Power_Encode; Power_Rest];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_Individual_7_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Encode = Subj_Pairs;

load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_Individual_7_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Rest = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Encode; Subj_Pairs_Rest];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(Power_Encode),1) = cellstr('Power_Encode');
Regions(length(Power_Encode)+1:...
    length(Power_Encode) + length(Power_Rest),1) = cellstr('Power_Rest');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'Power' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Power_DMN_HIPP_Encode_Rest_Beta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%Power/Recall/Rest/Gamma
%load intra network
load(strcat(StrPowerRecall, 'CorrIncorr_PowerVals_7_Yeo2011_HIPP_Gamma_Corrected_ArtifactRemove_1229.mat'));
Power_Recall = Power_Gamma;

%load intra network
load(strcat(StrPowerRest, 'PowerVals_7_Yeo2011_HIPP_Gamma_Corrected_Random_ArtifactRemove_1229.mat'));
Power_Rest = Power_Gamma;

Matrix = [Power_Recall; Power_Rest];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_Individual_7_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs; Subj_Pairs];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(Power_Recall),1) = cellstr('Power_Recall');
Regions(length(Power_Recall)+1:...
    length(Power_Recall) + length(Power_Rest),1) = cellstr('Power_Rest');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'Power' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Power_DMN_HIPP_Recall_Rest_Gamma.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%Power/Encode/Rest/Gamma
%load intra network
load(strcat(StrPowerEncode, 'CorrIncorr_PowerVals_7_Yeo2011_HIPP_Gamma_Corrected_ArtifactRemove_1229.mat'));
Power_Encode = Power_Gamma;

%load intra network
load(strcat(StrPowerRest, 'PowerVals_7_Yeo2011_HIPP_Gamma_Corrected_Random_ArtifactRemove_1229.mat'));
Power_Rest = Power_Gamma;

Matrix = [Power_Encode; Power_Rest];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_Individual_7_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Encode = Subj_Pairs;

load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_Individual_7_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Rest = Subj_Pairs;


Subj_Pairs_Stack = [Subj_Pairs_Encode; Subj_Pairs_Rest];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(Power_Encode),1) = cellstr('Power_Encode');
Regions(length(Power_Encode)+1:...
    length(Power_Encode) + length(Power_Rest),1) = cellstr('Power_Rest');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'Power' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Power_DMN_HIPP_Encode_Rest_Gamma.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix











































%Power/Encode/Correct/Incorrect/UltraSlow_Delta
%load intra network
load(strcat(StrPowerEncode, 'Correct_PowerVals_7_Yeo2011_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove_1229.mat'));
Power_Correct = Power_UltraSlow_Delta;

load(strcat(StrPowerEncode, 'Incorrect_PowerVals_7_Yeo2011_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove_1229.mat'));
Power_Incorrect = Power_UltraSlow_Delta;

Matrix = [Power_Correct; Power_Incorrect];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_Individual_7_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Intra];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(Power_Correct),1) = cellstr('Power_Correct');
Regions(length(Power_Correct)+1:...
    length(Power_Correct) + length(Power_Incorrect),1) = cellstr('Power_Incorrect');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'Power' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Power_DMN_HIPP_Encode_Correct_Incorrect_UltraSlow_Delta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%Power/Recall/Correct/Incorrect/UltraSlow_Delta
%load intra network
load(strcat(StrPowerRecall, 'Correct_PowerVals_7_Yeo2011_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove_1229.mat'));
Power_Correct = Power_UltraSlow_Delta;

load(strcat(StrPowerRecall, 'Incorrect_PowerVals_7_Yeo2011_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove_1229.mat'));
Power_Incorrect = Power_UltraSlow_Delta;

Matrix = [Power_Correct; Power_Incorrect];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_Individual_7_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;

Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Intra];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(Power_Correct),1) = cellstr('Power_Correct');
Regions(length(Power_Correct)+1:...
    length(Power_Correct) + length(Power_Incorrect),1) = cellstr('Power_Incorrect');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'Power' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Power_DMN_HIPP_Recall_Correct_Incorrect_UltraSlow_Delta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix





















%GammaAmplitude/DMN/Encode/
%load intra network
load(strcat(StrGammaIntraEncode, 'CorrIncorr_GammaAmplitudeVals_intraDMN_Yeo2011_Brainnetome_HIPP_Corrected_ArtifactRemove.mat'));
GammaAmplitudeVals_Intra = GammaAmplitudeVals_intra;
load(strcat(StrGammaIntraEncode, 'CorrIncorr_GammaAmplitudeVals_intraDMN_Yeo2011_Corrected_ArtifactRemove.mat'));
GammaAmplitudeVals_Intra = [GammaAmplitudeVals_Intra; GammaAmplitudeVals_intra];

%load inter network
load(strcat(StrGammaInterEncode, 'CorrIncorr_GammaAmplitudeVals_interDMN_1_Yeo2011_Brainnetome_HIPP_Corrected_ArtifactRemove.mat'));
GammaAmplitudeVals_Inter1 = GammaAmplitudeVals_inter;
load(strcat(StrGammaInterEncode, 'CorrIncorr_GammaAmplitudeVals_interDMN_2_Yeo2011_Brainnetome_HIPP_Corrected_ArtifactRemove.mat'));
GammaAmplitudeVals_Inter2 = GammaAmplitudeVals_inter;
load(strcat(StrGammaInterEncode, 'CorrIncorr_GammaAmplitudeVals_interDMN_3_Yeo2011_Brainnetome_HIPP_Corrected_ArtifactRemove.mat'));
GammaAmplitudeVals_Inter3 = GammaAmplitudeVals_inter;
load(strcat(StrGammaInterEncode, 'CorrIncorr_GammaAmplitudeVals_interDMN_4_Yeo2011_Brainnetome_HIPP_Corrected_ArtifactRemove.mat'));
GammaAmplitudeVals_Inter4 = GammaAmplitudeVals_inter;
load(strcat(StrGammaInterEncode, 'CorrIncorr_GammaAmplitudeVals_interDMN_5_Yeo2011_Brainnetome_HIPP_Corrected_ArtifactRemove.mat'));
GammaAmplitudeVals_Inter5 = GammaAmplitudeVals_inter;
load(strcat(StrGammaInterEncode, 'CorrIncorr_GammaAmplitudeVals_interDMN_6_Yeo2011_Brainnetome_HIPP_Corrected_ArtifactRemove.mat'));
GammaAmplitudeVals_Inter6 = GammaAmplitudeVals_inter;

GammaAmplitudeVals_Inter = [GammaAmplitudeVals_Inter1; GammaAmplitudeVals_Inter2; GammaAmplitudeVals_Inter3;...
    GammaAmplitudeVals_Inter4; GammaAmplitudeVals_Inter5; GammaAmplitudeVals_Inter6];

Matrix = [GammaAmplitudeVals_Intra; GammaAmplitudeVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

%load inter network
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterEncode, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(GammaAmplitudeVals_Intra),1) = cellstr('Intra');
Regions(length(GammaAmplitudeVals_Intra)+1:...
    length(GammaAmplitudeVals_Intra) + length(GammaAmplitudeVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'GammaAmp' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_GammaAmp_DMN_HIPP_Encode_Intra_Inter.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%GammaAmplitude/DMN/Recall/
%load intra network
load(strcat(StrGammaIntraRecall, 'CorrIncorr_GammaAmplitudeVals_intraDMN_Yeo2011_Brainnetome_HIPP_Corrected_ArtifactRemove.mat'));
GammaAmplitudeVals_Intra = GammaAmplitudeVals_intra;
load(strcat(StrGammaIntraRecall, 'CorrIncorr_GammaAmplitudeVals_intraDMN_Yeo2011_Corrected_ArtifactRemove.mat'));
GammaAmplitudeVals_Intra = [GammaAmplitudeVals_Intra; GammaAmplitudeVals_intra];

%load inter network
load(strcat(StrGammaInterRecall, 'CorrIncorr_GammaAmplitudeVals_interDMN_1_Yeo2011_Brainnetome_HIPP_Corrected_ArtifactRemove.mat'));
GammaAmplitudeVals_Inter1 = GammaAmplitudeVals_inter;
load(strcat(StrGammaInterRecall, 'CorrIncorr_GammaAmplitudeVals_interDMN_2_Yeo2011_Brainnetome_HIPP_Corrected_ArtifactRemove.mat'));
GammaAmplitudeVals_Inter2 = GammaAmplitudeVals_inter;
load(strcat(StrGammaInterRecall, 'CorrIncorr_GammaAmplitudeVals_interDMN_3_Yeo2011_Brainnetome_HIPP_Corrected_ArtifactRemove.mat'));
GammaAmplitudeVals_Inter3 = GammaAmplitudeVals_inter;
load(strcat(StrGammaInterRecall, 'CorrIncorr_GammaAmplitudeVals_interDMN_4_Yeo2011_Brainnetome_HIPP_Corrected_ArtifactRemove.mat'));
GammaAmplitudeVals_Inter4 = GammaAmplitudeVals_inter;
load(strcat(StrGammaInterRecall, 'CorrIncorr_GammaAmplitudeVals_interDMN_5_Yeo2011_Brainnetome_HIPP_Corrected_ArtifactRemove.mat'));
GammaAmplitudeVals_Inter5 = GammaAmplitudeVals_inter;
load(strcat(StrGammaInterRecall, 'CorrIncorr_GammaAmplitudeVals_interDMN_6_Yeo2011_Brainnetome_HIPP_Corrected_ArtifactRemove.mat'));
GammaAmplitudeVals_Inter6 = GammaAmplitudeVals_inter;

GammaAmplitudeVals_Inter = [GammaAmplitudeVals_Inter1; GammaAmplitudeVals_Inter2; GammaAmplitudeVals_Inter3;...
    GammaAmplitudeVals_Inter4; GammaAmplitudeVals_Inter5; GammaAmplitudeVals_Inter6];

Matrix = [GammaAmplitudeVals_Intra; GammaAmplitudeVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(GammaAmplitudeVals_Intra),1) = cellstr('Intra');
Regions(length(GammaAmplitudeVals_Intra)+1:...
    length(GammaAmplitudeVals_Intra) + length(GammaAmplitudeVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'GammaAmp' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_GammaAmp_DMN_HIPP_Recall_Intra_Inter.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%GammaAmplitude/DMN/Rest/
%load intra network
load(strcat(StrGammaIntraRest, 'GammaAmplitudeVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_Corrected_ArtifactRemove.mat'));
GammaAmplitudeVals_Intra = GammaAmplitudeVals_intra;
load(strcat(StrGammaIntraRest, 'GammaAmplitudeVals_intraNet_7_Yeo2011_Random_Corrected_ArtifactRemove.mat'));
GammaAmplitudeVals_Intra = [GammaAmplitudeVals_Intra; GammaAmplitudeVals_intra];

%load inter network
load(strcat(StrGammaInterRest, 'GammaAmplitudeVals_interDMN_1_Yeo2011_Random_Brainnetome_HIPP_Corrected_ArtifactRemove.mat'));
GammaAmplitudeVals_Inter1 = GammaAmplitudeVals_inter;
load(strcat(StrGammaInterRest, 'GammaAmplitudeVals_interDMN_2_Yeo2011_Random_Brainnetome_HIPP_Corrected_ArtifactRemove.mat'));
GammaAmplitudeVals_Inter2 = GammaAmplitudeVals_inter;
load(strcat(StrGammaInterRest, 'GammaAmplitudeVals_interDMN_3_Yeo2011_Random_Brainnetome_HIPP_Corrected_ArtifactRemove.mat'));
GammaAmplitudeVals_Inter3 = GammaAmplitudeVals_inter;
load(strcat(StrGammaInterRest, 'GammaAmplitudeVals_interDMN_4_Yeo2011_Random_Brainnetome_HIPP_Corrected_ArtifactRemove.mat'));
GammaAmplitudeVals_Inter4 = GammaAmplitudeVals_inter;
load(strcat(StrGammaInterRest, 'GammaAmplitudeVals_interDMN_5_Yeo2011_Random_Brainnetome_HIPP_Corrected_ArtifactRemove.mat'));
GammaAmplitudeVals_Inter5 = GammaAmplitudeVals_inter;
load(strcat(StrGammaInterRest, 'GammaAmplitudeVals_interDMN_6_Yeo2011_Random_Brainnetome_HIPP_Corrected_ArtifactRemove.mat'));
GammaAmplitudeVals_Inter6 = GammaAmplitudeVals_inter;

GammaAmplitudeVals_Inter = [GammaAmplitudeVals_Inter1; GammaAmplitudeVals_Inter2; GammaAmplitudeVals_Inter3;...
    GammaAmplitudeVals_Inter4; GammaAmplitudeVals_Inter5; GammaAmplitudeVals_Inter6];

Matrix = [GammaAmplitudeVals_Intra; GammaAmplitudeVals_Inter];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

%load inter network
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_1_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter1 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_2_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter2 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_3_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter3 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_4_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter4 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_5_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter5 = Subj_Pairs;
load(strcat(StrSubjPairsInterRecall, 'Subj_Pairs_interDMN_6_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Inter6 = Subj_Pairs;

Subj_Pairs_Inter = [Subj_Pairs_Inter1; Subj_Pairs_Inter2; Subj_Pairs_Inter3;...
    Subj_Pairs_Inter4; Subj_Pairs_Inter5; Subj_Pairs_Inter6];

Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Inter];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(GammaAmplitudeVals_Intra),1) = cellstr('Intra');
Regions(length(GammaAmplitudeVals_Intra)+1:...
    length(GammaAmplitudeVals_Intra) + length(GammaAmplitudeVals_Inter),1) = cellstr('Inter');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'GammaAmp' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'GammaAmp_DMN_HIPP_Rest_Intra_Inter.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix





































%Random epochs
%DMN/Rest/UltraSlow_Delta/Theta
%load intra network
load(strcat(StrPLVIntraRest, 'PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intraDMN_UltraSlow_Delta;
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_1 = [PLVVals_Intra; PLVVals_intra_UltraSlow_Delta];


%load intra network
load(strcat(StrPLVIntraRest, 'PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intraDMN_Theta;
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_Random_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_2 = [PLVVals_Intra; PLVVals_intra_Theta];

Matrix = [PLVVals_Intra_1; PLVVals_Intra_2];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Intra];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra_1),1) = cellstr('Intra_1');
Regions(length(PLVVals_Intra_1)+1:...
    length(PLVVals_Intra_1) + length(PLVVals_Intra_2),1) = cellstr('Intra_2');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Random_DMN_HIPP_Rest_Intra_UltraSlow_Delta_Theta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%DMN/Rest/UltraSlow_Delta/Alpha
%load intra network
load(strcat(StrPLVIntraRest, 'PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intraDMN_UltraSlow_Delta;
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_1 = [PLVVals_Intra; PLVVals_intra_UltraSlow_Delta];


%load intra network
load(strcat(StrPLVIntraRest, 'PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intraDMN_Alpha;
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_Random_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_2 = [PLVVals_Intra; PLVVals_intra_Alpha];

Matrix = [PLVVals_Intra_1; PLVVals_Intra_2];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Intra];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra_1),1) = cellstr('Intra_1');
Regions(length(PLVVals_Intra_1)+1:...
    length(PLVVals_Intra_1) + length(PLVVals_Intra_2),1) = cellstr('Intra_2');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Random_DMN_HIPP_Rest_Intra_UltraSlow_Delta_Alpha.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%DMN/Rest/UltraSlow_Delta/Beta
%load intra network
load(strcat(StrPLVIntraRest, 'PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intraDMN_UltraSlow_Delta;
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_1 = [PLVVals_Intra; PLVVals_intra_UltraSlow_Delta];


%load intra network
load(strcat(StrPLVIntraRest, 'PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intraDMN_Beta;
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_2 = [PLVVals_Intra; PLVVals_intra_Beta];

Matrix = [PLVVals_Intra_1; PLVVals_Intra_2];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Intra];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra_1),1) = cellstr('Intra_1');
Regions(length(PLVVals_Intra_1)+1:...
    length(PLVVals_Intra_1) + length(PLVVals_Intra_2),1) = cellstr('Intra_2');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Random_DMN_HIPP_Rest_Intra_UltraSlow_Delta_Beta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%DMN/Rest/UltraSlow_Delta/Gamma
%load intra network
load(strcat(StrPLVIntraRest, 'PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intraDMN_UltraSlow_Delta;
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_1 = [PLVVals_Intra; PLVVals_intra_UltraSlow_Delta];


%load intra network
load(strcat(StrPLVIntraRest, 'PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intraDMN_Gamma;
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_2 = [PLVVals_Intra; PLVVals_intra_Gamma];

Matrix = [PLVVals_Intra_1; PLVVals_Intra_2];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Intra];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra_1),1) = cellstr('Intra_1');
Regions(length(PLVVals_Intra_1)+1:...
    length(PLVVals_Intra_1) + length(PLVVals_Intra_2),1) = cellstr('Intra_2');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'Random_DMN_HIPP_Rest_Intra_UltraSlow_Delta_Gamma.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix




























%DMN/Recall/UltraSlow_Delta/Theta
%load intra network
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_UltraSlow_Delta;
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_1 = [PLVVals_Intra; PLVVals_intra_UltraSlow_Delta];


%load intra network
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Theta;
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_2 = [PLVVals_Intra; PLVVals_intra_Theta];

Matrix = [PLVVals_Intra_1; PLVVals_Intra_2];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Intra];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra_1),1) = cellstr('Intra_1');
Regions(length(PLVVals_Intra_1)+1:...
    length(PLVVals_Intra_1) + length(PLVVals_Intra_2),1) = cellstr('Intra_2');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_DMN_HIPP_Recall_Intra_UltraSlow_Delta_Theta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%DMN/Recall/UltraSlow_Delta/Alpha
%load intra network
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_UltraSlow_Delta;
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_1 = [PLVVals_Intra; PLVVals_intra_UltraSlow_Delta];


%load intra network
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Alpha;
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_2 = [PLVVals_Intra; PLVVals_intra_Alpha];

Matrix = [PLVVals_Intra_1; PLVVals_Intra_2];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Intra];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra_1),1) = cellstr('Intra_1');
Regions(length(PLVVals_Intra_1)+1:...
    length(PLVVals_Intra_1) + length(PLVVals_Intra_2),1) = cellstr('Intra_2');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_DMN_HIPP_Recall_Intra_UltraSlow_Delta_Alpha.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%DMN/Recall/UltraSlow_Delta/Beta
%load intra network
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_UltraSlow_Delta;
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_1 = [PLVVals_Intra; PLVVals_intra_UltraSlow_Delta];


%load intra network
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Beta;
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_2 = [PLVVals_Intra; PLVVals_intra_Beta];

Matrix = [PLVVals_Intra_1; PLVVals_Intra_2];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Intra];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra_1),1) = cellstr('Intra_1');
Regions(length(PLVVals_Intra_1)+1:...
    length(PLVVals_Intra_1) + length(PLVVals_Intra_2),1) = cellstr('Intra_2');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_DMN_HIPP_Recall_Intra_UltraSlow_Delta_Beta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%DMN/Recall/UltraSlow_Delta/Gamma
%load intra network
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_UltraSlow_Delta;
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_1 = [PLVVals_Intra; PLVVals_intra_UltraSlow_Delta];


%load intra network
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Gamma;
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_2 = [PLVVals_Intra; PLVVals_intra_Gamma];

Matrix = [PLVVals_Intra_1; PLVVals_Intra_2];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraRecall, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Intra];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra_1),1) = cellstr('Intra_1');
Regions(length(PLVVals_Intra_1)+1:...
    length(PLVVals_Intra_1) + length(PLVVals_Intra_2),1) = cellstr('Intra_2');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_DMN_HIPP_Recall_Intra_UltraSlow_Delta_Gamma.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix





































%DMN/Encode/UltraSlow_Delta/Theta
%load intra network
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_UltraSlow_Delta;
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_1 = [PLVVals_Intra; PLVVals_intra_UltraSlow_Delta];


%load intra network
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Theta;
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_2 = [PLVVals_Intra; PLVVals_intra_Theta];

Matrix = [PLVVals_Intra_1; PLVVals_Intra_2];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Intra];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra_1),1) = cellstr('Intra_1');
Regions(length(PLVVals_Intra_1)+1:...
    length(PLVVals_Intra_1) + length(PLVVals_Intra_2),1) = cellstr('Intra_2');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_DMN_HIPP_Encode_Intra_UltraSlow_Delta_Theta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%DMN/Encode/UltraSlow_Delta/Alpha
%load intra network
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_UltraSlow_Delta;
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_1 = [PLVVals_Intra; PLVVals_intra_UltraSlow_Delta];


%load intra network
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Alpha;
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_2 = [PLVVals_Intra; PLVVals_intra_Alpha];

Matrix = [PLVVals_Intra_1; PLVVals_Intra_2];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Intra];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra_1),1) = cellstr('Intra_1');
Regions(length(PLVVals_Intra_1)+1:...
    length(PLVVals_Intra_1) + length(PLVVals_Intra_2),1) = cellstr('Intra_2');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_DMN_HIPP_Encode_Intra_UltraSlow_Delta_Alpha.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%DMN/Encode/UltraSlow_Delta/Beta
%load intra network
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_UltraSlow_Delta;
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_1 = [PLVVals_Intra; PLVVals_intra_UltraSlow_Delta];


%load intra network
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Beta;
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_2 = [PLVVals_Intra; PLVVals_intra_Beta];

Matrix = [PLVVals_Intra_1; PLVVals_Intra_2];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Intra];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra_1),1) = cellstr('Intra_1');
Regions(length(PLVVals_Intra_1)+1:...
    length(PLVVals_Intra_1) + length(PLVVals_Intra_2),1) = cellstr('Intra_2');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_DMN_HIPP_Encode_Intra_UltraSlow_Delta_Beta.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix



%DMN/Encode/UltraSlow_Delta/Gamma
%load intra network
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_UltraSlow_Delta;
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_1 = [PLVVals_Intra; PLVVals_intra_UltraSlow_Delta];


%load intra network
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Gamma;
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_2 = [PLVVals_Intra; PLVVals_intra_Gamma];

Matrix = [PLVVals_Intra_1; PLVVals_Intra_2];

%load SubjPairs
%load intra network
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_Brainnetome_HIPP_ArtifactRemove.mat'));
Subj_Pairs_Intra = Subj_Pairs;
load(strcat(StrSubjPairsIntraEncode, 'Subj_Pairs_intraDMN_Yeo2011_ArtifactRemove.mat'));
Subj_Pairs_Intra = [Subj_Pairs_Intra; Subj_Pairs];

Subj_Pairs_Stack = [Subj_Pairs_Intra; Subj_Pairs_Intra];

Matrix = [Matrix Subj_Pairs_Stack];
Matrix_Cell = num2cell(Matrix);
Regions = {};
Regions(1:length(PLVVals_Intra_1),1) = cellstr('Intra_1');
Regions(length(PLVVals_Intra_1)+1:...
    length(PLVVals_Intra_1) + length(PLVVals_Intra_2),1) = cellstr('Intra_2');
Matrix_Cell = [Regions Matrix_Cell];
Matrix_Table = cell2table(Matrix_Cell);
Matrix_Table.Properties.VariableNames = {'Condition' 'PLV' 'Subject' 'Pair'};
writetable(Matrix_Table, strcat(StrSave, 'CorrIncorr_DMN_HIPP_Encode_Intra_UltraSlow_Delta_Gamma.csv'));

clear Matrix_Table Matrix_Cell Regions Subj_Pairs_Stack Matrix