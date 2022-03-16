*** Keywords ***	
################################################################-- Have EndPointName --################################################################
#-------------------------------------------- DB --------------------------------------------#	
Check ResponseObject Success DB
    [Arguments]    ${code}    ${description}    ${dataResponse}
	# "{"statusCode":"20000","description":"inquiry worker is success"}"
    # "{"statusCode":"[statusCode]","description":"[description]"}""    

	${replaceDescription}    Replace String    ${description}    20000:    ${EMPTY}    
	${replaceCode}=    Replace String    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_COAPAPP_DB}    [statusCode]    ${code}
	${replaceDescription}=    Replace String    ${replaceCode}    [description]    ${replaceDescription}
	${responseObject}=    Replace String To Object    ${replaceDescription}
	# Log To Console    responseObjectDelta${responseObject}
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_RESPONSEOBJECT}']    ${responseObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_RESPONSEOBJECT}

##############################################################################################################################################################
		
################################################################-- Do Not Have EndPointName --################################################################
##############################################################################################################################################################
