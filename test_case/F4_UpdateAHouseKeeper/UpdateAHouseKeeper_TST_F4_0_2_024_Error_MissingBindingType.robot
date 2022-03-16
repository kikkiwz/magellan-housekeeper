*** Settings ***
Resource    ../../variables/Variables.robot    
Resource    ../../keyword/Keyword.robot
#Suite Setup    Open Directory

*** Test Cases ***
################### Post ###################
UpdateAHouseKeeper_TST_F4_0_2_024_Error_MissingBindingType
    [Documentation]    Step is :    
	...    1.Signin
	...    2.Create Partner
	...    3.Create Account
	...    4.Create a House Keeper
	...    5.Update a House Keeper
	...    6.Delete a House Keeper
    ...    8.Remove Account
    ...    9.Remove Partner

	#====== Start Prepare data ==========
    
	${valueType}=    Set Variable    ${VALUE_TYPE_PURGING}
	${valueBindingType}=    Set Variable    ${VALUE_BINDINGTYPE_PRETENANT}
	${typeConditionProperties}=    Set Variable    ${VALUE_CONDITIONPROPERTIES_TYPE_DAYS}
    ${valueConditionProperties}=    Set Variable    ${VALUE_HOUSEKEEPER_DAYS}
    
	${conditionProperties}=    Set Variable    [{"Type":"${typeConditionProperties}","Value":${valueConditionProperties}}]

	# Prepare data for Request CreateData
	# [accessToken,PartnerId,AccountId,AccountName,PartnerName,CustomerId,HouseKeeperId,HouseKeeperName]
	${createResponse}=     Request CreateData for Signin Partner Account and CreateAHouseKeeper    ${SIGNIN_USERNAME_ROOTADMIN}    ${SIGNIN_PASSOWORD_ROOTADMIN}    ${valueType}    ${valueBindingType}    ${conditionProperties}
	Log To Console    createResponse is : ${createResponse}

	${accessToken}=    Set Variable    ${createResponse}[0]
    Log To Console    AccessToken is : ${accessToken}

	${PartnerId}=    Set Variable    ${createResponse}[1]
    Log To Console    PartnerId is : ${PartnerId}

	${AccountId}=    Set Variable    ${createResponse}[2]
    Log To Console    AccountId is : ${AccountId}

    ${CustomerId}=    Set Variable    ${createResponse}[5]
    Log To Console    CustomerId is : ${CustomerId}

	${HouseKeeperId}=    Set Variable    ${createResponse}[6]
    Log To Console    HouseKeeperId is : ${HouseKeeperId}

	#====== End Prepare data ==========

	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    #Headers
	${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_UPDATEAHOUSEKEEPER_FAIL}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_UPDATEAHOUSEKEEPER}    Accept=${HEADER_ACCEPT}  
	Log To Console    Headers is : ${headers}
		
	#HouseKeeperName
    ${random_number}=    generate random string    6    [NUMBERS]
	${HouseKeeperName}=    Set Variable    ${VALUE_HOUSEKEEPERNAME}${random_number}
    Log To Console    HouseKeeperName is : ${HouseKeeperName}	

	${valueBindingTypeUpdate}=    Set Variable    ${VALUE_BINDINGTYPE_PREACCOUNT}
	${valueBindingKey}=    Set Variable    ${PartnerId}
	${valueConditionPropertiesUpdate}=    Set Variable    ${VALUE_HOUSEKEEPER_UPDATE_DAYS}

	${urlUpdateAHouseKeeper}=    Replace String    ${URL_UPDATEAHOUSEKEEPER}    id    ${HouseKeeperId}
    Log To Console    urlUpdateAHouseKeeper is : ${urlUpdateAHouseKeeper}
	
	#Body
    ${body}=    Evaluate    {"Type":"${valueType}","ConditionProperties":[{"Type":"${typeConditionProperties}","Value":${valueConditionPropertiesUpdate}}],"BindingKey":"${valueBindingKey}","Name":"${HouseKeeperName}"}
    Log To Console    Body is : ${body}

    #Response
    ${res}=    Run keyword And Continue On Failure    Put Api Request    ${URL}${SUPPORTADMIN}    ${urlUpdateAHouseKeeper}    ${headers}    ${body}
	Log To Console    Response is : ${res}

    ${checkReponse}=    Run keyword And Continue On Failure    Response ResultCode Should Have Error    ${res}    ${UPDATEAHOUSEKEEPER}   ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}    ${VALUE_LOG_CODE_40000}    ${VALUE_DESCRIPTION_THECLIENTREQUESTEDMISSINGORINVALIDFORMAT_ERROR}
    Log To Console    checkReponse is : ${checkReponse}

    ${pathUrl}=    Set Variable    ${VALUE_HOUSEKEEPER_URL}/${HouseKeeperId}
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_UPDATEAHOUSEKEEPER_FAIL}${current_timestamp}

    ${endPointName}=    Set Variable    null
	${custom}=    Set Variable    null
	${customDetailDB}=    Set Variable    null
    ${responseObjectDetail}=    Set Variable    [{"Target":"BindingType","DeveloperMessage":"The BindingType is a required"}]

	${bodyLog}=    Set Variable    {"Type":"${valueType}","ConditionProperties":[{"Type":"${typeConditionProperties}","Value":${valueConditionPropertiesUpdate}}],"BindingKey":"${valueBindingKey}","Name":"${HouseKeeperName}"}

	#====== Check log and Verify DB ==========

	#Check log detail and summary
    Log UpdateAHouseKeeper Error    ${VALUE_LOG_CODE_40000}    ${VALUE_DESCRIPTION_THECLIENTREQUESTEDMISSINGORINVALIDFORMAT_ERROR}    ${VALUE_LOG_CODE_40000}    ${VALUE_DESCRIPTION_THECLIENTREQUESTEDMISSINGORINVALIDFORMAT_ERROR}    ${res}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${accessToken}    ${AccountId}    ${bodyLog}

    [Teardown]    Generic Test Case Teardown    ${UPDATEAHOUSEKEEPER}    ${createResponse}    ${HouseKeeperId}
