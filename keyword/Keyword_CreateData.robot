*** Keywords ***
Signin
    [Arguments]    ${url}    ${username}    ${password}
    ${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    ${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-UserName=${HEADER_X_AIS_USERNAME_AISPARTNER}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_SIGNIN}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_SIGNIN}    Accept=${HEADER_ACCEPT}  
    ${data}=    Evaluate    {"username": "${username}","password": "${password}"}   
	${res}=    Run keyword And Continue On Failure    Post Api Request    ${url}${PROVISIONINGAPIS}    ${URL_SIGNIN}    ${headers}    ${data}
	Log To Console    Response Signin : ${res}
	Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${SINGNIN}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DESCRIPTION}
	#accessToken
	${accessToken}=    Get From Dictionary    ${res}     ${FIELD_ACCESSTOKEN}
	#Log To Console    ${accessToken}
	[return]    ${accessToken}

ValidateToken
    [Arguments]    ${url}    ${accessToken}
    ${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    ${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-UserName=${HEADER_X_AIS_USERNAME_AISPARTNER}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_VALIDATETOKEN}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_VALIDATETOKEN}    Accept=${HEADER_ACCEPT}  
	#Log To Console    ${headers}
	
    ${data}=    Evaluate    {"AccessToken": "${accessToken}"}   
	${res}=    Run keyword And Continue On Failure    Post Api Request    ${url}${PROVISIONINGAPIS}    ${URL_VALIDATETOKEN}    ${headers}    ${data}
	Log To Console    Response ValidateToken : ${res}
	Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${VALIDATETOKEN}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DESCRIPTION}
	
Create Partner
    [Arguments]    ${url}    ${accessToken}
    #Generate Random number
    ${random_number}=    generate random string    6    [NUMBERS]
	#PartnerName
	${PartnerName}=    Set Variable    ${VALUE_PARTNERNAME}${random_number}
	#MerchantContact
	${MerchantContact}=    Set Variable    ${VALUE_MERCHANTCONTACT}
	#CPID
	${CPID}=    Set Variable    ${VALUE_CPID}
	
	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    ${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-UserName=${HEADER_X_AIS_USERNAME_AISPARTNER}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_CREATEPARTNER}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_CREATEPARTNER}    x-ais-AccessToken=Bearer ${accessToken}    Accept=${HEADER_ACCEPT}  
	#Log To Console    ${headers}
				
    ${data}=    Evaluate    {"PartnerName": "${PartnerName}","PartnerType": ["Supplier","Customer"],"PartnerDetail": {"MerchantContact": "${MerchantContact}","CPID": "${CPID}"},"Property": {"RouteEngine": "false"}}   
    #Log To Console    ${data}

    ${res}=    Run keyword And Continue On Failure    Post Api Request    ${url}${PROVISIONINGAPIS}    ${URL_CREATEPARTNER}    ${headers}    ${data}
    Log To Console    Response Create Partner : ${res}
	Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${CREATEPARTNER}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DESCRIPTION}
	
	#GetResponse_PartnerId
    ${PartnerInfo}=    Get From Dictionary    ${res}     ${FIELD_PARTNERINFO}   
    # Log To Console    ${PartnerInfo}	
	${GetResponse_PartnerId}=    Get From Dictionary    ${PartnerInfo}     ${FIELD_PARTNERID}    
	# Log To Console    ${GetResponse_PartnerId}	
	${GetResponse_CustomerId}=    Get From Dictionary    ${PartnerInfo}     ${FIELD_CUSTOMERID}
    ${PartnerType}=    Set Variable     ${PartnerInfo['PartnerType']}
	${setPartnerTypeArr}=    Set Variable    '${PartnerType}[0]', '${PartnerType}[1]' 
    ${Property}=    Set Variable     ${PartnerInfo['Property']}
	${RouteEngine}=    Set Variable    ${Property['RouteEngine']}
    #AccountName
    ${AccountName}=    Set Variable    ${VALUE_ACCOUNTNAME}${random_number}
    #Log To Console    ${AccountName}
    #ConfigGroupName
    ${ConfigGroupName}=    Set Variable    ${VALUE_CONFIGGROUPNAME}${random_number}
    #Log To Console    ${ConfigGroupName}
    [Return]    ${GetResponse_PartnerId}    ${AccountName}    ${ConfigGroupName}    ${PartnerName}    ${GetResponse_CustomerId}    ${setPartnerTypeArr}    ${RouteEngine}    ${MerchantContact}    ${CPID}   

Create Account
    [Arguments]    ${url}    ${accessToken}    ${PartnerId}    ${AccountName}
    ${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    ${headers}=    Create Dictionary    Content-Type=${HEADER_CONTENT_TYPE}    x-ais-UserName=${HEADER_X_AIS_USERNAME_AISPARTNER}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_CREATEACCOUNT}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_CREATEACCOUNT}    x-ais-AccessToken=Bearer ${accessToken}    Accept=${HEADER_ACCEPT}
    #Log To Console    ${headers}
    ${randomSensorApp}=    Evaluate    random.randint(100, 999)    random
    ${data}=    Evaluate    {"PartnerID": "${PartnerId}","AccountName": "${AccountName}${randomSensorApp}"}

    #Log To Console    ${data}

    ${res}=    Run keyword And Continue On Failure    Post Api Request    ${url}${PROVISIONINGAPIS}    ${URL_CREATEACCOUNT}    ${headers}    ${data}
	Log To Console    Response Create Account : ${res}
	Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${CREATEACCOUNT}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DESCRIPTION}
	
	#GetResponse_AccountName
    ${PartnerInfo}=    Get From Dictionary    ${res}     ${FIELD_PARTNERINFO}   
    #Log To Console    ${PartnerInfo}	
	${AccountInfo}=    Get From Dictionary    ${PartnerInfo}     ${FIELD_ACCOUNTINFO}  
	#Log To Console    ${AccountInfo}	
	${GetResponse_AccountName}=    Get From Dictionary    ${AccountInfo}[0]     ${FIELD_ACCOUNTNAME}    
	#Log To Console    ${GetResponse_AccountName}
	#GetResponse_AccountId
	${GetResponse_AccountId}=        Get From Dictionary    ${AccountInfo}[0]     ${FIELD_ACCOUNTID}    
    #Log To Console    ${GetResponse_AccountId} 
	
	[return]    ${GetResponse_AccountId}     ${GetResponse_AccountName}    

Create Account Code
    [Arguments]    ${url}    ${accessToken}    ${PartnerId}    ${AccountName}
    ${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    ${headers}=    Create Dictionary    Content-Type=${HEADER_CONTENT_TYPE}    x-ais-UserName=${HEADER_X_AIS_USERNAME_AISPARTNER}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_CREATEACCOUNT}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_CREATEACCOUNT}    x-ais-AccessToken=Bearer ${accessToken}    Accept=${HEADER_ACCEPT}
    #Log To Console    ${headers}
    ${random_number}=    generate random string    6    [NUMBERS]
    #AccountCode
    ${AccountCode}=    Set Variable    ${VALUE_ACCOUNTCODE}${random_number}

    ${data}=    Evaluate    {"PartnerID": "${PartnerId}","AccountName": "${AccountName}${random_number}","AccountCode": "${AccountCode}"}
    #Log To Console    ${data}

    ${res}=    Run keyword And Continue On Failure    Post Api Request    ${url}${PROVISIONINGAPIS}    ${URL_CREATEACCOUNT}    ${headers}    ${data}
	Log To Console    Response Create Account : ${res}
	Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${CREATEACCOUNT}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DESCRIPTION}
	
	#GetResponse_AccountName
    ${PartnerInfo}=    Get From Dictionary    ${res}     ${FIELD_PARTNERINFO}   
    #Log To Console    ${PartnerInfo}	
	${AccountInfo}=    Get From Dictionary    ${PartnerInfo}     ${FIELD_ACCOUNTINFO}  
	#Log To Console    ${AccountInfo}	
	${GetResponse_AccountName}=    Get From Dictionary    ${AccountInfo}[0]     ${FIELD_ACCOUNTNAME}    
	#Log To Console    ${GetResponse_AccountName}
	#GetResponse_AccountId
	${GetResponse_AccountId}=        Get From Dictionary    ${AccountInfo}[0]     ${FIELD_ACCOUNTID}    
    #Log To Console    ${GetResponse_AccountId} 
    #GetResponse_AccountCode
	${GetResponse_AccountCode}=        Get From Dictionary    ${AccountInfo}[0]     ${FIELD_ACCOUNTCODE}    
    #Log To Console    ${GetResponse_AccountCode} 
	
	[return]    ${GetResponse_AccountId}     ${GetResponse_AccountName}    ${GetResponse_AccountCode}    

Create Thing
    [Arguments]    ${url}    ${accessToken}    ${AccountId}    ${AccountName}
    ${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    ${headers}=    Create Dictionary    Content-Type=${HEADER_CONTENT_TYPE}    x-ais-UserName=${HEADER_X_AIS_USERNAME_AISPARTNER}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_CREATETHING}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_CREATETHING}    x-ais-AccessToken=Bearer ${accessToken}    x-ais-AccountKey=${AccountId}    Accept=${HEADER_ACCEPT}
    #Log To Console    ${headers}
    #random_IM
    ${randomIM1}=    Evaluate    random.randint(10000000, 99999999)    random
    ${randomIM2}=    Evaluate    random.randint(1000000, 9999999)    random
    ${random_IM}=    Set Variable    ${randomIM1} ${randomIM2}
    #Log To Console    ${random_IM}
    #random_ICCID
    ${randomICCID1}=    Evaluate    random.randint(1000000, 9999999)    random
    ${randomICCID2}=    Evaluate    random.randint(100000, 999999)    random
    ${random_ICCID}=    Set Variable    ${randomICCID1} ${randomICCID2}
    #Log To Console    ${random_ICCID}
    #ThingName
    ${random_number}=    generate random string    6    [NUMBERS]
	${ThingName}=    Set Variable    ${VALUE_THINGNAME}${random_number}
    #Log To Console    ${ThingName} 

    ${data}=    Evaluate    {"ThingName": "${ThingName}","IMEI": "${random_IM}","IMSI": "${random_IM}","ICCID": "${random_ICCID}","RouteUrl": ${VALUE_ROUTEURL},"RouteInfo": {"MIMO_ID": ${VALUE_ROUTEINFO_MIMO_ID},"MIMO_SerialNo": ${VALUE_ROUTEINFO_MIMO_SERIALNO}},"RouteFlag": {"ThingName": ${VALUE_ROUTEFLAG_THINGNAME},"ThingToken": ${VALUE_ROUTEFLAG_THINGTOKEN},"IMEI": ${VALUE_ROUTEFLAG_IMEI},"ICCID": ${VALUE_ROUTEFLAG_ICCID},"RouteInfo": ${VALUE_ROUTEFLAG_ROUTEINFO}}}   
    #Log To Console    ${data}

    ${res}=    Run keyword And Continue On Failure    Post Api Request    ${url}${PROVISIONINGAPIS}    ${URL_CREATETHING}    ${headers}    ${data}
	#Log To Console    Response Create Thing : ${res}
	Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${CREATETHING}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DESCRIPTION}
	
	#GetResponse_ThingID
    ${ThingInfo}=    Get From Dictionary    ${res}     ${FIELD_THINGINFO}   
    #Log To Console    ${ThingInfo}	
	${GetResponse_ThingID}=    Get From Dictionary    ${ThingInfo}     ${FIELD_THINGID}    
	#Log To Console    ${GetResponse_ThingID}
	${GetResponse_IMSI}=    Get From Dictionary    ${ThingInfo}     ${FIELD_IMSI}    
	#Log To Console    ${GetResponse_IMSI}
	${GetResponse_ThingToken}=    Get From Dictionary    ${ThingInfo}     ${FIELD_THINGTOKEN}  
	#Log To Console    ${GetResponse_ThingToken}
	
	[return]    ${GetResponse_ThingID}    ${GetResponse_IMSI}    ${GetResponse_ThingToken}
	
Create ThingStateInfo
    [Arguments]    ${url}    ${accessToken}    ${AccountId}    ${ThingId}    ${type}    ${SensorKey}
    ${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    ${headers}=    Create Dictionary    Content-Type=${HEADER_CONTENT_TYPE}    x-ais-UserName=${HEADER_X_AIS_USERNAME_AISPARTNER}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_CREATETHINGSTATEINFO}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_CREATETHINGSTATEINFO}    x-ais-AccessToken=Bearer ${accessToken}    x-ais-AccountKey=${AccountId}    Accept=${HEADER_ACCEPT}
    #Log To Console    ${headers}
    #random_Sensor
    ${random_Sensor}=    Evaluate    random.randint(100, 999)    random
    #${random_Sensor}=    Set Variable    ${randomSensor1}
    #Log To Console    ${random_Sensor}
    # ${setThingId}=    Set Variable    ["${ThingId}"]

    ${data}=    Evaluate    {"ThingId": ${ThingId},"Type": "${type}", "Sensor": {"${SensorKey}": "${random_Sensor}"}}
    # Log To Console    ${data}

    ${res}=    Run keyword And Continue On Failure    Post Api Request    ${url}${PROVISIONINGAPIS}    ${URL_CREATETHINGSTATEINFO}    ${headers}    ${data}
	Log To Console    Response Create ThingStateInfo : ${res}
	Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${CREATETHINGSTATEINFO}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DESCRIPTION}
	
	[return]    ${type}    ${SensorKey}    ${random_Sensor}  

Import Thing
    [Arguments]    ${url}    ${accessToken}    ${data}

	#Ex. ${data}=    Evaluate    { "ConnectivityType": "${VALUE_CONNECTIVITYTYPE_NBIOT}", "ThingName": "${ThingName}", "ThingIdentifier": "${ThingIdentifier}", "ThingSecret": "${ThingSecret}", "IMEI": "${IMEI}" }
	# Log To Console    ${data}

    ${data_count}=    Get Length    ${data}
    # Log To Console    ${data_count}
	@{valArrData}=    Create List
	FOR    ${i}    IN RANGE    ${data_count}

        ${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
        ${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_IMPORTTHING}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_IMPORTTHING}  
        #Log To Console    ${headers}

        ${body}=    Evaluate    { "ConnectivityType": "${data[${i}]['ConnectivityType']}", "ThingName": "${data[${i}]['ThingName']}", "ThingIdentifier": "${data[${i}]['ThingIdentifier']}", "ThingSecret": "${data[${i}]['ThingSecret']}"}

        Append To List    ${valArrData}    ${body}        #Add data to array set at valArrData
		
    #Exit For Loop
	END
    
	# Log To Console    ${valArrData}
	${res}=    Run keyword And Continue On Failure    Post Api Request    ${url}${CENTRICAPIS}    ${URL_IMPORTTHING}    ${headers}    ${valArrData}
	Log To Console    Response Import Thing : ${res}
	
	${data_countRes}=    Get Length    ${res}
    # Log To Console    ${data_countRes}
	FOR    ${i}    IN RANGE    ${data_countRes} 
		#status StatusDespcription
    	${status}=    Get From Dictionary    ${res}[${i}]     ${FIELD_STATUS}
		# Log To Console    status${status}
		${StatusDespcription}=    Set Variable   ${res}[${i}][${FIELD_STATUSDESCRIPTION}]
		# Log To Console    StatusDespcription${StatusDespcription}
	    Run keyword And Continue On Failure    Response ResultCode Should Have Success    ${status}    ${StatusDespcription}    ${IMPORTTHING}
	#Exit For Loop
	END
	[return]    ${res}

Mapping IMEI
    [Arguments]    ${url}    ${accessToken}    ${data}

	#Ex. ${data}=    Evaluate    { "ConnectivityType": "${VALUE_CONNECTIVITYTYPE_NBIOT}", "ThingName": "${ThingName}", "ThingIdentifier": "${ThingIdentifier}", "ThingSecret": "${ThingSecret}", "IMEI": "${IMEI}" }
	# Log To Console    ${data}

    ${data_count}=    Get Length    ${data}
    # Log To Console    ${data_count}
	@{valArrData}=    Create List
	FOR    ${i}    IN RANGE    ${data_count}

        ${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
        ${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_MAPPINGIMEI}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_MAPPINGIMEI}  
        #Log To Console    ${headers}

        ${body}=    Evaluate    { "ConnectivityType": "${data[${i}]['ConnectivityType']}", "ThingName": "${data[${i}]['ThingName']}", "ThingIdentifier": "${data[${i}]['ThingIdentifier']}", "ThingSecret": "${data[${i}]['ThingSecret']}", "IMEI": "${data[${i}]['IMEI']}"}

        Append To List    ${valArrData}    ${body}        #Add data to array set at valArrData
		
    #Exit For Loop
	END
    
	# Log To Console    ${valArrData}
	${res}=    Run keyword And Continue On Failure    Post Api Request    ${url}${CENTRICAPIS}    ${URL_MAPPINGIMEI}    ${headers}    ${valArrData}
	Log To Console    Response Mapping IMEI : ${res}
    
	${data_countRes}=    Get Length    ${res}
    # Log To Console    ${data_countRes}
	FOR    ${i}    IN RANGE    ${data_countRes} 
		#status StatusDespcription
    	${status}=    Get From Dictionary    ${res}[${i}]     ${FIELD_STATUS}
		# Log To Console    status${status}
		${StatusDespcription}=    Set Variable   ${res}[${i}][${FIELD_STATUSDESCRIPTION}]
		# Log To Console    StatusDespcription${StatusDespcription}
	    Run keyword And Continue On Failure    Response ResultCode Should Have Success    ${status}    ${StatusDespcription}    ${MAPPINGIMEI}
	#Exit For Loop
	END
	[return]    ${res}
    
Activate Things
    [Arguments]    ${url}    ${WorkerId}    ${ThingIdentifier}    ${ThingSecret}    ${imei}
    ${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    ${headers}=    Create Dictionary    Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_ACTIVATETHINGS}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_ACTIVATETHINGS}
    #Log To Console    ${headers}

    ${data}=    Evaluate    [ { "ThingIdentifier": "${ThingIdentifier}", "ThingSecret": "${ThingSecret}", "IMEI": "${imei}" } ]
    #Log To Console    ${data}

	${replaceUrl}=    Replace String    ${URL_ACTIVATETHINGS_CENTRIC}    {WorkerId}    ${WorkerId}
	# Log To Console    ${replaceUrl}

    ${res}=    Run keyword And Continue On Failure    Post Api Request    ${url}${CENTRICAPIS}    ${replaceUrl}    ${headers}    ${data}
	Log To Console    Response Activate Things : ${res}
	# Response ResultCode Should Have    ${res}    ${ACTIVATETHINGS_CENTRIC}    ${FIELD_OPERATIONSTATUS}    ${FIELD_STATUS}    ${FIELD_STATUSDESCRIPTION}
	${data_count}=    Get Length    ${res}
    # Log To Console    ${data_count}
    FOR    ${i}    IN RANGE    ${data_count}
        #GetResponse_ThingID
        ${status}=    Get From Dictionary    ${res}[${i}]    ${FIELD_STATUS}
        # Log To Console    ${status}
        ${StatusDespcription}=    Set Variable    ${res}[${i}][${FIELD_STATUSDESCRIPTION}]
        # Log To Console    ${StatusDespcription}
        Response ResultCode Should Have Success    ${status}    ${StatusDespcription}    ${ACTIVATETHINGS}
        #Exit For Loop
    END
    # [return]

Activate Thing Core
    [Arguments]    ${url}    ${accessToken}    ${AccountId}    ${data}

	#Ex. ${data}=    Evaluate    { "ConnectivityType": "${VALUE_CONNECTIVITYTYPE_NBIOT}", "ThingName": "${ThingName}", "ThingIdentifier": "${ThingIdentifier}", "ThingSecret": "${ThingSecret}", "IMEI": "${IMEI}" }
	# Log To Console    ${data}
	# Log To Console    ${data[0]['ThingIdentifier']}
    ${data_count}=    Get Length    ${data}
    # Log To Console    ${data_count}
	@{valArrData}=    Create List
	FOR    ${i}    IN RANGE    ${data_count}

        ${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
        ${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-UserName=${HEADER_X_AIS_USERNAME_AISPARTNER}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_ACTIVATETHING_CORE}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_ACTIVATETHING_CORE}    x-ais-AccessToken=Bearer ${accessToken}    x-ais-AccountKey=${AccountId}  
        #Log To Console    ${headers}

        ${body}=    Evaluate    { "ICCID": "${data[${i}]['ThingIdentifier']}", "IMSI": "${data[${i}]['ThingSecret']}", "IMEI": "${data[${i}]['IMEI']}"}

        Append To List    ${valArrData}    ${body}        #Add data to array set at valArrData
		
    #Exit For Loop
	END
    
	# Log To Console    ${valArrData}
	${res}=    Run keyword And Continue On Failure    Post Api Request    ${url}${PROVISIONINGAPIS}    ${URL_ACTIVATETHING_CORE}    ${headers}    ${valArrData}
	Log To Console    Response Activate Thing : ${res}
	Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${ACTIVATETHING_CORE}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DESCRIPTION}
    
	${resActivateThing}=    Set Variable    ${res['${FIELD_ACTIVATETHING}']}
	${data_countRes}=    Get Length    ${resActivateThing}
    # Log To Console    ${data_countRes}
    @{GetResponse_ThingIDArr}=    Create List
	FOR    ${i}    IN RANGE    ${data_countRes} 
		#status StatusDespcription
    	${status}=    Get From Dictionary    ${resActivateThing}[${i}]     ${FIELD_STATUS}
		# Log To Console    status${status}
		Run keyword And Continue On Failure    Should Be Equal As Strings    ${status}    ${VALUE_STATUS_SUCCESS}

		#GetResponse_ThingIDArr
		${resThingId}=    Set Variable   ${resActivateThing}[${i}][${FIELD_THINGID}]
		Append To List    ${GetResponse_ThingIDArr}    ${resThingId}        #Add data to array set at valArrData
		# Log To Console    GetResponse_ThingIDArr${GetResponse_ThingIDArr}

	#Exit For Loop
	END
	[return]    ${GetResponse_ThingIDArr}    ${res}    

TransferThings
    [Arguments]    ${url}    ${accessToken}    ${AccountId}    ${data}    ${AccountId2}

	#Ex. ${data}=    Evaluate    { "ConnectivityType": "${VALUE_CONNECTIVITYTYPE_NBIOT}", "ThingName": "${ThingName}", "ThingIdentifier": "${ThingIdentifier}", "ThingSecret": "${ThingSecret}", "IMEI": "${IMEI}" }
	# Log To Console    ${data}
	# Log To Console    ${data[0]['ThingIdentifier']}
    ${data_count}=    Get Length    ${data}
    # Log To Console    ${data_count}
	@{valArrData}=    Create List
	FOR    ${i}    IN RANGE    ${data_count}

        ${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
        ${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-UserName=${HEADER_X_AIS_USERNAME_AISPARTNER}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_TRANSFERTHINHS}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_TRANSFERTHINHS}    x-ais-AccessToken=Bearer ${accessToken}    x-ais-AccountKey=${AccountId}    x-ais-TransferType=${HEADER_X_AIS_TRANSFERTYPE_ACCOUNTID}    x-ais-TransferValue=${AccountId2}  
        # Log To Console    Headers is : ${headers}
       
        ${body}=    Evaluate    { "ICCID": "${data[${i}]['ThingIdentifier']}", "IMSI": "${data[${i}]['ThingSecret']}", "IMEI": "${data[${i}]['IMEI']}"}

        Append To List    ${valArrData}    ${body}        #Add data to array set at valArrData
		
    #Exit For Loop
	END
    
	# Log To Console    ${valArrData}
	${res}=    Run keyword And Continue On Failure    Post Api Request    ${url}${PROVISIONINGAPIS}    ${URL_TRANSFERTHINHS}    ${headers}    ${valArrData}
	Log To Console    Response Activate Thing : ${res}
	Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${TRANSFERTHINHS}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DESCRIPTION}
    
	${resActivateThing}=    Set Variable    ${res['${FIELD_ACTIVATETHING}']}
	${data_countRes}=    Get Length    ${resActivateThing}
    # Log To Console    ${data_countRes}
    @{GetResponse_ThingIDArr}=    Create List
	FOR    ${i}    IN RANGE    ${data_countRes} 
		#status StatusDespcription
    	${status}=    Get From Dictionary    ${resActivateThing}[${i}]     ${FIELD_STATUS}
		# Log To Console    status${status}
		Run keyword And Continue On Failure    Should Be Equal As Strings    ${status}    ${VALUE_STATUS_SUCCESS}

		#GetResponse_ThingIDArr
		${resThingId}=    Set Variable   ${resActivateThing}[${i}][${FIELD_THINGID}]
		Append To List    ${GetResponse_ThingIDArr}    ${resThingId}        #Add data to array set at valArrData
		# Log To Console    GetResponse_ThingIDArr${GetResponse_ThingIDArr}

	#Exit For Loop
	END
	[return]    ${GetResponse_ThingIDArr}    ${res}    

CreateAHouseKeeper
    [Arguments]    ${url}    ${Type}    ${BindingType}    ${BindingKey}    ${ConditionProperties}

    #HouseKeeperName
    ${random_number}=    generate random string    6    [NUMBERS]
	${HouseKeeperName}=    Set Variable    ${VALUE_HOUSEKEEPERNAME}${random_number}
    # Log To Console    HouseKeeperName is : ${HouseKeeperName}	

	${valueType}=    Set Variable    ${Type}
	${valueBindingType}=    Set Variable    ${BindingType}
	${valueBindingKey}=    Set Variable    ${BindingKey}
	
	${current_timestamp}=    Change format date now    ${DDMMYYYYHMS_NOW}
    ${headers}=    Create Dictionary        Content-Type=${HEADER_CONTENT_TYPE}    x-ais-OrderRef=${HEADER_X_AIS_ORDERREF_CREATEAHOUSEKEEPER}${current_timestamp}    x-ais-OrderDesc=${HEADER_X_AIS_ORDERDESC_CREATEAHOUSEKEEPER}    Accept=${HEADER_ACCEPT}  
	#Log To Console    ${headers}
				
    # ${ConditionProperties}=    Set Variable    [{"Type":"${typeConditionProperties}","Value":${valueConditionProperties}}]            
    ${data}=    Evaluate    {"Type":"${valueType}","ConditionProperties":${ConditionProperties},"BindingType":"${valueBindingType}","BindingKey":"${valueBindingKey}","Name":"${HouseKeeperName}"}
    # Log To Console    data is : ${data}

    ${res}=    Run keyword And Continue On Failure    Post Api Request    ${url}${SUPPORTADMIN}    ${URL_CREATEAHOUSEKEEPER}    ${headers}    ${data}
    Log To Console    Response Create a House Keeper : ${res}
	Run keyword And Continue On Failure    Response ResultCode Should Have    ${res}    ${CREATEAHOUSEKEEPER}    ${FIELD_OPERATIONSTATUS}    ${FIELD_CODE}    ${FIELD_DEVELOPERMESSAGE}
	
	#GetResponse_HouseKeeperId
    ${HouseKeeperInfo}=    Get From Dictionary    ${res}     ${FIELD_HOUSEKEEPERINFO}   
    #Log To Console    ${HouseKeeperInfo}	
	${GetResponse_HouseKeeperId}=    Get From Dictionary    ${HouseKeeperInfo}     ${FIELD_ID}    
	# Log To Console    HouseKeeperId is : ${GetResponse_HouseKeeperId}

    [Return]    ${GetResponse_HouseKeeperId}    ${HouseKeeperName}

Request CreateData for Signin Partner and Account
    [Arguments]    ${username}    ${password}
    ${accessToken}=    Signin    ${URL}    ${username}    ${password}
    ${postCreatePartner}=    Create Partner    ${URL}    ${accessToken}
    ${postCreateAccount}=    Create Account    ${URL}    ${accessToken}    ${postCreatePartner}[0]    ${postCreatePartner}[1]
    #accessToken,PartnerId,AccountId,AccountName,PartnerName,CustomerId
    [Return]    ${accessToken}    ${postCreatePartner}[0]    ${postCreateAccount}[0]    ${postCreateAccount}[1]    ${postCreatePartner}[3]    ${postCreatePartner}[4]

Request CreateData for Signin Partner Account ImportThing MappingIMEI and ActivateThingCore
    [Arguments]        ${username}    ${password}    ${data}
	${accessToken}=    Signin    ${URL}    ${username}    ${password}
	${postCreatePartner}=    Create Partner    ${URL}    ${accessToken}
	${postCreateAccount}=	Create Account    ${URL}    ${accessToken}    ${postCreatePartner}[0]    ${postCreatePartner}[1]
	${postImportThing}=	   Import Thing    ${URL_CENTRIC}    ${accessToken}    ${data}
	${postMappingIMEI}=	   Mapping IMEI    ${URL_CENTRIC}    ${accessToken}    ${data}
	${postActivateThingCore}=    Activate Thing Core    ${URL}    ${accessToken}    ${postCreateAccount}[0]    ${data}

	#accessToken,PartnerId,AccountId,AccountName,PartnerName,CustomerId,ThingIdArr
    [return]    ${accessToken}    ${postCreatePartner}[0]    ${postCreateAccount}[0]    ${postCreateAccount}[1]    ${postCreatePartner}[3]    ${postCreatePartner}[4]    ${postActivateThingCore}[0]

Request CreateData for Signin Partner Account and CreateAHouseKeeper
    [Arguments]    ${username}    ${password}    ${Type}    ${BindingType}    ${ConditionProperties}
    ${accessToken}=    Signin    ${URL}    ${username}    ${password}
    ${postCreatePartner}=    Create Partner    ${URL}    ${accessToken}
    ${postCreateAccount}=    Create Account    ${URL}    ${accessToken}    ${postCreatePartner}[0]    ${postCreatePartner}[1]

    # custom{tenant{account{thing{}}}}
    ${BindingKey}=    Set Variable If    '${BindingType}'=='${VALUE_BINDINGTYPE_PRETENANT}'    ${postCreatePartner}[4]    #CustomerId
    ...    '${BindingType}'=='${VALUE_BINDINGTYPE_PREACCOUNT}'    ${postCreatePartner}[0]    #PartnerId
	...    '${BindingType}'=='${VALUE_BINDINGTYPE_PRETHING}'    ${postCreateAccount}[0]    #AccountId

    ${postCreateAHouseKeeper}=    CreateAHouseKeeper    ${URL}    ${Type}    ${BindingType}    ${BindingKey}    ${ConditionProperties}

    #accessToken,PartnerId,AccountId,AccountName,PartnerName,CustomerId,HouseKeeperId,HouseKeeperName
    [Return]    ${accessToken}    ${postCreatePartner}[0]    ${postCreateAccount}[0]    ${postCreateAccount}[1]    ${postCreatePartner}[3]    ${postCreatePartner}[4]    ${postCreateAHouseKeeper}[0]    ${postCreateAHouseKeeper}[1]

 Request CreateData for Signin Partner Account ImportThing MappingIMEI ActivateThingCore and CreateAHouseKeeper
    [Arguments]        ${username}    ${password}    ${data}    ${Type}    ${BindingType}    ${ConditionProperties}
	${accessToken}=    Signin    ${URL}    ${username}    ${password}
	${postCreatePartner}=    Create Partner    ${URL}    ${accessToken}
	${postCreateAccount}=	Create Account    ${URL}    ${accessToken}    ${postCreatePartner}[0]    ${postCreatePartner}[1]
	${postImportThing}=	   Import Thing    ${URL_CENTRIC}    ${accessToken}    ${data}
	${postMappingIMEI}=	   Mapping IMEI    ${URL_CENTRIC}    ${accessToken}    ${data}
	${postActivateThingCore}=    Activate Thing Core    ${URL}    ${accessToken}    ${postCreateAccount}[0]    ${data}

    # custom{tenant{account{thing{}}}}
    ${BindingKey}=    Set Variable If    '${BindingType}'=='${VALUE_BINDINGTYPE_PRETENANT}'    ${postCreatePartner}[4]    #CustomerId
    ...    '${BindingType}'=='${VALUE_BINDINGTYPE_PREACCOUNT}'    ${postCreatePartner}[0]    #PartnerId
	...    '${BindingType}'=='${VALUE_BINDINGTYPE_PRETHING}'    ${postCreateAccount}[0]    #AccountId

    ${postCreateAHouseKeeper}=    CreateAHouseKeeper    ${URL}    ${Type}    ${BindingType}    ${BindingKey}    ${ConditionProperties}

	#accessToken,PartnerId,AccountId,AccountName,PartnerName,CustomerId,ThingIdArr,HouseKeeperId,HouseKeeperName
    [return]    ${accessToken}    ${postCreatePartner}[0]    ${postCreateAccount}[0]    ${postCreateAccount}[1]    ${postCreatePartner}[3]    ${postCreatePartner}[4]    ${postActivateThingCore}[0]    ${postCreateAHouseKeeper}[0]    ${postCreateAHouseKeeper}[1]

Request CreateData for Signin Partner Account CreateAHouseKeeper and CreateAHouseKeeper
    [Arguments]    ${username}    ${password}    ${Type}    ${BindingType}    ${ConditionProperties}    ${Type2}    ${BindingType2}
    ${accessToken}=    Signin    ${URL}    ${username}    ${password}
    ${postCreatePartner}=    Create Partner    ${URL}    ${accessToken}
    ${postCreateAccount}=    Create Account    ${URL}    ${accessToken}    ${postCreatePartner}[0]    ${postCreatePartner}[1]

    # custom{tenant{account{thing{}}}}
    ${BindingKey}=    Set Variable If    '${BindingType}'=='${VALUE_BINDINGTYPE_PRETENANT}'    ${postCreatePartner}[4]    #CustomerId
    ...    '${BindingType}'=='${VALUE_BINDINGTYPE_PREACCOUNT}'    ${postCreatePartner}[0]    #PartnerId
	...    '${BindingType}'=='${VALUE_BINDINGTYPE_PRETHING}'    ${postCreateAccount}[0]    #AccountId

    # custom{tenant{account{thing{}}}}
    ${BindingKey2}=    Set Variable If    '${BindingType2}'=='${VALUE_BINDINGTYPE_PRETENANT}'    ${postCreatePartner}[4]    #CustomerId
    ...    '${BindingType2}'=='${VALUE_BINDINGTYPE_PREACCOUNT}'    ${postCreatePartner}[0]    #PartnerId
	...    '${BindingType2}'=='${VALUE_BINDINGTYPE_PRETHING}'    ${postCreateAccount}[0]    #AccountId

    ${postCreateAHouseKeeper}=    CreateAHouseKeeper    ${URL}    ${Type}    ${BindingType}    ${BindingKey}    ${ConditionProperties}
    ${postCreateAHouseKeeper2}=    CreateAHouseKeeper    ${URL}    ${Type2}    ${BindingType2}    ${BindingKey2}    ${ConditionProperties}
    
    #accessToken,PartnerId,AccountId,AccountName,PartnerName,CustomerId,HouseKeeperId,HouseKeeperName,HouseKeeperId,HouseKeeperName
    [Return]    ${accessToken}    ${postCreatePartner}[0]    ${postCreateAccount}[0]    ${postCreateAccount}[1]    ${postCreatePartner}[3]    ${postCreatePartner}[4]    ${postCreateAHouseKeeper}[0]    ${postCreateAHouseKeeper}[1]    ${postCreateAHouseKeeper2}[0]    ${postCreateAHouseKeeper2}[1]