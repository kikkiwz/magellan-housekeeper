*** Keywords ***
# ConnectMongoDB
#     Connect To Mongodb    ${CONNECT_TO_MONGODB}
# DisConnectMongoDB
#     Disconnect From Mongodb

Start Connect To Mongodb
    [Arguments]    ${type}    ${json_data}    ${value_fields}    ${dbName}    ${dbCollName}
    Connect To Mongodb    ${CONNECT_TO_MONGODB}
    # ${result}=    Search All Fields    ${data}
    ${result}=    Run Keyword If    '${type}' == '${MONGODB_TYPE_ALL}'    Search All Fields    ${json_data}    ${dbName}    ${dbCollName}
    ...    ELSE IF    '${type}' == '${MONGODB_TYPE_SEARCHBYSELECTFIEDS}'    Search By Select Fields    ${json_data}    ${value_fields}    ${dbName}    ${dbCollName}
    ...    ELSE IF    '${type}' == '${MONGODB_TYPE_INSERTDATA}'    Insert Data    ${json_data}    ${dbName}    ${dbCollName}
    
    Disconnect From Mongodb
    Log    ${result}
    # Log To Console    ${result}
    [Return]    ${result} 

Search All Fields
    [Arguments]    ${json_data}    ${dbName}    ${dbCollName}
    Log    ${json_data}
    Log To Console    Search All Fields${json_data}
    # ${result}=    Retrieve Some Mongodb Records    dbName=mgcore    dbCollName=things    recordJSON=${json_data}    returnDocuments=True
    ${result}=    Retrieve Some Mongodb Records    dbName=${dbName}    dbCollName=${dbCollName}    recordJSON=${json_data}    returnDocuments=True
    Log    ${result}
    Log To Console    Search All Fields${result}
    #ได้ record เดียวเสมอ, convert dict กลับไปถ้าจะดึงค่าให้ใช้  ${result}=    Get From Dictionary    ${dict}    ชื่อฟิลด์ 
    ${dict}=    Convert To Dictionary    ${result}[0]
    Log To Console    dict${dict}
    [Return]    ${dict} 

Search By Select Fields
    [Arguments]    ${json_data}    ${value_fields}    ${dbName}    ${dbCollName}
    Log    ${json_data}  
    ${result}=    Retrieve Mongodb Records With Desired Fields    dbName=${dbName}    dbCollName=${dbCollName}    recordJSON=${json_data}    fields=${value_fields}    return__id=False    returnDocuments=True    
    Log    ${result}
	${dict}=    Convert To Dictionary    ${result}[0]
    [Return]    ${dict} 

Insert Data
    [Arguments]    ${json_data}    ${dbName}    ${dbCollName}
    Log    ${json_data}  
    # ${date}=    Get Date
    ${result}=    Save Mongodb Records     dbName=${dbName}    dbCollName=${dbCollName}    recordJSON=${json_data}
    Log    ${result}
	# ${dict}=    Convert To Dictionary    ${result}[0]
    [Return]    ${result} 

