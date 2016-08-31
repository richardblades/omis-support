#'------------------------------------------------------------------------------------------
#'
#'	i n p u t D a t a . R
#'
#'------------------------------------------------------------------------------------------
options("stringsAsFactors" = FALSE)

depVar1		<- c("turnover47s07")
depVar1Ttl	<- c("turnover £m")
factor1 	<- c("5")
factor2     <- c("10")
geography	<- c("nuts4")

systemFile <- system.file("data", package="omis")
rdsFile <- paste0(systemFile, "/", "inputData.rds")
inputData   <- readRDS(file=rdsFile) 
fix(inputData)

indVar1		<- c("femalePop")
indVar2		<- c("femaleWorkGrossWeek")
#	indVar1		<- c("newborough2East")
#	indVar2		<- c("westborough2West")

modelTo		<- c("2012")
options		<- c("modelAttr", "nonlinear")
predictTo	<- c("2020")