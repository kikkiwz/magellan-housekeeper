*** Settings ***
Resource    ../../variables/Variables.robot    
Resource    ../../keyword/Keyword.robot
#Suite Setup    Open Directory

*** Test Cases ***
################### Post ###################
CreateAHouseKeeper_TST_F2_1_1_001_Success_KeepingPerTenantDays
    [Documentation]    Step is :    
	...    1.Signin
	...    2.Create Partner
	...    3.Create Account
	...    4.Create a House Keeper
	...    5.Delete a House Keeper
    ...    6.Remove Account
    ...    7.Remove Partner

	#====== Start Prepare data ==========

	# Prepare data for Request CreateData
	# [accessToken,PartnerId,AccountId,AccountName,PartnerName,CustomerId]
	${createResponse}=    Request CreateData for Signin Partner and Account    ${SIGNIN_USERNAME_ROOTADMIN}    ${SIGNIN_PASSOWORD_ROOTADMIN}
	Log To Console    createResponse is : ${createResponse}

	${accessToken}=    Set Variable    ${createResponse}[0]
    Log To Console    AccessToken is : ${accessToken}

	${PartnerId}=    Set Variable    ${createResponse}[1]
    Log To Console    PartnerId is : ${PartnerId}

	${AccountId}=    Set Variable    ${createResponse}[2]
    Log To Console    AccountId is : ${AccountId}

    ${CustomerId}=    Set Variable    ${createResponse}[5]
    Log To Console    CustomerId is : ${CustomerId}

	#====== End Prepare data ==========

	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    #Headers
	${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_CREATEAHOUSEKEEPER}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_CREATEAHOUSEKEEPER}    Accept=${HEADER_ACCEPT}  
	Log To Console    Headers is : ${headers}
		
	#HouseKeeperName
    ${random_number}=    generate random string    6    [NUMBERS]
	${HouseKeeperName}=    Set Variable    ${VALUE_HOUSEKEEPERNAME}${random_number}
    Log To Console    HouseKeeperName is : ${HouseKeeperName}	

	${valueType}=    Set Variable    ${VALUE_TYPE_KEEPING}
	${valueBindingType}=    Set Variable    ${VALUE_BINDINGTYPE_PRETENANT}
	${valueBindingKey}=    Set Variable    ${CustomerId}
	${typeConditionProperties}=    Set Variable    ${VALUE_CONDITIONPROPERTIES_TYPE_DAYS}
	${valueConditionProperties}=    Set Variable    ${VALUE_HOUSEKEEPER_DAYS}

	#Body
    ${body}=    Evaluate    {"Type":"${valueType}","ConditionProperties":[{"Type":"${typeConditionProperties}","Value":${valueConditionProperties}}],"BindingType":"${valueBindingType}","BindingKey":"${valueBindingKey}","Name":"${HouseKeeperName}"}
    Log To Console    Body is : ${body}

    #Response
    ${res}=    Run keyword And Continue On Failure    Post Api Request    ${URL}${SUPPORTADMIN}    ${URL_CREATEAHOUSEKEEPER}    ${headers}    ${body}
	Log To Console    Response is : ${res}

    ${checkReponse}=    Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${CREATEAHOUSEKEEPER}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}
    Log To Console    checkReponse is : ${checkReponse}

    #GetResponse_HouseKeeperId
    ${HouseKeeperInfo}=    Get From Dictionary    ${res}     ${FIELD_HOUSEKEEPERINFO}   
    #Log To Console    ${HouseKeeperInfo}	
	${GetResponse_HouseKeeperId}=    Get From Dictionary    ${HouseKeeperInfo}     ${FIELD_ID}    
	Log To Console    HouseKeeperId is : ${GetResponse_HouseKeeperId}

	${HouseKeeperInfo}=    Set Variable    ${res['${FIELD_HOUSEKEEPERINFO}']}
	${GetResponse_ConditionProperties}=    Get From Dictionary    ${HouseKeeperInfo}     ${FIELD_CONDITIONPROPERTIES}    
	${GetResponse_Type}=    Get From Dictionary    ${HouseKeeperInfo}     ${FIELD_TYPE}   
	${GetResponse_Name}=    Get From Dictionary    ${HouseKeeperInfo}     ${FIELD_NAME}   
	${GetResponse_BindingType}=    Get From Dictionary    ${HouseKeeperInfo}     ${FIELD_BINDINGTYPE}   
	${GetResponse_BindingKey}=    Get From Dictionary    ${HouseKeeperInfo}     ${FIELD_BINDINGKEY}   
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_ConditionProperties}    [{'Type': '${typeConditionProperties}', 'Value': ${valueConditionProperties}}]
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_Type}    ${valueType}
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_Name}    ${HouseKeeperName}
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_BindingType}    ${valueBindingType}
	Run keyword And Continue On Failure    Should Be Equal As Strings    ${GetResponse_BindingKey}    ${valueBindingKey}

    ${pathUrl}=    Set Variable    ${VALUE_HOUSEKEEPER_URL}
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_CREATEAHOUSEKEEPER}${current_timestamp}

	${dataConditionPropertiesDB}=    Set Variable    [{'Type': '${typeConditionProperties}', 'Value': ${valueConditionProperties}}]

    ${dataConditionPropertiesLog}=    Set Variable    [{"Type":"${typeConditionProperties}","Value":${valueConditionProperties}}]

	#====== Check log and Verify DB ==========

	#Check log detail and summary
	Log CreateAHouseKeeper Success    ${res}    ${pathUrl}    ${dataSearch}    ${body}    ${accessToken}    ${PartnerId}    ${CustomerId}    ${AccountId}    ${GetResponse_HouseKeeperId}    ${valueType}    ${dataConditionPropertiesLog}    ${valueBindingType}    ${valueBindingKey}    ${HouseKeeperName}    

    #Inquiry for verify DB   
    Run Keyword If    '${checkReponse}'=='true'    Request Verify DB Check Data HouseKeepers    ${CREATEAHOUSEKEEPER}    ${HouseKeeperName}    ${body}    ${GetResponse_HouseKeeperId}    ${PartnerId}    ${CustomerId}    ${AccountId}    ${dataConditionPropertiesDB}
    
    [Teardown]    Generic Test Case Teardown    ${CREATEAHOUSEKEEPER}    ${createResponse}    ${GetResponse_HouseKeeperId}
    


