*** Settings ***
Resource    ../../variables/Variables.robot    
Resource    ../../keyword/Keyword.robot
#Suite Setup    Open Directory

*** Test Cases ***
################### Post ###################
CreateAHouseKeeper_TST_F2_0_2_032_Error_KeepingNameDuplicated
    [Documentation]    Step is :    
	...    1.Signin
	...    2.Create Partner
	...    3.Create Account
	...    4.Create a House Keeper
	...    5.Create a House Keeper
	...    6.Delete a House Keeper
    ...    7.Remove Account
    ...    8.Remove Partner

	#====== Start Prepare data ==========
	
	${random_valueConditionProperties}=    generate random string    6    [NUMBERS]
	${valueType}=    Set Variable    ${VALUE_TYPE_KEEPING}
	${valueBindingType}=    Set Variable    ${VALUE_BINDINGTYPE_PRETHING}
	${typeConditionProperties}=    Set Variable    ${VALUE_CONDITIONPROPERTIES_TYPE_SIZE}
    ${valueConditionProperties}=    Set Variable    ${random_valueConditionProperties}
    
	${conditionProperties}=    Set Variable    [{"Type":"${typeConditionProperties}","Value":${valueConditionProperties}}]

    # Prepare data for create thing
	${valArrData}=    Prepare data for create thing ImportThing MappingIMEI and ActivateThingCore    1
	Log To Console    valArrData is : ${valArrData}

	# Prepare data for Request CreateData
	# [accessToken,PartnerId,AccountId,AccountName,PartnerName,CustomerId,ThingIdArr,HouseKeeperId,HouseKeeperName]
	${createResponse}=     Request CreateData for Signin Partner Account ImportThing MappingIMEI ActivateThingCore and CreateAHouseKeeper    ${SIGNIN_USERNAME_ROOTADMIN}    ${SIGNIN_PASSOWORD_ROOTADMIN}    ${valArrData}    ${valueType}    ${valueBindingType}    ${conditionProperties}
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

	${HouseKeeperId}=    Set Variable    ${createResponse}[7]
    Log To Console    HouseKeeperId is : ${HouseKeeperId}

	${HouseKeeperName}=    Set Variable    ${createResponse}[8]
    Log To Console    HouseKeeperName is : ${HouseKeeperName}
	
	#====== End Prepare data ==========

	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    #Headers
	${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_CREATEAHOUSEKEEPER_FAIL}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_CREATEAHOUSEKEEPER}    Accept=${HEADER_ACCEPT}  
	Log To Console    Headers is : ${headers}

	${valueBindingKey}=    Set Variable    ${AccountId}

	#Body
    ${body}=    Evaluate    {"Type":"${valueType}","ConditionProperties":[{"Type":"${typeConditionProperties}","Value":${valueConditionProperties}}],"BindingType":"${valueBindingType}","BindingKey":"${valueBindingKey}","Name":"${HouseKeeperName}"}
    Log To Console    Body is : ${body}

    #Response
    ${res}=    Run keyword And Continue On Failure    Post Api Request    ${URL}${SUPPORTADMIN}    ${URL_CREATEAHOUSEKEEPER}    ${headers}    ${body}
	Log To Console    Response is : ${res}

    ${checkReponse}=    Run keyword And Continue On Failure    Response ResultCode Should Have Error    ${res}    ${CREATEAHOUSEKEEPER}   ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}    ${VALUE_LOG_CODE_40301}    ${VALUE_DESCRIPTION_THENAMECOULDNOTBEDUPLICATED_ERROR}
    Log To Console    checkReponse is : ${checkReponse}

    ${pathUrl}=    Set Variable    ${VALUE_HOUSEKEEPER_URL}
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_CREATEAHOUSEKEEPER_FAIL}${current_timestamp}

	${endPointName}=    Set Variable    null
	${custom}=    Set Variable    null
	${customDetailDB}=    Set Variable    null
    ${responseObjectDetail}=    Set Variable    null

	${bodyLog}=    Set Variable    {"Type":"${valueType}","ConditionProperties":[{"Type":"${typeConditionProperties}","Value":${valueConditionProperties}}],"BindingType":"${valueBindingType}","BindingKey":"${valueBindingKey}","Name":"${HouseKeeperName}"}

	#====== Check log and Verify DB ==========

	#Check log detail and summary
    Log CreateAHouseKeeper Error    ${VALUE_LOG_CODE_40301}    ${VALUE_DESCRIPTION_THENAMECOULDNOTBEDUPLICATED_ERROR}    ${VALUE_LOG_CODE_40301}    ${VALUE_DESCRIPTION_THENAMECOULDNOTBEDUPLICATED_ERROR}    ${res}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${accessToken}    ${AccountId}    ${bodyLog}

    [Teardown]    Generic Test Case Teardown    ${PARTNERACCOUNTTHINGARRCORECREATEAHOUSEKEEPER}    ${createResponse}    ${HouseKeeperId}
    


    


