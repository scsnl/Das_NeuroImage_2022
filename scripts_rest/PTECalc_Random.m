function [PTE_12, PTE_21] = PTECalc_Random(RegXData, RegYData)

NSubj = size(RegXData,3);

%Define parameters
fs = 1000;
EndPoints1 = 3000;%1500
EndPoints2 = 3000;%1500

%Store PTE
PTE_12 = [];
PTE_21 = [];

%Specify approximate length of resting data
Task_Len = 1600;

%Number of randomizations
N_Rand = 50;

%Filter
[z,p,k] = butter( 4, [0.5 80] ./ (fs/2), 'bandpass' );
[s,g]=zp2sos(z,p,k);%# create second order sections
HdBP=dfilt.df2sos(s,g);

[z,p,k] = butter( 4, [57 63] ./ (fs/2), 'stop' );
[s,g]=zp2sos(z,p,k);%# create second order sections
Hd1=dfilt.df2sos(s,g);

for i=1:NSubj
    
    TempDataX = RegXData(:,:,i);
    emptyCells = cellfun('isempty', TempDataX);
    TempDataX(all(emptyCells,2),:) = [];
    TempDataX(:,all(emptyCells,1)) = [];
    
    TempDataY = RegYData(:,:,i);
    emptyCells = cellfun('isempty', TempDataY);
    TempDataY(all(emptyCells,2),:) = [];
    TempDataY(:,all(emptyCells,1)) = [];
    
     if (~isempty(TempDataX) && ~isempty(TempDataY))
    
         NElecX = size(TempDataX,1);
         NElecY = size(TempDataY,1);
         NEpochs = size(TempDataX,2);
         
         for j=1:NElecX
             
             for k=1:NElecY
                 
                 PTE_12_Temp = [];
                 PTE_21_Temp = [];
                 
                 for i_Epoch=1:NEpochs
                     
                     Ch1 = TempDataX{j,i_Epoch};
                     Ch2 = TempDataY{k,i_Epoch};
                     
                     Ch1 = Ch1(EndPoints1+1:end-EndPoints2);
                     Ch2 = Ch2(EndPoints1+1:end-EndPoints2);
                     
                     BandFilt_1 = filtfilthd(HdBP,zscore(Ch1));
                     BandFilt_2 = filtfilthd(HdBP,zscore(Ch2));
                     
                     BandFilt_1 = filtfilthd(Hd1,zscore(BandFilt_1));
                     BandFilt_2 = filtfilthd(Hd1,zscore(BandFilt_2));
                     
                     Ch1filtscore = zscore(BandFilt_1);
                     Ch2filtscore = zscore(BandFilt_2);
                     
                     Tot_Len = length(Ch1filtscore);
                     Av_Len = Tot_Len-Task_Len+1;
                     
                     PTE_12_Temp_local = [];
                     PTE_21_Temp_local = [];
                     for i_Rand = 1:N_Rand
                         
                         rand_temp = randperm(Av_Len);
                         rand_ind = rand_temp(1):rand_temp(1)+Task_Len-1;
                         
                         Ch1filtscore_local = Ch1filtscore(rand_ind);
                         Ch2filtscore_local = Ch2filtscore(rand_ind);
                         
                         %Gather data
                         X = [Ch1filtscore_local Ch2filtscore_local];
                         
                         %Calculate PTE
                         [dPTE, PTE, delay, Nbins, binsize] = PhaseTE_MF_New(X);
                         
                         PTE_12_Temp_local = [PTE_12_Temp_local; PTE(1,2)];
                         PTE_21_Temp_local = [PTE_21_Temp_local; PTE(2,1)];
                         
                     end
                     
                     PTE_12_Temp = [PTE_12_Temp; mean(PTE_12_Temp_local)];
                     PTE_21_Temp = [PTE_21_Temp; mean(PTE_21_Temp_local)];
                     
                 end
                 
                 PTE_12 = [PTE_12; mean(PTE_12_Temp)];
                 PTE_21 = [PTE_21; mean(PTE_21_Temp)];
                 
             end
             
         end
    
     end
    
end










