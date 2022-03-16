*** Keywords ***
####################################################
Log CreateAHouseKeeper Success
	[Arguments]    ${getData}    ${pathUrl}    ${dataSearch}    ${bodyReq}    ${accessToken}    ${partnerId}    ${customerId}    ${accountId}    ${GetResponse_HouseKeeperId}    ${type}    ${dataConditionPropertiesLog}    ${BindingType}    ${BindingKey}    ${Name}    
    
    #/api/v1/housekeeper
	${identity}=    Set Variable    ${EMPTY }
	${endPointName}=    Set Variable    null
    ${custom}=    Set Variable    null
	${customDetailDB}=    Set Variable    null

	${Resource}=    Set Variable If    '${BindingType}'=='${VALUE_BINDINGTYPE_PRETENANT}'    {"CustomerId":"${BindingKey}","TenantId":null,"AccountId":null,"ThingId":null}
    ...    '${BindingType}'=='${VALUE_BINDINGTYPE_PREACCOUNT}'    	{"CustomerId":"${customerId}","TenantId":"${BindingKey}","AccountId":null,"ThingId":null}
	...    '${BindingType}'=='${VALUE_BINDINGTYPE_PRETHING}'    	{"CustomerId":"${customerId}","TenantId":"${partnerId}","AccountId":"${BindingKey}","ThingId":null}

	${body}=    Set Variable    {"Type":"${type}","ConditionProperties":${dataConditionPropertiesLog},"BindingType":"${BindingType}","BindingKey":"${BindingKey}","Name":"${Name}","Resource":${Resource}}
	${response}=    Set Variable    ${getData}
    ${responseObjectDetail}=    Set Variable    null

	#resultCode_summary[20000],resultDesc_summary[The requested operation was successfully],Code_detail[20000],Description_detail[The requested operation was successfully],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${VALUE_LOG_CODE_20100}    ${VALUE_DESCRIPTION_CREATEAHOUSEKEEPER_SUCCESS}    ${VALUE_LOG_CODE_20100}    ${VALUE_DESCRIPTION_CREATEAHOUSEKEEPER_SUCCESS}    ${VALUE_APPLICATIONNAME_HOUSEKEEPER}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_PROVISIONINGAPIS}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_CREATEAHOUSEKEEPER}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail}  

Log CreateAHouseKeeper Error
	[Arguments]    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${getData}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${accessToken}    ${accountId}    ${body} 

    #/api/v1/housekeeper
	${identity}=    Set Variable    ${EMPTY }
    ${response}=    Set Variable    ${getData}
	
	#resultCode_summary[40300],resultDesc_summary[Forbidden],Code_detail[40300],Description_detail[The requested operation could not be found.],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${VALUE_APPLICATIONNAME_HOUSEKEEPER}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_PROVISIONINGAPIS}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_CREATEAHOUSEKEEPER}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 

Log UpdateAHouseKeeper Success
	[Arguments]    ${getData}    ${pathUrl}    ${dataSearch}    ${bodyReq}    ${accessToken}    ${partnerId}    ${customerId}    ${accountId}    ${GetResponse_HouseKeeperId}    ${type}    ${dataConditionPropertiesLog}    ${BindingType}    ${BindingKey}    ${Name}    
    
    #/api/v1/housekeeper/id
	${identity}=    Set Variable    ${EMPTY }
	${endPointName}=    Set Variable    null
    ${custom}=    Set Variable    null
	${customDetailDB}=    Set Variable    null

	${Resource}=    Set Variable If    '${BindingType}'=='${VALUE_BINDINGTYPE_PRETENANT}'    {"CustomerId":"${BindingKey}","TenantId":null,"AccountId":null,"ThingId":null}
    ...    '${BindingType}'=='${VALUE_BINDINGTYPE_PREACCOUNT}'    	{"CustomerId":"${customerId}","TenantId":"${BindingKey}","AccountId":null,"ThingId":null}
	...    '${BindingType}'=='${VALUE_BINDINGTYPE_PRETHING}'    	{"CustomerId":"${customerId}","TenantId":"${partnerId}","AccountId":"${BindingKey}","ThingId":null}

	${body}=    Set Variable    {"Type":"${type}","ConditionProperties":${dataConditionPropertiesLog},"BindingType":"${BindingType}","BindingKey":"${BindingKey}","Name":"${Name}","Status":"Disable","RemoveStatus":false,"CreatedDateTime":"[CreatedDateTime]","Resource":${Resource}}
	# Log To Console    ${body}
	${response}=    Set Variable    ${getData}
    ${responseObjectDetail}=    Set Variable    null

	#resultCode_summary[20000],resultDesc_summary[The requested operation was successfully],Code_detail[20000],Description_detail[The requested operation was successfully],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_UPDATEAHOUSEKEEPER_SUCCESS}    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_UPDATEAHOUSEKEEPER_SUCCESS}    ${VALUE_APPLICATIONNAME_HOUSEKEEPER}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_PROVISIONINGAPIS}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_UPDATEAHOUSEKEEPER}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail}  

Log UpdateAHouseKeeper Error
	[Arguments]    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${getData}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${accessToken}    ${accountId}    ${body} 

    #/api/v1/housekeeper/id
	${identity}=    Set Variable    ${EMPTY }
    ${response}=    Set Variable    ${getData}
	
	#resultCode_summary[40300],resultDesc_summary[Forbidden],Code_detail[40300],Description_detail[The requested operation could not be found.],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${VALUE_APPLICATIONNAME_HOUSEKEEPER}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_PROVISIONINGAPIS}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_UPDATEAHOUSEKEEPER}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 

Log DeleteAHouseKeeper Success
	[Arguments]    ${getData}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${partnerId}    ${customerId}    ${accountId}    ${GetResponse_HouseKeeperId}
    
    #/api/v1/housekeeper/id
	${identity}=    Set Variable    ${EMPTY }
	${endPointName}=    Set Variable    null
    ${custom}=    Set Variable    null
	${customDetailDB}=    Set Variable    null

	${body}=    Set Variable    {}
	${response}=    Set Variable    ${getData}
    ${responseObjectDetail}=    Set Variable    null

	#resultCode_summary[20000],resultDesc_summary[The requested operation was successfully],Code_detail[20000],Description_detail[The requested operation was successfully],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_DELETEAHOUSEKEEPER_SUCCESS}    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_DELETEAHOUSEKEEPER_SUCCESS}    ${VALUE_APPLICATIONNAME_HOUSEKEEPER}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_PROVISIONINGAPIS}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_DELETEAHOUSEKEEPER}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail}  

Log DeleteAHouseKeeper Error
	[Arguments]    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${getData}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${accessToken}    ${accountId}

    #/api/v1/housekeeper/id
	${identity}=    Set Variable    ${EMPTY }
    ${response}=    Set Variable    ${getData}
	${body}=    Set Variable    {}
	
	#resultCode_summary[40300],resultDesc_summary[Forbidden],Code_detail[40300],Description_detail[The requested operation could not be found.],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${VALUE_APPLICATIONNAME_HOUSEKEEPER}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_PROVISIONINGAPIS}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_DELETEAHOUSEKEEPER}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 

Log GetAHouseKeeperById Success
	[Arguments]    ${getData}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${partnerId}    ${customerId}    ${accountId}    ${GetResponse_HouseKeeperId}    ${body}
    
    #/api/v1/housekeeper/id
	${identity}=    Set Variable    ${EMPTY }
	${endPointName}=    Set Variable    null
    ${custom}=    Set Variable    null
	${customDetailDB}=    Set Variable    null

	# ${body}=    Set Variable    {}
	${response}=    Set Variable    ${getData}
    ${responseObjectDetail}=    Set Variable    null

	#resultCode_summary[20000],resultDesc_summary[The requested operation was successfully],Code_detail[20000],Description_detail[The requested operation was successfully],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_GETAHOUSEKEEPERBYID_SUCCESS}    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_GETAHOUSEKEEPERBYID_SUCCESS}    ${VALUE_APPLICATIONNAME_HOUSEKEEPER}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_PROVISIONINGAPIS}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_GETAHOUSEKEEPERBYID}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail}  

Log GetAHouseKeeperById Error
	[Arguments]    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${getData}    ${pathUrl}    ${dataSearch}    ${endPointName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}    ${accessToken}    ${accountId}

    #/api/v1/housekeeper/id
	${identity}=    Set Variable    ${EMPTY }
    ${response}=    Set Variable    ${getData}
	${body}=    Set Variable    {}
	
	#resultCode_summary[40300],resultDesc_summary[Forbidden],Code_detail[40300],Description_detail[The requested operation could not be found.],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${ResultCode}    ${ResultDesc}    ${Code}    ${Desc}    ${VALUE_APPLICATIONNAME_HOUSEKEEPER}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_PROVISIONINGAPIS}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_GETAHOUSEKEEPERBYID}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 

Log GetAListHouseKeeper Success
	[Arguments]    ${getData}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}
    
    #/api/v1/housekeeper/id
	${identity}=    Set Variable    ${EMPTY }
	${endPointName}=    Set Variable    null
    ${custom}=    Set Variable    null
	${customDetailDB}=    Set Variable    null

	${body}=    Set Variable    {}
	${response}=    Set Variable    ${getData}
    ${responseObjectDetail}=    Set Variable    null

	#resultCode_summary[20000],resultDesc_summary[The requested operation was successfully],Code_detail[20000],Description_detail[The requested operation was successfully],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,accessToken,accountId,body[request],response[response],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    Check Log Response    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_GETALISTHOUSEKEEPER_SUCCESS}    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_GETALISTHOUSEKEEPER_SUCCESS}    ${VALUE_APPLICATIONNAME_HOUSEKEEPER}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_PROVISIONINGAPIS}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_GETALISTHOUSEKEEPER}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail}  