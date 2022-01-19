# install packages if missing
# install.packages("lmerTest") 

# other related packages if needed
# install.packages("readxl")
# install.packages("lme4")
# install.packages("nlme")
# library(readxl)
# library(nlme)

# load libraries
library(lmerTest)
library(bestNormalize)

# Read Data
Brain.df <- read.csv("C:/Users/ANUP/Desktop/DMN_Final_Submission/LME_Analysis/CorrIncorr_PTE_DMN_HIPP_Encode_Recall.csv", fileEncoding="UTF-8-BOM")
x = as.numeric(Brain.df$PTE)
xx = bestNormalize(x)
xxt = xx[["x.t"]]
Brain.df$PTE = xxt
# Run Model with subjects as random effects
ieegmodel = lmer(PTE ~ Condition + (1|Subject), data=Brain.df)

# Stats
anova(ieegmodel)

