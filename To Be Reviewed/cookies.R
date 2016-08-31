#'------------------------------------------------------------------------------------------
#'
#'	c o o k i e s . R
#'
#'	EU directive dictates "informed consent" must be sought. 
#'		
#'	domain=omis-scarborough.uk;
#'		Used to compare against the domain of the server in which the URL is being 
#'		requested. If the domain matches or if it is a sub-domain, then the path attribute 
#'		will be checked next. Only hosts within the specified domain can set a cookie for 
#'		that domain. The domain attribute cannot be a top level domain (such as .gov or 
#'		.com) to prevent servers from setting arbitrary cookies for another domain. If the 
#'		domain attribute is not set, then the host name of the server that generated the 
#'		cookie is used as the default value of the domain. For example, if a cookie is set 
#'		by an application at app.mydomain.com with no domain attribute set, then the cookie
#'		would be resubmitted for all subsequent requests for app.mydomain.com and its 
#'		sub-domains (such as hacker.app.mydomain.com), but not to otherapp.mydomain.com. If
#'		a developer wanted to loosen this restriction, then he could set the domain
#'		attribute to mydomain.com. In this case the cookie would be sent to all requests
#'		for app.mydomain.com and its sub domains, such as hacker.app.mydomain.com, and even
#'		bank.mydomain.com. If there was a vulnerable server on a sub domain (for example, 
#'		otherapp.mydomain.com) and the domain attribute has been set too loosely (for 
#'		example, mydomain.com), then the vulnerable server could be used to harvest cookies
#'		(such as session tokens).
#'
#'	expiration=; 	
#'		This attribute is used to set persistent cookies, since the cookie does not expire
#'		until the set date is exceeded. This persistent cookie will be used by this browser
#'		session and subsequent sessions until the cookie expires. Once the expiration date
#'		has exceeded, the browser will delete the cookie. Alternatively, if this attribute
#'		is not set, then the cookie is only valid in the current browser session and the 
#'		cookie will be deleted when the session ends.
#'
#'	HttpOnly;
#'		Helps prevent attacks such as cross-site scripting, since it does not allow the
#'		cookie to be accessed via a client side script such as JavaScript. Not all browsers
#'		support this functionality.
#'
#'	path="full-path???"
#'	path="ocpu/library/omis/www/"	
#'		In addition to the domain, the URL path that the cookie is valid for can be
#'		specified. If the domain and path match, then the cookie will be sent in the
#'		request. Just as with the domain attribute, if the path attribute is set too 
#'		loosely, then it could leave the application vulnerable to attacks by other
#'		applications on the same server. For example, if the path attribute was set to the 
#'		web server root "/", then the application cookies will be sent to every application
#'		within the same domain.
#'
#'	secure;		
#'		Browser may only send cookie if the request is being sent over a secure channel such
#'		as HTTPS.
#'
#'------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------
#   Establish environment
#-------------------------------------------------------------------------------------------
	library(httr)								   # Simplifies URL and HTTP interaction
	
	
# 	turn off ssl verify, otherwise the subsequent GET command will fail	
	set_config(config(ssl_verifypeer = 0L)) ??? BAD
	
#	important - httr preserves cookies on subsequent requests to the same host, we don't 
#	need that because of sessions expiration
  	handle_reset("https://omis-scarborough.uk/ocpu/library/omis/www/")	
  	
#-------------------------------------------------------------------------------------------
#   Declare OpenCPU URL
#-------------------------------------------------------------------------------------------
  	url <- c("https://www.omis-scarborough.uk/ocpu/library/omis/www/")
  	url <- c("http://omis-scarborough.uk/ocpu/library/omis/www/")
  	url <- c("http://httpbin.org/cookies")
  	
#-------------------------------------------------------------------------------------------
#   Cookie request via set_cookies()
#
#	verbose() uses the following prefixes to distinguish between different components of the
#	http messages:
#	 	* 	informative curl messages
#		-> 	headers sent (out)
#		>> 	data sent (out)
#		*> 	ssl data sent (out)
#		<- 	headers received (in)
#		<< 	data received (in)
#		<* 	ssl data received (in)
#-------------------------------------------------------------------------------------------
  	userType <- c("admin")
  	
  	request <- GET(url, set_cookies("userType"=userType),
  		verbose(data_out=TRUE, data_in=FALSE, info=TRUE, ssl=TRUE))
  	
  	request <- GET(url, set_cookies("name"="value"), verbose())		
	content(request)$cookies
  
#-------------------------------------------------------------------------------------------
#   Cookie response 
#-------------------------------------------------------------------------------------------
	response <- GET(url, query=list("name"="value"))
	cookies(response)
  
#-------------------------------------------------------------------------------------------
#   httr documentation
#-------------------------------------------------------------------------------------------
	httr_options("set_cookies")
	httr_options("cookie")
	curl_docs("cookie")
	curl_docs("cookiefile")
	curl_docs("cookiejar")
	curl_docs("cookielist")
	curl_docs("cookiesession")
	
#-------------------------------------------------------------------------------------------
#   Examine httr output
#-------------------------------------------------------------------------------------------
  	r <- request
  	r <- response
  	
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
