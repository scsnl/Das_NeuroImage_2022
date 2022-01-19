%Anup Das
%26 September, 2018
%This program finds the channel indices in the pairs.json files

close all;
clear all;
clc;

load('FileListBipolar.mat');
Njson = size(FileList,1);
ChID = cell(Njson,1);

for i=1:Njson
    
    d = dir(FileList(i).folder);
    B = jsondecode(fileread(strcat(FileList(i).folder,'\',d(4).name)));
    dynamicPath = {char(fieldnames(B)) 'pairs'};
    D = getfield(B, dynamicPath{:});
    Nelec = size(fieldnames(D),1);
    E = fieldnames(D);
    ChIDTemp = zeros(Nelec,2);
    
    for j=1:Nelec
        
        dynamicPath1 = {char(E{j}) 'channel_1'};
        dynamicPath2 = {char(E{j}) 'channel_2'};       
        ChIDTemp(j,1) = getfield(D, dynamicPath1{:});
        ChIDTemp(j,2) = getfield(D, dynamicPath2{:});
        
    end
    
    ChID{i,1} = ChIDTemp;

end

save('ChIDBipolar.mat','ChID');



