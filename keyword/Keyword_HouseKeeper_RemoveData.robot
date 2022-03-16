*** Keywords ***
####################################################
Rollback Data Remove Partner
	# [accessToken,PartnerId,AccountId,AccountName,PartnerName,CustomerId]
	[Arguments]    ${getData}

	${accessToken}=    Set Variable    ${getData}[0]
	${PartnerId}=    Set Variable    ${getData}[1]

    ${result}=    Run Keyword And Return Status    Partner Request RemoveData    ${accessToken}    ${PartnerId}
	# Log To Console    result${result}
	Run Keyword If    '${result}'=='False'    Log To Console    ${\n}===Delete Data Failed!====${\n}
	Run Keyword If    '${result}'=='True'    Log To Console    ${\n}===Delete Data Succeeds!===${\n}

Rollback Data Remove Partner and Account
	# [accessToken,PartnerId,AccountId,AccountName,PartnerName,CustomerId,HouseKeeperId,HouseKeeperName]
	[Arguments]    ${getData}

	${accessToken}=    Set Variable    ${getData}[0]
	${PartnerId}=    Set Variable    ${getData}[1]
	${AccountId}=    Set Variable    ${getData}[2]

    ${result}=    Run Keyword And Return Status    Partner Account Request RemoveData    ${accessToken}    ${PartnerId}    ${AccountId}
	# Log To Console    result${result}
	Run Keyword If    '${result}'=='False'    Log To Console    ${\n}===Delete Data Failed!====${\n}
	Run Keyword If    '${result}'=='True'    Log To Console    ${\n}===Delete Data Succeeds!===${\n}

Rollback Data Remove Partner Account and ThingArr Core
	#[accessToken,PartnerId,AccountId,AccountName,PartnerName,CustomerId,ThingIdArr]
	[Arguments]    ${Flow}    ${getData}

	${accessToken}=    Set Variable    ${getData}[0]
	${PartnerId}=    Set Variable    ${getData}[1]
	${AccountId}=    Set Variable    ${getData}[2]
	${ThingIdArr}=    Set Variable    ${getData}[6]
    # Log To Console    ThingIdArr${ThingIdArr}

    ${result}=    Run Keyword And Return Status    Partner Account and ThingArr Core Request RemoveData    ${accessToken}    ${PartnerId}    ${AccountId}    ${ThingIdArr}
	# Log To Console    result${result}
	Run Keyword If    '${result}'=='False'    Log To Console    ${\n}===Delete Data Failed!====${\n}
	Run Keyword If    '${result}'=='True'    Log To Console    ${\n}===Delete Data Succeeds!===${\n}

Rollback Data Remove Partner Account and CreateAHouseKeeper
	#[accessToken,PartnerId,AccountId,AccountName,PartnerName,CustomerId]
	[Arguments]    ${getData}    ${id}

	${accessToken}=    Set Variable    ${getData}[0]
	${PartnerId}=    Set Variable    ${getData}[1]
	${AccountId}=    Set Variable    ${getData}[2]

    ${result}=    Run Keyword And Return Status    Partner Account and CreateAHouseKeeper Request RemoveData    ${accessToken}    ${PartnerId}    ${AccountId}    ${id}
	# Log To Console    result${result}
	Run Keyword If    '${result}'=='False'    Log To Console    ${\n}===Delete Data Failed!====${\n}
	Run Keyword If    '${result}'=='True'    Log To Console    ${\n}===Delete Data Succeeds!===${\n}

Rollback Data Remove Partner Account and CreateAHouseKeeper2
	#[accessToken,PartnerIdArr,AccountIdArr,HouseKeeperIdArr]
	[Arguments]    ${getData}

	${accessToken}=    Set Variable    ${getData['accessToken']}
	${PartnerId}=    Set Variable    ${getData['PartnerId']}
	${AccountId}=    Set Variable    ${getData['AccountId']}
	${HouseKeeperId}=    Set Variable    ${getData['HouseKeeperId']}

    ${result}=    Run Keyword And Return Status    Partner2 Account2 and CreateAHouseKeeper2 Request RemoveData    ${accessToken}    ${PartnerId}    ${AccountId}    ${HouseKeeperId}
	# Log To Console    result${result}
	Run Keyword If    '${result}'=='False'    Log To Console    ${\n}===Delete Data Failed!====${\n}
	Run Keyword If    '${result}'=='True'    Log To Console    ${\n}===Delete Data Succeeds!===${\n}

Rollback Data Remove Partner Account ThingArr and CreateAHouseKeeper
	#[accessToken,PartnerId,AccountId,AccountName,PartnerName,CustomerId,ThingIdArr]
	[Arguments]    ${Flow}    ${getData}    ${id}

	${accessToken}=    Set Variable    ${getData}[0]
	${PartnerId}=    Set Variable    ${getData}[1]
	${AccountId}=    Set Variable    ${getData}[2]
	${ThingIdArr}=    Set Variable    ${getData}[6]

    ${result}=    Run Keyword And Return Status    Partner Account ThingArr and CreateAHouseKeeper Core Request RemoveData    ${accessToken}    ${PartnerId}    ${AccountId}    ${ThingIdArr}    ${id}
	# Log To Console    result${result}
	Run Keyword If    '${result}'=='False'    Log To Console    ${\n}===Delete Data Failed!====${\n}
	Run Keyword If    '${result}'=='True'    Log To Console    ${\n}===Delete Data Succeeds!===${\n}

Rollback Data Remove CreateAHouseKeeper
	# [accessToken,PartnerId,AccountId,AccountName,PartnerName,CustomerId,HouseKeeperId,HouseKeeperName]
	[Arguments]    ${id}

    ${result}=    Run Keyword And Return Status    DeleteAHouseKeeper Request RemoveData    ${id}
	# Log To Console    result${result}
	Run Keyword If    '${result}'=='False'    Log To Console    ${\n}===Delete Data Failed!====${\n}
	Run Keyword If    '${result}'=='True'    Log To Console    ${\n}===Delete Data Succeeds!===${\n}

Rollback Data Remove Partner and CreateAHouseKeeper
	#[accessToken,PartnerId,AccountId,AccountName,PartnerName,CustomerId,HouseKeeperId,HouseKeeperName]
	[Arguments]    ${Flow}    ${getData}    ${id}

	${accessToken}=    Set Variable    ${getData}[0]
	${PartnerId}=    Set Variable    ${getData}[1]

    ${result}=    Run Keyword And Return Status    Partner and CreateAHouseKeeper Request RemoveData    ${accessToken}    ${PartnerId}    ${id}
	# Log To Console    result${result}
	Run Keyword If    '${result}'=='False'    Log To Console    ${\n}===Delete Data Failed!====${\n}
	Run Keyword If    '${result}'=='True'    Log To Console    ${\n}===Delete Data Succeeds!===${\n}
