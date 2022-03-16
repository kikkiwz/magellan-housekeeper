*** Settings ***
Resource    ../../variables/Variables.robot    
Resource    ../../keyword/Keyword.robot
#Suite Setup    Open Directory

*** Test Cases ***
################### Post ###################
DeleteAHouseKeeper_TST_F5_0_2_003_Error_NotFoundID
    [Documentation]    Step is :    
	...    1.Signin
	...    2.Create Partner
	...    3.Create Account
	...    4.Create a House Keeper
	...    5.Delete a House Keeper
	...    6.Delete a House Keeper	
    ...    7.Remove Account
    ...    8.Remove Partner

	#====== Start Prepare data ==========
    
	${valueType}=    Set Variable    ${VALUE_TYPE_KEEPING}
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

	${HouseKeeperName}=    Set Variable    ${createResponse}[7]
    Log To Console    HouseKeeperName is : ${HouseKeeperName}

	${valueBindingKey}=    Set Variable    ${CustomerId}

    #DeleteAHouseKeeper
	${postDeleteAHouseKeeper}=    DeleteAHouseKeeper    ${URL}    ${HouseKeeperId}
    Log To Console    DeleteAHouseKeeper is : ${postDeleteAHouseKeeper}

	#====== End Prepare data ==========

	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    #Headers
	${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_DELETEAHOUSEKEEPER_FAIL}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_DELETEAHOUSEKEEPER}    Accept=${HEADER_ACCEPT}  
	Log To Console    Headers is : ${headers}
		
	${urlDeleteAHouseKeeper}=    Replace String    ${URL_DELETEAHOUSEKEEPER}    id    ${HouseKeeperId}
    Log To Console    urlDeleteAHouseKeeper is : ${urlDeleteAHouseKeeper}

    #Response
    ${res}=    Run keyword And Continue On Failure    Delete Api Request Not Data    ${URL}${SUPPORTADMIN}    ${urlDeleteAHouseKeeper}    ${headers}
	Log To Console    Response is : ${res}

    ${checkReponse}=    Run keyword And Continue On Failure    Response ResultCode Should Have Error    ${res}    ${DELETEAHOUSEKEEPER}   ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}    ${VALUE_LOG_CODE_40400}    ${VALUE_DESCRIPTION_REQUESTED_OPERATION_COULDNOTBEFOUND_ERROR}
    Log To Console    checkReponse is : ${checkReponse}

    ${pathUrl}=    Set Variable    ${VALUE_HOUSEKEEPER_URL}/${HouseKeeperId}
	${dataSearch}=    Set Variable    ${HEADER_X_AIS_ORDERREF_DELETEAHOUSEKEEPER_FAIL}${current_timestamp}

	${endPointName}=    Set Variable    null
	${custom}=    Set Variable    null
	${customDetailDB}=    Set Variable    null
    ${responseObjectDetail}=    Set Variable    null

	#====== Check log and Verify DB ==========

	#Check log detail and summary
    Log DeleteAHouseKeeper Error    ${VALUE_LOG_CODE_40400}    ${VALUE_DESCRIPTION_REQUESTED_OPERATION_COULDNOTBEFOUND_ERROR}    ${VALUE_LOG_CODE_40400}    ${VALUE_DESCRIPTION_REQUESTED_OPERATION_COULDNOTBEFOUND_ERROR}    ${res}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${accessToken}    ${AccountId}

    [Teardown]    Generic Test Case Teardown    ${PARTNERACCOUNT}    ${createResponse}    null
    


