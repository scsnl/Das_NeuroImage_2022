function [PLVVals_Rand_Global] = PLVCalc_PCCPrec_X_HighGamma_NA(RegXData, RegYData, Freq_Range)

NSubj = size(RegXData,3);

%Define parameters
fs = 1000;
EndPoints1 = 0;%1500
EndPoints2 = 0;%1500

%Specify parameters for PLV
WinDis =  0;%200
n = 1;
m = 1;
NRand = 50;
PLVVals_Rand_Global = [];

%Filter
% [z,p,k] = butter( 4, Freq_Range ./ (fs/2), 'bandpass' );
% [s,g]=zp2sos(z,p,k);%# create second order sections
% Hd=dfilt.df2sos(s,g);
% 
% [z,p,k] = butter( 4, [119 121] ./ (fs/2), 'stop' );
% [s,g]=zp2sos(z,p,k);%# create second order sections
% Hd_Line=dfilt.df2sos(s,g);


[z,p,k] = butter( 4, [117 123] ./ (fs/2), 'stop' );
[s,g]=zp2sos(z,p,k);%# create second order sections
Hd_Line1=dfilt.df2sos(s,g);

fs = 1000;
[z,p,k] = butter( 4, [57 63] ./ (fs/2), 'stop' );
[s,g]=zp2sos(z,p,k);%# create second order sections
Hd_Line2=dfilt.df2sos(s,g);

fs = 1000;
[z,p,k] = butter( 4, [177 183] ./ (fs/2), 'stop' );
[s,g]=zp2sos(z,p,k);%# create second order sections
Hd_Line3=dfilt.df2sos(s,g);

[z,p,k] = butter( 4, Freq_Range ./ (fs/2), 'bandpass' );%[80 160]
[s,g]=zp2sos(z,p,k);%# create second order sections
Hd=dfilt.df2sos(s,g);

for i_Sub=1:NSubj
    
    TempDataX = RegXData(:,:,i_Sub);
    emptyCells = cellfun('isempty', TempDataX);
    TempDataX(all(emptyCells,2),:) = [];
    TempDataX(:,all(emptyCells,1)) = [];
    
    TempDataY = RegYData(:,:,i_Sub);
    emptyCells = cellfun('isempty', TempDataY);
    TempDataY(all(emptyCells,2),:) = [];
    TempDataY(:,all(emptyCells,1)) = [];
    
    if (~isempty(TempDataX) && ~isempty(TempDataY))
        
        NElecX = size(TempDataX,1);
        NElecY = size(TempDataY,1);
        NEpochs = size(TempDataX,2);
        
        for j=1:NElecX
            
            for k=1:NElecY
                
                for i_Epoch=1:NEpochs
                    
                    Ch1 = TempDataX{j,i_Epoch};
                    Ch2 = TempDataY{k,i_Epoch};
                    
                    Ch1 = Ch1(EndPoints1+1:end-EndPoints2);
                    Ch2 = Ch2(EndPoints1+1:end-EndPoints2);
                    
                    BandFilt_1 = filtfilthd(Hd_Line1,zscore(Ch1));
                    BandFilt_2 = filtfilthd(Hd_Line1,zscore(Ch2));
                    
                    BandFilt_1 = filtfilthd(Hd_Line2,zscore(BandFilt_1));
                    BandFilt_2 = filtfilthd(Hd_Line2,zscore(BandFilt_2));
                    
                    BandFilt_1 = filtfilthd(Hd_Line3,zscore(BandFilt_1));
                    BandFilt_2 = filtfilthd(Hd_Line3,zscore(BandFilt_2));
                    
                    BandFilt_1 = filtfilthd(Hd,zscore(BandFilt_1));
                    BandFilt_2 = filtfilthd(Hd,zscore(BandFilt_2));
                    
                    x1 = zscore(BandFilt_1);
                    x2 = zscore(BandFilt_2);
                    
                    %Calculate PLV
                    h1=hilbert(x1);
                    h2=hilbert(x2);
                    
                    h1 = h1(WinDis+1:end-WinDis);
                    h2 = h2(WinDis+1:end-WinDis);
                    
                    [phase1]=unwrap(angle(h1));
                    [phase2]=unwrap(angle(h2));
                    
                    for i_rand = 1:NRand
                        
                        phase1_rand = phase1(randperm(length(phase1)));
                        phase2_rand = phase2(randperm(length(phase2)));
                        RP=n*phase1_rand-m*phase2_rand;
                        PLVVals_Rand_Global=[PLVVals_Rand_Global; abs(sum(exp(i*RP))/length(RP))];
                        
                    end
                    
                end
                
            end
            
        end
        
    end
    
end

%save('STGPCCPrec_PLV_NoResample.mat','PLVVals');

