function [Subj_Pairs] = PLVCalc_Mixed_Effects(RegXData, RegYData, Subj_Ind_Mixed_Effects)

NSubj = size(RegXData,3);

%Parameters
Subj_Pairs = [];
count = 0;

for i=1:NSubj
    
    TempDataX = RegXData(:,:,i);
    emptyCells = cellfun('isempty', TempDataX);
    TempDataX(all(emptyCells,2),:) = [];
    TempDataX(:,all(emptyCells,1)) = [];
    
    TempDataY = RegYData(:,:,i);
    emptyCells = cellfun('isempty', TempDataY);
    TempDataY(all(emptyCells,2),:) = [];
    TempDataY(:,all(emptyCells,1)) = [];
    
    Electrodes_Pairs_Indices = 1;
    
     if (~isempty(TempDataX) && ~isempty(TempDataY))
    
         count = count + 1;
         Subj_Indices = Subj_Ind_Mixed_Effects(count);
         NElecX = size(TempDataX,1);
         NElecY = size(TempDataY,1);
         NEpochs = size(TempDataX,2);
         
         for j=1:NElecX
             
             for k=1:NElecY
                 
                 Temp = [Subj_Indices Electrodes_Pairs_Indices];
                 Subj_Pairs = [Subj_Pairs; Temp];
                 Electrodes_Pairs_Indices = Electrodes_Pairs_Indices + 1;
                 
             end
             
         end
    
     end
    
end


