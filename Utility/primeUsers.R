#'------------------------------------------------------------------------------------------
#'
#' 	p r i m e U s e r s . R
#'
#' 	Prime users account data
#'
#'	User account data held in /extdata/.users.rda
#'
#'------------------------------------------------------------------------------------------



#-------------------------------------------------------------------------------------------
#
#	Establish package libraries
#
#-------------------------------------------------------------------------------------------
  	library(digest)



#-------------------------------------------------------------------------------------------
#
#	Establish filePath to Production Binary and Development Source.
#
#-------------------------------------------------------------------------------------------
 	pathBinary <- system.file("extdata", ".users.rda", package="omis")
 	pathSource <- c("~/R/omis/inst/extdata/.users.rda")


#-------------------------------------------------------------------------------------------
#
#	Prime /extdata/users.rda file
#
#-------------------------------------------------------------------------------------------
	users <- data.frame(
  		email=c( 
  			'adrian@electricangel.co.uk',
  			'annie@create.uk.net',
  			'A.Ingram@hull.ac.uk',
  			'C.Conway@hull.ac.uk',   
  			'david.kelly@scaborough.gov.uk',
  			
  			'd.mundy@hull.ac.uk',
  			'guy@forward-thinker.co.uk',
  			'matt@wearesauce.io',
  			'michelle@create.uk.net',
  			'M.Augustyn@hull.ac.uk',
  			
  			'Nick.Taylor@scarborough.gov.uk',
  			'omis.scarborough+admin@gmail.com', 
  			'omis.scarborough+base@gmail.com',
  			'omis.scarborough+denied@gmail.com', 
  			'omis.scarborough+pending@gmail.com',
  			
  			'paul.grahamslaw@btinternet.com',
  			'richardblades7@icloud.com', 
  			'ricky.carrott@outlook.com',
  			'r.blades@hull.ac.uk',
  			'S.G.Johnson@hull.ac.uk'),
  		password=c(	
  			'password', 'password', 'password', 'password', 'password',
  			'password', 'password', 'password', 'password', 'password',
  			'password', 'password', 'password', 'password', 'password',
  			'password', 'password', 'password', 'password', 'password'),
  		passwordAttempts=c(
  			0, 0, 0, 0, 0,
  			0, 0, 0, 0, 0,
  			0, 0, 0, 0, 0,
  			0, 0, 0, 0, 0),
  		userType=c(
  			'base', 	'base', 	'admin', 	'base', 	'base',
  			'admin', 	'admin', 	'base', 	'admin', 	'admin',
  			'admin', 	'admin', 	'base', 	'denied', 	'pending',
  			'base', 	'admin', 	'base', 	'admin', 	'admin'),
  		stringsAsFactors=FALSE
  		)
 
   	for (i in 1:nrow(users)) {
   	  	users[i, "password"] <- digest(users[i, "password"], algo="md5", serialize=FALSE)
  	}
 
 	save(users, file=pathBinary) 							  		 # Production Binary
 	save(users, file=pathSource) 									# Development Source