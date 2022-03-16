*** Keywords ***	
################################################################-- Do Have EndPointName --################################################################
#-------------------------------------------- HouseKeeper --------------------------------------------#	
#-------------------------------------------- HouseKeeper : RequestObject --------------------------------------------#	
Check RequestObject App Success HouseKeeper	
    [Arguments]    ${dataResponse}    ${pathUrl}    ${tid}    ${body}    ${response}    ${accessToken}    ${accountId}    ${cmdName}    ${code}    ${description}
	# Log To Console    pathUrl${pathUrl}
	# ""{"url":"[valuePathUrl]","method":"[method]","headers":{"host":"[host]","x-real-ip":"[x-real-ip]","x-forwarded-for":"[x-forwarded-for]", 
	# "x-forwarded-proto":"[x-forwarded-proto]","content-length":"[content-length]","user-agent":"[user-agent]","accept-encoding":"[accept-encoding]",
	# "accept":"*/*","content-type":"[content-type]","x-ais-username":"AisPartner","x-ais-orderref":"[tid]","x-ais-orderdesc":"[Orderdesc]",
	# "x-ais-accesstoken":"[AccessToken]","x-envoy-external-address":"[x-envoy-external-address]","x-request-id":"[x-request-id]",
	# "x-envoy-original-path":"[x-envoy-original-path]","x-b3-traceid":"[x-b3-traceid]","x-b3-spanid":"[x-b3-spanid]","x-b3-parentspanid":"[x-b3-parentspanid]",
	# "x-b3-sampled":"[x-b3-sampled]","startTime":[startTime] },"routeParameters":[routeParameters],"queryString":[queryString],"body":[body]}""

	${method}=    Set Variable If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_CREATEAHOUSEKEEPER}'    ${NAME_SESSION_POST}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_UPDATEAHOUSEKEEPER}'    ${NAME_SESSION_PUT}    
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_DELETEAHOUSEKEEPER}'    ${NAME_SESSION_DELETE}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_GETAHOUSEKEEPERBYID}'    ${NAME_SESSION_GET}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_GETALISTHOUSEKEEPER}'    ${NAME_SESSION_GET}

	# Log To Console    method${method}

	${orderdesc}=    Set Variable If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_CREATEAHOUSEKEEPER}'    ${HEADER_X_AIS_ORDERDESC_CREATEAHOUSEKEEPER}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_UPDATEAHOUSEKEEPER}'    ${HEADER_X_AIS_ORDERDESC_UPDATEAHOUSEKEEPER}    
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_DELETEAHOUSEKEEPER}'    ${HEADER_X_AIS_ORDERDESC_DELETEAHOUSEKEEPER}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_GETAHOUSEKEEPERBYID}'    ${HEADER_X_AIS_ORDERDESC_GETAHOUSEKEEPERBYID}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_GETALISTHOUSEKEEPER}'    ${HEADER_X_AIS_ORDERDESC_GETALISTHOUSEKEEPER}

    # Log To Console    orderdesc${orderdesc}

	${requestObjectData}=    Set Variable    ${dataResponse['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']}
    # Log To Console    requestObjectData${requestObjectData}

	${HouseKeeperInfo}=    Set Variable If    '${code}'=='${VALUE_LOG_CODE_20000}' and '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_CREATEAHOUSEKEEPER}'     ${response['HouseKeeperInfo']}
    ...    '${code}'=='${VALUE_LOG_CODE_20000}' and '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_UPDATEAHOUSEKEEPER}'     ${response['HouseKeeperInfo']}
	...    '${code}'=='${VALUE_LOG_CODE_20000}' and '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_DELETEAHOUSEKEEPER}'    ${EMPTY} 
	...    '${code}'=='${VALUE_LOG_CODE_20000}' and '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_GETAHOUSEKEEPERBYID}'    ${EMPTY}  
	...    '${code}'=='${VALUE_LOG_CODE_20000}' and '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_GETALISTHOUSEKEEPER}'    ${EMPTY}  
	...    '${code}'!='${VALUE_LOG_CODE_20000}'    ${EMPTY}     
    # Log To Console    HouseKeeperInfo${HouseKeeperInfo}
    
	${CreatedDateTime}=    Set Variable If    '${code}'=='${VALUE_LOG_CODE_20000}' and '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_CREATEAHOUSEKEEPER}'     ${HouseKeeperInfo['CreatedDateTime']}
    ...    '${code}'=='${VALUE_LOG_CODE_20000}' and '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_UPDATEAHOUSEKEEPER}'    ${HouseKeeperInfo['CreatedDateTime']}
	...    '${code}'=='${VALUE_LOG_CODE_20000}' and '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_DELETEAHOUSEKEEPER}'    ${EMPTY} 
	...    '${code}'=='${VALUE_LOG_CODE_20000}' and '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_GETAHOUSEKEEPERBYID}'    ${EMPTY}  
	...    '${code}'=='${VALUE_LOG_CODE_20000}' and '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_GETALISTHOUSEKEEPER}'    ${EMPTY}  
	...    '${code}'!='${VALUE_LOG_CODE_20000}'    ${EMPTY}     
    # Log To Console    CreatedDateTime${CreatedDateTime}
    ${Id}=    Remove String    ${pathUrl}    ${VALUE_HOUSEKEEPER_URL}/
 
	${resp_json}=    Evaluate    json.loads(r'''${requestObjectData}''')    json
	# Log To Console    resp_json${resp_json['headers']['x-real-ip']}
# 
	${routeParameters}=    Set Variable If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_CREATEAHOUSEKEEPER}'    {}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_UPDATEAHOUSEKEEPER}' and '${pathUrl}'!='${VALUE_HOUSEKEEPER_URL}/${VALUE_HOUSEKEEPER_ID_INVALID}'    {"id":"${Id}"}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_UPDATEAHOUSEKEEPER}' and '${pathUrl}'=='${VALUE_HOUSEKEEPER_URL}/${VALUE_HOUSEKEEPER_ID_INVALID}'    {"id":" "}
    ...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_DELETEAHOUSEKEEPER}'    {"id":"${Id}"}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_GETAHOUSEKEEPERBYID}'    {"id":"${Id}"}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_GETALISTHOUSEKEEPER}'    {}

    # Log To Console    routeParameters${routeParameters}
	${bodyCheck}=    Set Variable If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_GETAHOUSEKEEPERBYID}'    {}
    ...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_GETALISTHOUSEKEEPER}'    {}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_CREATEAHOUSEKEEPER}'    ${body}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_UPDATEAHOUSEKEEPER}'    ${body}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_DELETEAHOUSEKEEPER}'    ${body}
    # Log To Console    bodyCheck${bodyCheck}
	${queryString}=    Set Variable    {}
	${host}=    Set Variable    ${resp_json['headers']['host']}
	${xRealIp}=    Set Variable    ${resp_json['headers']['x-real-ip']}
	${xForwardedFor}=    Set Variable    ${resp_json['headers']['x-forwarded-for']}
	${xForwardedProto}=    Set Variable    ${resp_json['headers']['x-forwarded-proto']}
	${contentLength}=    Set Variable    ${resp_json['headers']['content-length']}
	${userAgent}=    Set Variable    ${resp_json['headers']['user-agent']}
	${acceptEncoding}=    Set Variable    ${resp_json['headers']['accept-encoding']}
	${contentType}=    Set Variable    ${resp_json['headers']['content-type']}
	${xEnvoyExternalAddress}=    Set Variable    ${resp_json['headers']['x-envoy-external-address']}
	${xRequestId}=    Set Variable    ${resp_json['headers']['x-request-id']}
	${xEnvoyOriginalPath}=    Set Variable    ${resp_json['headers']['x-envoy-original-path']}
	${xB3Traceid}=    Set Variable    ${resp_json['headers']['x-b3-traceid']}
	${xB3Spanid}=    Set Variable    ${resp_json['headers']['x-b3-spanid']}
	${xB3Parentspanid}=    Set Variable    ${resp_json['headers']['x-b3-parentspanid']}
	${xB3Sampled}=    Set Variable    ${resp_json['headers']['x-b3-sampled']}
	${startTime}=    Set Variable    '${resp_json['headers']['startTime']}'

    ${valueReplace}=    Set Variable If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_CREATEAHOUSEKEEPER}'    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_PROVISIONING_HOUSEKEEPER}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_UPDATEAHOUSEKEEPER}'    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_PROVISIONING_HOUSEKEEPER}    
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_DELETEAHOUSEKEEPER}'    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_PROVISIONING_HOUSEKEEPER}       
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_GETAHOUSEKEEPERBYID}'    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_PROVISIONING_HOUSEKEEPER_GETAHOUSEKEEPERBYID}    
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_GETALISTHOUSEKEEPER}'    ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_PROVISIONING_HOUSEKEEPER_GETAHOUSEKEEPERBYID}    
	
	${replaceUrl}=    Replace String    ${valueReplace}    [valuePathUrl]    ${pathUrl}
	${replaceTid}=    Replace String    ${replaceUrl}    [tid]    ${tid}
	${replaceBody}=    Replace String    ${replaceTid}    [body]    ${bodyCheck}
	${replaceMethod}=    Replace String    ${replaceBody}    [method]    ${method}
	${replaceOrderdesc}=    Replace String    ${replaceMethod}    [Orderdesc]    ${orderdesc}
	${replaceHost}=    Replace String    ${replaceOrderdesc}    [host]    ${host}
	${replaceXrealIp}=    Replace String    ${replaceHost}    [x-real-ip]    ${xRealIp}
	${replaceXforwardedFor}=    Replace String    ${replaceXrealIp}    [x-forwarded-for]    ${xForwardedFor}
	${replaceXforwardedProto}=    Replace String    ${replaceXforwardedFor}    [x-forwarded-proto]    ${xForwardedProto}
	${replaceContentLength}=    Replace String    ${replaceXforwardedProto}    [content-length]    ${contentLength}
	${replaceUserAgent}=    Replace String    ${replaceContentLength}    [user-agent]    ${userAgent}
	${replaceAcceptEncoding}=    Replace String    ${replaceUserAgent}    [accept-encoding]    ${acceptEncoding}
	${replaceContentType}=    Replace String    ${replaceAcceptEncoding}    [content-type]    ${contentType}
	${replaceXenvoyExternalAddress}=    Replace String    ${replaceContentType}    [x-envoy-external-address]    ${xEnvoyExternalAddress}
	${replaceXrequestId}=    Replace String    ${replaceXenvoyExternalAddress}    [x-request-id]    ${xRequestId}
	${replaceXenvoyOriginalPath}=    Replace String    ${replaceXrequestId}    [x-envoy-original-path]    ${xEnvoyOriginalPath}
	${replaceXb3Traceid}=    Replace String    ${replaceXenvoyOriginalPath}    [x-b3-traceid]    ${xB3Traceid}
	${replaceXb3Spanid}=    Replace String    ${replaceXb3Traceid}    [x-b3-spanid]    ${xB3Spanid}
	${replaceXb3Parentspanid}=    Replace String    ${replaceXb3Spanid}    [x-b3-parentspanid]    ${xB3Parentspanid}
	${replaceXb3Sampled}=    Replace String    ${replaceXb3Parentspanid}    [x-b3-sampled]    ${xB3Sampled}
	${replaceStartTime}=    Replace String    ${replaceXb3Sampled}    [startTime]    ${startTime}
	${replaceRouteParameters}=    Replace String    ${replaceStartTime}    [routeParameters]    ${routeParameters}
	${replaceCreatedDateTime}=    Replace String    ${replaceRouteParameters}    [CreatedDateTime]    ${CreatedDateTime}
	${replaceQueryString}=    Replace String    ${replaceCreatedDateTime}    [queryString]    ${queryString}
	${replaceText}=    Replace String    ${replaceQueryString}    '    ${EMPTY}
	${requestObject}=    Replace String To Object    ${replaceText}
	# Log To Console    dataResponse${dataResponse}
	# Log To Console    HouseKeeperRequestObjectApp${requestObject}

	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_REQUESTOBJECT}']    ${requestObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_REQUESTOBJECT}

#-------------------------------------------- Provisioning HouseKeeper : ResponseObject --------------------------------------------#	
Check ResponseObject App Success HouseKeeper	
    [Arguments]    ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${accessToken}    ${accountId}    ${cmdName}
	#"{ "OperationStatus":{ "Code":"[Code]", "DeveloperMessage":"[Description]" }, "HouseKeeperInfo":{ "Id":"[Id]", "ConditionProperties":[ { "Type":"[ConditionPropertiesType]", "Value":[ConditionPropertiesValue] } ], "Type":"[Type]", "Name":"[Name]", "BindingType":"[BindingType]", "BindingKey":"[BindingKey]", "CreatedDateTime":"[CreatedDateTime]", "LastUpdatedTimestamp":"[LastUpdatedTimestamp]" } }"

	${HouseKeeperInfo}=    Set Variable If    '${cmdName}'!='${VALUE_LOG_SUMMARY_CMDNAME_GETAHOUSEKEEPERBYID}'    ${response['HouseKeeperInfo']}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_GETAHOUSEKEEPERBYID}'    ${response['HousekeepersInfo'][0]}
    # Log To Console    HouseKeeperInfo${HouseKeeperInfo}

	${Id}=    Set Variable     ${HouseKeeperInfo['Id']}
	${CreatedDateTime}=    Set Variable     ${HouseKeeperInfo['CreatedDateTime']}
	${LastUpdatedTimestamp}=    Set Variable     ${HouseKeeperInfo['LastUpdatedTimestamp']}

    ${body}=    Set Variable     ${body}
	# Log To Console    body${body}

	${resp_json}=    Evaluate    json.loads(r'''${body}''')    json
	# Log To Console    resp_json${resp_json}

	${Name}=    Set Variable     ${resp_json['Name']}
	${Type}=    Set Variable     ${resp_json['Type']}
	${BindingType}=    Set Variable     ${resp_json['BindingType']}
	${BindingKey}=    Set Variable     ${resp_json['BindingKey']}

    # ConditionProperties
    ${data_count}=    Get Length    ${resp_json['ConditionProperties']}
	# Log To Console    data_count${data_count}  
	@{valArrData}=    Create List
	FOR    ${i}    IN RANGE    ${data_count}
	    ${conditionPropertiesType}=    Set Variable     ${resp_json['ConditionProperties'][${i}]['Type']}

	    ${data}=    Set Variable If    '${conditionPropertiesType}'!='${VALUE_CONDITIONPROPERTIES_TYPE_DATETIME}'    {"Type":"${conditionPropertiesType}","Value":${resp_json['ConditionProperties'][${i}]['Value']}}
        ...    '${conditionPropertiesType}'=='${VALUE_CONDITIONPROPERTIES_TYPE_DATETIME}'    {"Type":"${conditionPropertiesType}","StartDate":"${resp_json['ConditionProperties'][${i}]['StartDate']}","EndDate":"${resp_json['ConditionProperties'][${i}]['EndDate']}"}                   
        Append To List    ${valArrData}    ${data}        #Add data to array set at valArrData
	END

	# Log To Console    valArrData${valArrData}
    ${replaceValArrData}=    Replace String    '${valArrData}'    '    "
	${replaceValArrData}=    Replace String    '${replaceValArrData}'    ${SPACE}    ${EMPTY}
    # Log To Console    replaceValArrData${replaceValArrData}
	
	${valueReplace}=    Set Variable If    '${cmdName}'!='${VALUE_LOG_SUMMARY_CMDNAME_GETAHOUSEKEEPERBYID}'    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_PROVISIONING_HOUSEKEEPER}
	...    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_GETAHOUSEKEEPERBYID}'    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_PROVISIONING_HOUSEKEEPER_GETAHOUSEKEEPERBYID}    
	
	${replaceCode}    Replace String    ${valueReplace}    [Code]    ${code}  
	${replaceDescription}=    Replace String    ${replaceCode}    [Description]    ${description}
	${replaceId}=    Replace String    ${replaceDescription}    [Id]    ${Id}
	${replaceConditionProperties}=    Replace String    ${replaceId}    [ConditionProperties]    ${replaceValArrData}
	
	# ${replaceConditionPropertiesType}=    Replace String    ${replaceId}    [ConditionPropertiesType]    ${ConditionPropertiesType}
	# ${replaceConditionPropertiesValue}=    Replace String    ${replaceConditionPropertiesType}    [ConditionPropertiesValue]    ${ConditionPropertiesValue}
	${replaceType}=    Replace String    ${replaceConditionProperties}    [Type]    ${Type}
	${replaceName}=    Replace String    ${replaceType}    [Name]    ${Name}
	${replaceBindingType}=    Replace String    ${replaceName}    [BindingType]    ${BindingType}
	${replaceBindingKey}=    Replace String    ${replaceBindingType}    [BindingKey]    ${BindingKey}
	${replaceCreatedDateTime}=    Replace String    ${replaceBindingKey}    [CreatedDateTime]    ${CreatedDateTime}
	${replaceLastUpdatedTimestamp}=    Replace String    ${replaceCreatedDateTime}    [LastUpdatedTimestamp]    ${LastUpdatedTimestamp}
	${replaceText}=    Replace String    ${replaceLastUpdatedTimestamp}    '    ${EMPTY}
	${replaceText}=    Replace String    ${replaceText}    "[    [
	${replaceText}=    Replace String    ${replaceText}    ]"    ]
    ${responseObject}=    Replace String To Object    ${replaceText}

	# Log To Console    HouseKeeperresponseObject${responseObject}
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_RESPONSEOBJECT}']    ${responseObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_RESPONSEOBJECT}

##############################################################################################################################################################
