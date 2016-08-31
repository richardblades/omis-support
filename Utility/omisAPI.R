#'------------------------------------------------------------------------------------------
#'
#'	o m i s A P I . R
#'
#'------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------
#   Establish environment
#-------------------------------------------------------------------------------------------
	library(jsonlite)
	library(httr)								   # Simplifies URL and HTTP interaction

#-------------------------------------------------------------------------------------------
#   Declare OpenCPU URL
#-------------------------------------------------------------------------------------------
#  	url <- "http://localhost:5941/ocpu/library/omis/"
  	url <- "http://www.omis-scarborough.uk/ocpu/library/omis/"
  	
#-------------------------------------------------------------------------------------------
#   Load JSON from URL directly into R data frame and then write out as a CSV file.
#-------------------------------------------------------------------------------------------
  	df <- fromJSON(paste0(url, "data/nuts1Year/json"))
  	write.csv(df, file="~/Downloads/nuts1Year.csv", quote=FALSE, row.names=FALSE)

#-------------------------------------------------------------------------------------------
#   Useful omis API commands
#-------------------------------------------------------------------------------------------
	r <- GET(paste0(url, ""))           					# package information
	r <- GET(paste0(url, "R/"))         					# R code directory
	r <- GET(paste0(url, "R/nuts4D47Model"))         		# R code > print
	r <- GET(paste0(url, "data/"))      					# data directory
	r <- GET(paste0(url, "data/nuts1Year"))      			# data object > print
	r <- GET(paste0(url, "data/nuts1Year/json"))      		# data object > json
	r <- GET(paste0(url, "data/nuts1Year/md"))         		# data object > markdown
	r <- GET(paste0(url, "data/nuts1Year/csv"))         	# data object > CSV
	r <- GET(paste0(url, "data/nuts1Year/rda"))         	# data object > R dataset
	r <- GET(paste0(url, "data/nuts1Year/tab"))         	# data object > table
	r <- GET(paste0(url, "data/nuts1Year/tab?sep='|'"))   	# data object > table with sep

#-------------------------------------------------------------------------------------------
#   Examine httr output
#-------------------------------------------------------------------------------------------
  	print(r)
  	status_code(r)
  	headers(r)
  	r$status_code
  	r$headers
  	r$args
  	str(content(r))
  	http_status(r)
  	content(r, "text")
  	content(r, "raw")
  	content(r, "parsed")
