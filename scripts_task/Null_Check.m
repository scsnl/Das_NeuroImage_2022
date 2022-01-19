%Anup Das
%31 August, 2021
%Null distribution check

close all;
clear all;
clc;


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

StrIntraDistance = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_rest/Distance_Results/Yeo_atlas/Intra_7/';
StrInterDistance = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_rest/Distance_Results/Yeo_atlas/Inter_7/';

StrSave = '/oak/stanford/groups/menon/projects/a1das/2018_ECoG_DMN_Project/scripts/Release_20171012_scripts/scripts_task/Null_Check_Plots/';

%Intra/Encode
load(strcat(StrPLVIntraEncode, 'NA_CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_NA = PLVVals_intra_UltraSlow_Delta;
load(strcat(StrPLVIntraEncode, 'NA_CorrIncorr_PLVVals_intraDMN_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_NA = [PLVVals_Intra_NA; PLVVals_intra_UltraSlow_Delta];


load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_UltraSlow_Delta;
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = [PLVVals_Intra; PLVVals_intra_UltraSlow_Delta];


%figure; hist(PLVVals_Intra_NA, 50); hold on;
%plot([mean(PLVVals_Intra_NA) + 1.96*std(PLVVals_Intra_NA) mean(PLVVals_Intra_NA) + 1.96*std(PLVVals_Intra_NA)],[0 150],'r'); hold on;
%plot([mean(PLVVals_Intra_NA) - 1.96*std(PLVVals_Intra_NA) mean(PLVVals_Intra_NA) - 1.96*std(PLVVals_Intra_NA)],[0 150],'r');

mean(PLVVals_Intra_NA) + 1.96*std(PLVVals_Intra_NA)
mean(PLVVals_Intra_NA) - 1.96*std(PLVVals_Intra_NA)
mean(PLVVals_Intra)

N_BoxCox = 10000;
PLVVals_Intra_NA_Random = PLVVals_Intra_NA(randperm(N_BoxCox));
[transdat,lambda] = boxcox(PLVVals_Intra_NA_Random);
mean(transdat) + 1.96*std(transdat)
((mean(PLVVals_Intra))^lambda - 1)/lambda


figure('Renderer', 'painters', 'Position', [200 200 800 600]);
hist(PLVVals_Intra_NA, 25);
hold on; xline(mean(PLVVals_Intra), 'r', 'LineWidth', 3);
%hold on; xline(mean(MFG_to_HIPP), 'g', 'LineWidth', 3);
set(gca, 'fontSize', 24);
xlabel('PLV');
title('Slow-wave');
print(strcat(StrSave,'Intra_Encode_UltraSlow_Delta'), '-depsc')





load(strcat(StrPLVIntraEncode, 'NA_CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_NA = PLVVals_intra_Theta;
load(strcat(StrPLVIntraEncode, 'NA_CorrIncorr_PLVVals_intraDMN_Yeo2011_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_NA = [PLVVals_Intra_NA; PLVVals_intra_Theta];


load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Theta;
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = [PLVVals_Intra; PLVVals_intra_Theta];


%figure; hist(PLVVals_Intra_NA, 50); hold on;
%plot([mean(PLVVals_Intra_NA) + 1.96*std(PLVVals_Intra_NA) mean(PLVVals_Intra_NA) + 1.96*std(PLVVals_Intra_NA)],[0 150],'r'); hold on;
%plot([mean(PLVVals_Intra_NA) - 1.96*std(PLVVals_Intra_NA) mean(PLVVals_Intra_NA) - 1.96*std(PLVVals_Intra_NA)],[0 150],'r');

mean(PLVVals_Intra_NA) + 1.96*std(PLVVals_Intra_NA)
mean(PLVVals_Intra_NA) - 1.96*std(PLVVals_Intra_NA)
mean(PLVVals_Intra)

N_BoxCox = 10000;
PLVVals_Intra_NA_Random = PLVVals_Intra_NA(randperm(N_BoxCox));
[transdat,lambda] = boxcox(PLVVals_Intra_NA_Random);
mean(transdat) + 1.96*std(transdat)
((mean(PLVVals_Intra))^lambda - 1)/lambda

figure('Renderer', 'painters', 'Position', [200 200 800 600]);
hist(PLVVals_Intra_NA, 25);
hold on; xline(mean(PLVVals_Intra), 'r', 'LineWidth', 3);
set(gca, 'fontSize', 24);
xlabel('PLV');
title('Theta');
print(strcat(StrSave,'Intra_Encode_Theta'), '-depsc')







load(strcat(StrPLVIntraEncode, 'NA_CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_NA = PLVVals_intra_Alpha;
load(strcat(StrPLVIntraEncode, 'NA_CorrIncorr_PLVVals_intraDMN_Yeo2011_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_NA = [PLVVals_Intra_NA; PLVVals_intra_Alpha];


load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Alpha;
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = [PLVVals_Intra; PLVVals_intra_Alpha];


%figure; hist(PLVVals_Intra_NA, 50); hold on;
%plot([mean(PLVVals_Intra_NA) + 1.96*std(PLVVals_Intra_NA) mean(PLVVals_Intra_NA) + 1.96*std(PLVVals_Intra_NA)],[0 150],'r'); hold on;
%plot([mean(PLVVals_Intra_NA) - 1.96*std(PLVVals_Intra_NA) mean(PLVVals_Intra_NA) - 1.96*std(PLVVals_Intra_NA)],[0 150],'r');

mean(PLVVals_Intra_NA) + 1.96*std(PLVVals_Intra_NA)
mean(PLVVals_Intra_NA) - 1.96*std(PLVVals_Intra_NA)
mean(PLVVals_Intra)

N_BoxCox = 10000;
PLVVals_Intra_NA_Random = PLVVals_Intra_NA(randperm(N_BoxCox));
[transdat,lambda] = boxcox(PLVVals_Intra_NA_Random);
mean(transdat) + 1.96*std(transdat)
((mean(PLVVals_Intra))^lambda - 1)/lambda

figure('Renderer', 'painters', 'Position', [200 200 800 600]);
hist(PLVVals_Intra_NA, 25);
hold on; xline(mean(PLVVals_Intra), 'r', 'LineWidth', 3);
set(gca, 'fontSize', 24);
xlabel('PLV');
title('Alpha');
print(strcat(StrSave,'Intra_Encode_Alpha'), '-depsc')








load(strcat(StrPLVIntraEncode, 'NA_CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_NA = PLVVals_intra_Beta;
load(strcat(StrPLVIntraEncode, 'NA_CorrIncorr_PLVVals_intraDMN_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_NA = [PLVVals_Intra_NA; PLVVals_intra_Beta];


load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Beta;
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = [PLVVals_Intra; PLVVals_intra_Beta];


%figure; hist(PLVVals_Intra_NA, 50); hold on;
%plot([mean(PLVVals_Intra_NA) + 1.96*std(PLVVals_Intra_NA) mean(PLVVals_Intra_NA) + 1.96*std(PLVVals_Intra_NA)],[0 150],'r'); hold on;
%plot([mean(PLVVals_Intra_NA) - 1.96*std(PLVVals_Intra_NA) mean(PLVVals_Intra_NA) - 1.96*std(PLVVals_Intra_NA)],[0 150],'r');

mean(PLVVals_Intra_NA) + 1.96*std(PLVVals_Intra_NA)
mean(PLVVals_Intra_NA) - 1.96*std(PLVVals_Intra_NA)
mean(PLVVals_Intra)

PLVVals_Intra_NA_Random = PLVVals_Intra_NA(randperm(N_BoxCox));
[transdat,lambda] = boxcox(PLVVals_Intra_NA_Random);
mean(transdat) + 1.96*std(transdat)
((mean(PLVVals_Intra))^lambda - 1)/lambda

figure('Renderer', 'painters', 'Position', [200 200 800 600]);
hist(PLVVals_Intra_NA, 25);
hold on; xline(mean(PLVVals_Intra), 'r', 'LineWidth', 3);
set(gca, 'fontSize', 24);
xlabel('PLV');
title('Beta');
print(strcat(StrSave,'Intra_Encode_Beta'), '-depsc')






load(strcat(StrPLVIntraEncode, 'NA_CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_NA = PLVVals_intra_Gamma;
load(strcat(StrPLVIntraEncode, 'NA_CorrIncorr_PLVVals_intraDMN_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_NA = [PLVVals_Intra_NA; PLVVals_intra_Gamma];


load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Gamma;
load(strcat(StrPLVIntraEncode, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = [PLVVals_Intra; PLVVals_intra_Gamma];


%figure; hist(PLVVals_Intra_NA, 50); hold on;
%plot([mean(PLVVals_Intra_NA) + 1.96*std(PLVVals_Intra_NA) mean(PLVVals_Intra_NA) + 1.96*std(PLVVals_Intra_NA)],[0 150],'r'); hold on;
%plot([mean(PLVVals_Intra_NA) - 1.96*std(PLVVals_Intra_NA) mean(PLVVals_Intra_NA) - 1.96*std(PLVVals_Intra_NA)],[0 150],'r');

mean(PLVVals_Intra_NA) + 1.96*std(PLVVals_Intra_NA)
mean(PLVVals_Intra_NA) - 1.96*std(PLVVals_Intra_NA)
mean(PLVVals_Intra)


PLVVals_Intra_NA_Random = PLVVals_Intra_NA(randperm(N_BoxCox));
[transdat,lambda] = boxcox(PLVVals_Intra_NA_Random);
mean(transdat) + 1.96*std(transdat)
((mean(PLVVals_Intra))^lambda - 1)/lambda

figure('Renderer', 'painters', 'Position', [200 200 800 600]);
hist(PLVVals_Intra_NA, 25);
hold on; xline(mean(PLVVals_Intra), 'r', 'LineWidth', 3);
set(gca, 'fontSize', 24);
xlabel('PLV');
title('Gamma');
print(strcat(StrSave,'Intra_Encode_Gamma'), '-depsc')




































%Intra/Recall
load(strcat(StrPLVIntraRecall, 'NA_CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_NA = PLVVals_intra_UltraSlow_Delta;
load(strcat(StrPLVIntraRecall, 'NA_CorrIncorr_PLVVals_intraDMN_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_NA = [PLVVals_Intra_NA; PLVVals_intra_UltraSlow_Delta];


load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_UltraSlow_Delta;
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = [PLVVals_Intra; PLVVals_intra_UltraSlow_Delta];


%figure; hist(PLVVals_Intra_NA, 50); hold on;
%plot([mean(PLVVals_Intra_NA) + 1.96*std(PLVVals_Intra_NA) mean(PLVVals_Intra_NA) + 1.96*std(PLVVals_Intra_NA)],[0 150],'r'); hold on;
%plot([mean(PLVVals_Intra_NA) - 1.96*std(PLVVals_Intra_NA) mean(PLVVals_Intra_NA) - 1.96*std(PLVVals_Intra_NA)],[0 150],'r');

mean(PLVVals_Intra_NA) + 1.96*std(PLVVals_Intra_NA)
mean(PLVVals_Intra_NA) - 1.96*std(PLVVals_Intra_NA)
mean(PLVVals_Intra)

PLVVals_Intra_NA_Random = PLVVals_Intra_NA(randperm(N_BoxCox));
[transdat,lambda] = boxcox(PLVVals_Intra_NA_Random);
mean(transdat) + 1.96*std(transdat)
((mean(PLVVals_Intra))^lambda - 1)/lambda

figure('Renderer', 'painters', 'Position', [200 200 800 600]);
hist(PLVVals_Intra_NA, 25);
hold on; xline(mean(PLVVals_Intra), 'r', 'LineWidth', 3);
set(gca, 'fontSize', 24);
xlabel('PLV');
title('Slow-wave');
print(strcat(StrSave,'Intra_Recall_UltraSlow_Delta'), '-depsc')







load(strcat(StrPLVIntraRecall, 'NA_CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_NA = PLVVals_intra_Theta;
load(strcat(StrPLVIntraRecall, 'NA_CorrIncorr_PLVVals_intraDMN_Yeo2011_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_NA = [PLVVals_Intra_NA; PLVVals_intra_Theta];


load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Theta;
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = [PLVVals_Intra; PLVVals_intra_Theta];


%figure; hist(PLVVals_Intra_NA, 50); hold on;
%plot([mean(PLVVals_Intra_NA) + 1.96*std(PLVVals_Intra_NA) mean(PLVVals_Intra_NA) + 1.96*std(PLVVals_Intra_NA)],[0 150],'r'); hold on;
%plot([mean(PLVVals_Intra_NA) - 1.96*std(PLVVals_Intra_NA) mean(PLVVals_Intra_NA) - 1.96*std(PLVVals_Intra_NA)],[0 150],'r');

mean(PLVVals_Intra_NA) + 1.96*std(PLVVals_Intra_NA)
mean(PLVVals_Intra_NA) - 1.96*std(PLVVals_Intra_NA)
mean(PLVVals_Intra)

PLVVals_Intra_NA_Random = PLVVals_Intra_NA(randperm(N_BoxCox));
[transdat,lambda] = boxcox(PLVVals_Intra_NA_Random);
mean(transdat) + 1.96*std(transdat)
((mean(PLVVals_Intra))^lambda - 1)/lambda

figure('Renderer', 'painters', 'Position', [200 200 800 600]);
hist(PLVVals_Intra_NA, 25);
hold on; xline(mean(PLVVals_Intra), 'r', 'LineWidth', 3);
set(gca, 'fontSize', 24);
xlabel('PLV');
title('Theta');
print(strcat(StrSave,'Intra_Recall_Theta'), '-depsc')







load(strcat(StrPLVIntraRecall, 'NA_CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_NA = PLVVals_intra_Alpha;
load(strcat(StrPLVIntraRecall, 'NA_CorrIncorr_PLVVals_intraDMN_Yeo2011_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_NA = [PLVVals_Intra_NA; PLVVals_intra_Alpha];


load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Alpha;
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = [PLVVals_Intra; PLVVals_intra_Alpha];


%figure; hist(PLVVals_Intra_NA, 50); hold on;
%plot([mean(PLVVals_Intra_NA) + 1.96*std(PLVVals_Intra_NA) mean(PLVVals_Intra_NA) + 1.96*std(PLVVals_Intra_NA)],[0 150],'r'); hold on;
%plot([mean(PLVVals_Intra_NA) - 1.96*std(PLVVals_Intra_NA) mean(PLVVals_Intra_NA) - 1.96*std(PLVVals_Intra_NA)],[0 150],'r');

mean(PLVVals_Intra_NA) + 1.96*std(PLVVals_Intra_NA)
mean(PLVVals_Intra_NA) - 1.96*std(PLVVals_Intra_NA)
mean(PLVVals_Intra)

PLVVals_Intra_NA_Random = PLVVals_Intra_NA(randperm(N_BoxCox));
[transdat,lambda] = boxcox(PLVVals_Intra_NA_Random);
mean(transdat) + 1.96*std(transdat)
((mean(PLVVals_Intra))^lambda - 1)/lambda

figure('Renderer', 'painters', 'Position', [200 200 800 600]);
hist(PLVVals_Intra_NA, 25);
hold on; xline(mean(PLVVals_Intra), 'r', 'LineWidth', 3);
set(gca, 'fontSize', 24);
xlabel('PLV');
title('Alpha');
print(strcat(StrSave,'Intra_Recall_Alpha'), '-depsc')







load(strcat(StrPLVIntraRecall, 'NA_CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_NA = PLVVals_intra_Beta;
load(strcat(StrPLVIntraRecall, 'NA_CorrIncorr_PLVVals_intraDMN_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_NA = [PLVVals_Intra_NA; PLVVals_intra_Beta];


load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Beta;
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = [PLVVals_Intra; PLVVals_intra_Beta];


%figure; hist(PLVVals_Intra_NA, 50); hold on;
%plot([mean(PLVVals_Intra_NA) + 1.96*std(PLVVals_Intra_NA) mean(PLVVals_Intra_NA) + 1.96*std(PLVVals_Intra_NA)],[0 150],'r'); hold on;
%plot([mean(PLVVals_Intra_NA) - 1.96*std(PLVVals_Intra_NA) mean(PLVVals_Intra_NA) - 1.96*std(PLVVals_Intra_NA)],[0 150],'r');

mean(PLVVals_Intra_NA) + 1.96*std(PLVVals_Intra_NA)
mean(PLVVals_Intra_NA) - 1.96*std(PLVVals_Intra_NA)
mean(PLVVals_Intra)

PLVVals_Intra_NA_Random = PLVVals_Intra_NA(randperm(N_BoxCox));
[transdat,lambda] = boxcox(PLVVals_Intra_NA_Random);
mean(transdat) + 1.96*std(transdat)
((mean(PLVVals_Intra))^lambda - 1)/lambda

figure('Renderer', 'painters', 'Position', [200 200 800 600]);
hist(PLVVals_Intra_NA, 25);
hold on; xline(mean(PLVVals_Intra), 'r', 'LineWidth', 3);
set(gca, 'fontSize', 24);
xlabel('PLV');
title('Beta');
print(strcat(StrSave,'Intra_Recall_Beta'), '-depsc')







load(strcat(StrPLVIntraRecall, 'NA_CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_NA = PLVVals_intra_Gamma;
load(strcat(StrPLVIntraRecall, 'NA_CorrIncorr_PLVVals_intraDMN_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_NA = [PLVVals_Intra_NA; PLVVals_intra_Gamma];


load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intra_Gamma;
load(strcat(StrPLVIntraRecall, 'CorrIncorr_PLVVals_intraDMN_Yeo2011_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = [PLVVals_Intra; PLVVals_intra_Gamma];


%figure; hist(PLVVals_Intra_NA, 50); hold on;
%plot([mean(PLVVals_Intra_NA) + 1.96*std(PLVVals_Intra_NA) mean(PLVVals_Intra_NA) + 1.96*std(PLVVals_Intra_NA)],[0 150],'r'); hold on;
%plot([mean(PLVVals_Intra_NA) - 1.96*std(PLVVals_Intra_NA) mean(PLVVals_Intra_NA) - 1.96*std(PLVVals_Intra_NA)],[0 150],'r');

mean(PLVVals_Intra_NA) + 1.96*std(PLVVals_Intra_NA)
mean(PLVVals_Intra_NA) - 1.96*std(PLVVals_Intra_NA)
mean(PLVVals_Intra)


PLVVals_Intra_NA_Random = PLVVals_Intra_NA(randperm(N_BoxCox));
[transdat,lambda] = boxcox(PLVVals_Intra_NA_Random);
mean(transdat) + 1.96*std(transdat)
((mean(PLVVals_Intra))^lambda - 1)/lambda

figure('Renderer', 'painters', 'Position', [200 200 800 600]);
hist(PLVVals_Intra_NA, 25);
hold on; xline(mean(PLVVals_Intra), 'r', 'LineWidth', 3);
set(gca, 'fontSize', 24);
xlabel('PLV');
title('Gamma');
print(strcat(StrSave,'Intra_Recall_Gamma'), '-depsc')

























%Intra/Rest
load(strcat(StrPLVIntraRest, 'NA_PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_NA = PLVVals_intraDMN_UltraSlow_Delta;
load(strcat(StrPLVIntraRest, 'NA_PLVVals_intraNet_7_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_NA = [PLVVals_Intra_NA; PLVVals_intra_UltraSlow_Delta];


load(strcat(StrPLVIntraRest, 'PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intraDMN_UltraSlow_Delta;
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_Random_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = [PLVVals_Intra; PLVVals_intra_UltraSlow_Delta];


%figure; hist(PLVVals_Intra_NA, 50); hold on;
%plot([mean(PLVVals_Intra_NA) + 1.96*std(PLVVals_Intra_NA) mean(PLVVals_Intra_NA) + 1.96*std(PLVVals_Intra_NA)],[0 150],'r'); hold on;
%plot([mean(PLVVals_Intra_NA) - 1.96*std(PLVVals_Intra_NA) mean(PLVVals_Intra_NA) - 1.96*std(PLVVals_Intra_NA)],[0 150],'r');

mean(PLVVals_Intra_NA) + 1.96*std(PLVVals_Intra_NA)
mean(PLVVals_Intra_NA) - 1.96*std(PLVVals_Intra_NA)
mean(PLVVals_Intra)

PLVVals_Intra_NA_Random = PLVVals_Intra_NA(randperm(N_BoxCox));
[transdat,lambda] = boxcox(PLVVals_Intra_NA_Random);
mean(transdat) + 1.96*std(transdat)
((mean(PLVVals_Intra))^lambda - 1)/lambda

figure('Renderer', 'painters', 'Position', [200 200 800 600]);
hist(PLVVals_Intra_NA, 25);
hold on; xline(mean(PLVVals_Intra), 'r', 'LineWidth', 3);
set(gca, 'fontSize', 24);
xlabel('PLV');
title('Slow-wave');
print(strcat(StrSave,'Intra_Rest_UltraSlow_Delta'), '-depsc')







load(strcat(StrPLVIntraRest, 'NA_PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_NA = PLVVals_intraDMN_Theta;
load(strcat(StrPLVIntraRest, 'NA_PLVVals_intraNet_7_Yeo2011_Random_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_NA = [PLVVals_Intra_NA; PLVVals_intra_Theta];


load(strcat(StrPLVIntraRest, 'PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intraDMN_Theta;
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_Random_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = [PLVVals_Intra; PLVVals_intra_Theta];


%figure; hist(PLVVals_Intra_NA, 50); hold on;
%plot([mean(PLVVals_Intra_NA) + 1.96*std(PLVVals_Intra_NA) mean(PLVVals_Intra_NA) + 1.96*std(PLVVals_Intra_NA)],[0 150],'r'); hold on;
%plot([mean(PLVVals_Intra_NA) - 1.96*std(PLVVals_Intra_NA) mean(PLVVals_Intra_NA) - 1.96*std(PLVVals_Intra_NA)],[0 150],'r');

mean(PLVVals_Intra_NA) + 1.96*std(PLVVals_Intra_NA)
mean(PLVVals_Intra_NA) - 1.96*std(PLVVals_Intra_NA)
mean(PLVVals_Intra)

PLVVals_Intra_NA_Random = PLVVals_Intra_NA(randperm(N_BoxCox));
[transdat,lambda] = boxcox(PLVVals_Intra_NA_Random);
mean(transdat) + 1.96*std(transdat)
((mean(PLVVals_Intra))^lambda - 1)/lambda

figure('Renderer', 'painters', 'Position', [200 200 800 600]);
hist(PLVVals_Intra_NA, 25);
hold on; xline(mean(PLVVals_Intra), 'r', 'LineWidth', 3);
set(gca, 'fontSize', 24);
xlabel('PLV');
title('Theta');
print(strcat(StrSave,'Intra_Rest_Theta'), '-depsc')







load(strcat(StrPLVIntraRest, 'NA_PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_NA = PLVVals_intraDMN_Alpha;
load(strcat(StrPLVIntraRest, 'NA_PLVVals_intraNet_7_Yeo2011_Random_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_NA = [PLVVals_Intra_NA; PLVVals_intra_Alpha];


load(strcat(StrPLVIntraRest, 'PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intraDMN_Alpha;
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_Random_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = [PLVVals_Intra; PLVVals_intra_Alpha];


%figure; hist(PLVVals_Intra_NA, 50); hold on;
%plot([mean(PLVVals_Intra_NA) + 1.96*std(PLVVals_Intra_NA) mean(PLVVals_Intra_NA) + 1.96*std(PLVVals_Intra_NA)],[0 150],'r'); hold on;
%plot([mean(PLVVals_Intra_NA) - 1.96*std(PLVVals_Intra_NA) mean(PLVVals_Intra_NA) - 1.96*std(PLVVals_Intra_NA)],[0 150],'r');

mean(PLVVals_Intra_NA) + 1.96*std(PLVVals_Intra_NA)
mean(PLVVals_Intra_NA) - 1.96*std(PLVVals_Intra_NA)
mean(PLVVals_Intra)

PLVVals_Intra_NA_Random = PLVVals_Intra_NA(randperm(N_BoxCox));
[transdat,lambda] = boxcox(PLVVals_Intra_NA_Random);
mean(transdat) + 1.96*std(transdat)
((mean(PLVVals_Intra))^lambda - 1)/lambda

figure('Renderer', 'painters', 'Position', [200 200 800 600]);
hist(PLVVals_Intra_NA, 25);
hold on; xline(mean(PLVVals_Intra), 'r', 'LineWidth', 3);
set(gca, 'fontSize', 24);
xlabel('PLV');
title('Alpha');
print(strcat(StrSave,'Intra_Rest_Alpha'), '-depsc')







load(strcat(StrPLVIntraRest, 'NA_PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_NA = PLVVals_intraDMN_Beta;
load(strcat(StrPLVIntraRest, 'NA_PLVVals_intraNet_7_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_NA = [PLVVals_Intra_NA; PLVVals_intra_Beta];


load(strcat(StrPLVIntraRest, 'PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intraDMN_Beta;
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_Random_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = [PLVVals_Intra; PLVVals_intra_Beta];


%figure; hist(PLVVals_Intra_NA, 50); hold on;
%plot([mean(PLVVals_Intra_NA) + 1.96*std(PLVVals_Intra_NA) mean(PLVVals_Intra_NA) + 1.96*std(PLVVals_Intra_NA)],[0 150],'r'); hold on;
%plot([mean(PLVVals_Intra_NA) - 1.96*std(PLVVals_Intra_NA) mean(PLVVals_Intra_NA) - 1.96*std(PLVVals_Intra_NA)],[0 150],'r');

mean(PLVVals_Intra_NA) + 1.96*std(PLVVals_Intra_NA)
mean(PLVVals_Intra_NA) - 1.96*std(PLVVals_Intra_NA)
mean(PLVVals_Intra)

PLVVals_Intra_NA_Random = PLVVals_Intra_NA(randperm(N_BoxCox));
[transdat,lambda] = boxcox(PLVVals_Intra_NA_Random);
mean(transdat) + 1.96*std(transdat)
((mean(PLVVals_Intra))^lambda - 1)/lambda

figure('Renderer', 'painters', 'Position', [200 200 800 600]);
hist(PLVVals_Intra_NA, 25);
hold on; xline(mean(PLVVals_Intra), 'r', 'LineWidth', 3);
set(gca, 'fontSize', 24);
xlabel('PLV');
title('Beta');
print(strcat(StrSave,'Intra_Rest_Beta'), '-depsc')







load(strcat(StrPLVIntraRest, 'NA_PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_NA = PLVVals_intraDMN_Gamma;
load(strcat(StrPLVIntraRest, 'NA_PLVVals_intraNet_7_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra_NA = [PLVVals_Intra_NA; PLVVals_intra_Gamma];


load(strcat(StrPLVIntraRest, 'PLVVals_intraDMN_Yeo2011_Random_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = PLVVals_intraDMN_Gamma;
load(strcat(StrPLVIntraRest, 'PLVVals_intraNet_7_Yeo2011_Random_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Intra = [PLVVals_Intra; PLVVals_intra_Gamma];


%figure; hist(PLVVals_Intra_NA, 50); hold on;
%plot([mean(PLVVals_Intra_NA) + 1.96*std(PLVVals_Intra_NA) mean(PLVVals_Intra_NA) + 1.96*std(PLVVals_Intra_NA)],[0 150],'r'); hold on;
%plot([mean(PLVVals_Intra_NA) - 1.96*std(PLVVals_Intra_NA) mean(PLVVals_Intra_NA) - 1.96*std(PLVVals_Intra_NA)],[0 150],'r');

mean(PLVVals_Intra_NA) + 1.96*std(PLVVals_Intra_NA)
mean(PLVVals_Intra_NA) - 1.96*std(PLVVals_Intra_NA)
mean(PLVVals_Intra)


PLVVals_Intra_NA_Random = PLVVals_Intra_NA(randperm(N_BoxCox));
[transdat,lambda] = boxcox(PLVVals_Intra_NA_Random);
mean(transdat) + 1.96*std(transdat)
((mean(PLVVals_Intra))^lambda - 1)/lambda

figure('Renderer', 'painters', 'Position', [200 200 800 600]);
hist(PLVVals_Intra_NA, 25);
hold on; xline(mean(PLVVals_Intra), 'r', 'LineWidth', 3);
set(gca, 'fontSize', 24);
xlabel('PLV');
title('Gamma');
print(strcat(StrSave,'Intra_Rest_Gamma'), '-depsc')



































%Inter/Encode
load(strcat(StrPLVInterEncode, 'NA_CorrIncorr_PLVVals_interDMN_1_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'NA_CorrIncorr_PLVVals_interDMN_2_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'NA_CorrIncorr_PLVVals_interDMN_3_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'NA_CorrIncorr_PLVVals_interDMN_4_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'NA_CorrIncorr_PLVVals_interDMN_5_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterEncode, 'NA_CorrIncorr_PLVVals_interDMN_6_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_UltraSlow_Delta;

PLVVals_Inter_NA = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];


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


%figure; hist(PLVVals_Inter_NA, 50); hold on;
%plot([mean(PLVVals_Inter_NA) + 1.96*std(PLVVals_Inter_NA) mean(PLVVals_Inter_NA) + 1.96*std(PLVVals_Inter_NA)],[0 150],'r'); hold on;
%plot([mean(PLVVals_Inter_NA) - 1.96*std(PLVVals_Inter_NA) mean(PLVVals_Inter_NA) - 1.96*std(PLVVals_Inter_NA)],[0 150],'r');

mean(PLVVals_Inter_NA) + 1.96*std(PLVVals_Inter_NA)
mean(PLVVals_Inter_NA) - 1.96*std(PLVVals_Inter_NA)
mean(PLVVals_Inter)

PLVVals_Inter_NA_Random = PLVVals_Inter_NA(randperm(N_BoxCox));
[transdat,lambda] = boxcox(PLVVals_Inter_NA_Random);
mean(transdat) + 1.96*std(transdat)
((mean(PLVVals_Inter))^lambda - 1)/lambda

figure('Renderer', 'painters', 'Position', [200 200 800 600]);
hist(PLVVals_Inter_NA, 25);
hold on; xline(mean(PLVVals_Inter), 'r', 'LineWidth', 3);
set(gca, 'fontSize', 24);
xlabel('PLV');
title('Slow-wave');
print(strcat(StrSave,'Inter_Encode_UltraSlow_Delta'), '-depsc')






load(strcat(StrPLVInterEncode, 'NA_CorrIncorr_PLVVals_interDMN_1_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Theta;
load(strcat(StrPLVInterEncode, 'NA_CorrIncorr_PLVVals_interDMN_2_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Theta;
load(strcat(StrPLVInterEncode, 'NA_CorrIncorr_PLVVals_interDMN_3_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Theta;
load(strcat(StrPLVInterEncode, 'NA_CorrIncorr_PLVVals_interDMN_4_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Theta;
load(strcat(StrPLVInterEncode, 'NA_CorrIncorr_PLVVals_interDMN_5_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Theta;
load(strcat(StrPLVInterEncode, 'NA_CorrIncorr_PLVVals_interDMN_6_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Theta;

PLVVals_Inter_NA = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];


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


%figure; hist(PLVVals_Inter_NA, 50); hold on;
%plot([mean(PLVVals_Inter_NA) + 1.96*std(PLVVals_Inter_NA) mean(PLVVals_Inter_NA) + 1.96*std(PLVVals_Inter_NA)],[0 150],'r'); hold on;
%plot([mean(PLVVals_Inter_NA) - 1.96*std(PLVVals_Inter_NA) mean(PLVVals_Inter_NA) - 1.96*std(PLVVals_Inter_NA)],[0 150],'r');

mean(PLVVals_Inter_NA) + 1.96*std(PLVVals_Inter_NA)
mean(PLVVals_Inter_NA) - 1.96*std(PLVVals_Inter_NA)
mean(PLVVals_Inter)

PLVVals_Inter_NA_Random = PLVVals_Inter_NA(randperm(N_BoxCox));
[transdat,lambda] = boxcox(PLVVals_Inter_NA_Random);
mean(transdat) + 1.96*std(transdat)
((mean(PLVVals_Inter))^lambda - 1)/lambda

figure('Renderer', 'painters', 'Position', [200 200 800 600]);
hist(PLVVals_Inter_NA, 25);
hold on; xline(mean(PLVVals_Inter), 'r', 'LineWidth', 3);
set(gca, 'fontSize', 24);
xlabel('PLV');
title('Theta');
print(strcat(StrSave,'Inter_Encode_Theta'), '-depsc')







load(strcat(StrPLVInterEncode, 'NA_CorrIncorr_PLVVals_interDMN_1_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Alpha;
load(strcat(StrPLVInterEncode, 'NA_CorrIncorr_PLVVals_interDMN_2_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Alpha;
load(strcat(StrPLVInterEncode, 'NA_CorrIncorr_PLVVals_interDMN_3_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Alpha;
load(strcat(StrPLVInterEncode, 'NA_CorrIncorr_PLVVals_interDMN_4_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Alpha;
load(strcat(StrPLVInterEncode, 'NA_CorrIncorr_PLVVals_interDMN_5_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Alpha;
load(strcat(StrPLVInterEncode, 'NA_CorrIncorr_PLVVals_interDMN_6_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Alpha;

PLVVals_Inter_NA = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];


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


%figure; hist(PLVVals_Inter_NA, 50); hold on;
%plot([mean(PLVVals_Inter_NA) + 1.96*std(PLVVals_Inter_NA) mean(PLVVals_Inter_NA) + 1.96*std(PLVVals_Inter_NA)],[0 150],'r'); hold on;
%plot([mean(PLVVals_Inter_NA) - 1.96*std(PLVVals_Inter_NA) mean(PLVVals_Inter_NA) - 1.96*std(PLVVals_Inter_NA)],[0 150],'r');

mean(PLVVals_Inter_NA) + 1.96*std(PLVVals_Inter_NA)
mean(PLVVals_Inter_NA) - 1.96*std(PLVVals_Inter_NA)
mean(PLVVals_Inter)

PLVVals_Inter_NA_Random = PLVVals_Inter_NA(randperm(N_BoxCox));
[transdat,lambda] = boxcox(PLVVals_Inter_NA_Random);
mean(transdat) + 1.96*std(transdat)
((mean(PLVVals_Inter))^lambda - 1)/lambda

figure('Renderer', 'painters', 'Position', [200 200 800 600]);
hist(PLVVals_Inter_NA, 25);
hold on; xline(mean(PLVVals_Inter), 'r', 'LineWidth', 3);
set(gca, 'fontSize', 24);
xlabel('PLV');
title('Alpha');
print(strcat(StrSave,'Inter_Encode_Alpha'), '-depsc')







load(strcat(StrPLVInterEncode, 'NA_CorrIncorr_PLVVals_interDMN_1_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'NA_CorrIncorr_PLVVals_interDMN_2_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'NA_CorrIncorr_PLVVals_interDMN_3_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'NA_CorrIncorr_PLVVals_interDMN_4_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'NA_CorrIncorr_PLVVals_interDMN_5_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Beta;
load(strcat(StrPLVInterEncode, 'NA_CorrIncorr_PLVVals_interDMN_6_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Beta;

PLVVals_Inter_NA = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];


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


%figure; hist(PLVVals_Inter_NA, 50); hold on;
%plot([mean(PLVVals_Inter_NA) + 1.96*std(PLVVals_Inter_NA) mean(PLVVals_Inter_NA) + 1.96*std(PLVVals_Inter_NA)],[0 150],'r'); hold on;
%plot([mean(PLVVals_Inter_NA) - 1.96*std(PLVVals_Inter_NA) mean(PLVVals_Inter_NA) - 1.96*std(PLVVals_Inter_NA)],[0 150],'r');

mean(PLVVals_Inter_NA) + 1.96*std(PLVVals_Inter_NA)
mean(PLVVals_Inter_NA) - 1.96*std(PLVVals_Inter_NA)
mean(PLVVals_Inter)

PLVVals_Inter_NA_Random = PLVVals_Inter_NA(randperm(N_BoxCox));
[transdat,lambda] = boxcox(PLVVals_Inter_NA_Random);
mean(transdat) + 1.96*std(transdat)
((mean(PLVVals_Inter))^lambda - 1)/lambda

figure('Renderer', 'painters', 'Position', [200 200 800 600]);
hist(PLVVals_Inter_NA, 25);
hold on; xline(mean(PLVVals_Inter), 'r', 'LineWidth', 3);
set(gca, 'fontSize', 24);
xlabel('PLV');
title('Beta');
print(strcat(StrSave,'Inter_Encode_Beta'), '-depsc')







load(strcat(StrPLVInterEncode, 'NA_CorrIncorr_PLVVals_interDMN_1_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'NA_CorrIncorr_PLVVals_interDMN_2_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'NA_CorrIncorr_PLVVals_interDMN_3_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'NA_CorrIncorr_PLVVals_interDMN_4_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'NA_CorrIncorr_PLVVals_interDMN_5_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterEncode, 'NA_CorrIncorr_PLVVals_interDMN_6_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Gamma;

PLVVals_Inter_NA = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];


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


%figure; hist(PLVVals_Inter_NA, 50); hold on;
%plot([mean(PLVVals_Inter_NA) + 1.96*std(PLVVals_Inter_NA) mean(PLVVals_Inter_NA) + 1.96*std(PLVVals_Inter_NA)],[0 150],'r'); hold on;
%plot([mean(PLVVals_Inter_NA) - 1.96*std(PLVVals_Inter_NA) mean(PLVVals_Inter_NA) - 1.96*std(PLVVals_Inter_NA)],[0 150],'r');

mean(PLVVals_Inter_NA) + 1.96*std(PLVVals_Inter_NA)
mean(PLVVals_Inter_NA) - 1.96*std(PLVVals_Inter_NA)
mean(PLVVals_Inter)


PLVVals_Inter_NA_Random = PLVVals_Inter_NA(randperm(N_BoxCox));
[transdat,lambda] = boxcox(PLVVals_Inter_NA_Random);
mean(transdat) + 1.96*std(transdat)
((mean(PLVVals_Inter))^lambda - 1)/lambda

figure('Renderer', 'painters', 'Position', [200 200 800 600]);
hist(PLVVals_Inter_NA, 25);
hold on; xline(mean(PLVVals_Inter), 'r', 'LineWidth', 3);
set(gca, 'fontSize', 24);
xlabel('PLV');
title('Gamma');
print(strcat(StrSave,'Inter_Encode_Gamma'), '-depsc')






































%Inter/Recall
load(strcat(StrPLVInterRecall, 'NA_CorrIncorr_PLVVals_interDMN_1_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'NA_CorrIncorr_PLVVals_interDMN_2_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'NA_CorrIncorr_PLVVals_interDMN_3_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'NA_CorrIncorr_PLVVals_interDMN_4_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'NA_CorrIncorr_PLVVals_interDMN_5_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_UltraSlow_Delta;
load(strcat(StrPLVInterRecall, 'NA_CorrIncorr_PLVVals_interDMN_6_Yeo2011_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_UltraSlow_Delta;

PLVVals_Inter_NA = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];


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


%figure; hist(PLVVals_Inter_NA, 50); hold on;
%plot([mean(PLVVals_Inter_NA) + 1.96*std(PLVVals_Inter_NA) mean(PLVVals_Inter_NA) + 1.96*std(PLVVals_Inter_NA)],[0 150],'r'); hold on;
%plot([mean(PLVVals_Inter_NA) - 1.96*std(PLVVals_Inter_NA) mean(PLVVals_Inter_NA) - 1.96*std(PLVVals_Inter_NA)],[0 150],'r');

mean(PLVVals_Inter_NA) + 1.96*std(PLVVals_Inter_NA)
mean(PLVVals_Inter_NA) - 1.96*std(PLVVals_Inter_NA)
mean(PLVVals_Inter)

PLVVals_Inter_NA_Random = PLVVals_Inter_NA(randperm(N_BoxCox));
[transdat,lambda] = boxcox(PLVVals_Inter_NA_Random);
mean(transdat) + 1.96*std(transdat)
((mean(PLVVals_Inter))^lambda - 1)/lambda

figure('Renderer', 'painters', 'Position', [200 200 800 600]);
hist(PLVVals_Inter_NA, 25);
hold on; xline(mean(PLVVals_Inter), 'r', 'LineWidth', 3);
set(gca, 'fontSize', 24);
xlabel('PLV');
title('Slow-wave');
print(strcat(StrSave,'Inter_Recall_UltraSlow_Delta'), '-depsc')






load(strcat(StrPLVInterRecall, 'NA_CorrIncorr_PLVVals_interDMN_1_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Theta;
load(strcat(StrPLVInterRecall, 'NA_CorrIncorr_PLVVals_interDMN_2_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Theta;
load(strcat(StrPLVInterRecall, 'NA_CorrIncorr_PLVVals_interDMN_3_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Theta;
load(strcat(StrPLVInterRecall, 'NA_CorrIncorr_PLVVals_interDMN_4_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Theta;
load(strcat(StrPLVInterRecall, 'NA_CorrIncorr_PLVVals_interDMN_5_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Theta;
load(strcat(StrPLVInterRecall, 'NA_CorrIncorr_PLVVals_interDMN_6_Yeo2011_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Theta;

PLVVals_Inter_NA = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];


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

%figure; hist(PLVVals_Inter_NA, 50); hold on;
%plot([mean(PLVVals_Inter_NA) + 1.96*std(PLVVals_Inter_NA) mean(PLVVals_Inter_NA) + 1.96*std(PLVVals_Inter_NA)],[0 150],'r'); hold on;
%plot([mean(PLVVals_Inter_NA) - 1.96*std(PLVVals_Inter_NA) mean(PLVVals_Inter_NA) - 1.96*std(PLVVals_Inter_NA)],[0 150],'r');

mean(PLVVals_Inter_NA) + 1.96*std(PLVVals_Inter_NA)
mean(PLVVals_Inter_NA) - 1.96*std(PLVVals_Inter_NA)
mean(PLVVals_Inter)

PLVVals_Inter_NA_Random = PLVVals_Inter_NA(randperm(N_BoxCox));
[transdat,lambda] = boxcox(PLVVals_Inter_NA_Random);
mean(transdat) + 1.96*std(transdat)
((mean(PLVVals_Inter))^lambda - 1)/lambda

figure('Renderer', 'painters', 'Position', [200 200 800 600]);
hist(PLVVals_Inter_NA, 25);
hold on; xline(mean(PLVVals_Inter), 'r', 'LineWidth', 3);
set(gca, 'fontSize', 24);
xlabel('PLV');
title('Theta');
print(strcat(StrSave,'Inter_Recall_Theta'), '-depsc')





load(strcat(StrPLVInterRecall, 'NA_CorrIncorr_PLVVals_interDMN_1_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Alpha;
load(strcat(StrPLVInterRecall, 'NA_CorrIncorr_PLVVals_interDMN_2_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Alpha;
load(strcat(StrPLVInterRecall, 'NA_CorrIncorr_PLVVals_interDMN_3_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Alpha;
load(strcat(StrPLVInterRecall, 'NA_CorrIncorr_PLVVals_interDMN_4_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Alpha;
load(strcat(StrPLVInterRecall, 'NA_CorrIncorr_PLVVals_interDMN_5_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Alpha;
load(strcat(StrPLVInterRecall, 'NA_CorrIncorr_PLVVals_interDMN_6_Yeo2011_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Alpha;

PLVVals_Inter_NA = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];


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


%figure; hist(PLVVals_Inter_NA, 50); hold on;
%plot([mean(PLVVals_Inter_NA) + 1.96*std(PLVVals_Inter_NA) mean(PLVVals_Inter_NA) + 1.96*std(PLVVals_Inter_NA)],[0 150],'r'); hold on;
%plot([mean(PLVVals_Inter_NA) - 1.96*std(PLVVals_Inter_NA) mean(PLVVals_Inter_NA) - 1.96*std(PLVVals_Inter_NA)],[0 150],'r');

mean(PLVVals_Inter_NA) + 1.96*std(PLVVals_Inter_NA)
mean(PLVVals_Inter_NA) - 1.96*std(PLVVals_Inter_NA)
mean(PLVVals_Inter)

PLVVals_Inter_NA_Random = PLVVals_Inter_NA(randperm(N_BoxCox));
[transdat,lambda] = boxcox(PLVVals_Inter_NA_Random);
mean(transdat) + 1.96*std(transdat)
((mean(PLVVals_Inter))^lambda - 1)/lambda

figure('Renderer', 'painters', 'Position', [200 200 800 600]);
hist(PLVVals_Inter_NA, 25);
hold on; xline(mean(PLVVals_Inter), 'r', 'LineWidth', 3);
set(gca, 'fontSize', 24);
xlabel('PLV');
title('Alpha');
print(strcat(StrSave,'Inter_Recall_Alpha'), '-depsc')






load(strcat(StrPLVInterRecall, 'NA_CorrIncorr_PLVVals_interDMN_1_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'NA_CorrIncorr_PLVVals_interDMN_2_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'NA_CorrIncorr_PLVVals_interDMN_3_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'NA_CorrIncorr_PLVVals_interDMN_4_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'NA_CorrIncorr_PLVVals_interDMN_5_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Beta;
load(strcat(StrPLVInterRecall, 'NA_CorrIncorr_PLVVals_interDMN_6_Yeo2011_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Beta;

PLVVals_Inter_NA = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];


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


%figure; hist(PLVVals_Inter_NA, 50); hold on;
%plot([mean(PLVVals_Inter_NA) + 1.96*std(PLVVals_Inter_NA) mean(PLVVals_Inter_NA) + 1.96*std(PLVVals_Inter_NA)],[0 150],'r'); hold on;
%plot([mean(PLVVals_Inter_NA) - 1.96*std(PLVVals_Inter_NA) mean(PLVVals_Inter_NA) - 1.96*std(PLVVals_Inter_NA)],[0 150],'r');

mean(PLVVals_Inter_NA) + 1.96*std(PLVVals_Inter_NA)
mean(PLVVals_Inter_NA) - 1.96*std(PLVVals_Inter_NA)
mean(PLVVals_Inter)

PLVVals_Inter_NA_Random = PLVVals_Inter_NA(randperm(N_BoxCox));
[transdat,lambda] = boxcox(PLVVals_Inter_NA_Random);
mean(transdat) + 1.96*std(transdat)
((mean(PLVVals_Inter))^lambda - 1)/lambda

figure('Renderer', 'painters', 'Position', [200 200 800 600]);
hist(PLVVals_Inter_NA, 25);
hold on; xline(mean(PLVVals_Inter), 'r', 'LineWidth', 3);
set(gca, 'fontSize', 24);
xlabel('PLV');
title('Beta');
print(strcat(StrSave,'Inter_Recall_Beta'), '-depsc')







load(strcat(StrPLVInterRecall, 'NA_CorrIncorr_PLVVals_interDMN_1_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'NA_CorrIncorr_PLVVals_interDMN_2_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'NA_CorrIncorr_PLVVals_interDMN_3_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'NA_CorrIncorr_PLVVals_interDMN_4_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'NA_CorrIncorr_PLVVals_interDMN_5_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_inter_Gamma;
load(strcat(StrPLVInterRecall, 'NA_CorrIncorr_PLVVals_interDMN_6_Yeo2011_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_inter_Gamma;

PLVVals_Inter_NA = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];


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


%figure; hist(PLVVals_Inter_NA, 50); hold on;
%plot([mean(PLVVals_Inter_NA) + 1.96*std(PLVVals_Inter_NA) mean(PLVVals_Inter_NA) + 1.96*std(PLVVals_Inter_NA)],[0 150],'r'); hold on;
%plot([mean(PLVVals_Inter_NA) - 1.96*std(PLVVals_Inter_NA) mean(PLVVals_Inter_NA) - 1.96*std(PLVVals_Inter_NA)],[0 150],'r');

mean(PLVVals_Inter_NA) + 1.96*std(PLVVals_Inter_NA)
mean(PLVVals_Inter_NA) - 1.96*std(PLVVals_Inter_NA)
mean(PLVVals_Inter)

PLVVals_Inter_NA_Random = PLVVals_Inter_NA(randperm(N_BoxCox));
[transdat,lambda] = boxcox(PLVVals_Inter_NA_Random);
mean(transdat) + 1.96*std(transdat)
((mean(PLVVals_Inter))^lambda - 1)/lambda

figure('Renderer', 'painters', 'Position', [200 200 800 600]);
hist(PLVVals_Inter_NA, 25);
hold on; xline(mean(PLVVals_Inter), 'r', 'LineWidth', 3);
set(gca, 'fontSize', 24);
xlabel('PLV');
title('Gamma');
print(strcat(StrSave,'Inter_Recall_Gamma'), '-depsc')




























%Inter/Rest
load(strcat(StrPLVInterRest, 'NA_PLVVals_interDMN_1_Yeo2011_Random_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_interDMN_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'NA_PLVVals_interDMN_2_Yeo2011_Random_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_interDMN_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'NA_PLVVals_interDMN_3_Yeo2011_Random_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_interDMN_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'NA_PLVVals_interDMN_4_Yeo2011_Random_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_interDMN_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'NA_PLVVals_interDMN_5_Yeo2011_Random_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_interDMN_UltraSlow_Delta;
load(strcat(StrPLVInterRest, 'NA_PLVVals_interDMN_6_Yeo2011_Random_Brainnetome_HIPP_UltraSlow_Delta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_interDMN_UltraSlow_Delta;

PLVVals_interDMN_NA = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];


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


%figure; hist(PLVVals_interDMN_NA, 50); hold on;
%plot([mean(PLVVals_interDMN_NA) + 1.96*std(PLVVals_interDMN_NA) mean(PLVVals_interDMN_NA) + 1.96*std(PLVVals_interDMN_NA)],[0 150],'r'); hold on;
%plot([mean(PLVVals_interDMN_NA) - 1.96*std(PLVVals_interDMN_NA) mean(PLVVals_interDMN_NA) - 1.96*std(PLVVals_interDMN_NA)],[0 150],'r');

mean(PLVVals_interDMN_NA) + 1.96*std(PLVVals_interDMN_NA)
mean(PLVVals_interDMN_NA) - 1.96*std(PLVVals_interDMN_NA)
mean(PLVVals_Inter)

PLVVals_interDMN_NA_Random = PLVVals_interDMN_NA(randperm(N_BoxCox));
[transdat,lambda] = boxcox(PLVVals_interDMN_NA_Random);
mean(transdat) + 1.96*std(transdat)
((mean(PLVVals_Inter))^lambda - 1)/lambda

figure('Renderer', 'painters', 'Position', [200 200 800 600]);
hist(PLVVals_Inter_NA, 25);
hold on; xline(mean(PLVVals_Inter), 'r', 'LineWidth', 3);
set(gca, 'fontSize', 24);
xlabel('PLV');
title('Slow-wave');
print(strcat(StrSave,'Inter_Rest_UltraSlow_Delta'), '-depsc')






load(strcat(StrPLVInterRest, 'NA_PLVVals_interDMN_1_Yeo2011_Random_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_interDMN_Theta;
load(strcat(StrPLVInterRest, 'NA_PLVVals_interDMN_2_Yeo2011_Random_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_interDMN_Theta;
load(strcat(StrPLVInterRest, 'NA_PLVVals_interDMN_3_Yeo2011_Random_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_interDMN_Theta;
load(strcat(StrPLVInterRest, 'NA_PLVVals_interDMN_4_Yeo2011_Random_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_interDMN_Theta;
load(strcat(StrPLVInterRest, 'NA_PLVVals_interDMN_5_Yeo2011_Random_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_interDMN_Theta;
load(strcat(StrPLVInterRest, 'NA_PLVVals_interDMN_6_Yeo2011_Random_Brainnetome_HIPP_Theta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_interDMN_Theta;

PLVVals_interDMN_NA = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];


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

%figure; hist(PLVVals_interDMN_NA, 50); hold on;
%plot([mean(PLVVals_interDMN_NA) + 1.96*std(PLVVals_interDMN_NA) mean(PLVVals_interDMN_NA) + 1.96*std(PLVVals_interDMN_NA)],[0 150],'r'); hold on;
%plot([mean(PLVVals_interDMN_NA) - 1.96*std(PLVVals_interDMN_NA) mean(PLVVals_interDMN_NA) - 1.96*std(PLVVals_interDMN_NA)],[0 150],'r');

mean(PLVVals_interDMN_NA) + 1.96*std(PLVVals_interDMN_NA)
mean(PLVVals_interDMN_NA) - 1.96*std(PLVVals_interDMN_NA)
mean(PLVVals_Inter)

PLVVals_interDMN_NA_Random = PLVVals_interDMN_NA(randperm(N_BoxCox));
[transdat,lambda] = boxcox(PLVVals_interDMN_NA_Random);
mean(transdat) + 1.96*std(transdat)
((mean(PLVVals_Inter))^lambda - 1)/lambda

figure('Renderer', 'painters', 'Position', [200 200 800 600]);
hist(PLVVals_Inter_NA, 25);
hold on; xline(mean(PLVVals_Inter), 'r', 'LineWidth', 3);
set(gca, 'fontSize', 24);
xlabel('PLV');
title('Theta');
print(strcat(StrSave,'Inter_Rest_Theta'), '-depsc')





load(strcat(StrPLVInterRest, 'NA_PLVVals_interDMN_1_Yeo2011_Random_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_interDMN_Alpha;
load(strcat(StrPLVInterRest, 'NA_PLVVals_interDMN_2_Yeo2011_Random_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_interDMN_Alpha;
load(strcat(StrPLVInterRest, 'NA_PLVVals_interDMN_3_Yeo2011_Random_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_interDMN_Alpha;
load(strcat(StrPLVInterRest, 'NA_PLVVals_interDMN_4_Yeo2011_Random_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_interDMN_Alpha;
load(strcat(StrPLVInterRest, 'NA_PLVVals_interDMN_5_Yeo2011_Random_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_interDMN_Alpha;
load(strcat(StrPLVInterRest, 'NA_PLVVals_interDMN_6_Yeo2011_Random_Brainnetome_HIPP_Alpha_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_interDMN_Alpha;

PLVVals_interDMN_NA = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];


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


%figure; hist(PLVVals_interDMN_NA, 50); hold on;
%plot([mean(PLVVals_interDMN_NA) + 1.96*std(PLVVals_interDMN_NA) mean(PLVVals_interDMN_NA) + 1.96*std(PLVVals_interDMN_NA)],[0 150],'r'); hold on;
%plot([mean(PLVVals_interDMN_NA) - 1.96*std(PLVVals_interDMN_NA) mean(PLVVals_interDMN_NA) - 1.96*std(PLVVals_interDMN_NA)],[0 150],'r');

mean(PLVVals_interDMN_NA) + 1.96*std(PLVVals_interDMN_NA)
mean(PLVVals_interDMN_NA) - 1.96*std(PLVVals_interDMN_NA)
mean(PLVVals_Inter)

PLVVals_interDMN_NA_Random = PLVVals_interDMN_NA(randperm(N_BoxCox));
[transdat,lambda] = boxcox(PLVVals_interDMN_NA_Random);
mean(transdat) + 1.96*std(transdat)
((mean(PLVVals_Inter))^lambda - 1)/lambda

figure('Renderer', 'painters', 'Position', [200 200 800 600]);
hist(PLVVals_Inter_NA, 25);
hold on; xline(mean(PLVVals_Inter), 'r', 'LineWidth', 3);
set(gca, 'fontSize', 24);
xlabel('PLV');
title('Alpha');
print(strcat(StrSave,'Inter_Rest_Alpha'), '-depsc')






load(strcat(StrPLVInterRest, 'NA_PLVVals_interDMN_1_Yeo2011_Random_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_interDMN_Beta;
load(strcat(StrPLVInterRest, 'NA_PLVVals_interDMN_2_Yeo2011_Random_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_interDMN_Beta;
load(strcat(StrPLVInterRest, 'NA_PLVVals_interDMN_3_Yeo2011_Random_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_interDMN_Beta;
load(strcat(StrPLVInterRest, 'NA_PLVVals_interDMN_4_Yeo2011_Random_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_interDMN_Beta;
load(strcat(StrPLVInterRest, 'NA_PLVVals_interDMN_5_Yeo2011_Random_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_interDMN_Beta;
load(strcat(StrPLVInterRest, 'NA_PLVVals_interDMN_6_Yeo2011_Random_Brainnetome_HIPP_Beta_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_interDMN_Beta;

PLVVals_interDMN_NA = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];


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


%figure; hist(PLVVals_interDMN_NA, 50); hold on;
%plot([mean(PLVVals_interDMN_NA) + 1.96*std(PLVVals_interDMN_NA) mean(PLVVals_interDMN_NA) + 1.96*std(PLVVals_interDMN_NA)],[0 150],'r'); hold on;
%plot([mean(PLVVals_interDMN_NA) - 1.96*std(PLVVals_interDMN_NA) mean(PLVVals_interDMN_NA) - 1.96*std(PLVVals_interDMN_NA)],[0 150],'r');

mean(PLVVals_interDMN_NA) + 1.96*std(PLVVals_interDMN_NA)
mean(PLVVals_interDMN_NA) - 1.96*std(PLVVals_interDMN_NA)
mean(PLVVals_Inter)

PLVVals_interDMN_NA_Random = PLVVals_interDMN_NA(randperm(N_BoxCox));
[transdat,lambda] = boxcox(PLVVals_interDMN_NA_Random);
mean(transdat) + 1.96*std(transdat)
((mean(PLVVals_Inter))^lambda - 1)/lambda

figure('Renderer', 'painters', 'Position', [200 200 800 600]);
hist(PLVVals_Inter_NA, 25);
hold on; xline(mean(PLVVals_Inter), 'r', 'LineWidth', 3);
set(gca, 'fontSize', 24);
xlabel('PLV');
title('Beta');
print(strcat(StrSave,'Inter_Rest_Beta'), '-depsc')







load(strcat(StrPLVInterRest, 'NA_PLVVals_interDMN_1_Yeo2011_Random_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter1 = PLVVals_interDMN_Gamma;
load(strcat(StrPLVInterRest, 'NA_PLVVals_interDMN_2_Yeo2011_Random_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter2 = PLVVals_interDMN_Gamma;
load(strcat(StrPLVInterRest, 'NA_PLVVals_interDMN_3_Yeo2011_Random_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter3 = PLVVals_interDMN_Gamma;
load(strcat(StrPLVInterRest, 'NA_PLVVals_interDMN_4_Yeo2011_Random_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter4 = PLVVals_interDMN_Gamma;
load(strcat(StrPLVInterRest, 'NA_PLVVals_interDMN_5_Yeo2011_Random_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter5 = PLVVals_interDMN_Gamma;
load(strcat(StrPLVInterRest, 'NA_PLVVals_interDMN_6_Yeo2011_Random_Brainnetome_HIPP_Gamma_Corrected_ArtifactRemove.mat'));
PLVVals_Inter6 = PLVVals_interDMN_Gamma;

PLVVals_interDMN_NA = [PLVVals_Inter1; PLVVals_Inter2; PLVVals_Inter3;...
    PLVVals_Inter4; PLVVals_Inter5; PLVVals_Inter6];


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


%figure; hist(PLVVals_interDMN_NA, 50); hold on;
%plot([mean(PLVVals_interDMN_NA) + 1.96*std(PLVVals_interDMN_NA) mean(PLVVals_interDMN_NA) + 1.96*std(PLVVals_interDMN_NA)],[0 150],'r'); hold on;
%plot([mean(PLVVals_interDMN_NA) - 1.96*std(PLVVals_interDMN_NA) mean(PLVVals_interDMN_NA) - 1.96*std(PLVVals_interDMN_NA)],[0 150],'r');

mean(PLVVals_interDMN_NA) + 1.96*std(PLVVals_interDMN_NA)
mean(PLVVals_interDMN_NA) - 1.96*std(PLVVals_interDMN_NA)
mean(PLVVals_Inter)

PLVVals_interDMN_NA_Random = PLVVals_interDMN_NA(randperm(N_BoxCox));
[transdat,lambda] = boxcox(PLVVals_interDMN_NA_Random);
mean(transdat) + 1.96*std(transdat)
((mean(PLVVals_Inter))^lambda - 1)/lambda

figure('Renderer', 'painters', 'Position', [200 200 800 600]);
hist(PLVVals_Inter_NA, 25);
hold on; xline(mean(PLVVals_Inter), 'r', 'LineWidth', 3);
set(gca, 'fontSize', 24);
xlabel('PLV');
title('Gamma');
print(strcat(StrSave,'Inter_Rest_Gamma'), '-depsc')
































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



%PTE/DMN/Encode
%load inter network
load(strcat(StrPTEEncode, 'NA_CorrIncorr_PTEVals_DMNHIPP_1_Yeo2011_ArtifactRemove.mat'));
PTEVals1 = PTE_Rand_Global;
load(strcat(StrPTEEncode, 'NA_CorrIncorr_PTEVals_DMNHIPP_2_Yeo2011_ArtifactRemove.mat'));
PTEVals2 = PTE_Rand_Global;
load(strcat(StrPTEEncode, 'NA_CorrIncorr_PTEVals_DMNHIPP_3_Yeo2011_ArtifactRemove.mat'));
PTEVals3 = PTE_Rand_Global;
load(strcat(StrPTEEncode, 'NA_CorrIncorr_PTEVals_DMNHIPP_4_Yeo2011_ArtifactRemove.mat'));
PTEVals4 = PTE_Rand_Global;
load(strcat(StrPTEEncode, 'NA_CorrIncorr_PTEVals_DMNHIPP_5_Yeo2011_ArtifactRemove.mat'));
PTEVals5 = PTE_Rand_Global;
load(strcat(StrPTEEncode, 'NA_CorrIncorr_PTEVals_DMNHIPP_6_Yeo2011_ArtifactRemove.mat'));
PTEVals6 = PTE_Rand_Global;

PTEVals_NA = [PTEVals1; PTEVals2; PTEVals3;PTEVals4; PTEVals5; PTEVals6];



%figure; hist(PTEVals_NA, 50); hold on;
%plot([mean(PTEVals_NA) + 1.96*std(PTEVals_NA) mean(PTEVals_NA) + 1.96*std(PTEVals_NA)],[0 150],'r'); hold on;
%plot([mean(PTEVals_NA) - 1.96*std(PTEVals_NA) mean(PTEVals_NA) - 1.96*std(PTEVals_NA)],[0 150],'r');

mean(PTEVals_NA) + 1.96*std(PTEVals_NA)
mean(PTEVals_NA) - 1.96*std(PTEVals_NA)
mean(PTEVals_DMNHIPP_Others)
mean(PTEVals_Others_DMNHIPP)


figure('Renderer', 'painters', 'Position', [200 200 800 600]);
hist(PTEVals_NA, 25);
hold on; xline(mean(PTEVals_DMNHIPP_Others), 'r', 'LineWidth', 3);
hold on; xline(mean(PTEVals_Others_DMNHIPP), 'g', 'LineWidth', 3);
set(gca, 'fontSize', 24);
xlabel('PTE');
title('Encoding');
print(strcat(StrSave,'PTE_Encode'), '-depsc')





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



%PTE/DMN/Recall
%load inter network
load(strcat(StrPTERecall, 'NA_CorrIncorr_PTEVals_DMNHIPP_1_Yeo2011_ArtifactRemove.mat'));
PTEVals1 = PTE_Rand_Global;
load(strcat(StrPTERecall, 'NA_CorrIncorr_PTEVals_DMNHIPP_2_Yeo2011_ArtifactRemove.mat'));
PTEVals2 = PTE_Rand_Global;
load(strcat(StrPTERecall, 'NA_CorrIncorr_PTEVals_DMNHIPP_3_Yeo2011_ArtifactRemove.mat'));
PTEVals3 = PTE_Rand_Global;
load(strcat(StrPTERecall, 'NA_CorrIncorr_PTEVals_DMNHIPP_4_Yeo2011_ArtifactRemove.mat'));
PTEVals4 = PTE_Rand_Global;
load(strcat(StrPTERecall, 'NA_CorrIncorr_PTEVals_DMNHIPP_5_Yeo2011_ArtifactRemove.mat'));
PTEVals5 = PTE_Rand_Global;
load(strcat(StrPTERecall, 'NA_CorrIncorr_PTEVals_DMNHIPP_6_Yeo2011_ArtifactRemove.mat'));
PTEVals6 = PTE_Rand_Global;

PTEVals_NA = [PTEVals1; PTEVals2; PTEVals3;PTEVals4; PTEVals5; PTEVals6];



%figure; hist(PTEVals_NA, 50); hold on;
%plot([mean(PTEVals_NA) + 1.96*std(PTEVals_NA) mean(PTEVals_NA) + 1.96*std(PTEVals_NA)],[0 150],'r'); hold on;
%plot([mean(PTEVals_NA) - 1.96*std(PTEVals_NA) mean(PTEVals_NA) - 1.96*std(PTEVals_NA)],[0 150],'r');

mean(PTEVals_NA) + 1.96*std(PTEVals_NA)
mean(PTEVals_NA) - 1.96*std(PTEVals_NA)
mean(PTEVals_DMNHIPP_Others)
mean(PTEVals_Others_DMNHIPP)

figure('Renderer', 'painters', 'Position', [200 200 800 600]);
hist(PTEVals_NA, 25);
hold on; xline(mean(PTEVals_DMNHIPP_Others), 'r', 'LineWidth', 3);
hold on; xline(mean(PTEVals_Others_DMNHIPP), 'g', 'LineWidth', 3);
set(gca, 'fontSize', 24);
xlabel('PTE');
title('Recall');
print(strcat(StrSave,'PTE_Recall'), '-depsc')







%PTE/DMN/Rest
%load inter network
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

PTEVals_DMNHIPP_Others = [PTEVals1; PTEVals2; PTEVals3;PTEVals4; PTEVals5; PTEVals6];


load(strcat(StrPTERest, 'PTEVals_1_DMNHIPP_Random_Yeo2011_ArtifactRemove.mat'));
PTEVals1 = PTEVals_21;
load(strcat(StrPTERest, 'PTEVals_2_DMNHIPP_Random_Yeo2011_ArtifactRemove.mat'));
PTEVals2 = PTEVals_21;
load(strcat(StrPTERest, 'PTEVals_3_DMNHIPP_Random_Yeo2011_ArtifactRemove.mat'));
PTEVals3 = PTEVals_21;
load(strcat(StrPTERest, 'PTEVals_4_DMNHIPP_Random_Yeo2011_ArtifactRemove.mat'));
PTEVals4 = PTEVals_21;
load(strcat(StrPTERest, 'PTEVals_5_DMNHIPP_Random_Yeo2011_ArtifactRemove.mat'));
PTEVals5 = PTEVals_21;
load(strcat(StrPTERest, 'PTEVals_6_DMNHIPP_Random_Yeo2011_ArtifactRemove.mat'));
PTEVals6 = PTEVals_21;

PTEVals_Others_DMNHIPP = [PTEVals1; PTEVals2; PTEVals3;PTEVals4; PTEVals5; PTEVals6];



%PTE/DMN/Rest
%load inter network
load(strcat(StrPTERest, 'NA_PTEVals_DMNHIPP_1_Random_Yeo2011_ArtifactRemove.mat'));
PTEVals1 = PTE_Rand_Global;
load(strcat(StrPTERest, 'NA_PTEVals_DMNHIPP_2_Random_Yeo2011_ArtifactRemove.mat'));
PTEVals2 = PTE_Rand_Global;
load(strcat(StrPTERest, 'NA_PTEVals_DMNHIPP_3_Random_Yeo2011_ArtifactRemove.mat'));
PTEVals3 = PTE_Rand_Global;
load(strcat(StrPTERest, 'NA_PTEVals_DMNHIPP_4_Random_Yeo2011_ArtifactRemove.mat'));
PTEVals4 = PTE_Rand_Global;
load(strcat(StrPTERest, 'NA_PTEVals_DMNHIPP_5_Random_Yeo2011_ArtifactRemove.mat'));
PTEVals5 = PTE_Rand_Global;
load(strcat(StrPTERest, 'NA_PTEVals_DMNHIPP_6_Random_Yeo2011_ArtifactRemove.mat'));
PTEVals6 = PTE_Rand_Global;

PTEVals_NA = [PTEVals1; PTEVals2; PTEVals3;PTEVals4; PTEVals5; PTEVals6];



%figure; hist(PTEVals_NA, 50); hold on;
%plot([mean(PTEVals_NA) + 1.96*std(PTEVals_NA) mean(PTEVals_NA) + 1.96*std(PTEVals_NA)],[0 150],'r'); hold on;
%plot([mean(PTEVals_NA) - 1.96*std(PTEVals_NA) mean(PTEVals_NA) - 1.96*std(PTEVals_NA)],[0 150],'r');

mean(PTEVals_NA) + 1.96*std(PTEVals_NA)
mean(PTEVals_NA) - 1.96*std(PTEVals_NA)
mean(PTEVals_DMNHIPP_Others)
mean(PTEVals_Others_DMNHIPP)

figure('Renderer', 'painters', 'Position', [200 200 800 600]);
hist(PTEVals_NA, 25);
hold on; xline(mean(PTEVals_DMNHIPP_Others), 'r', 'LineWidth', 3);
hold on; xline(mean(PTEVals_Others_DMNHIPP), 'g', 'LineWidth', 3);
set(gca, 'fontSize', 24);
xlabel('PTE');
title('Rest');
print(strcat(StrSave,'PTE_Rest'), '-depsc')









