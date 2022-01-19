%Anup Das
%29 March, 2020
%Electrode density calculation

close all
clear all
clc

load('ChIDBipolarArtifactRemove.mat')

count = 0;

for i=1:size(ChID,1)
    
    ChIDTemp = ChID{i,1};
    
    for j=1:length(ChIDTemp)
        
        ChIDNum1 = ChIDTemp(j,1);
        ChIDNum2 = ChIDTemp(j,2);
        
        if ((ChIDNum1~=0) && (ChIDNum2~=0))
            
            count = count + 1;
            
        end
        
    end
    
end
            

Density = count/length(ChID);
            
            
            
            
            
            
            
            
            
            