%Anup Das
%20 September, 2019
%This program plots electrodes for specified brain regions on a brain
%surface plot

close all;
clear all;
clc;

addpath /oak/stanford/groups/menon/projects/a1das/2018_ECoG_SN_Project/scripts/WakefulnessAllRegions_scripts/legendflex
addpath /oak/stanford/groups/menon/projects/a1das/2018_ECoG_SN_Project/scripts/WakefulnessAllRegions_scripts/legendflex/legendflex
addpath /oak/stanford/groups/menon/projects/a1das/2018_ECoG_SN_Project/scripts/WakefulnessAllRegions_scripts/legendflex/setgetpos_V1.2

%addpath Y:\projects\a1das\2018_ECoG_SN_Project\scripts\WakefulnessAllRegions_scripts\legendflex
%addpath Y:\projects\a1das\2018_ECoG_SN_Project\scripts\WakefulnessAllRegions_scripts\legendflex\legendflex
%addpath Y:\projects\a1das\2018_ECoG_SN_Project\scripts\WakefulnessAllRegions_scripts\legendflex\setgetpos_V1.2

%load all files
load('SurfacePlotCoordBrainnetome_HIPP_ArtifactRemove_1229.mat');
HIPP = SurfacePlotCoord;
load('SurfacePlotCoordYeo_1_ArtifactRemove.mat');
Yeo_1 = SurfacePlotCoord;
load('SurfacePlotCoordYeo_2_ArtifactRemove.mat');
Yeo_2 = SurfacePlotCoord;
load('SurfacePlotCoordYeo_3_ArtifactRemove.mat');
Yeo_3 = SurfacePlotCoord;
load('SurfacePlotCoordYeo_4_ArtifactRemove.mat');
Yeo_4 = SurfacePlotCoord;
load('SurfacePlotCoordYeo_5_ArtifactRemove.mat');
Yeo_5 = SurfacePlotCoord;
load('SurfacePlotCoordYeo_6_ArtifactRemove.mat');
Yeo_6 = SurfacePlotCoord;
load('SurfacePlotCoordYeo_7_ArtifactRemove_1229.mat');
Yeo_7 = SurfacePlotCoord;
Yeo_7 = [Yeo_7; HIPP];

load('FacesLeft.mat')
load('FacesRight.mat')
load('NodesLeft.mat')
load('NodesRight.mat')
load('Hemisphere.mat')

L_Yeo_1 = Yeo_1(find(Yeo_1(:,1)<0),:);
R_Yeo_1 = Yeo_1(find(Yeo_1(:,1)>0),:);

L_Yeo_2 = Yeo_2(find(Yeo_2(:,1)<0),:);
R_Yeo_2 = Yeo_2(find(Yeo_2(:,1)>0),:);

L_Yeo_3 = Yeo_3(find(Yeo_3(:,1)<0),:);
R_Yeo_3 = Yeo_3(find(Yeo_3(:,1)>0),:);

L_Yeo_4 = Yeo_4(find(Yeo_4(:,1)<0),:);
R_Yeo_4 = Yeo_4(find(Yeo_4(:,1)>0),:);

L_Yeo_5 = Yeo_5(find(Yeo_5(:,1)<0),:);
R_Yeo_5 = Yeo_5(find(Yeo_5(:,1)>0),:);

L_Yeo_6 = Yeo_6(find(Yeo_6(:,1)<0),:);
R_Yeo_6 = Yeo_6(find(Yeo_6(:,1)>0),:);

L_Yeo_7 = Yeo_7(find(Yeo_7(:,1)<0),:);
R_Yeo_7 = Yeo_7(find(Yeo_7(:,1)>0),:);

figure
p=patch('faces',FacesRight,'vertices',NodesRight, 'facecolor',...
    [0.781 0.762 0.664],  'edgecolor', 'none', 'facealpha', 0.2);

facecolor = repmat([1 1 1], length(FacesRight), 1);
set(p,'FaceVertexCData',facecolor);

daspect([1 1 1])
view(3); axis tight
view([-0.24283662322663,-208.1215211487066,1310.41813190201])%view([50 -40 100])

material shiny
camlight('headlight')
lighting gouraud; axis off

hold all;
plot3(R_Yeo_1(:,1),R_Yeo_1(:,2),R_Yeo_1(:,3),...
    'linestyle','none','marker','.','color',[1.000000 0.000000 1.000000],'markersize',20);%magenta
plot3(R_Yeo_2(:,1),R_Yeo_2(:,2),R_Yeo_2(:,3),...
    'linestyle','none','marker','.','color',[1.000000 0.940000 0.000000],'markersize',20);%yellow
plot3(R_Yeo_3(:,1),R_Yeo_3(:,2),R_Yeo_3(:,3),...
    'linestyle','none','marker','.','color',[0.540000 0.170000 0.890000],'markersize',20);%violet
plot3(R_Yeo_4(:,1),R_Yeo_4(:,2),R_Yeo_4(:,3),...
    'linestyle','none','marker','.','color',[0.000000 1.000000 1.000000],'markersize',20);%cyan
plot3(R_Yeo_5(:,1),R_Yeo_5(:,2),R_Yeo_5(:,3),...
    'linestyle','none','marker','.','color',[0 0.5 0],'markersize',20);
plot3(R_Yeo_6(:,1),R_Yeo_6(:,2),R_Yeo_6(:,3),...
    'b.','markersize',20);
plot3(R_Yeo_7(:,1),R_Yeo_7(:,2),R_Yeo_7(:,3),...
    'r.','markersize',20);

hold off

p=patch('faces',FacesLeft,'vertices',NodesLeft, 'facecolor',...
    [0.781 0.762 0.664],  'edgecolor', 'none', 'facealpha', 0.2);

facecolor = repmat([1 1 1], length(FacesLeft), 1);
set(p,'FaceVertexCData',facecolor);

daspect([1 1 1])
view(3); axis tight
view([-0.24283662322663,-208.1215211487066,1310.41813190201])%view([50 -40 100])

material shiny
camlight('headlight')
lighting gouraud; axis off

hold all;
plot3(L_Yeo_1(:,1),L_Yeo_1(:,2),L_Yeo_1(:,3),...
    'linestyle','none','marker','.','color',[1.000000 0.000000 1.000000],'markersize',20);%magenta
plot3(L_Yeo_2(:,1),L_Yeo_2(:,2),L_Yeo_2(:,3),...
    'linestyle','none','marker','.','color',[1.000000 0.940000 0.000000],'markersize',20);%yellow
plot3(L_Yeo_3(:,1),L_Yeo_3(:,2),L_Yeo_3(:,3),...
    'linestyle','none','marker','.','color',[0.540000 0.170000 0.890000],'markersize',20);%violet
plot3(L_Yeo_4(:,1),L_Yeo_4(:,2),L_Yeo_4(:,3),...
    'linestyle','none','marker','.','color',[0.000000 1.000000 1.000000],'markersize',20);%cyan
plot3(L_Yeo_5(:,1),L_Yeo_5(:,2),L_Yeo_5(:,3),...
    'linestyle','none','marker','.','color',[0 0.5 0],'markersize',20);
plot3(L_Yeo_6(:,1),L_Yeo_6(:,2),L_Yeo_6(:,3),...
    'b.','markersize',20);
plot3(L_Yeo_7(:,1),L_Yeo_7(:,2),L_Yeo_7(:,3),...
    'r.','markersize',20);
hold off


figure
p=patch('faces',FacesRight,'vertices',NodesRight, 'facecolor',...
    [0.781 0.762 0.664],  'edgecolor', 'none', 'facealpha', 0.2);

facecolor = repmat([1 1 1], length(FacesRight), 1);
set(p,'FaceVertexCData',facecolor);

daspect([1 1 1])
view(3); axis tight
view([1172.52429235214,-70.182417825913035,236.9780617227996])%view([50 -40 100])

material shiny
camlight('headlight')
lighting gouraud; axis off

hold all;
plot3(R_Yeo_1(:,1),R_Yeo_1(:,2),R_Yeo_1(:,3),...
    'linestyle','none','marker','.','color',[1.000000 0.000000 1.000000],'markersize',20);%magenta
plot3(R_Yeo_2(:,1),R_Yeo_2(:,2),R_Yeo_2(:,3),...
    'linestyle','none','marker','.','color',[1.000000 0.940000 0.000000],'markersize',20);%yellow
plot3(R_Yeo_3(:,1),R_Yeo_3(:,2),R_Yeo_3(:,3),...
    'linestyle','none','marker','.','color',[0.540000 0.170000 0.890000],'markersize',20);%violet
plot3(R_Yeo_4(:,1),R_Yeo_4(:,2),R_Yeo_4(:,3),...
    'linestyle','none','marker','.','color',[0.000000 1.000000 1.000000],'markersize',20);%cyan
plot3(R_Yeo_5(:,1),R_Yeo_5(:,2),R_Yeo_5(:,3),...
    'linestyle','none','marker','.','color',[0 0.5 0],'markersize',20);
plot3(R_Yeo_6(:,1),R_Yeo_6(:,2),R_Yeo_6(:,3),...
    'b.','markersize',20);
plot3(R_Yeo_7(:,1),R_Yeo_7(:,2),R_Yeo_7(:,3),...
    'r.','markersize',20);
hold off


fig1=figure;
p=patch('faces',FacesLeft,'vertices',NodesLeft, 'facecolor',...
    [0.781 0.762 0.664],  'edgecolor', 'none', 'facealpha', 0.2);

facecolor = repmat([1 1 1], length(FacesLeft), 1);
set(p,'FaceVertexCData',facecolor);

daspect([1 1 1])
view(3); axis tight
view([-1103.1,77.3889,452.4818])%view([50 -40 100])

material shiny
camlight('headlight')
lighting gouraud; axis off

hold all;
h1 = plot3(L_Yeo_1(:,1),L_Yeo_1(:,2),L_Yeo_1(:,3),...
    'linestyle','none','marker','.','color',[1.000000 0.000000 1.000000],'markersize',20);%magenta
h2 = plot3(L_Yeo_2(:,1),L_Yeo_2(:,2),L_Yeo_2(:,3),...
    'linestyle','none','marker','.','color',[1.000000 0.940000 0.000000],'markersize',20);%yellow
h3 = plot3(L_Yeo_3(:,1),L_Yeo_3(:,2),L_Yeo_3(:,3),...
    'linestyle','none','marker','.','color',[0.540000 0.170000 0.890000],'markersize',20);%violet
h4 = plot3(L_Yeo_4(:,1),L_Yeo_4(:,2),L_Yeo_4(:,3),...
    'linestyle','none','marker','.','color',[0.000000 1.000000 1.000000],'markersize',20);%cyan
h5 = plot3(L_Yeo_5(:,1),L_Yeo_5(:,2),L_Yeo_5(:,3),...
    'linestyle','none','marker','.','color',[0 0.5 0],'markersize',20);
h6 = plot3(L_Yeo_6(:,1),L_Yeo_6(:,2),L_Yeo_6(:,3),...
    'b.','markersize',20);
h7 = plot3(L_Yeo_7(:,1),L_Yeo_7(:,2),L_Yeo_7(:,3),...
    'r.','markersize',20);

fig2 = figure;
[~, objh]=legendflex([h7 h3 h4 h6 h1 h2 h5], {'DMN','DAN','VAN','FPN','VISN','SMN','LIMN'}, 'ref', fig2,'Fontsize', 18);
objhl = findobj(objh, 'type', 'line');
set(objhl, 'Markersize', 60); 
hold off



