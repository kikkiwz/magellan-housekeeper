*** Settings ***
Resource    ../../variables/Variables.robot    
Resource    ../../keyword/Keyword.robot
#Suite Setup    Open Directory

*** Test Cases ***
################### Post ###################
GetAListHouseKeeper_TST_F1_1_1_001_Success
    [Documentation]    Step is :    
	...    1.Get a List House Keeper

	#====== Start Prepare data ==========

	${accessToken}=    Set Variable    null
    Log To Console    AccessToken is : ${accessToken}

	${AccountId}=    Set Variable    null
    Log To Console    AccountId is : ${AccountId}

	# #====== End Prepare data ==========

	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    #Headers
	${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_GETALISTHOUSEKEEPER}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_GETALISTHOUSEKEEPER}    Accept=${HEADER_ACCEPT}  
	Log To Console    Headers is : ${headers}
	
    #Response
    ${res}=    Run keyword And Continue On Failure    Get Api Request    ${URL}${SUPPORTADMIN}    ${URL_GETALISTHOUSEKEEPER}    ${headers}
	Log To Console    Response is : ${res}

    ${checkReponse}=    Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${GETALISTHOUSEKEEPER}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}
    Log To Console    checkReponse is : ${checkReponse}

    ${pathUrl}=    Set Variable    ${VALUE_HOUSEKEEPER_URL}
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_GETALISTHOUSEKEEPER}${current_timestamp}

	#====== Check log and Verify DB ==========

	#Check log detail and summary
	Log GetAListHouseKeeper Success    ${res}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${AccountId}
