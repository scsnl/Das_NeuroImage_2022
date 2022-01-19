function [GammaVals, GammaValsVec] = GammaBandFluctuationCalc_Amplitude(RegXData, RegYData)

NSubj = size(RegXData,3);

%Define parameters
fs = 1000;
EndPoints1 = 0;%1500
EndPoints2 = 0;%1500
FrDivs = [80:10:160];
WinDis =  0;

%Store correlation
GammaVals = [];
GammaValsVec = [];

%Filters
[z,p,k] = butter( 4, 4 ./ (fs/2), 'low' );
[s,g]=zp2sos(z,p,k);%# create second order sections
HdDelta=dfilt.df2sos(s,g);

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

for i=1:NSubj
    
    TempDataX = RegXData(:,:,i);
    emptyCells1 = cellfun('isempty', TempDataX);
    TempDataX(all(emptyCells1,2),:) = [];
    TempDataX(:,all(emptyCells1,1)) = [];
    
    TempDataY = RegYData(:,:,i);
    emptyCells2 = cellfun('isempty', TempDataY);
    TempDataY(all(emptyCells2,2),:) = [];
    TempDataY(:,all(emptyCells2,1)) = [];
    
    if (~isempty(TempDataX) && ~isempty(TempDataY))
        
        NElecX = size(TempDataX,1);
        NElecY = size(TempDataY,1);
        NEpochs = size(TempDataX,2);
    
        for jj=1:NElecX
            
            for kk=1:NElecY
                
                GammaVec = [];
                
                for i_Epoch=1:NEpochs
                    
                    Ch1 = TempDataX{jj,i_Epoch};
                    Ch2 = TempDataY{kk,i_Epoch};
                    
                    Ch1 = Ch1(EndPoints1+1:end-EndPoints2);
                    Ch2 = Ch2(EndPoints1+1:end-EndPoints2);
  
                    BandFilt_1 = filtfilthd(Hd_Line1,zscore(Ch1));
                    BandFilt_2 = filtfilthd(Hd_Line1,zscore(Ch2));
                    
                    BandFilt_1 = filtfilthd(Hd_Line2,zscore(BandFilt_1));
                    BandFilt_2 = filtfilthd(Hd_Line2,zscore(BandFilt_2));
                    
                    BandFilt_1 = filtfilthd(Hd_Line3,zscore(BandFilt_1));
                    BandFilt_2 = filtfilthd(Hd_Line3,zscore(BandFilt_2));
                    
                    %Gamma band power for channel 1
                    Gamma_All_TS_1 = [];
                    
                    for i_FrDivs = 1:length(FrDivs)-1
                        
                        [z,p,k] = butter( 4, [FrDivs(i_FrDivs) FrDivs(i_FrDivs+1)] ./ (fs/2), 'bandpass' );
                        [s,g]=zp2sos(z,p,k);
                        Hd=dfilt.df2sos(s,g);
                        Ch1filt = filtfilthd(Hd,zscore(BandFilt_1));
                        x1_hilbert = hilbert(Ch1filt);
                        x1_hilbert_abs = abs(x1_hilbert(WinDis+1:end-WinDis));
                        x1_hilbert_abs_norm = x1_hilbert_abs/mean(x1_hilbert_abs);
                        Gamma_All_TS_1 = [Gamma_All_TS_1 x1_hilbert_abs_norm];
                        
                    end
                    
                    Gamma_Avg_TS_1 = mean(Gamma_All_TS_1,2);
                    Gamma_Avg_TS_1_filt = abs(zscore(filtfilthd(HdDelta,Gamma_Avg_TS_1)));
                    
                    %Gamma band power for channel 2
                    Gamma_All_TS_2 = [];
                    
                    for i_FrDivs = 1:length(FrDivs)-1
                        
                        [z,p,k] = butter( 4, [FrDivs(i_FrDivs) FrDivs(i_FrDivs+1)] ./ (fs/2), 'bandpass' );
                        [s,g]=zp2sos(z,p,k);
                        Hd=dfilt.df2sos(s,g);
                        Ch2filt = filtfilthd(Hd,zscore(BandFilt_2));
                        x2_hilbert = hilbert(Ch2filt);
                        x2_hilbert_abs = abs(x2_hilbert(WinDis+1:end-WinDis));
                        x2_hilbert_abs_norm = x2_hilbert_abs/mean(x2_hilbert_abs);
                        Gamma_All_TS_2 = [Gamma_All_TS_2 x2_hilbert_abs_norm];
                        
                    end
                    
                    Gamma_Avg_TS_2 = mean(Gamma_All_TS_2,2);
                    Gamma_Avg_TS_2_filt = abs(zscore(filtfilthd(HdDelta,Gamma_Avg_TS_2)));
                    
                    %Correlation analysis
                    r = corr(Gamma_Avg_TS_1_filt, Gamma_Avg_TS_2_filt);
                    GammaVec = [GammaVec; 0.5*(log(1+r) - log(1-r))];
                    
                end
                
                GammaVals = [GammaVals; mean(GammaVec)];
                GammaValsVec = [GammaValsVec; GammaVec];
                
            end
            
        end
        
        clear TempDataX emptyCells1 emptyCells2
        
    end
    
end






