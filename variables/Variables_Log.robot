*** Variables ***

#log
${VALUE_LOG_URL}    mg-iot.siamimo.com

#applicationName : Charging
${VALUE_APPLICATIONNAME_CHARGING}    Insight.Charging.APIs
#applicationName : Centric
# ${VALUE_APPLICATIONNAME_COAP_CENTRIC}    asgardcoap
# ${VALUE_APPLICATIONNAME_MQTT_CENTRIC}    asgardmqtt

# ${VALUE_APPLICATIONNAME_CHARGING}    Insight.Charging.APIs

#namespace
# ${VALUE_LOG_NAMESPACE}    Magellan 
${VALUE_LOG_NAMESPACE}    magellan 

#containerId : ProvisioningAPIs
${VALUE_LOG_CONTAINERID_PROVISIONINGAPIS}    provisioningapis-v132


#-------------------------------------------- Detail Log --------------------------------------------#
#endPointName : ProvisioningAPIs
${DETAIL_ENDPOINTNAME_PROVISIONINGAPIS}    ProvisioningAPIs

#${Api}

#endPointName : Asgard MQTT
${DETAIL_ENDPOINTNAME_RABBITMQ}    RabbitMQ

#endPointName : Charging
${DETAIL_ENDPOINTNAME_ROCSSERVICE}    RocsService

#log Detail
${VALUE_DETAIL}    Detail  
#field log Detail
${FIELD_LOG_DETAIL_SYSTEMTIMESTAP}    systemTimestamp   
${FIELD_LOG_DETAIL_LOGTYPE}    logType  
${FIELD_LOG_DETAIL_LOGLEVEL}    logLevel  
${FIELD_LOG_DETAIL_NAMESPACE}    namespace  
${FIELD_LOG_DETAIL_APPLICATIONNAME}    applicationName  
${FIELD_LOG_DETAIL_CONTAINERID}    containerId
${FIELD_LOG_DETAIL_SESSIONID}    sessionId  
${FIELD_LOG_DETAIL_TID}    tid 
${FIELD_LOG_DETAIL_CUSTOM1}    custom1   
${FIELD_LOG_DETAIL_CUSTOM2}    custom2   
${FIELD_LOG_DETAIL_ENDPOINTNAME}    endPointName
${FIELD_LOG_DETAIL_REQUESTOBJECT}    requestObject
${FIELD_LOG_DETAIL_URL}    url
${FIELD_LOG_DETAIL_HEADERS}    headers
${FIELD_LOG_DETAIL_XAISORDERREF}    x-ais-OrderRef
${FIELD_LOG_DETAIL_BODY}    body
${FIELD_LOG_DETAIL_IMSI}    Imsi
${FIELD_LOG_DETAIL_IPADDRESS}    IpAddress        
${FIELD_LOG_DETAIL_RESPONSEOBJECT}    responseObject
${FIELD_LOG_DETAIL_THINGTOKEN}    ThingToken
${FIELD_LOG_DETAIL_OPERATIONSTATUS}    OperationStatus
${FIELD_LOG_DETAIL_OPERATIONSTATUS_CODE}    Code
${FIELD_LOG_DETAIL_OPERATIONSTATUS_DESCRIPTION}    Description
${FIELD_LOG_DETAIL_ACTIVITYLOG}    activityLog
${FIELD_LOG_DETAIL_ACTIVITYLOG_STARTTIME}    startTime
${FIELD_LOG_DETAIL_ACTIVITYLOG_ENDTIME}    endTime
${FIELD_LOG_DETAIL_ACTIVITYLOG_PROCESSTIME}    processTime

${VALUE_LOG_DETAIL_LOGLEVEL}    info  
${VALUE_LOG_DETAIL_CUSTOM2}    ${NONE}
${VALUE_LOG_DETAIL_VERSION}    v1

#-------------------------------------------- CreateAHouseKeeper --------------------------------------------#
#-------------------------------------------- requestObject and responseObject CreateAHouseKeeper --------------------------------------------#
#'requestObject': '{ "url":"/housekeeper", "method":"POST", "headers":{ "host":"mg-iot.siamimo.com", "x-real-ip":"124.120.201.167", "x-forwarded-for":"124.120.201.167, 10.233.66.0", "x-forwarded-proto":"http", "content-length":"169", "user-agent":"python-requests/2.24.0", "accept-encoding":"gzip, deflate", "accept":"*/*", "content-type":"application/json", "x-ais-username":"AisPartner", "x-ais-orderref":"CreateAHouseKeeper_19082021155635", "x-ais-orderdesc":"CreateAHouseKeeper", "x-ais-accesstoken":"Bearer ibnxnVhs5Rx3IwglWv7/gVA/1TpQnKqAOBAADlRDvYhOpXwmlpYOEb5yfY5aZpoj0YRWRZM26i9HOqtc1fc1jpNDOK5JpISttmMEy59g2py7nLWonDe2YW2OPRGWSowk6+9ZihLU1fZ5d5jAqqrZaKlOAAI3N1TXDNLsHuKcOJMcERbCcaMqRaku+MY4/kzE+eyIdkfwwbjT91S2VQq+Wk2ooMWuLk6/ogqx75KEFBxiblgmidyLo+6CqNghgC2GVhlWhotC0plKVegMrc8SMg==", "x-ais-accountkey":"611e1cc3558026000167c848", "x-envoy-external-address":"10.233.66.0", "x-request-id":"5c2c10c5-9138-44c0-9a78-80f878f49c76", "x-envoy-original-path":"/supportadmin/api/v1/housekeeper", "x-b3-traceid":"ee4986893f0e25fe0f1b2102987b87ac", "x-b3-spanid":"38a3ac3cb99b392c", "x-b3-parentspanid":"0f1b2102987b87ac", "x-b3-sampled":"0", "startTime":1629363395422 }, "routeParameters":{ }, "queryString":{ }, "body":{ "Type":"Keeping", "ConditionProperties":[ { "Type":"Days", "Value":1 } ], "BindingType":"PerTenant", "BindingKey":"611e1cc2558026000167c843", "Name":"SC_Name523928", "Resource":{ "CustomerId":"611e1cc2558026000167c843", "TenantId":null, "AccountId":null } } }'
${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_PROVISIONING_HOUSEKEEPER}    "{"url":"[valuePathUrl]","method":"[method]","headers":{"host":"[host]","x-real-ip":"[x-real-ip]","x-forwarded-for":"[x-forwarded-for]","x-forwarded-proto":"[x-forwarded-proto]","content-length":"[content-length]","user-agent":"[user-agent]","accept-encoding":"[accept-encoding]","accept":"*/*","content-type":"[content-type]","x-ais-orderref":"[tid]","x-ais-orderdesc":"[Orderdesc]","x-envoy-external-address":"[x-envoy-external-address]","x-request-id":"[x-request-id]","x-envoy-original-path":"[x-envoy-original-path]","x-b3-traceid":"[x-b3-traceid]","x-b3-spanid":"[x-b3-spanid]","x-b3-parentspanid":"[x-b3-parentspanid]","x-b3-sampled":"[x-b3-sampled]","startTime":[startTime]},"routeParameters":[routeParameters],"queryString":[queryString],"body":[body]}"

# {"url":"/housekeeper/61263a625cb35f0011fd0729","method":"GET","headers":{"host":"mg-iot.siamimo.com","x-real-ip":"58.8.179.168","x-forwarded-for":"58.8.179.168,10.233.68.0","x-forwarded-proto":"http","user-agent":"python-requests/2.24.0","accept-encoding":"gzip, deflate","accept":"*/*","content-type":"application/json","x-ais-orderref":"GetAHouseKeeperById_25082021194106","x-ais-orderdesc":"GetAHouseKeeperById","x-envoy-external-address":"10.233.68.0","x-request-id":"9dca9ad3-802b-4cbc-ae7a-1f72ed2ea69d","x-envoy-original-path":"/supportadmin/api/v1/housekeeper/61263a625cb35f0011fd0729","content-length":"0","x-b3-traceid":"65303ee64cdedd1899ca6ecf249d9198","x-b3-spanid":"8e4ad1fa15bcad75","x-b3-parentspanid":"99ca6ecf249d9198","x-b3-sampled":"0","startTime":1629895266869},"routeParameters":{"id":"61263a625cb35f0011fd0729"},"queryString":{},"body":{}}

${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_PROVISIONING_HOUSEKEEPER_GETAHOUSEKEEPERBYID}    "{"url":"[valuePathUrl]","method":"[method]","headers":{"host":"[host]","x-real-ip":"[x-real-ip]","x-forwarded-for":"[x-forwarded-for]","x-forwarded-proto":"[x-forwarded-proto]","user-agent":"[user-agent]","accept-encoding":"[accept-encoding]","accept":"*/*","content-type":"[content-type]","x-ais-orderref":"[tid]","x-ais-orderdesc":"[Orderdesc]","x-envoy-external-address":"[x-envoy-external-address]","x-request-id":"[x-request-id]","x-envoy-original-path":"[x-envoy-original-path]","content-length":"[content-length]","x-b3-traceid":"[x-b3-traceid]","x-b3-spanid":"[x-b3-spanid]","x-b3-parentspanid":"[x-b3-parentspanid]","x-b3-sampled":"[x-b3-sampled]","startTime":[startTime]},"routeParameters":[routeParameters],"queryString":[queryString],"body":[body]}"


# { "url":"/housekeeper", "method":"POST", "headers":{ "host":"[host]", "x-real-ip":"[x-real-ip]", "x-forwarded-for":"[x-forwarded-for]", "x-forwarded-proto":"[x-forwarded-proto]", "content-length":"[content-length]", "user-agent":"[user-agent]", "accept-encoding":"[accept-encoding]", "accept":"*/*", "content-type":"[content-type]", "x-ais-username":"AisPartner", "x-ais-orderref":"[tid]", "x-ais-orderdesc":"[Orderdesc]", "x-ais-accesstoken":"[AccessToken]", "x-envoy-external-address":"[x-envoy-external-address]", "x-request-id":"[x-request-id]", "x-envoy-original-path":"[]x-envoy-original-path", "x-b3-traceid":"[x-b3-traceid]", "x-b3-spanid":"[x-b3-spanid]", "x-b3-parentspanid":"[x-b3-parentspanid]", "x-b3-sampled":"[x-b3-sampled]", "startTime":[startTime] }, "routeParameters":[routeParameters], "queryString":[queryString], "body":[body] }
# 'responseObject': '{ "OperationStatus":{ "Code":"20100", "DeveloperMessage":"The requested operation was successfully." }, "HouseKeeperInfo":{ "Id":"611e1cc3afd48f00113d4c4c", "ConditionProperties":[ { "Type":"Days", "Value":1 } ], "Type":"Keeping", "Name":"SC_Name523928", "BindingType":"PerTenant", "BindingKey":"611e1cc2558026000167c843", "CreatedDateTime":"2021-08-19T08:56:35.436Z", "LastUpdatedTimestamp":"2021-08-19T08:56:35.436Z" } }'
# { "OperationStatus":{ "Code":"[Code]", "DeveloperMessage":"[Description]" }, "HouseKeeperInfo":{ "Id":"[Id]", "ConditionProperties":[ { "Type":"[ConditionPropertiesType]", "Value":[ConditionPropertiesValue] } ], "Type":"[Type]", "Name":"[Name]", "BindingType":"[BindingType]", "BindingKey":"[BindingKey]", "CreatedDateTime":"[CreatedDateTime]", "LastUpdatedTimestamp":"[LastUpdatedTimestamp]" } }
${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_PROVISIONING_HOUSEKEEPER}    "{"OperationStatus":{"Code":"[Code]","DeveloperMessage":"[Description]"},"HouseKeeperInfo":{"Id":"[Id]","ConditionProperties":[ConditionProperties],"Type":"[Type]","Name":"[Name]","BindingType":"[BindingType]","BindingKey":"[BindingKey]","CreatedDateTime":"[CreatedDateTime]","LastUpdatedTimestamp":"[LastUpdatedTimestamp]"}}"
${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_PROVISIONING_HOUSEKEEPER_GETAHOUSEKEEPERBYID}    "{"OperationStatus":{"Code":"[Code]","DeveloperMessage":"[Description]"},"HousekeepersInfo":[{"Id":"[Id]","ConditionProperties":[ConditionProperties],"Type":"[Type]","Name":"[Name]","BindingType":"[BindingType]","BindingKey":"[BindingKey]","CreatedDateTime":"[CreatedDateTime]","LastUpdatedTimestamp":"[LastUpdatedTimestamp]"}]}"

# 'requestObject': '{ "url":"mg-iot.siamimo.com/api/v1/Group/CreateGroup", "method":"POST", "headers":{ "x-ais-username":"AisPartner", "x-ais-orderref":"CreateGroup_22072021145248", "x-ais-orderdesc":"CreateGroup", "x-ais-accesstoken":"Bearer ibnxnVhs5Rx3IwglWv7/gVA/1TpQnKqAOBAADlRDvYhOpXwmlpYOEb5yfY5aZpoj0YRWRZM26i9HOqtc1fc1jpNDOK5JpISttmMEy59g2py7nLWonDe2YW2OPRGWSowk6+9ZihLU1fZ5d5jAqqrZaKlOAAI3N1TXDNLsHuKcOJMcERbCcaMqRaku+MY4/kzE+eyIdkfwwbjT91S2VQq+Wk2ooMWuLk6/Uu9eqbowjSNEs94WT27N5Vpp7Hzw/EfJlZbWRJhhYitKVegMrc8SMg==" }, "body":{ "ThingGroupName":"ThingGroupName988256", "ThingId":[ "60f923d0c0b47b0001e8667f", "60f923d0c0b47b0001e86680" ], "CustomDetails":{ "QuasarContentType":"None", "QuasarRefreshTime":0 } } }
# ${VALUE_LOG_DETAIL_REQUESTOBJECT_APP_PROVISIONING_HOUSEKEEPER_ERROR_ACCOUNTKEYMISSING}    "{"url":"[valuePathUrl]","method":"[method]","headers":{"x-ais-username":"AisPartner","x-ais-orderref":"[tid]","x-ais-orderdesc":"[Orderdesc]","x-ais-accesstoken":"[AccessToken]"},"body":[body]}"


# # 'responseObject': '{ "GroupInfo":{ "GroupId":"60f923d0c0b47b0001e86688", "ThingGroupName":"UpdateGroupName988256", "ThingId":[ "60f923d0c0b47b0001e8667f", "60f923d0c0b47b0001e86680" ], "CustomDetails":{ "QuasarContentType":"None", "QuasarRefreshTime":0 } }, "OperationStatus":{ "Code":"20100", "Description":"UpdateGroup is Success" } }'
# ${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_PROVISIONING_UPDATEGROUP}    "{"GroupInfo":{"GroupId":"[GroupId]","ThingGroupName":"[ThingGroupName]","ThingId":[[ThingId]],"CustomDetails":{"QuasarContentType":"[QuasarContentType]","QuasarRefreshTime":[QuasarRefreshTime]}},"OperationStatus":{"Code":"[Code]","Description":"[Description]"}}"

# # 'responseObject': '{ "GroupInfo":[ { "GroupId":"61024e029e5b7b00010628a9", "ThingGroupName":"ThingGroupName094206", "ThingId":[ "61024e029e5b7b00010628a0", "61024e029e5b7b00010628a1" ], "CustomDetails":{ "QuasarContentType":"None", "QuasarRefreshTime":0 } } ], "_Metadata":{ "TotalCount":1, "Limit":10000, "OffSet":0 }, "OperationStatus":{ "Code":"20000", "Description":"InquiryGroup is Success" } }'
# ${VALUE_LOG_DETAIL_RESPONSEOBJECT_APP_PROVISIONING_INQUIRYGROUP}    "{"GroupInfo":[{"GroupId":"[GroupId]","ThingGroupName":"[ThingGroupName]","ThingId":[[ThingId]],"CustomDetails":{"QuasarContentType":"[QuasarContentType]","QuasarRefreshTime":[QuasarRefreshTime]}}],"_Metadata":{"TotalCount":1,"Limit":10000,"OffSet":0},"OperationStatus":{"Code":"[Code]","Description":"[Description]"}}"

#-------------------------------------------- responseObject Success --------------------------------------------#
# 'responseObject': '{ "OperationStatus":{ "Code":"20000", "Description":"ValidateTokenProcess is Success" } }'
${VALUE_LOG_DETAIL_RESPONSEOBJECT_SUCCESS}    "{"OperationStatus":{"Code":"[Code]","DeveloperMessage":"[Description]"}}"

#-------------------------------------------- responseObject Error --------------------------------------------#
#{ \"OperationStatus\":{ \"Code\":\"40000\", \"DeveloperMessage\":\"The client request missing or invalid format\" }, \"Detail\":[ { \"Target\":\"ThingIdentifier\", \"DeveloperMessage\":\"The length of ThingIdentifier must be 13 or 19 characters. You entered 20 characters.\" } ] }
${VALUE_LOG_DETAIL_RESPONSEOBJECT_HAVEDETAIL_ERROR}    "{\"OperationStatus\":{\"Code\":\"[Code]\",\"DeveloperMessage\":\"[Description]\"},\"Details\":[Detail]}"

#{"OperationStatus":{"Code":"40400","DeveloperMessage":"The requested operation could not be found."}}
${VALUE_LOG_DETAIL_RESPONSEOBJECT_NOTHAVEDETAIL_ERROR}    "{\"OperationStatus\":{\"Code\":\"[Code]\",\"DeveloperMessage\":\"[Description]\"}}"

#-------------------------------------------- Detail DB--------------------------------------------#
# "responseObject":"{"statusCode":"20000","description":"inquiry worker is success"}"
${VALUE_LOG_DETAIL_REQUESTOBJECT_COAPAPP_DB}    {}    
${VALUE_LOG_DETAIL_RESPONSEOBJECT_COAPAPP_DB}    {"statusCode":"[statusCode]","description":"[description]"}    

#-------------------------------------------- Summary Log --------------------------------------------#
${VALUE_SUMMARY}    Summary 
#field log Summary
${FIELD_LOG_SUMMARY_SYSTEMTIMESTAP}    systemTimestamp   
${FIELD_LOG_SUMMARY_LOGTYPE}    logType  
${FIELD_LOG_SUMMARY_NAMESPACE}    namespace
${FIELD_LOG_SUMMARY_APPLICATIONNAME}    applicationName
${FIELD_LOG_SUMMARY_CONTAINERID}    containerId
${FIELD_LOG_SUMMARY_SESSIONID}    sessionId
${FIELD_LOG_SUMMARY_TID}    tid 
${FIELD_LOG_SUMMARY_IDENTITY}    identity 
${FIELD_LOG_SUMMARY_CMDNAME}    cmdName  
${FIELD_LOG_SUMMARY_RESULTCODE}    resultCode  
${FIELD_LOG_SUMMARY_RESULTDESC}    resultDesc
${FIELD_LOG_SUMMARY_CUSTOM}    custom
${FIELD_LOG_SUMMARY_CUSTOMDATA}    customData
${FIELD_LOG_SUMMARY_ENDPOINTSUMMARY}    endPointSummary
${FIELD_LOG_SUMMARY_REQTIMESTAP}    reqTimestamp 
${FIELD_LOG_SUMMARY_RESTIMESTAMP}    resTimestamp  
${FIELD_LOG_SUMMARY_USAGETIME}    usageTime 

#value log summary  cmdName: HouseKeeper
${VALUE_LOG_SUMMARY_CMDNAME_CREATEAHOUSEKEEPER}    createhousekeeper
${VALUE_LOG_SUMMARY_CMDNAME_UPDATEAHOUSEKEEPER}    updatethousekeeper
${VALUE_LOG_SUMMARY_CMDNAME_DELETEAHOUSEKEEPER}    deletehousekeeper
${VALUE_LOG_SUMMARY_CMDNAME_GETAHOUSEKEEPERBYID}    gethousekeeperlist
${VALUE_LOG_SUMMARY_CMDNAME_GETALISTHOUSEKEEPER}    gethousekeeper

${VALUE_LOG_SUMMARY_IDENTITY}    ${NONE}
${VALUE_LOG_SUMMARY_CUSTOM}    ${NONE}

${VALUE_LOG_CODE_20000}    20000
${VALUE_LOG_CODE_20100}    20100
${VALUE_LOG_CODE_40000}    40000
${VALUE_LOG_CODE_40300}    40300
${VALUE_LOG_CODE_40400}    40400
${VALUE_LOG_CODE_40301}    40301
${VALUE_LOG_CODE_40305}    40305
${VALUE_LOG_CODE_40010}    40010
${VALUE_LOG_CODE_40308}    40308
${VALUE_LOG_CODE_40103}    40103

${VALUE_LOG_SUMMARY_RESULTDESC_OK}    OK


# ${VALUE_LOG_SUMMARY_RESULTDESC_20000_REQUESTED_OPERATION_SUCCESSFULLY}    The requested operation was successfully
${VALUE_DESCRIPTION_REQUESTED_OPERATION_SUCCESSFULLY}    The requested operation was successfully

#status
${VALUE_STATUS_SUCCESS}     Success
${VALUE_STATUS_WHITELISTALREADY}     WhitelistAlready

#response description
${VALUE_DESCRIPTION_REGISTER_SUCCESS}    Register is Success
${VALUE_DESCRIPTION_REPORT_SUCCESS}     Report is Success
${VALUE_DESCRIPTION_IS_SUCCESS}     is Success

${VALUE_DESCRIPTION_SUCCESS}     Success

#Error
${VALUE_DESCRIPTION_THECONDITIONPROPERTIESCOULDNOTBEDUPLICATED_ERROR}    The Condition Properties could not be duplicated

${VALUE_DESCRIPTION_THENAMECOULDNOTBEDUPLICATED_ERROR}    The Name could not be duplicated    

${VALUE_DESCRIPTION_THETYPECOULDNOTBEDUPLICATED_ERROR}    The Type could not be duplicated

${VALUE_DESCRIPTION_THEBINDINGKEYCOULDNOTBEDUPLICATED_ERROR}    The BindingKey could not be duplicated

${VALUE_DESCRIPTION_REQUESTED_OPERATION_COULDNOTBEFOUND_ERROR}    The requested operation could not be found.

${VALUE_DESCRIPTION_THECLIENTREQUESTEDMISSINGORINVALIDFORMAT_ERROR}    The client requested missing or invalid format.


${VALUE_DESCRIPTION_FORBIDDEN_ERROR}    Forbidden
${VALUE_DESCRIPTION_INVALIDPAYLOAD_ERROR}    InvalidPayload


${VALUE_DESCRIPTION_REQUESTED_OPERATION_THING_COULDNOTBEFOUND_ERROR}    The requested operation Thing could not be found.

${VALUE_DESCRIPTION_THEOPERATIONHASALREADYEXPIRED_ERROR}    The operation has already expired.
${VALUE_DESCRIPTION_THETHINGIDENTIFIERREQUESTEDALREADYEXISTS_ERROR}    The ThingIdentifier requested already exists.
${VALUE_DESCRIPTION_THETHINGTOKENREQUESTEDALREADYEXISTS_ERROR}    The thingToken requested already exists.

${VALUE_DESCRIPTION_THECLIENTREQUESTMISSINGORINVALIDFORMAT_ERROR}    The client request missing or invalid format

#Details DeveloperMessage
${VALUE_DETAILS_DEVELOPERMESSAGE_THEIDISNOTOBJECTID_ERROR}    The Id is not Object Id.
