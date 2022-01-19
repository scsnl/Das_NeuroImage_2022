function [Subj_Pairs] = PowerCalc_Mixed_Effects(RegXData, Subj_Ind_Mixed_Effects)

NSubj = size(RegXData,3);

%Parameters
Subj_Pairs = [];
count = 0;

for i=1:NSubj
    
    TempDataX = RegXData(:,:,i);
    emptyCells = cellfun('isempty', TempDataX);
    TempDataX(all(emptyCells,2),:) = [];
    TempDataX(:,all(emptyCells,1)) = [];
    
    Electrodes_Pairs_Indices = 1;
    
     if (~isempty(TempDataX))
    
         count = count + 1;
         Subj_Indices = Subj_Ind_Mixed_Effects(count);
         NElecX = size(TempDataX,1);
         
         for j=1:NElecX
                 
             Temp = [Subj_Indices Electrodes_Pairs_Indices];
             Subj_Pairs = [Subj_Pairs; Temp];
             Electrodes_Pairs_Indices = Electrodes_Pairs_Indices + 1;
             
         end
    
     end
    
end


