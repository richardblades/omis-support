#'------------------------------------------------------------------------------------------
#'	
#'	c s v R e a d S a v e L o a d W r i t e . R
#'
#'	df <- read.csv(
#'		csvPathName,  				# 	CSV path name.
#'       as.is = !stringsAsFactors, #   Turn off automatic conversion of character data #to
#'         							#	factors.
#'       colClasses = NA,           # 	To convert everything to character data, set to
#'         							#	"character".
#'       comment.char = "#",        #   Character prefix denoting comments.
#'       fill = TRUE,               #	Fill in rows that have unequal numbers of columns.
#'       header = TRUE,             #	Are there column names in 1st row?
#'       na.string = "NA",          # 	Could be "." for SAS files.
#'       sep = ",",                 #	Row delimeter.
#'       skip = 0,                  #	Number of rows to skip at the top of the file. Can
#'         							#	be set > 0.
#'       stringsAsFactors = FALSE   # 	Additional control for deciding whether characters
#'         							#	should be converted to factor.
#'       strip.white = TRUE        	#   Strip out extra white space in strings. For example
#'         							#	" 0.1" becomes "0.1".
#'	)
#'------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------
#	
#	Read CSV file into an R data frame
#
#-------------------------------------------------------------------------------------------
readFunction <- function(dfName,csvName,csvPathName) {
	csvFile <- paste0(csvPathName, csvName, ".csv")
	dfName <- read.csv(csvFile, stringsAsFactors=FALSE, header=TRUE, sep=",")
}
readFunction(dfName="nuts1Year",csvName="nuts1Year",csvPathName="~/desktop/")



#-------------------------------------------------------------------------------------------
#	
#	Save R data frame as .rda file
#
#   Best saving rda dataset with intended data frame name. This greatly simplifies future
#   reference.
#	Assign effectively creates a pointer to the resultant data frame using the literal
# 	value held by dfName.
# 	Save objects referenced as literals within the list.
#-------------------------------------------------------------------------------------------
saveFunction <- function(dfName,rdaPathName,df) {
	rdaFile <- paste0(rdaPathName, dfName, ".rda")
    assign(dfName, df)           
    save(list=dfName, file=rdaFile)
}
saveFunction(dfName="nuts1Year",rdaPathName="~/R/omis/data/",df)



#-------------------------------------------------------------------------------------------
#	
#	Save R data frame as .rds file
#
#-------------------------------------------------------------------------------------------
	dfName="nuts1Year"
	rdsPathName="~/R/omis/data/"
	rdsFile <- paste0(rdsPathName, dfName, ".rds")
	saveRDS(dfName, file=rdsFile)



#-------------------------------------------------------------------------------------------
#	
#	Load .rda file into an R data frame
#   Results in nuts1Year data frame being loaded (regardless of rdaPathName).
#
#-------------------------------------------------------------------------------------------
loadFunction <- function(dfName,rdaPathName) {
	rdaFile <- paste0(rdaPathName, dfName, ".rda")
	load(rdaFile)
}
loadFunction(dfName="nuts1Year",rdaPathName="~/R/omis/data/")



#-------------------------------------------------------------------------------------------
#	
#	Load .rds file into an R data frame
#
#-------------------------------------------------------------------------------------------
	dfName="nuts1Year"
	rdsPathName="~/R/omis/data/"
	rdsFile <- paste0(rdsPathName, dfName, ".rds")
	df <- readRDS(file=rdsFile)



#-------------------------------------------------------------------------------------------
#	
#	Write R data frame to CSV file
#
#-------------------------------------------------------------------------------------------
writeFunction <- function(dfName,csvName,csvPathName) {
	csvFile <- paste0(csvPathName, csvName, ".csv")
	write.csv(dfName, file=csvFile, quote=FALSE, row.names=FALSE)
}
writeFunction(dfName="nuts1Year",csvName="nuts1YearCopy",csvPathName="~/desktop/")



#-------------------------------------------------------------------------------------------
#	
#	Load .rda file and assign to an R data frame with name of own choosing 
#
#-------------------------------------------------------------------------------------------
geography <- c("nuts1")
rdaFile <- paste0("~/R/omis/data/", geography, "Year.rda")
load(rdaFile)
dfName <- paste0(geography, "Year")
df <- get(dfName)

#-------------------------------------------------------------------------------------------
assignFunction <- function(dfName,rdaPathName) {
	rdaFile <- paste0(rdaPathName, dfName, ".rda")
	load(rdaFile)
	df <- get(dfName)
}
assignFunction(dfName="nuts1Year",rdaPathName="~/R/omis/data/")