function [PowerVals, PowerValsVec] = PowerCalc_PCCPrec_X_UltraSlow_Random(RegXData, Freq_LP)

NSubj = size(RegXData,3);

%Define parameters
fs = 1000;
EndPoints1 = 3000;%1500
EndPoints2 = 3000;%1500

%Specify parameters for power
PowerVals = [];
PowerValsVec = [];

%Specify approximate length of task data
Task_Len = 1600;

%Number of randomizations
N_Rand = 50;

%Filter
% [b_filt,a_filt] = butter(2,Delta/(fs/2),'bandpass');
[z,p,k] = butter( 4, Freq_LP ./ (fs/2), 'low' );
[s,g]=zp2sos(z,p,k);%# create second order sections
Hd=dfilt.df2sos(s,g);

for i_Sub=1:NSubj
    
    TempDataX = RegXData(:,:,i_Sub);
    emptyCells = cellfun('isempty', TempDataX);
    TempDataX(all(emptyCells,2),:) = [];
    TempDataX(:,all(emptyCells,1)) = [];
    
    if (~isempty(TempDataX))
        
        NElecX = size(TempDataX,1);
        NEpochs = size(TempDataX,2);
    
        for j=1:NElecX
            
            PowerVec = [];
            
            for i_Epoch=1:NEpochs
                
                Ch1 = TempDataX{j,i_Epoch};
                
                Ch1 = Ch1(EndPoints1+1:end-EndPoints2);
                
                BandFilt_1 = filtfilthd(Hd,Ch1-mean(Ch1));
                
                x1 = BandFilt_1 - mean(BandFilt_1);
                
                %Calculate power  
                Tot_Len = length(x1);
                Av_Len = Tot_Len-Task_Len+1;
                
                PowerVecLocal = [];
                for i_Rand = 1:N_Rand
                    
                    rand_temp = randperm(Av_Len);
                    rand_ind = rand_temp(1):rand_temp(1)+Task_Len-1;
                    
                    x1_rand = x1(rand_ind);
                    
                    PowerVecLocal=[PowerVecLocal; norm(x1_rand,2)^2/numel(x1_rand)];
                    
                end
                
                PowerVec = [PowerVec; mean(PowerVecLocal)];
                
            end
            
            PowerVals = [PowerVals; mean(PowerVec)];
            PowerValsVec = [PowerValsVec; PowerVec];
            
        end
    
    end
    
end



