*** Keywords ***	
Post Search Log
    [Arguments]    ${url}    ${valueSearch}    ${value_applicationName}    
	${headers}=    Create Dictionary    Content-Type=${HEADER_CONTENT_TYPE}    Authorization=${HEADER_AUTHENTICATION}    kbn-version=7.5.1  
    #${headers}=    Create Dictionary    Content-Type=${HEADER_CONTENT_TYPE}    Host=azmagellancd001-iot.southeastasia.cloudapp.azure.com:30380    kbn-version=7.5.1    Origin=http://azmagellancd001-iot.southeastasia.cloudapp.azure.com:30380    
	# Log To Console    ${headers}
	
	#return valueDateGte,valueDateLte (RANGE_SEARCH 15 minutes)
	${setRange}=    Rang Get Value Minus Time Current Date and Change Format    ${YYYYMMDDTHMSZ_FROM_NOW}    ${RANGE_SEARCH}    ${TIME_STRING_MINUTES}
	#${setRange}=    Rang Get Value Minus Time Current Date and Change Format    ${YYYYMMDDTHMSZ_FROM_NOW}    50    ${TIME_STRING_MINUTES}
	#Log To Console    setRange${setRange}
	${setRangeGTE}=    Set variable    ${setRange}[0]
	${setRangeLTE}=    Set variable    ${setRange}[1]
	#Log To Console    setRangeGTE${setRangeGTE}
	#Log To Console    setRangeLTE${setRangeLTE}

	Log    valueSearch${valueSearch}
	# Log To Console    valueSearch${valueSearch}
	
	# best_fields phrase
	${multiMatchType}=    Set Variable    best_fields 
	
    ${data}=    Evaluate    {"version":"true","size":500,"sort":[{"@timestamp_es":{"order":"desc","unmapped_type":"boolean"}}],"_source":{"excludes":[]},"aggs":{"2":{"date_histogram":{"field":"@timestamp_es","fixed_interval":"30s","time_zone":"Asia/Bangkok","min_doc_count":1}}},"stored_fields":["*"],"script_fields":{},"docvalue_fields":[{"field":"@timestamp_es","format":"date_time"},{"field":"cauldron.custom1.activityLog.endTime","format":"date_time"},{"field":"cauldron.custom1.activityLog.startTime","format":"date_time"},{"field":"time","format":"date_time"}],"query":{"bool":{"must":[],"filter":[{"multi_match":{"type":"${multiMatchType}","query":"${valueSearch}","lenient":"true"}},{"range":{"@timestamp_es":{"format":"strict_date_optional_time","gte":"${setRangeGTE}","lte":"${setRangeLTE}"}}}],"should":[],"must_not":[]}},"highlight":{"pre_tags":["@kibana-highlighted-field@"],"post_tags":["@/kibana-highlighted-field@"],"fields":{"*":{}},"fragment_size":2147483647}}
    # Log To Console    ${data}
	# Log To Console    ${url}
    ${res}=    Run keyword And Continue On Failure    Post Api Request    ${url}    ${EMPTY}    ${headers}    ${data}
	Log    ${res}
	${total}=    Set variable    ${res['hits']['total']}
	Log    ${total}
	Should Not Be Equal     ${total}    0
	#Sleep    10s
	[return]    ${res}
	
Get tid for Search Log
    [Arguments]    ${value_applicationName}    ${valueSearch}    ${endPointName}
	#Log To Console    value_applicationName${value_applicationName}	
	#Log To Console    valueSearch${valueSearch}	
	${resLog}=    Wait Until Keyword Succeeds    3x    10s    Post Search Log    ${URL_GET_LOG}    ${valueSearch}    ${value_applicationName}
	Sleep    10s
	Log    resLog${resLog}	

	${total}=    Set variable    ${resLog['hits']['total']}
	# Log To Console    resLog0${resLog}  
	# Log To Console    total${total}  

	Run Keyword And Return If    '${total}'=='0'    ${resLog}
    Should Not Be Equal     ${total}    0
	@{valArrData}=    Create List
	FOR    ${i}    IN RANGE    ${total}
        # Log To Console    ${i}  
	    ${valLog}=    Set variable    ${resLog['hits']['hits'][${i}]['_source']['cauldron']}
        # Log To Console    applicationName${valLog['applicationName']}
        # Log To Console    valLog${valLog}
		
	    ${applicationName}=    Set variable    ${valLog['applicationName']}
        # Log To Console    applicationName${applicationName}
  
		Run Keyword If    '${applicationName}'=='${value_applicationName}'     Append To List    ${valArrData}    ${valLog}        #Add data to array set at valArrData

    # Exit For Loop
	END
	#Log To Console    tivalArrDatad${valArrData}
    ${tid}=    Set variable    ${valArrData[0]['tid']}
	# Log To Console    tid${tid}
	${sessionId}=    Set variable    ${valArrData[0]['sessionId']}
	# Log To Console    sessionId${sessionId}
    [return]    ${tid}    ${sessionId}
	
Data Log Response
    [Arguments]    ${value_applicationName}    ${valueSearch}    ${endPointName}
	
	Sleep    2s
	${resTid}=    Wait Until Keyword Succeeds    3x    10s    Get tid for Search Log    ${value_applicationName}    ${valueSearch}    ${endPointName}

	# ${getTidSessionId}=    Set Variable If	'${value_applicationName}'=='${VALUE_APPLICATIONNAME_CHARGING}'    ${resTid}[1]    
	# ...    '${value_applicationName}'!='${VALUE_APPLICATIONNAME_CHARGING}'    ${resTid}[0]

	# ${resTid}=    Get tid for Search Log    ${value_applicationName}    ${valueSearch}    ${endPointName}
	# Log To Console    resTid${resTid}	
	#Log To Console    getTidSessionId${getTidSessionId}	
   
	${resLog}=    Wait Until Keyword Succeeds    3x    10s    Post Search Log    ${URL_GET_LOG}    ${resTid}[0]    ${value_applicationName}
    Log    resLog${resLog}	
	#Sleep    10s
		
	${total}=    Set variable    ${resLog['hits']['total']}
	# Log To Console    total11${total}
	
    @{valArrData}=    Create List
	@{valArrDetail}=    Create List
	@{valArrSummary}=    Create List
	FOR    ${i}    IN RANGE    ${total}
        # Log To Console    ${i}  
	    ${valLog}=    Set variable    ${resLog['hits']['hits'][${i}]['_source']['log']}
        # Log To Console    valLog${valLog}

        # r use for parameter / have in data 
	    ${dataResponse}=    Evaluate    json.loads(r'''${valLog}''')    json
        # Log To Console    dataRespon/se${dataResponse}
	
	    ${applicationName}=    Set variable    ${dataResponse['applicationName']}
        # Log To Console    applicationName${applicationName}
		${logType}=    Set variable    ${dataResponse['logType']}
        # Log To Console    logType${logType}

	    Run Keyword If    '${applicationName}'=='${value_applicationName}'    Append To List    ${valArrData}    ${dataResponse}    #Add data to array set at valArrData
		Run Keyword If    '${applicationName}'=='${value_applicationName}' and '${logType}'=='${VALUE_DETAIL}'   Append To List    ${valArrDetail}    ${dataResponse}    #Add data to array set at valArrDetail
		Run Keyword If    '${applicationName}'=='${value_applicationName}' and '${logType}'=='${VALUE_SUMMARY}'   Append To List    ${valArrSummary}    ${dataResponse}    #Add data to array set at valArrSummary
		
    END
	# Log To Console    valArrData${valArrData}  
	# Log To Console    valArrDetail${valArrDetail}  
	# Log To Console    valArrSummary${valArrSummary}  
    [return]    ${valArrData}    ${valArrDetail}    ${valArrSummary}    ${resTid}[0]    ${resTid}[1]

Check Log Detail 
    [Arguments]    ${code}    ${description}     ${data}    ${tid}    ${applicationName}     ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${endPointName}    ${logLevel}    ${namespace}    ${containerId}    ${cmdName}    ${identity}    ${custom}    ${customDetailDB}    ${responseObjectDetail}   

    Log    data${data} 
	
	${dataLogDetail}=    Run keyword And Continue On Failure    Log Detail Check EndPointName    ${data}
    Log    ${dataLogDetail}    
	#value ArrDetail Have EndPointName
	${valArrDetailHaveEndPointName}=    Set Variable    ${dataLogDetail}[0]
	#value ArrDetail Not Have EndPointName
	${valArrDetailNotHaveEndPointName}=    Set Variable    ${dataLogDetail}[1]

	# Log To Console    valArrDetailHaveEndPointName${valArrDetailHaveEndPointName}  
	# Log To Console    valArrDetailNotHaveEndPointName${valArrDetailNotHaveEndPointName}  

	${langValArrDetailHaveEndPointName}=    Get Length    ${valArrDetailHaveEndPointName}
    # Log To Console    langValArrDetailHaveEndPointName${langValArrDetailHaveEndPointName}  

	${langValArrDetailNotHaveEndPointName}=    Get Length    ${valArrDetailNotHaveEndPointName}
    # Log To Console    langValArrDetailNotHaveEndPointName${langValArrDetailNotHaveEndPointName}  

	Run Keyword If    '${langValArrDetailHaveEndPointName}'!='0'    Check Log Detail Have EndPointName    ${code}    ${description}     ${valArrDetailHaveEndPointName}    ${tid}    ${applicationName}     ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${endPointName}    ${logLevel}    ${namespace}    ${containerId}    ${cmdName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}
    Run Keyword If    '${langValArrDetailNotHaveEndPointName}'!='0'    Check Log Detail App Do Not Have EndPointName    ${code}    ${description}     ${valArrDetailNotHaveEndPointName}    ${tid}    ${applicationName}     ${pathUrl}    ${dataSearch}    ${endPointName}    ${accessToken}    ${accountId}    ${body}    ${response}    ${logLevel}    ${namespace}    ${containerId}    ${cmdName}    ${identity}    ${custom}    ${responseObjectDetail} 
	# Run Keyword If    '${code}'!='${VALUE_LOG_CODE_40000}'    Check Log Detail Have EndPointName    ${code}    ${description}     ${valArrDetailHaveEndPointName}    ${tid}    ${applicationName}     ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${endPointName}    ${logLevel}    ${namespace}    ${containerId}    ${cmdName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}
	# Check Log Detail App Do Not Have EndPointName    ${code}    ${description}     ${valArrDetailNotHaveEndPointName}    ${tid}    ${applicationName}     ${pathUrl}    ${dataSearch}    ${body}    ${endPointName}    ${logLevel}    ${namespace}    ${containerId}    ${cmdName}    ${identity}    ${custom}    ${responseObjectDetail} 
	
Log Detail Check EndPointName
    [Arguments]    ${data}
	${data_count}=    Get Length    ${data}
	#Log To Console    data_count${data_count}
    @{valArrDetailHaveEndPointName}=    Create List
	@{valArrDetailNotHaveEndPointName}=    Create List
    FOR    ${i}    IN RANGE    ${data_count}
	    ${keyCustom1}=    Set Variable   @{data[${i}]['custom1']}
		# Log To Console    ${keyCustom1}    
		${checkKeyEndPointName}=    Get Matches    ${keyCustom1}    endPointName
		${countKeyEndPointName}=    Get Length    ${checkKeyEndPointName}
		#Log To Console    checkKeyEndPointName${checkKeyEndPointName} 
		#Log To Console    countKeyEndPointName${countKeyEndPointName} 
		Run Keyword If    ${countKeyEndPointName}==1    Append To List    ${valArrDetailHaveEndPointName}    ${data}[${i}]    #Add data to array set at valArrData
		Run Keyword If    ${countKeyEndPointName}==0    Append To List    ${valArrDetailNotHaveEndPointName}    ${data}[${i}]    #Add data to array set at valArrData
		
		#${data[${i}]['custom1']['endPointName']}
	END	
	# Log To Console    valArrDetailHaveEndPointName${valArrDetailHaveEndPointName}  
	# Log To Console    valArrDetailNotHaveEndPointName${valArrDetailNotHaveEndPointName}  
	[return]    ${valArrDetailHaveEndPointName}    ${valArrDetailNotHaveEndPointName}

#-------------------------------------------- Check Log Detail Have EndPointName --------------------------------------------#	
Check Log Detail Have EndPointName  
    [Arguments]    ${code}    ${description}     ${data}    ${tid}    ${applicationName}     ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${endPointName}    ${logLevel}    ${namespace}    ${containerId}    ${cmdName}    ${custom}    ${customDetailDB}    ${responseObjectDetail}
    ${data_count}=    Get Length    ${data}
	# Log To Console    data_count${data_count}  
	# Log To Console    data${data} 
	# ${thingToken}=    Set Variable
	FOR    ${i}    IN RANGE    ${data_count}
		
		#Log To Console    ${data[${i}]['custom1']['requestObject']}
		#Log To Console    ${data[${i}]['custom1']['endPointName']}
		#Log To Console    ${code}
		
	    ${dataResponse}=    Set Variable    ${data[${i}]}
		# Log To Console    dataResponse${dataResponse}  
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_SYSTEMTIMESTAP}']    ${data[${i}]['systemTimestamp']}    ${FIELD_LOG_DETAIL_SYSTEMTIMESTAP}
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_LOGTYPE}']    ${VALUE_DETAIL}    ${FIELD_LOG_DETAIL_LOGTYPE} 
        Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_LOGLEVEL}']    ${logLevel}    ${FIELD_LOG_DETAIL_LOGLEVEL} 
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_NAMESPACE}']    ${namespace}    ${FIELD_LOG_DETAIL_NAMESPACE}
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_APPLICATIONNAME}']    ${applicationName}    ${FIELD_LOG_DETAIL_APPLICATIONNAME}
		#Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CONTAINERID}']    ${containerId}    ${FIELD_LOG_DETAIL_CONTAINERID}
        # Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_SESSIONID}']    ${tid}    ${FIELD_LOG_DETAIL_SESSIONID}
		Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_TID}']    ${tid}    ${FIELD_LOG_DETAIL_TID}
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_ACTIVITYLOG}']['${FIELD_LOG_DETAIL_ACTIVITYLOG_STARTTIME}']    ${data[${i}]['custom1']['activityLog']['startTime']}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_ACTIVITYLOG}.${FIELD_LOG_DETAIL_ACTIVITYLOG_STARTTIME} 
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_ACTIVITYLOG}']['${FIELD_LOG_DETAIL_ACTIVITYLOG_ENDTIME}']    ${data[${i}]['custom1']['activityLog']['endTime']}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_ACTIVITYLOG}.${FIELD_LOG_DETAIL_ACTIVITYLOG_ENDTIME}
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_ACTIVITYLOG}']['${FIELD_LOG_DETAIL_ACTIVITYLOG_PROCESSTIME}']    ${data[${i}]['custom1']['activityLog']['processTime']}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_ACTIVITYLOG}.${FIELD_LOG_DETAIL_ACTIVITYLOG_PROCESSTIME}
        Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM2}']    ${VALUE_LOG_DETAIL_CUSTOM2}    ${FIELD_LOG_DETAIL_CUSTOM2}
    
		# Run Keyword If    '${data[${i}]['custom1']['endPointName']}'=='${DETAIL_ENDPOINTNAME_PROVISIONINGAPIS}' and '${custom}'    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_ENDPOINTNAME}']    ${DETAIL_ENDPOINTNAME_PROVISIONINGAPIS}    ['endPointName']

		#Custom
		#Check endPointName
        # Log To Console    endPointName${data[${i}]['custom1']['endPointName']}
		#Check requestObject responseObject 
        ${json_customDetailDB}=    Set Variable If    '${custom}'!='null' and '${data[${i}]['custom1']['endPointName']}'!='${DETAIL_ENDPOINTNAME_PROVISIONINGAPIS}'     Convert String to JSON    ${customDetailDB}
		# Log To Console    json_customDetailDB${json_customDetailDB}
		${json_endPointName}=    Set Variable If    '${custom}'!='null' and '${data[${i}]['custom1']['endPointName']}'!='${DETAIL_ENDPOINTNAME_PROVISIONINGAPIS}'         Convert String to JSON    ${endPointName}
		#  Log To Console    json_endPointName${json_endPointName}  
		  
		${dataCustomDetailDB}=    Set Variable If    '${custom}'!='null' and '${data[${i}]['custom1']['endPointName']}'!='${DETAIL_ENDPOINTNAME_PROVISIONINGAPIS}'         ${json_customDetailDB['endPointSummary'][${i}]}
		# Log To Console    dataCustomDetailDB${dataCustomDetailDB}  
		${dataEndPointName}=    Set Variable If    '${custom}'!='null' and '${data[${i}]['custom1']['endPointName']}'!='${DETAIL_ENDPOINTNAME_PROVISIONINGAPIS}'         ${json_endPointName[${i}]}
		# Log To Console    dataEndPointName${dataEndPointName}  
		Check Log Detail Custom RequestObject and ResponseObject    ${code}    ${description}    ${dataResponse}    ${dataSearch}    ${tid}    ${cmdName}    ${dataEndPointName}    ${accessToken}    ${accountId}    ${body}    ${response}    ${applicationName}    ${pathUrl}    ${custom}    ${dataCustomDetailDB}    ${responseObjectDetail} 
    
	END

#-------------------------------------------- Check Log Detail : RequestObject and ResponseObject Have EndPointName --------------------------------------------#		
Check Log Detail Custom RequestObject and ResponseObject
	[Arguments]    ${code}    ${description}    ${dataResponse}    ${dataSearch}    ${tid}    ${cmdName}    ${endPointName}    ${accessToken}    ${accountId}    ${body}    ${response}    ${applicationName}    ${pathUrl}   ${custom}    ${dataCustomDetailDB}    ${responseObjectDetail} 

	#-------------------------------------------- Error --------------------------------------------#   
	#ResponseObject : [Error !20000 !20100]
	Run Keyword If    '${code}'!='${VALUE_LOG_CODE_20000}' and '${code}'!='${VALUE_LOG_CODE_20100}' and '${responseObjectDetail}'=='null'    Check ResponseObject Error    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_NOTHAVEDETAIL_ERROR}    ${code}    ${description}    ${dataResponse}
    Run Keyword If    '${code}'!='${VALUE_LOG_CODE_20000}' and '${code}'!='${VALUE_LOG_CODE_20100}' and '${responseObjectDetail}'!='null'    Check ResponseObject Error Detail    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_HAVEDETAIL_ERROR}    ${code}    ${description}    ${dataResponse}    ${responseObjectDetail}
	
#-------------------------------------------- Check Log Detail Do Not Have EndPointName --------------------------------------------#		
Check Log Detail App Do Not Have EndPointName
    [Arguments]    ${code}    ${description}     ${data}    ${tid}    ${applicationName}     ${pathUrl}    ${dataSearch}    ${endPointName}    ${accessToken}    ${accountId}    ${body}    ${response}    ${logLevel}    ${namespace}    ${containerId}    ${cmdName}    ${identity}    ${custom}    ${responseObjectDetail} 
    ${data_count}=    Get Length    ${data}
	# Log To Console    data_count${data_count}  
	FOR    ${i}    IN RANGE    ${data_count}
	 
	    ${dataResponse}=    Set Variable    ${data[${i}]}
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_SYSTEMTIMESTAP}']    ${data[${i}]['systemTimestamp']}    ${FIELD_LOG_DETAIL_SYSTEMTIMESTAP}
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_LOGTYPE}']    ${VALUE_DETAIL}    ${FIELD_LOG_DETAIL_LOGTYPE}
        Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_LOGLEVEL}']    ${logLevel}    ${FIELD_LOG_DETAIL_LOGLEVEL}
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_NAMESPACE}']    ${namespace}    ${FIELD_LOG_DETAIL_NAMESPACE}
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_APPLICATIONNAME}']    ${applicationName}    ${FIELD_LOG_DETAIL_APPLICATIONNAME}
		#Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CONTAINERID}']    ${containerId}    ${FIELD_LOG_DETAIL_CONTAINERID}
        # Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_SESSIONID}']    ${tid}    ${FIELD_LOG_DETAIL_SESSIONID}
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_TID}']    ${tid}    ${FIELD_LOG_DETAIL_TID}
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_ACTIVITYLOG}']['${FIELD_LOG_DETAIL_ACTIVITYLOG_STARTTIME}']    ${data[${i}]['custom1']['activityLog']['startTime']}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_ACTIVITYLOG}.${FIELD_LOG_DETAIL_ACTIVITYLOG_STARTTIME} 
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_ACTIVITYLOG}']['${FIELD_LOG_DETAIL_ACTIVITYLOG_ENDTIME}']    ${data[${i}]['custom1']['activityLog']['endTime']}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_ACTIVITYLOG}.${FIELD_LOG_DETAIL_ACTIVITYLOG_ENDTIME}
	    Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_ACTIVITYLOG}']['${FIELD_LOG_DETAIL_ACTIVITYLOG_PROCESSTIME}']    ${data[${i}]['custom1']['activityLog']['processTime']}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_ACTIVITYLOG}.${FIELD_LOG_DETAIL_ACTIVITYLOG_PROCESSTIME}
        Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM2}']    ${VALUE_LOG_DETAIL_CUSTOM2}    ${FIELD_LOG_DETAIL_CUSTOM2}

		Check Log Detail Custom RequestObject and ResponseObject App    ${code}    ${description}    ${applicationName}    ${dataResponse}    ${dataSearch}    ${tid}    ${cmdName}    ${endPointName}    ${accessToken}    ${accountId}    ${body}    ${response}    ${pathUrl}    ${identity}    ${custom}    ${applicationName}    ${responseObjectDetail}
				
	END
#-------------------------------------------- Check Log Detail : RequestObject and ResponseObject --------------------------------------------#		
Check Log Detail Custom RequestObject and ResponseObject App
	[Arguments]    ${code}    ${description}    ${applicationName}    ${dataResponse}    ${imsi}    ${tid}    ${cmdName}    ${endPointName}    ${accessToken}    ${accountId}    ${body}    ${response}    ${pathUrl}    ${identity}    ${custom}    ${applicationName}    ${responseObjectDetail}
	
	#-------------------------------------------- HouseKeeper --------------------------------------------#
	#RequestObject : [CreateAHouseKeeper]
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_CREATEAHOUSEKEEPER}'    Check RequestObject App Success HouseKeeper    ${dataResponse}    ${pathUrl}    ${tid}    ${body}    ${response}    ${accessToken}    ${accountId}    ${cmdName}    ${code}    ${description}
	#RequestObject : [UpdateAHouseKeeper]
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_UPDATEAHOUSEKEEPER}'    Check RequestObject App Success HouseKeeper    ${dataResponse}    ${pathUrl}    ${tid}    ${body}    ${response}    ${accessToken}    ${accountId}    ${cmdName}    ${code}    ${description}
	# #RequestObject : [DeleteAHouseKeeper]
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_DELETEAHOUSEKEEPER}'    Check RequestObject App Success HouseKeeper    ${dataResponse}    ${pathUrl}    ${tid}    ${body}    ${response}    ${accessToken}    ${accountId}    ${cmdName}    ${code}    ${description}
	# #RequestObject : [GetAHouseKeeperById]
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_GETAHOUSEKEEPERBYID}'    Check RequestObject App Success HouseKeeper    ${dataResponse}    ${pathUrl}    ${tid}    ${body}    ${response}    ${accessToken}    ${accountId}    ${cmdName}    ${code}    ${description}
	# #RequestObject : [GetAListHouseKeeper]
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_GETALISTHOUSEKEEPER}'    Check RequestObject App Success HouseKeeper    ${dataResponse}    ${pathUrl}    ${tid}    ${body}    ${response}    ${accessToken}    ${accountId}    ${cmdName}    ${code}    ${description}

	#ResponseObject : [CreateAHouseKeeper]
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_CREATEAHOUSEKEEPER}' and '${code}'=='${VALUE_LOG_CODE_20100}'    Check ResponseObject App Success HouseKeeper    ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${accessToken}    ${accountId}    ${cmdName}
    #ResponseObject : [UpdateAHouseKeeper]
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_UPDATEAHOUSEKEEPER}' and '${code}'=='${VALUE_LOG_CODE_20000}'    Check ResponseObject App Success HouseKeeper    ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${accessToken}    ${accountId}    ${cmdName}
    # #ResponseObject : [DeleteAHouseKeeper]
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_DELETEAHOUSEKEEPER}' and '${code}'=='${VALUE_LOG_CODE_20000}'    Check ResponseObject Success    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_SUCCESS}    ${code}    ${description}    ${dataResponse}
    # #ResponseObject : [GetAHouseKeeperById]
	Run Keyword If    '${cmdName}'=='${VALUE_LOG_SUMMARY_CMDNAME_GETAHOUSEKEEPERBYID}' and '${code}'=='${VALUE_LOG_CODE_20000}'    Check ResponseObject App Success HouseKeeper    ${code}    ${description}    ${dataResponse}    ${body}    ${response}    ${accessToken}    ${accountId}    ${cmdName}

	#-------------------------------------------- Error --------------------------------------------#   
	#ResponseObject : [Error !20000 !20100]
	${removeTextResponseObjectDetail}=    Remove String    ${responseObjectDetail}    '    ${EMPTY}
	Run Keyword If    '${code}'!='${VALUE_LOG_CODE_20000}' and '${code}'!='${VALUE_LOG_CODE_20100}' and '${removeTextResponseObjectDetail}'=='null'    Check ResponseObject Error    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_NOTHAVEDETAIL_ERROR}    ${code}    ${description}    ${dataResponse}
    Run Keyword If    '${code}'!='${VALUE_LOG_CODE_20000}' and '${code}'!='${VALUE_LOG_CODE_20100}' and '${removeTextResponseObjectDetail}'!='null'    Check ResponseObject Error Detail    ${VALUE_LOG_DETAIL_RESPONSEOBJECT_HAVEDETAIL_ERROR}    ${code}    ${description}    ${dataResponse}    ${responseObjectDetail}
	
#--------------------------------------------  ResponseObject Success Have Code and Description --------------------------------------------#
Check ResponseObject Success
    [Arguments]    ${value}    ${code}    ${description}    ${dataResponse}
	
	# ${code}=    Set Variable    ${code}

	${replaceCodeCmdName}=    Replace String    ${value}    [Code]    ${code}
	${replaceDescriptionCmdName}=    Replace String    ${replaceCodeCmdName}    [Description]    ${description}

	${responseObject}=    Replace String To Object    ${replaceDescriptionCmdName}
	# Log To Console    responseObjectError${responseObject}
			
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_RESPONSEOBJECT}']    ${responseObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_RESPONSEOBJECT}

#--------------------------------------------  ResponseObject Error Not Have EndPointName --------------------------------------------#
Check ResponseObject Error  
    [Arguments]    ${value}    ${code}    ${description}    ${dataResponse}
	
	# ${code}=    Set Variable    ${code}

	${replaceCodeCmdName}=    Replace String    ${value}    [Code]    ${code}
	${replaceDescriptionCmdName}=    Replace String    ${replaceCodeCmdName}    [Description]    ${description}

	${responseObject}=    Replace String To Object    ${replaceDescriptionCmdName}
	# Log To Console    responseObjectError${responseObject}
			
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_RESPONSEOBJECT}']    ${responseObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_RESPONSEOBJECT}

Check ResponseObject Error Detail  
    [Arguments]    ${value}    ${code}    ${description}    ${dataResponse}    ${responseObjectDetail}
	
	# ${code}=    Set Variable    ${code}

	${replaceCodeCmdName}=    Replace String    ${value}    [Code]    ${code}
	${replaceDescriptionCmdName}=    Replace String    ${replaceCodeCmdName}    [Description]    ${description}
	${replaceDetail}=    Replace String    ${replaceDescriptionCmdName}    [Detail]    ${responseObjectDetail}

	${responseObject}=    Replace String To Object    ${replaceDetail}
	# Log To Console    responseObjectError${responseObject}
			
	Check Json Data Should Be Equal    ${dataResponse}    ['${FIELD_LOG_DETAIL_CUSTOM1}']['${FIELD_LOG_DETAIL_RESPONSEOBJECT}']    ${responseObject}    ${FIELD_LOG_DETAIL_CUSTOM1}.${FIELD_LOG_DETAIL_RESPONSEOBJECT}

    #resultCode_summary[20000],resultDesc_summary[The requested operation was successfully],Code_detail[20000],Description_detail[The requested operation was successfully],applicationName[ProvisioningAPIs],pathUrl[mg-iot.siamimo.com/api/v1/auth/signin],dataSearch,body[request],namespace[magellan],containerId[provisioningapis-vXX],identity,cmdName[SignInProcess],endPointName[],logLevel[INFO],custom,customDetailDB,responseObjectDetail
    # Check Log Response    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_REQUESTED_OPERATION_SUCCESSFULLY}    ${VALUE_LOG_CODE_20000}    ${VALUE_DESCRIPTION_REQUESTED_OPERATION_SUCCESSFULLY}    ${VALUE_APPLICATIONNAME_HOUSEKEEPER}    ${pathUrl}    ${pathUrl}    ${responseBody}    ${VALUE_LOG_NAMESPACE}    ${VALUE_LOG_CONTAINERID_COAPAPP}    ${identity}    ${VALUE_LOG_SUMMARY_CMDNAME_SIGNIN}    ${endPointName}    ${VALUE_LOG_DETAIL_LOGLEVEL}    ${custom}    ${customDetailDB}    ${responseObjectDetail}  

Check Log Response 
    #resultCode_summary[20000],resultDesc_summary[The requested operation was successfully],Code_detail[20000],Description_detail[The requested operation was successfully],applicationName,pathUrl,dataSearch,accessToken,accountId,body[request],response[response],namespace,containerId,identity,cmdName,endPointName,logLevel,custom,customDetailDB,responseObjectDetail
    [Arguments]    ${resultCode_summary}    ${resultDesc_summary}    ${code_detail}    ${description_detail}    ${applicationName}    ${pathUrl}     ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${namespace}    ${containerId}    ${identity}    ${cmdName}    ${endPointName}    ${logLevel}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 
    #Log To Console    imsi_thingTokenimsi_thingToken${imsi_thingToken}
	#return valArrData,valArrDetail,valArrSummary,tid
	${dataLogResponse}=    Data Log Response    ${applicationName}    ${dataSearch}    ${endPointName}
	Log    Log is ${dataLogResponse}
	
	Check Log Detail    ${code_detail}    ${description_detail}    ${dataLogResponse}[1]    ${dataLogResponse}[3]    ${applicationName}    ${pathUrl}    ${dataSearch}    ${accessToken}    ${accountId}    ${body}    ${response}    ${endPointName}    ${logLevel}    ${namespace}    ${containerId}    ${cmdName}    ${identity}    ${custom}    ${customDetailDB}    ${responseObjectDetail} 
    Check Log Summary    ${resultCode_summary}    ${resultDesc_summary}    ${dataLogResponse}[2]    ${dataLogResponse}[3]    ${applicationName}    ${namespace}    ${containerId}    ${identity}    ${cmdName}    ${custom}

Replace String To Object
    [Arguments]    ${string}
    
	${replStringToJsonStart}=    Replace String    ${string}    "{    {
	${replStringToJsonEnd}=    Replace String    ${replStringToJsonStart}    }"    }
	[RETURN]    ${replStringToJsonEnd}
