%Anup Das
%25 September, 2018
%This program finds the MNI coordinates of bipolar electrodes of all 
%subjects by combining information from the additional file

close all;
clear all;
clc;

load('FileListBipolar.mat');
load('MNIAllSubjectBipolar.mat');
Njson = size(FileList,1);
MNIAllSubjectFilledBipolar = MNIAllSubjectBipolar;
Count = 0;

for i=[1:4 7:11 14:20 23:31 35:58 63:74 78:83 89:97 100:115]
    
    d = dir(FileList(i).folder);
    B = jsondecode(fileread(strcat(FileList(i).folder,'\',d(4).name)));
    dynamicPath = {char(fieldnames(B)) 'pairs'};
    D = getfield(B, dynamicPath{:});
    E = fieldnames(D);
    SubjDir = d(1).folder;
    SubjInd = SubjDir(76:81);
    FoldTemp1 = strcat('Y:\projects\a1das\2018_ECoG_Project\Release_20171012\Programs\MNIAll\eeg\',SubjInd);
    
    if 7==exist(FoldTemp1,'dir')
        
        FoldTemp2 = strcat(FoldTemp1, '\imaging\',SubjInd,'\electrodenames_coordinates_mni.csv');
        t = readtable(FoldTemp2, 'ReadVariableNames', false,...
            'ReadRowNames', true);
        
        if ~isempty(t)
            
            tt = table2dataset(t);
            label = tt(2:end,1);
            CH_Label = upper(get(tt,'ObsNames'));
            
            Coords = tt(1:end,1:3);
            Coords = dataset2cell(Coords);
            Coords = Coords(2:end,2:4);
            Coords = cell2mat(Coords);
            
            MNITemp = MNIAllSubjectBipolar{i};
            NElec = size(MNITemp,1);
            
            for j=1:NElec
                
                if (MNITemp(j,1)==0 && MNITemp(j,2)==0 && MNITemp(j,3)==0)
                    
                    Count = Count+1;
                    FNames=fields(D);
                    dynamicPath1 = {char(fieldnames(B)) 'pairs' FNames{j}};
                    FCode = getfield(B, dynamicPath1{:});
                    Code = FCode.code;
                    CodeSplit = strsplit(Code,'-');
                    Code1 = CodeSplit{1,1};
                    Code2 = CodeSplit{1,2};
                    Index1 = find(ismember(CH_Label,Code1) == 1);
                    Index2 = find(ismember(CH_Label,Code2) == 1);
                    
                    if (~isempty(Index1) && ~isempty(Index2))
                        MNITemp(j,:) = (Coords(Index1,:) + Coords(Index2,:))/2;
                    end
                    
                end
            end
            
            MNIAllSubjectFilledBipolar{i} = MNITemp;
        end
    end
end

save('MNIAllSubjectFilledBipolar.mat','MNIAllSubjectFilledBipolar');





