*** Keywords ***
Remove Partner
    [Arguments]    ${url}    ${accessToken}    ${PartnerId}
	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    ${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-UserName=${HEADER_X_AIS_USERNAME_AISPARTNER}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_REMOVEPARTNER}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_REMOVEPARTNER}    x-ais-AccessToken=Bearer ${accessToken}    Accept=${HEADER_ACCEPT}  
	#Log To Console    ${headers}
				
    ${data}=    Evaluate    {"PartnerId": "${PartnerId}"}   
    #Log To Console    ${data}

    ${res}=    Delete Api Request    ${url}${PROVISIONINGAPIS}    ${URL_REMOVEPARTNER}    ${headers}    ${data}
	Log To Console    RemovePartner Response : ${res}
	${result}=    Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${REMOVEPARTNER}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DESCRIPTION}
    # Log To Console    RemovePartner Result : ${result}
	[return]    ${result}

Remove Account
    [Arguments]    ${url}    ${accessToken}    ${PartnerId}    ${AccountId}
	Log    ${url}
	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    ${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-UserName=${HEADER_X_AIS_USERNAME_AISPARTNER}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_REMOVEACCOUNT}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_REMOVEACCOUNT}    x-ais-AccessToken=Bearer ${accessToken}    Accept=${HEADER_ACCEPT}  
	#Log To Console    ${headers}
				
    ${data}=    Evaluate    {"PartnerID": "${PartnerId}","AccountId": "${AccountId}"}   
    # Log To Console    ${data}

    ${res}=    Delete Api Request    ${url}${PROVISIONINGAPIS}    ${URL_REMOVEACCOUNT}    ${headers}    ${data}
	Log To Console    RemoveAccount Response : ${res}

	${result}=    Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${REMOVEACCOUNT}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DESCRIPTION}
    # Log To Console    RemoveAccount Result : ${result}
	[return]    ${result}

Remove Thing
    [Arguments]    ${url}    ${accessToken}    ${ThingID}    ${AccountId}
	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    ${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-UserName=${HEADER_X_AIS_USERNAME_AISPARTNER}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_REMOVETHING}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_REMOVETHING}    x-ais-AccessToken=Bearer ${accessToken}    x-ais-AccountKey=${AccountId}        Accept=${HEADER_ACCEPT}  
	# Log To Console    ${headers}
		
    ${data}=    Evaluate    {"ThingId": "${ThingID}"}   
    # Log To Console    ${data}

    ${res}=    Delete Api Request    ${url}${PROVISIONINGAPIS}    ${URL_REMOVETHING}    ${headers}    ${data}
	Log To Console    RemoveThing Response : ${res}

	${result}=    Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${REMOVETHING}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DESCRIPTION}
    # Log To Console    RemoveThing Result : ${result}
	[return]    ${result}

Remove ThingStateInfo
    [Arguments]    ${url}    ${accessToken}    ${ThingId}    ${AccountId}    ${Type}    ${SensorKey}

	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    ${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-UserName=${HEADER_X_AIS_USERNAME_AISPARTNER}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_REMOVETHINGSTATEINFO}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_REMOVETHINGSTATEINFO}    x-ais-AccessToken=Bearer ${accessToken}    x-ais-AccountKey=${AccountId}        Accept=${HEADER_ACCEPT}  
	#Log To Console    ${headers}

    ${data}=    Evaluate    {"ThingId": "${ThingId}","stateType": "${Type}", "stateKey": "${SensorKey}"}   
    # Log To Console    ${data}
    ${res}=    Delete Api Request    ${url}${PROVISIONINGAPIS}    ${URL_REMOVETHINGSTATEINFO}    ${headers}    ${data}
	Log To Console    RemoveThingStateInfo Response : ${res}

    ${result}=    Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${REMOVETHINGSTATEINFO}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DESCRIPTION}
    # Log To Console    RemoveThingStateInfo Result : ${result}

	[return]    ${result}

DeleteCustomer
    [Arguments]    ${url}    ${accessToken}    ${AccountId}    ${CustomerId}
	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    ${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-UserName=${HEADER_X_AIS_USERNAME_AISPARTNER}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_DELETECUSTOMER}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_DELETECUSTOMER}    x-ais-AccessToken=Bearer ${accessToken}    x-ais-AccountKey=${AccountId}        Accept=${HEADER_ACCEPT}  
	#Log To Console    ${headers}

    ${data}=    Evaluate    {"customerId": "${CustomerId}"}   
    # Log To Console    ${data}

    ${res}=    Delete Api Request    ${url}${PROVISIONINGAPIS}    ${URL_DELETECUSTOMER}    ${headers}    ${data}
	Log To Console    DeleteCustomer Response : ${res}

	${result}=    Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${DELETECUSTOMER}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DESCRIPTION}
    # Log To Console    DeleteCustomer Result : ${result}
	
	[return]    ${result}

DeleteAHouseKeeper
    [Arguments]    ${url}    ${HouseKeeperId}
	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    ${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_DELETEAHOUSEKEEPER}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_DELETEAHOUSEKEEPER}  
	#Log To Console    ${headers}
				
    ${urlReplace}=    Replace String    ${URL_DELETEAHOUSEKEEPER}    id    ${HouseKeeperId} 
    # Log To Console    ${url}

    ${res}=    Delete Api Request Not Data    ${url}${SUPPORTADMIN}    ${urlReplace}    ${headers}
	Log To Console    DeleteAHouseKeeper Response : ${res}
	${result}=    Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${DELETEAHOUSEKEEPER}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}
    # Log To Console    DeleteAHouseKeeper Result : ${result}
	[return]    ${result}

Partner Request RemoveData
    [Arguments]    ${accessToken}    ${PartnerId}
		
	${postRemovePartner}=    Remove Partner    ${URL}    ${accessToken}    ${PartnerId}

	${result}=    Set Variable If    '${postRemovePartner}'=='true'    true
    ...    '${postRemovePartner}'!='true'    false
    Log To Console    Partner Request RemoveData Result : ${result}
	[return]    ${result}
	
Partner Account Request RemoveData
    [Arguments]    ${accessToken}    ${PartnerId}    ${AccountId}
		
	${postRemoveAccount}=    Remove Account    ${URL}    ${accessToken}    ${PartnerId}    ${AccountId}
	${postRemovePartner}=    Remove Partner    ${URL}    ${accessToken}    ${PartnerId}

	${result}=    Set Variable If    '${postRemoveAccount}'=='true' and '${postRemovePartner}'=='true'    true
    ...    '${postRemoveAccount}'!='true' and '${postRemovePartner}'!='true'    false
    Log To Console    Partner Account Request RemoveData Result : ${result}
	[return]    ${result}

Partner Account and ThingArr Core Request RemoveData
    [Arguments]    ${accessToken}    ${PartnerId}    ${AccountId}    ${ThingIdArr}
		
	${data_count}=    Get Length    ${ThingIdArr}
	# Log To Console    data_count${data_count}  

	FOR    ${i}    IN RANGE    ${data_count}
        ${postRemoveThing}=    Remove Thing    ${URL}    ${accessToken}    ${ThingIdArr}[${i}]    ${AccountId}    
	END
	${postRemoveAccount}=    Remove Account    ${URL}    ${accessToken}    ${PartnerId}    ${AccountId}
	${postRemovePartner}=    Remove Partner    ${URL}    ${accessToken}    ${PartnerId}

	${result}=    Set Variable If    '${postRemoveAccount}'=='true' and '${postRemovePartner}'=='true' and '${postRemoveThing}'=='true'    true
    ...    '${postRemoveAccount}'!='true' and '${postRemovePartner}'!='true' and '${postRemoveThing}'!='true'    false
    Log To Console    Partner Account and ThingArr Core Request RemoveData Result : ${result}
	[return]    ${result}

Partner Account and CreateAHouseKeeper Request RemoveData
    [Arguments]    ${accessToken}    ${PartnerId}    ${AccountId}    ${HouseKeeperId}
	
	${postDeleteAHouseKeeper}=    DeleteAHouseKeeper    ${URL}    ${HouseKeeperId}
	${postRemoveAccount}=    Remove Account    ${URL}    ${accessToken}    ${PartnerId}    ${AccountId}
	${postRemovePartner}=    Remove Partner    ${URL}    ${accessToken}    ${PartnerId}
	
	${result}=    Set Variable If    '${postRemoveAccount}'=='true' and '${postRemovePartner}'=='true' and '${postDeleteAHouseKeeper}'=='true'    true
    ...    '${postRemoveAccount}'!='true' and '${postRemovePartner}'!='true' and '${postDeleteAHouseKeeper}'!='true'    false
    Log To Console    Partner Account and CreateAHouseKeeper Request RemoveData Result : ${result}
	[return]    ${result}

Partner2 Account2 and CreateAHouseKeeper2 Request RemoveData
    [Arguments]    ${accessToken}    ${PartnerId}    ${AccountId}    ${HouseKeeperIdArr}
	
	${countHouseKeeper}=    Get Length    ${HouseKeeperIdArr}
	# Log To Console    countHouseKeeper${countHouseKeeper}  
	FOR    ${i}    IN RANGE    ${countHouseKeeper} 
		${postDeleteAHouseKeeper}=    DeleteAHouseKeeper    ${URL}    ${HouseKeeperIdArr}[${i}] 
	END

	${countAccountId}=    Get Length    ${AccountId}
	# Log To Console    countAccountId${countAccountId}  
	FOR    ${i}    IN RANGE    ${countAccountId} 
		${postRemoveAccount}=    Remove Account    ${URL}    ${accessToken}    ${PartnerId}[${i}]    ${AccountId}[${i}]
	END

	${countPartnerId}=    Get Length    ${PartnerId}
	# Log To Console    countPartnerId${countPartnerId}  
	FOR    ${i}    IN RANGE    ${countPartnerId} 
		${postRemovePartner}=    Remove Partner    ${URL}    ${accessToken}    ${PartnerId}[${i}]
	END
	
	${result}=    Set Variable If    '${postRemoveAccount}'=='true' and '${postRemovePartner}'=='true' and '${postDeleteAHouseKeeper}'=='true'    true
    ...    '${postRemoveAccount}'!='true' and '${postRemovePartner}'!='true' and '${postDeleteAHouseKeeper}'!='true'    false
    Log To Console    Partner Account and CreateAHouseKeeper Request RemoveData Result : ${result}
	[return]    ${result}


Partner Account ThingArr and CreateAHouseKeeper Core Request RemoveData
    [Arguments]    ${accessToken}    ${PartnerId}    ${AccountId}    ${ThingIdArr}    ${HouseKeeperId}
		
	${data_count}=    Get Length    ${ThingIdArr}
	Log To Console    data_count${data_count}  

    ${postDeleteAHouseKeeper}=    DeleteAHouseKeeper    ${URL}    ${HouseKeeperId}
	FOR    ${i}    IN RANGE    ${data_count}
        ${postRemoveThing}=    Remove Thing    ${URL}    ${accessToken}    ${ThingIdArr}[${i}]    ${AccountId}    
	END
	${postRemoveAccount}=    Remove Account    ${URL}    ${accessToken}    ${PartnerId}    ${AccountId}
	${postRemovePartner}=    Remove Partner    ${URL}    ${accessToken}    ${PartnerId}

	${result}=    Set Variable If    '${postRemoveAccount}'=='true' and '${postRemovePartner}'=='true' and '${postRemoveThing}'=='true' and '${postDeleteAHouseKeeper}'=='true'    true
    ...    '${postRemoveAccount}'!='true' and '${postRemovePartner}'!='true' and '${postRemoveThing}'!='true' and '${postDeleteAHouseKeeper}'!='true'    false
    Log To Console    Partner Account and ThingArr Core Request RemoveData Result : ${result}
	[return]    ${result}

Partner and CreateAHouseKeeper Request RemoveData
    [Arguments]    ${accessToken}    ${PartnerId}    ${House KeeperId}
	
	${postDeleteAHouseKeeper}=    DeleteAHouseKeeper    ${URL}    ${HouseKeeperId}
	${postRemovePartner}=    Remove Partner    ${URL}    ${accessToken}    ${PartnerId}
	
	${result}=    Set Variable If    '${postRemovePartner}'=='true' and '${postDeleteAHouseKeeper}'=='true'    true
    ...    '${postRemovePartner}'!='true' and '${postDeleteAHouseKeeper}'!='true'    false

	[return]    ${result}

DeleteAHouseKeeper Request RemoveData
    [Arguments]    ${HouseKeeperId}
		
	${postDeleteAHouseKeeper}=    DeleteAHouseKeeper    ${URL}    ${HouseKeeperId}

	${result}=    Set Variable If    '${postDeleteAHouseKeeper}'=='true'    true
    ...    '${postDeleteAHouseKeeper}'!='true'    false

	[return]    ${result}
