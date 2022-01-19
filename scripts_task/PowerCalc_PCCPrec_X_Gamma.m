function [PowerVals, PowerValsVec] = PowerCalc_PCCPrec_X_Gamma(RegXData, Freq_Range)

NSubj = size(RegXData,3);

%Define parameters
fs = 1000;
EndPoints1 = 0;%1500
EndPoints2 = 0;%1500

%Specify parameters for power
PowerVals = [];
PowerValsVec = [];

%Filter
% [z,p,k] = butter( 4, Freq_Range ./ (fs/2), 'bandpass' );
% [s,g]=zp2sos(z,p,k);%# create second order sections
% Hd=dfilt.df2sos(s,g);
% 
% [z,p,k] = butter( 4, [59 61] ./ (fs/2), 'stop' );
% [s,g]=zp2sos(z,p,k);%# create second order sections
% Hd_Line=dfilt.df2sos(s,g);

[z,p,k] = butter( 4, [57 63] ./ (fs/2), 'stop' );
[s,g]=zp2sos(z,p,k);%# create second order sections
Hd_Line=dfilt.df2sos(s,g);

[z,p,k] = butter( 4, Freq_Range ./ (fs/2), 'bandpass' );
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
                
                BandFilt_1 = filtfilthd(Hd_Line, Ch1-mean(Ch1));
                
                BandFilt_1 = filtfilthd(Hd, BandFilt_1 - mean(BandFilt_1));
                
                x1 = BandFilt_1 - mean(BandFilt_1);
                
                %Calculate power
                PowerVec=[PowerVec; norm(x1,2)^2/numel(x1)];
                
            end
            
            PowerVals = [PowerVals; mean(PowerVec)];
            PowerValsVec = [PowerValsVec; PowerVec];
            
        end
    
    end
    
end



