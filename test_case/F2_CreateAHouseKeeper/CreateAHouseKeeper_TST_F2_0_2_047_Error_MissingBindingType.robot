*** Settings ***
Resource    ../../variables/Variables.robot    
Resource    ../../keyword/Keyword.robot
#Suite Setup    Open Directory

*** Test Cases ***
################### Post ###################
CreateAHouseKeeper_TST_F2_0_2_047_Error_MissingBindingType
    [Documentation]    Step is :    
	...    1.Signin
	...    2.Create Partner
	...    3.Create Account
	...    4.Import Thing
	...    5.Mapping IMEI   
	...    6.Activate Thing Core
	...    7.Create a House Keeper
	...    8.Remove Thing Core
    ...    9.Remove Account
    ...    10.Remove Partner

	#====== Start Prepare data ==========
	
	# Prepare data for create thing
	${valArrData}=    Prepare data for create thing ImportThing MappingIMEI and ActivateThingCore    1
	Log To Console    valArrData is : ${valArrData}

	# Prepare data for Request CreateData
	# [accessToken,PartnerId,AccountId,AccountName,PartnerName,CustomerId,ThingIdArr]
	${createResponse}=    Request CreateData for Signin Partner Account ImportThing MappingIMEI and ActivateThingCore    ${SIGNIN_USERNAME_ROOTADMIN}    ${SIGNIN_PASSOWORD_ROOTADMIN}    ${valArrData}
	Log To Console    createResponse is : ${createResponse}

	${accessToken}=    Set Variable    ${createResponse}[0]
    Log To Console    AccessToken is : ${accessToken}

	${PartnerId}=    Set Variable    ${createResponse}[1]
    Log To Console    PartnerId is : ${PartnerId}

	${AccountId}=    Set Variable    ${createResponse}[2]
    Log To Console    AccountId is : ${AccountId}

    ${CustomerId}=    Set Variable    ${createResponse}[5]
    Log To Console    CustomerId is : ${CustomerId}

    ${ThingIdArr}=    Set Variable    ${createResponse}[6]
    Log To Console    ThingId is : ${ThingIdArr}
	
	#====== End Prepare data ==========

	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    #Headers
	${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_CREATEAHOUSEKEEPER_FAIL}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_CREATEAHOUSEKEEPER}    Accept=${HEADER_ACCEPT}  
	Log To Console    Headers is : ${headers}
		
	#HouseKeeperName
    ${random_number}=    generate random string    6    [NUMBERS]
	${HouseKeeperName}=    Set Variable    ${VALUE_HOUSEKEEPERNAME}${random_number}
    Log To Console    HouseKeeperName is : ${HouseKeeperName}	

	${valueType}=    Set Variable    ${VALUE_TYPE_KEEPING}
	${valueBindingType}=    Set Variable    ${VALUE_BINDINGTYPE_PRETHING}
	${valueBindingKey}=    Set Variable    ${AccountId}
	${typeConditionProperties}=    Set Variable    ${VALUE_CONDITIONPROPERTIES_TYPE_SIZE}
    ${valueConditionProperties}=    Set Variable    ${VALUE_HOUSEKEEPER_SIZE1}
	
	#Body
    ${body}=    Evaluate    {"Type":"${valueType}","ConditionProperties":[{"Type":"${typeConditionProperties}","Value":${valueConditionProperties}}],"BindingKey":"${valueBindingKey}","Name":"${HouseKeeperName}"}
    Log To Console    Body is : ${body}

    #Response
    ${res}=    Run keyword And Continue On Failure    Post Api Request    ${URL}${SUPPORTADMIN}    ${URL_CREATEAHOUSEKEEPER}    ${headers}    ${body}
	Log To Console    Response is : ${res}

    ${checkReponse}=    Run keyword And Continue On Failure    Response ResultCode Should Have Error    ${res}    ${CREATEAHOUSEKEEPER}   ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}    ${VALUE_LOG_CODE_40000}    ${VALUE_DESCRIPTION_THECLIENTREQUESTEDMISSINGORINVALIDFORMAT_ERROR}
    Log To Console    checkReponse is : ${checkReponse}

    ${pathUrl}=    Set Variable    ${VALUE_HOUSEKEEPER_URL}
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_CREATEAHOUSEKEEPER_FAIL}${current_timestamp}

	${endPointName}=    Set Variable    null
	${custom}=    Set Variable    null
	${customDetailDB}=    Set Variable    null
    ${responseObjectDetail}=    Set Variable    [{"Target":"BindingType","DeveloperMessage":"The BindingType is a required"}]

	${bodyLog}=    Set Variable    {"Type":"${valueType}","ConditionProperties":[{"Type":"${typeConditionProperties}","Value":${valueConditionProperties}}],"BindingKey":"${valueBindingKey}","Name":"${HouseKeeperName}"}

	#====== Check log and Verify DB ==========

	#Check log detail and summary
    Log CreateAHouseKeeper Error    ${VALUE_LOG_CODE_40000}    ${VALUE_DESCRIPTION_THECLIENTREQUESTEDMISSINGORINVALIDFORMAT_ERROR}    ${VALUE_LOG_CODE_40000}    ${VALUE_DESCRIPTION_THECLIENTREQUESTEDMISSINGORINVALIDFORMAT_ERROR}    ${res}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${accessToken}    ${AccountId}    ${bodyLog}

    [Teardown]    Generic Test Case Teardown    ${PARTNERACCOUNTTHINGARRCORE}    ${createResponse}    null
    


    


