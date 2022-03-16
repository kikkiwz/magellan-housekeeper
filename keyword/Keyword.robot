*** Settings ***
Library    Collections
Library    String
Library    DateTime
Library    OperatingSystem
Library    Process
Library    BuiltIn
Library    JSONLibrary
Library    MongoDBLibrary

Resource    ../keyword/Keyword_Request.robot
Resource    ../keyword/Keyword_Datetime.robot
Resource    ../keyword/Keyword_CreateData.robot
Resource    ../keyword/Keyword_RemoveData.robot
Resource    ../keyword/Keyword_UpdateData.robot
Resource    ../keyword/Keyword_InquiryData.robot
Resource    ../keyword/Keyword_Log.robot
Resource    ../keyword/Keyword_Log_Summary.robot

Resource    ../keyword/Keyword_MongoDB.robot
Resource    ../keyword/Keyword_VerifyDB.robot

Resource    ../keyword/Keyword_Log_Detail.robot
Resource    ../keyword/Keyword_Log_Detail_HouseKeeper.robot
Resource    ../keyword/Keyword_HouseKeeper_RemoveData.robot

Resource    ../keyword/Keyword_VerifyLog_HouseKeeper.robot

#Library Document
#https://robotframework.org/robotframework/latest/libraries/BuiltIn.html
#https://robotframework.org/robotframework/latest/libraries/String.html
#https://robotframework.org/robotframework/latest/libraries/Collections.html
#https://robotframework-thailand.github.io/robotframework-jsonlibrary/JSONLibrary.html

*** Keywords ***
####################################################
Add Needed Image Path
    Add Image Path    ${IMAGE_DIR}
	
Replace Text
    [Arguments]    ${string}    ${search_for}    ${replace_with}
	
	${replaceUrl}=    Replace String    ${string}    ${search_for}    ${replace_with}
	Log To Console    ${text}
	[RETURN]    ${text}
	
Replace Parameters Url Path
	[Arguments]    ${url}    ${urlPath}    ${ParametersField}    ${value_ParametersField}    ${ParametersField_ipAddress}    ${value_ipAddress}
	${replaceParametersUrl}=    Replace String    ${urlPath}    ${ParametersField}    ${value_ParametersField}
	#Log To Console    replaceUrl${replaceParametersUrl}
    ${replaceIPAddressUrl}=    Replace String    ${replaceParametersUrl}    ${ParametersField_ipAddress}    ${value_ipAddress}
	#Log To Console    replaceUrl${replaceIPAddressUrl}
	${url}=    Set Variable    ${url}${replaceIPAddressUrl}
	#Log To Console    ${url}
	[return]    ${url}
	
Replace Parameters Path
	[Arguments]    ${urlPath}    ${ParametersField}    ${value_ParametersField}    ${ParametersField_ipAddress}    ${value_ipAddress}
	${replaceParametersUrl}=    Replace String    ${urlPath}    ${ParametersField}    ${value_ParametersField}
	#Log To Console    replaceUrl${replaceParametersUrl}
    ${replaceIPAddressUrl}=    Replace String    ${replaceParametersUrl}    ${ParametersField_ipAddress}    ${value_ipAddress}
	#Log To Console    replaceUrl${replaceIPAddressUrl}
	${path}=    Set Variable    ${replaceIPAddressUrl}
	#Log To Console    ${path}
	[return]    ${path}	

Replace Parameters
	[Arguments]    ${urlPath}    ${ParametersField}    ${value_ParametersField}
	${replaceParametersUrl}=    Replace String    ${urlPath}    ${ParametersField}    ${value_ParametersField}
	#Log To Console    replaceUrl${replaceParametersUrl}
	${path}=    Set Variable    ${replaceParametersUrl}
	#Log To Console    ${path}
	[return]    ${path}	
	
#for use check log and verify DB check data 
Check Json Data Should Be Equal
	[Arguments]    ${JsonData}    ${field}    ${expected}    ${fieldName}
	
	#json.dumps use for parameter convert ' to "
	${listAsString}=    Evaluate    json.dumps(${JsonData})    json
	#r use for parameter / have in data
	${resp_json}=    Evaluate    json.loads(r'''${listAsString}''')    json
	#Log To Console    resp_json${resp_json}	
    #Should Be Equal    ${resp_json['${field}']}    ${expected}
	#Log To Console    resp_json${resp_json${field}}
	Log Many    ${listAsString}	
	Log To Console    ${fieldName} : ${expected} = ${resp_json${field}}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected}    ${resp_json${field}}    error=${field}	

Teardown Message
    [Arguments]    ${message}
    Log    Failed!!!	
  
Generic Test Case Teardown
    [Arguments]    ${Flow}    ${getData}    ${id}

	Log To Console    Flow${Flow}    

    # Catch of Try Catch Finally
    Run Keyword If Test Failed    Test Case Catch 
    # Finally of Try Catch Finally
    #  RKITS is only executed when test passed.
    Run Keyword If Test Passed    Test Case Finally

	Run Keyword If	'${Flow}' == '${CREATEAHOUSEKEEPER}' or '${Flow}' == '${UPDATEAHOUSEKEEPER}' or '${Flow}' == '${GETALISTHOUSEKEEPER}' or '${Flow}' == '${GETAHOUSEKEEPERBYID}' or '${Flow}' == '${DELETEAHOUSEKEEPER}'    Rollback Data Remove Partner Account and CreateAHouseKeeper    ${getData}    ${id}
	Run Keyword If	'${Flow}' == '${UPDATEAHOUSEKEEPER2}'    Rollback Data Remove Partner Account and CreateAHouseKeeper2    ${getData}
    Run Keyword If	'${Flow}' == '${PARTNERACCOUNTTHINGARRCORECREATEAHOUSEKEEPER}'    Rollback Data Remove Partner Account ThingArr and CreateAHouseKeeper    ${Flow}    ${getData}    ${id}
	Run Keyword If	'${Flow}' == '${PARTNERACCOUNTTHINGARRCORE}'    Rollback Data Remove Partner Account and ThingArr Core    ${Flow}    ${getData}
    Run Keyword If	'${Flow}' == '${PARTNER}'    Rollback Data Remove Partner    ${getData}
    Run Keyword If	'${Flow}' == '${UPDATEAHOUSEKEEPER_DELETE}'    Rollback Data Remove CreateAHouseKeeper    ${id}
    Run Keyword If	'${Flow}' == '${UPDATEAHOUSEKEEPER_PARTNER}'    Rollback Data Remove Partner and CreateAHouseKeeper    ${Flow}    ${getData}    ${id}
	Run Keyword If	'${Flow}' == '${PARTNERACCOUNT}'    Rollback Data Remove Partner and Account    ${getData}

Test Case Catch
    Log To Console    Test Case Catch : Rollback!!
 
	 
Test Case Finally
    Log To Console    Test Case Finally

Prepare data for create thing ImportThing MappingIMEI and ActivateThingCore
    [Arguments]    ${num}
    
	${data_count}=    Set Variable    ${num}
    # Log To Console    ${data_count}
	@{valArrData}=    Create List
	FOR    ${i}    IN RANGE    ${data_count}

        #set IMEI
        ${randomIM1}=    Evaluate    random.randint(10000000, 99999999)    random
        ${randomIM2}=    Evaluate    random.randint(1000000, 9999999)    random
        ${random_IMEI}=    Set Variable    ${randomIM1}${randomIM2}
        # Log To Console    ${random_IMEI} 
        Set Global Variable    ${IMEI}    ${random_IMEI}
        Log To Console    IMEI is : ${IMEI}

        #set ThingSecret
        ${randomIM3}=    Evaluate    random.randint(10000000, 99999999)    random
        ${randomIM4}=    Evaluate    random.randint(1000000, 9999999)    random
        ${random_ThingSecret}=    Set Variable    ${randomIM3}${randomIM4}
        # Log To Console    ${random_ThingSecret} 
        Set Global Variable    ${ThingSecret}    ${random_ThingSecret}
        Log To Console    ThingSecret is : ${ThingSecret}
	
        #set ThingIdentifier
        ${randomICCID1}=    Evaluate    random.randint(1000000, 9999999)    random
        ${randomICCID2}=    Evaluate    random.randint(100000, 999999)    random
        ${random_ThingIdentifier}=    Set Variable    ${FIELD_ICCIDPRE}${randomICCID1}${randomICCID2}
        # Log To Console    ${random_ThingIdentifier} 
        Set Global Variable    ${ThingIdentifier}    ${random_ThingIdentifier}
        Log To Console    ThingIdentifier is : ${ThingIdentifier}	

		#ThingName
        ${random_number}=    generate random string    6    [NUMBERS]
        ${ThingName}=    Set Variable    ${VALUE_ATHINGNAME}${random_number}
        Log To Console    ThingName is : ${ThingName}
        
        ${data}=    Evaluate    { "ConnectivityType": "${VALUE_CONNECTIVITYTYPE_NBIOT}", "ThingName": "${ThingName}", "ThingIdentifier": "${ThingIdentifier}", "ThingSecret": "${ThingSecret}", "IMEI": "${IMEI}" }

        Append To List    ${valArrData}    ${data}        #Add data to array set at valArrData
		# Run Keyword If    '${valueSearch}'=='${ASGARD_COAPAPI_VALUE_TST_F4_0_2_003_DATASEARCH}'    Append To List    ${valArrData}    ${valLog}        #Add data to array set at valArrData
		 
    # Exit For Loop
	END
	# Log To Console    valArrData${valArrData}
	[return]    ${valArrData}
