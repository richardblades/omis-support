#'------------------------------------------------------------------------------------------
#'
#'	d e m o F o o t f a l l . R
#'
#'	Remove footfall captured after cutOff date to faciliate demo
#'
#'------------------------------------------------------------------------------------------
	cutOff 	= c("2016-04-01") 				  
    
    
    
#-------------------------------------------------------------------------------------------
#   
#   Load current data and preserve as date stamped copy.
#
#-------------------------------------------------------------------------------------------
 	systemFile <- system.file("data", package="omis")
	rdaFile <- paste0(systemFile, "/", "nuts4HourFootfall.rda")
	load(rdaFile)
    
    dateStamp <- format(Sys.Date(), "%Y-%m-%d")
    dateStamped <- paste0(systemFile, "/", "nuts4HourFootfall", dateStamp, ".rda")
    save(nuts4HourFootfall, file=dateStamped) 

#-------------------------------------------------------------------------------------------
#   
#   Remove any data produced after cutOff date and save as latest version.
#
#-------------------------------------------------------------------------------------------
    nuts4HourFootfall <- subset(nuts4HourFootfall, date < cutOff)
    save(nuts4HourFootfall, file=rdaFile)  
    