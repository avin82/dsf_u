getwd()
setwd('~/Downloads')
getwd()

statesInfo <- read.csv('stateData.csv')

stateSubset <- subset(statesInfo, state.region == 1)
head(stateSubset, 2)
dim(stateSubset)

stateSubsetBracket <- statesInfo[statesInfo$state.region == 1, ]
head(stateSubsetBracket, 2)
dim(stateSubsetBracket)

stateSubsetIlliteracy <- subset(statesInfo, illiteracy == 0.5)
head(stateSubsetIlliteracy, 2)
dim(stateSubsetIlliteracy)

stateSubsetIlliteracyBracket <- statesInfo[statesInfo$illiteracy == 0.5, ]
head(stateSubsetIlliteracyBracket, 2)
dim(stateSubsetIlliteracyBracket)

stateSubsetGrad = subset(statesInfo, highSchoolGrad > 50)
head(stateSubsetGrad, 2)
dim(stateSubsetGrad)

stateSubsetGradBracket = statesInfo[statesInfo$highSchoolGrad > 50, ]
head(stateSubsetGradBracket, 2)
dim(stateSubsetGradBracket)