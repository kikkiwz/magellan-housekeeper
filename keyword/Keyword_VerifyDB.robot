*** Keywords ***
    # Connect To Mongodb    mongodb://admin:ais.co.th@52.163.210.190:27018/mgcore?authSource=admin

Request Verify DB Check Data HouseKeepers
    [Arguments]      ${flow}    ${Name}    ${body}   ${HouseKeeperId}    ${PartnerId}    ${CustomerId}    ${AccountId}    ${dataConditionPropertiesDB}

	${data}=    Set Variable    {"Name" : "${Name}"}

	${value_fields}=    Set Variable    null

    ${result}=    Start Connect To Mongodb    ${MONGODB_TYPE_ALL}    ${data}    ${value_fields}    ${MONGODB_DBNAME_MGCORE}    ${MONGODB_DBCOLLNAME_TB_HOUSEKEEPERS}
    Log To Console    result Request Verify DB Check Data HouseKeepers: ${result}

	${RemoveStatus}=    Set Variable If    '${flow}'=='${DELETEAHOUSEKEEPER}'    True
	...    '${flow}'!='${DELETEAHOUSEKEEPER}'    False
    # Log To Console    ${RemoveStatus}

	${Type}=    Set Variable    ${body['Type']}
	${ConditionProperties}=    Set Variable    ${body['ConditionProperties']}
	${BindingType}=    Set Variable    ${body['BindingType']}
	${BindingKey}=    Convert To String    ${body['BindingKey']}
	${Name}=    Convert To String    ${body['Name']}

	${Resource}=    Set Variable If    '${BindingType}'=='${VALUE_BINDINGTYPE_PRETENANT}'    {'CustomerId': ObjectId('${BindingKey}'), 'TenantId': None, 'AccountId': None, 'ThingId': None}
    ...    '${BindingType}'=='${VALUE_BINDINGTYPE_PREACCOUNT}'    	{'CustomerId': ObjectId('${CustomerId}'), 'TenantId': ObjectId('${BindingKey}'), 'AccountId': None, 'ThingId': None}
	...    '${BindingType}'=='${VALUE_BINDINGTYPE_PRETHING}'    	{'CustomerId': ObjectId('${CustomerId}'), 'TenantId': ObjectId('${PartnerId}'), 'AccountId': ObjectId('${BindingKey}'), 'ThingId': None}

    ${Status}=    Set Variable    Disable
    # ${Status}=    Set Variable If    '${BindingType}'=='${VALUE_BINDINGTYPE_PRETENANT}'    Disable
    # ...    '${BindingType}'=='${VALUE_BINDINGTYPE_PREACCOUNT}'    	{'CustomerId': None, 'TenantId': ObjectId('611dde49558026000167784a'), 'AccountId': None}
	
	# 2021-07-22 13:34:00.630000 -> 2021, 7, 22, 13, 34, 0, 630000
	# Log To Console    CreatedDateTime: ${result['CreatedDateTime']}
	# Log To Console    LastUpdatedTimestamp: ${result['LastUpdatedTimestamp']}
    ${dateCreatedDateTime}=    Convert Format Date MongoDB    ${result['CreatedDateTime']}
    # Log To Console    dateCreatedDateTime : ${dateCreatedDateTime}
    ${dateLastUpdatedTimestamp}=    Convert Format Date MongoDB    ${result['LastUpdatedTimestamp']}
    # Log To Console    dateLastUpdatedTimestamp : ${dateLastUpdatedTimestamp}

    ${replaceHouseKeeperId}=    Replace String    ${VALUE_DB_HOUSEKEEPER}    [HouseKeeperId]    ${HouseKeeperId}
	${replaceRemoveStatus}=    Replace String    ${replaceHouseKeeperId}    [RemoveStatus]    ${RemoveStatus}
	${replaceName}=    Replace String    ${replaceRemoveStatus}    [Name]    ${Name}
	${replaceConditionProperties}=    Replace String    ${replaceName}    [ConditionProperties]    ${dataConditionPropertiesDB}
	${replaceType}=    Replace String    ${replaceConditionProperties}    [Type]    ${Type}
	${replaceBindingType}=    Replace String    ${replaceType}    [BindingType]    ${BindingType}
	${replaceBindingKey}=    Replace String    ${replaceBindingType}    [BindingKey]    ${BindingKey}
	${replaceResource}=    Replace String    ${replaceBindingKey}    [Resource]    ${Resource}
	${replaceStatus}=    Replace String    ${replaceResource}    [Status]    ${Status}
	${replaceCreatedDateTime}=    Replace String    ${replaceStatus}    [CreatedDateTime]    ${dateCreatedDateTime}
	${replaceLastUpdatedTimestamp}=    Replace String    ${replaceCreatedDateTime}    [LastUpdatedTimestamp]    ${dateLastUpdatedTimestamp}
	${resultDB}=    Replace String To Object    ${replaceLastUpdatedTimestamp}
	# Log To Console    resultDB Request Verify DB Check Data HouseKeepers : ${resultDB}
	${strResult}=    Convert To String    ${result}
	Run Keyword And Continue On Failure    Should Be Equal    ${strResult}    ${resultDB}    error=Verify DB HouseKeepers	

