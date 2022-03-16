*** Variables ***
#-------------------------------------------- signin --------------------------------------------#	
#path url signin
${URL_SIGNIN}    /api/v1/auth/signin

#header Signin
${HEADER_X_AIS_ORDERREF_SIGNIN}    Signin_
${HEADER_X_AIS_ORDERREF_SIGNIN_FAIL}    Signinfail_
${HEADER_X_AIS_ORDERDESC_SIGNIN}    User Authentication


#response description
${VALUE_DESCRIPTION_SINGNIN_SUCCESS}    SignInProcess is Success

#request name
${SINGNIN}    Signin
#-------------------------------------------------------------------------------------------------------#
#-------------------------------------------- ValidateToken --------------------------------------------#	
#path url ValidateToken
${URL_VALIDATETOKEN}    /api/v1/auth/ValidateToken

#header ValidateToken
${HEADER_X_AIS_ORDERREF_VALIDATETOKEN}    ValidateToken_
${HEADER_X_AIS_ORDERREF_VALIDATETOKEN_FAIL}    ValidateTokenfail_
${HEADER_X_AIS_ORDERDESC_VALIDATETOKEN}    ValidateToken

#response description
${VALUE_DESCRIPTION_VALIDATETOKEN_SUCCESS}    ValidateTokenProcess is Success

#request name
${VALIDATETOKEN}    ValidateToken
#-------------------------------------------------------------------------------------------------------#
#-------------------------------------------- Partner --------------------------------------------#	
#-------------------------------------------- CreatePartner --------------------------------------------#	
#path url CreatePartner
${URL_CREATEPARTNER}    /api/v1/Partner/CreatePartner

#header CreatePartner
${HEADER_X_AIS_ORDERREF_CREATEPARTNER}    CreatePartner_
${HEADER_X_AIS_ORDERREF_CREATEPARTNER_FAIL}    CreatePartnerfail_
${HEADER_X_AIS_ORDERDESC_CREATEPARTNER}    CreatePartner

#value Create Partner
${VALUE_PARTNERNAME}    SC_
${VALUE_MERCHANTCONTACT}    Jida_TestMerchantContact@ais.co.th
${VALUE_CPID}    Jida_TesCPID@ais.co.th
${VALUE_ACCOUNTNAME}    Jida_TestAccountname
${VALUE_CONFIGGROUPNAME}    QATestConfigGroupName

#response description
${VALUE_DESCRIPTION_CREATEPARTNER_SUCCESS}    CreatePartner is Success

#request name
${CREATEPARTNER}    CreatePartner
${CREATEPARTNER_OTHERROLE}    CreatePartnerOtherRole

#-------------------------------------------- UpdatePartner --------------------------------------------#	
#path url UpdatePartner
${URL_UPDATEPARTNER}    /api/v1/Partner/UpdatePartner

#header UpdatePartner
${HEADER_X_AIS_ORDERREF_UPDATEPARTNER}    UpdatePartner_
${HEADER_X_AIS_ORDERREF_UPDATEPARTNER_FAIL}    UpdatePartnerfail_
${HEADER_X_AIS_ORDERDESC_UPDATEPARTNER}    UpdatePartner

#value Update Partner
${VALUE_PARTNERNAME_UPDATE}    Update_SC_
${VALUE_MERCHANTCONTACT_UPDATE}    Update_Jida_TestMerchantContact@ais.co.th
${VALUE_CPID_UPDATE}    Update_Jida_TesCPID@ais.co.th
${VALUE_ACCOUNTNAME_UPDATE}    Update_Jida_TestAccountname
${VALUE_CONFIGGROUPNAME_UPDATE}    Update_Sensor_TestThingGroupName

#response description
${VALUE_DESCRIPTION_UPDATEPARTNER_SUCCESS}    UpdatePartner is Success

#request name
${UPDATEPARTNER}    UpdatePartner
${UPDATEPARTNER_OTHERROLE}    UpdatePartnerOtherRole
#-------------------------------------------- InquiryPartner --------------------------------------------#
#path url InquiryPartner
${URL_INQUIRYPARTNER}    /api/v1/Partner/InquiryPartner

#header InquiryPartner
${HEADER_X_AIS_ORDERREF_INQUIRYPARTNER}    InquiryPartner_
${HEADER_X_AIS_ORDERREF_INQUIRYPARTNER_FAIL}    InquiryPartnerfail_
${HEADER_X_AIS_ORDERDESC_INQUIRYPARTNER}    InquiryPartner

#response description
${VALUE_DESCRIPTION_INQUIRYPARTNER_SUCCESS}    InquiryPartner is Success    

#request name
${INQUIRYPARTNER}    InquiryPartner
${INQUIRYPARTNER_OTHERROLE}    InquiryPartnerOtherRole	

#-------------------------------------------- RemovePartner --------------------------------------------#	
#path url remove
${URL_REMOVEPARTNER}    /api/v1/Partner/RemovePartner

#header RemovePartner
${HEADER_X_AIS_ORDERREF_REMOVEPARTNER}    RemovePartner_
${HEADER_X_AIS_ORDERREF_REMOVEPARTNER_FAIL}    RemovePartnerfail_
${HEADER_X_AIS_ORDERDESC_REMOVEPARTNER}    RemovePartner

#request name
${REMOVEPARTNER}    RemovePartner
${REMOVEPARTNER_OTHERROLE}    RemovePartnerOtherRole

#response description
${VALUE_DESCRIPTION_REMOVEPARTNER_SUCCESS}    RemovePartner is Success
#-------------------------------------------------------------------------------------------------------#
#------------------------------------------------ Account ----------------------------------------------#	
#-------------------------------------------- CreateAccount --------------------------------------------#
#path url CreateAccount
${URL_CREATEACCOUNT}    /api/v1/Account/CreateAccount

#header CreateAccount
${HEADER_X_AIS_ORDERREF_CREATEACCOUNT}    CreateAccount_
${HEADER_X_AIS_ORDERREF_CREATEACCOUNT_FAIL}    CreateAccountfail_
${HEADER_X_AIS_ORDERDESC_CREATEACCOUNT}    CreateAccount

#value CreateAccount
${VALUE_ACCOUNTCODE}    AccountCode_

#response description
${VALUE_DESCRIPTION_CREATEACCOUNT_SUCCESS}    CreateAccount is Success

#request name
${CREATEACCOUNT}    CreateAccount
${CREATEACCOUNT_OTHERROLE}    CreateAccountOtherRole

#-------------------------------------------- UpdateAccont --------------------------------------------#
#path url UpdateAccount
${URL_UPDATEACCOUNT}    /api/v1/Account/UpdateAccount

#header UpdateAccount
${HEADER_X_AIS_ORDERREF_UPDATEACCOUNT}    UpdateAccount_
${HEADER_X_AIS_ORDERREF_UPDATEACCOUNT_FAIL}    UpdateAccountfail_
${HEADER_X_AIS_ORDERDESC_UPDATEACCOUNT}    UpdateAccount

#response description
${VALUE_DESCRIPTION_UPDATEACCOUNT_SUCCESS}    UpdateAccount is Success

#request name
${UPDATEACCOUNT}    UpdateAccount
${UPDATEACCOUNT_OTHERROLE}    UpdateAccountOtherRole


${VALUE_ACCOUNTCODE}    QATesterAcc01
${VALUE_EXPIREDATE}    2021-11-30T15:27:27.396+07:00   
${VALUE_EXPIREDATE_ERROR}    2020-11-30T15:27:27.396+07:00 
${VALUE_CLEAREXPIREDATE}    true

#-------------------------------------------- InquiryAccont --------------------------------------------#
#path url InquiryAccount
${URL_INQUIRYACCOUNT}    /api/v1/Account/InquiryAccount

#header InquiryAccount
${HEADER_X_AIS_ORDERREF_INQUIRYACCOUNT}    InquiryAccount_
${HEADER_X_AIS_ORDERREF_INQUIRYACCOUNT_FAIL}    InquiryAccountfail_
${HEADER_X_AIS_ORDERDESC_INQUIRYACCOUNT}    InquiryAccount

#response description
${VALUE_DESCRIPTION_INQUIRYACCOUNT_SUCCESS}    InquiryAccount is Success

#request name
${INQUIRYACCOUNT}    InquiryAccount
${INQUIRYACCOUNT_OTHERROLE}    InquiryAccountOtherRole

#-------------------------------------------- RemoveAccont --------------------------------------------#
#path url RemoveAccount
${URL_REMOVEACCOUNT}    /api/v1/Account/RemoveAccount

#header InquiryAccount
${HEADER_X_AIS_ORDERREF_REMOVEACCOUNT}    RemoveAccount_
${HEADER_X_AIS_ORDERREF_REMOVEACCOUNT_FAIL}    RemoveAccountfail_
${HEADER_X_AIS_ORDERDESC_REMOVEACCOUNT}    RemoveAccount

#response description
${VALUE_DESCRIPTION_REMOVEACCOUNT_SUCCESS}    RemoveAccount is Success

#request name
${REMOVEACCOUNT}    RemoveAccount
${REMOVEACCOUNT_OTHERROLE}    RemoveAccountOtherRole

#-------------------------------------------- RemoveAcconts --------------------------------------------#
#path url RemoveAccounts
${URL_REMOVEACCOUNTS}    /api/v1/Account/RemoveAccounts

#header InquiryAccounts
${HEADER_X_AIS_ORDERREF_REMOVEACCOUNTS}    RemoveAccounts_
${HEADER_X_AIS_ORDERREF_REMOVEACCOUNTS_FAIL}    RemoveAccountsfail_
${HEADER_X_AIS_ORDERDESC_REMOVEACCOUNTS}    RemoveAccounts

#response description
${VALUE_DESCRIPTION_REMOVEACCOUNTS_SUCCESS}    RemoveAccounts is Success

#request name
${REMOVEACCOUNTS}    RemoveAccounts
${REMOVEACCOUNTS_OTHERROLE}    RemoveAccountsOtherRole
#-------------------------------------------------------------------------------------------------------#
#-------------------------------------------- Thing --------------------------------------------#
#-------------------------------------------- CreateThing --------------------------------------------#	
#path url CreateThing
${URL_CREATETHING}    /api/v1/Thing/CreateThing

#header CreateThing
${HEADER_X_AIS_ORDERREF_CREATETHING}    CreateThing_
${HEADER_X_AIS_ORDERDESC_CREATETHING}    CreateThing

#value Create CreateThing
${VALUE_THINGNAME}    Sensor_TestThingName
${VALUE_ROUTEURL}    ["http://10.12.3.4:2019/api/information/AddInformation"]
${VALUE_ROUTEINFO_MIMO_ID}    "606edada"
${VALUE_ROUTEINFO_MIMO_SERIALNO}    5466758878
${VALUE_ROUTEFLAG_THINGNAME}    "true"
${VALUE_ROUTEFLAG_THINGTOKEN}    "true"
${VALUE_ROUTEFLAG_IMEI}    "true"
${VALUE_ROUTEFLAG_ICCID}    "true"
${VALUE_ROUTEFLAG_ROUTEINFO}    "true"

#response description
${VALUE_DESCRIPTION_CREATETHING_SUCCESS}    CreateThing is Success    

#request name
${CREATETHING}    CreateThing

#-------------------------------------------- InquiryThing --------------------------------------------#	

#path url InquiryThing
${URL_INQUIRYTHING}    /api/v1/Thing/InquiryThing

#header InquiryThing
${HEADER_X_AIS_ORDERREF_INQUIRYTHING}    InquiryThing_
${HEADER_X_AIS_ORDERREF_INQUIRYTHING_FAIL}    InquiryThingfail_
${HEADER_X_AIS_ORDERDESC_INQUIRYTHING}    InquiryThing

#request name
${INQUIRYTHING}    InquiryThing

#response description
${VALUE_DESCRIPTION_INQUIRYTHING_SUCCESS}    InquiryThing is Success

#-------------------------------------------- RemoveThing --------------------------------------------#	
#path url remove
${URL_REMOVETHING}    /api/v1/Thing/RemoveThing

#header RemoveThing
${HEADER_X_AIS_ORDERREF_REMOVETHING}    RemoveThing_
${HEADER_X_AIS_ORDERDESC_REMOVETHING}    RemoveThing

#request name
${REMOVETHING}    RemoveThing

#response description
${VALUE_DESCRIPTION_REMOVETHING_SUCCESS}    RemoveThing is Success

#-------------------------------------------- RenewToken --------------------------------------------#	
#path url RenewToken
${URL_RENEWTOKEN}    /api/v1/Thing/ReNewToken

#header RenewToken
${HEADER_X_AIS_ORDERREF_RENEWTOKEN}    RenewToken_
${HEADER_X_AIS_ORDERREF_RENEWTOKEN_FAIL}    RenewTokenfail_
${HEADER_X_AIS_ORDERDESC_RENEWTOKEN}    RenewToken

#response description
${VALUE_DESCRIPTION_RENEWTOKEN_SUCCESS}    RenewToken is Success    

#request name
${RENEWTOKEN}    RenewToken
${RENEWTOKEN_OTHERROLE}    RenewTokenOtherRole
#-------------------------------------------- ActivateThing Core --------------------------------------------#	
#path url ActivateThing Core
${URL_ACTIVATETHING_CORE}    /api/v1/Thing/ActivateThing

#header ActivateThing
${HEADER_X_AIS_ORDERREF_ACTIVATETHING_CORE}    ActivateThing_
${HEADER_X_AIS_ORDERREF_ACTIVATETHING_CORE_FAIL}    ActivateThingfail_
${HEADER_X_AIS_ORDERDESC_ACTIVATETHING_CORE}    ActivateThing

#response description
${VALUE_DESCRIPTION_ACTIVATETHING_CORE_SUCCESS}    ActivateThing is Success

#request name
${ACTIVATETHING_CORE}    ActivateThingCore

#-------------------------------------------- TransferThings --------------------------------------------#	
#path url TransferThings
${URL_TRANSFERTHINHS}    /api/v1/Thing/TransferThings
 
#header TransferThings
${HEADER_X_AIS_ORDERREF_TRANSFERTHINHS}    TransferThings_
${HEADER_X_AIS_ORDERREF_TRANSFERTHINHS_FAIL}    TransferThingsfail_
${HEADER_X_AIS_ORDERDESC_TRANSFERTHINHS}    TransferThings

${HEADER_X_AIS_TRANSFERTYPE_ACCOUNTID}    AccountId 
${HEADER_X_AIS_TRANSFERTYPE_ACCOUNTCODE}    AccountCode 

#response description
${VALUE_DESCRIPTION_TRANSFERTHINHS_SUCCESS}    TransferThings is Success    

#request name
${TRANSFERTHINHS}    TransferThings
${TRANSFERTHINHS_OTHERROLE}    TransferThingsOtherRole

${TRANSFERTHINHS_TRUE}    TransferThingsTrue
${TRANSFERTHINHS_FALSE}    TransferThingsFalse
#-------------------------------------------- CreateThingStateInfo --------------------------------------------#	
#path url CreateThingStateInfo
${URL_CREATETHINGSTATEINFO}    /api/v1/Thing/CreateThingStateInfo

#header CreateThingStateInfo
${HEADER_X_AIS_ORDERREF_CREATETHINGSTATEINFO}    CreateThingStateInfo_
${HEADER_X_AIS_ORDERREF_CREATETHINGSTATEINFO_FAIL}    CreateThingStateInfofail_
${HEADER_X_AIS_ORDERDESC_CREATETHINGSTATEINFO}    CreateThingStateInfo

#value Create ThingStateInfo
${VALUE_SENSORKEY}    Temp
${VALUE_SENSORKEY_CHARGING}    AA
${VALUE_TYPE_REPORT}    Report
${VALUE_TYPE_DESIRE}    Desire
${VALUE_TYPE_DESIRE_INVALID}    desire

#response description
${VALUE_DESCRIPTION_CREATETHINGSTATEINFO_SUCCESS}    CreateThingStateInfo is Success

#request name
${CREATETHINGSTATEINFO}    CreateThingStateInfo
${CREATETHINGSTATEINFO_OTHERROLE}    CreateThingStateInfoOtherRole

#-------------------------------------------- RemoveThingStateInfo --------------------------------------------#	
#path url remove
${URL_REMOVETHINGSTATEINFO}    /api/v1/Thing/RemoveThingStateInfo

#header RemoveThingStateInfo
${HEADER_X_AIS_ORDERREF_REMOVETHINGSTATEINFO}    RemoveThingStateInfo_
${HEADER_X_AIS_ORDERREF_REMOVETHINGSTATEINFO_FAIL}    RemoveThingStateInfofail_
${HEADER_X_AIS_ORDERDESC_REMOVETHINGSTATEINFO}    RemoveThingStateInfo

#value
# ${VALUE_STATETYPE}    Report 
# ${VALUE_STATEKEY}    Temp 
${VALUE_SENSORKEY_NOTFOUND}    BB 

#request name
${REMOVETHINGSTATEINFO}    RemoveThingStateInfo
${REMOVETHINGSTATEINFO_OTHERROLE}    RemoveThingStateInfoOtherRole

#response description
${VALUE_DESCRIPTION_REMOVETHINGSTATEINFO_SUCCESS}    RemoveThingStateInfo is Success
#-------------------------------------------------------------------------------------------------------#
#-------------------------------------------- Customer --------------------------------------------#	
#-------------------------------------------- DeleteCustomer --------------------------------------------#	
#path url DeleteCustomer
${URL_DELETECUSTOMER}    /api/v1/Customer/DeleteCustomer

#header DeleteCustomer
${HEADER_X_AIS_ORDERREF_DELETECUSTOMER}    DeleteCustomer_
${HEADER_X_AIS_ORDERREF_DELETECUSTOMER_FAIL}    DeleteCustomerfail_
${HEADER_X_AIS_ORDERDESC_DELETECUSTOMER}    DeleteCustomer

#response description
${VALUE_DESCRIPTION_DELETECUSTOMER_SUCCESS}    removeCustomer is Success

#request name
${DELETECUSTOMER}    DeleteCustomer
${DELETECUSTOMER_OTHERROLE}    DeleteCustomerOtherRole
#-------------------------------------------------------------------------------------------------------#
#-------------------------------------------- Import Thing --------------------------------------------#	
#path url ImportThing
${URL_IMPORTTHING}    /api/v1/Things/Import

#header ImportThing
${HEADER_X_AIS_ORDERREF_IMPORTTHING}    ImportThing_
${HEADER_X_AIS_ORDERDESC_IMPORTTHING}    ImportThing

#response description
${VALUE_DESCRIPTION_IMPORTTHING_SUCCESS}    The requested operation was successfully.

#request name
${IMPORTTHING}    ImportThing

#-------------------------------------------- Mapping IMEI --------------------------------------------#	
#path url MappingIMEI
${URL_MAPPINGIMEI}    /api/v1/Things/Mapping/IMEI

#header MappingIMEI
${HEADER_X_AIS_ORDERREF_MAPPINGIMEI}    MappingIMEI_
${HEADER_X_AIS_ORDERDESC_MAPPINGIMEI}    MappingIMEI

#response description
${VALUE_DESCRIPTION_MAPPINGIMEI_SUCCESS}    The requested operation was successfully.

#request name
${MAPPINGIMEI}    MappingIMEI
#-------------------------------------------------------------------------------------------------------#
#-------------------------------------------- CreateAThing --------------------------------------------#	
#path url CreateAThing
${URL_CREATEATHING}    /api/v1/Things

#header CreateAThing
${HEADER_X_AIS_ORDERREF_CREATEATHING}    CreateAThing_
${HEADER_X_AIS_ORDERDESC_CREATEATHING}    CreateAThing

#value Create CreateAThing
# ${VALUE_THINGNAME}    Sensor_TestThingName

#response description
${VALUE_DESCRIPTION_CREATEATHING_SUCCESS}    The requested operation was successfully.

#request name
${CREATEATHING}    CreateAThing

#request name
${VALUE_ATHINGNAME}    ThingName
${VALUE_SUPPLIERID}    SupplierId
${VALUE_SUPPLIERNAME}    SupplierName

${VALUE_THINGSTATE_IDLE}    Idle
${VALUE_THINGSTATE_PENDING}    Pending
${VALUE_THINGSTATE_MENUFACTURING}    Menufacturing
${VALUE_THINGSTATE_ACTIVATED}    Activated
${VALUE_CONNECTIVITYTYPE_NBIOT}    NBIOT
${VALUE_CONNECTIVITYTYPE_SIM3G}    SIM3G
${VALUE_CONNECTIVITYTYPE_SIM4G}    SIM4G
${VALUE_CONNECTIVITYTYPE_SIM5G}    SIM5G
${VALUE_CONNECTIVITYTYPE_WIFIOrWIMAX}    "WIFI or WIMAX
${VALUE_CONNECTIVITYTYPE_WIMAX}    WIMAX
${VALUE_CONNECTIVITYTYPE_WIFI}    WIFI
#-------------------------------------------------------------------------------------------------------#
#-------------------------------------------- HouseKeeper --------------------------------------------#	
#-------------------------------------------- CreateAHouseKeeper --------------------------------------------#	
#path url CreateAHouseKeeper
${URL_CREATEAHOUSEKEEPER}    /api/v1/housekeeper

#header CreateAHouseKeeper
${HEADER_X_AIS_ORDERREF_CREATEAHOUSEKEEPER}    CreateAHouseKeeper_
${HEADER_X_AIS_ORDERREF_CREATEAHOUSEKEEPER_FAIL}    CreateAHouseKeeperfail_
${HEADER_X_AIS_ORDERDESC_CREATEAHOUSEKEEPER}    CreateAHouseKeeper
 
#value CreateAHouseKeeper
${VALUE_HOUSEKEEPERNAME}    SC_Name
${VALUE_TYPE_KEEPING}    Keeping
${VALUE_TYPE_PURGING}    Purging
${VALUE_CONDITIONPROPERTIES_TYPE_DAYS}    Days
${VALUE_CONDITIONPROPERTIES_TYPE_DATETIME}    DateTime
${VALUE_CONDITIONPROPERTIES_TYPE_TRANSECTION}    Transection
${VALUE_CONDITIONPROPERTIES_TYPE_SIZE}    Size
${VALUE_BINDINGTYPE_PRETENANT}    PerTenant
${VALUE_BINDINGTYPE_PREACCOUNT}    PerAccount
${VALUE_BINDINGTYPE_PRETHING}    PerThing

#response description
${VALUE_DESCRIPTION_CREATEAHOUSEKEEPER_SUCCESS}    The requested operation was successfully.  

#request name
${CREATEAHOUSEKEEPER}    CreateAHouseKeeper

#-------------------------------------------- UpdateAHouseKeeper --------------------------------------------#	
#path url UpdateAHouseKeeper
${URL_UPDATEAHOUSEKEEPER}    /api/v1/housekeeper/id

#header UpdateAHouseKeeper
${HEADER_X_AIS_ORDERREF_UPDATEAHOUSEKEEPER}    UpdateAHouseKeeper_
${HEADER_X_AIS_ORDERREF_UPDATEAHOUSEKEEPER_FAIL}    UpdateAHouseKeeperfail_
${HEADER_X_AIS_ORDERDESC_UPDATEAHOUSEKEEPER}    UpdateAHouseKeeper
 
#value UpdateAHouseKeeper
${VALUE_UPDATEAHOUSEKEEPERNAME}    UpdateSC_Name

#response description
${VALUE_DESCRIPTION_UPDATEAHOUSEKEEPER_SUCCESS}    The requested operation was successfully.   

#request name
${UPDATEAHOUSEKEEPER}    UpdateAHouseKeeper
${UPDATEAHOUSEKEEPER2}    UpdateAHouseKeeper2
#-------------------------------------------- GetAListHouseKeeper --------------------------------------------#	
#path url GetAListHouseKeeper
${URL_GETALISTHOUSEKEEPER}    /api/v1/housekeeper

#header GetAListHouseKeeper
${HEADER_X_AIS_ORDERREF_GETALISTHOUSEKEEPER}    GetAListHouseKeeper_
${HEADER_X_AIS_ORDERREF_GETALISTHOUSEKEEPER_FAIL}    GetAListHouseKeeperfail_
${HEADER_X_AIS_ORDERDESC_GETALISTHOUSEKEEPER}    GetAListHouseKeeper

#response description
${VALUE_DESCRIPTION_GETALISTHOUSEKEEPER_SUCCESS}    The requested operation was successfully.   

#request name
${GETALISTHOUSEKEEPER}    GetAListHouseKeeper

#-------------------------------------------- GetAHouseKeeperById --------------------------------------------#	
#path url GetAHouseKeeperById
${URL_GETAHOUSEKEEPERBYID}    /api/v1/housekeeper/id

#header GetAHouseKeeperById
${HEADER_X_AIS_ORDERREF_GETAHOUSEKEEPERBYID}    GetAHouseKeeperById_
${HEADER_X_AIS_ORDERREF_GETAHOUSEKEEPERBYID_FAIL}    GetAHouseKeeperByIdfail_
${HEADER_X_AIS_ORDERDESC_GETAHOUSEKEEPERBYID}    GetAHouseKeeperById

#response description
${VALUE_DESCRIPTION_GETAHOUSEKEEPERBYID_SUCCESS}    The requested operation was successfully.   

#request name
${GETAHOUSEKEEPERBYID}    GetAHouseKeeperById

#-------------------------------------------- DeleteAHouseKeeper --------------------------------------------#	
#path url DeleteAHouseKeeper
${URL_DELETEAHOUSEKEEPER}    /api/v1/housekeeper/id
	
#header DeleteAHouseKeeper
${HEADER_X_AIS_ORDERREF_DELETEAHOUSEKEEPER}    DeleteAHouseKeeper_
${HEADER_X_AIS_ORDERREF_DELETEAHOUSEKEEPER_FAIL}    DeleteAHouseKeeperfail_
${HEADER_X_AIS_ORDERDESC_DELETEAHOUSEKEEPER}    DeleteAHouseKeeper

#response description
${VALUE_DESCRIPTION_DELETEAHOUSEKEEPER_SUCCESS}    The requested operation was successfully.

#request name
${DELETEAHOUSEKEEPER}    DeleteAHouseKeeper
#-------------------------------------------- Other --------------------------------------------#	
#Other field
${FIELD_OPERATIONSTATUS}    OperationStatus
${FIELD_CODE}    Code
${FIELD_DESCRIPTION}    Description
${FIELD_ACCESSTOKEN}    AccessToken    
${FIELD_PARTNERINFO}    PartnerInfo
${FIELD_PARTNERINFO_LOWWERCASE}    partnerInfo   
${FIELD_PARTNERID}    PartnerId  
${FIELD_PARTNERNAME}    PartnerName
${FIELD_ACCOUNTINFO}    AccountInfo  
${FIELD_ACCOUNTNAME}    AccountName  
${FIELD_ACCOUNTID}    AccountId  
${FIELD_ACCOUNTCODE}    AccountCode 
${FIELD_THINGINFO}    ThingInfo  
${FIELD_THINGID}    ThingId 
${FIELD_THINGIDENTIFIER}    ThingIdentifier  
${FIELD_THINGSECRET}    ThingSecret  
${FIELD_IMSI}    IMSI  
${FIELD_IMEI}    IMEI
${FIELD_THINGTOKEN}    ThingToken   
${FIELD_ACTIVATETHING}    ActivateThing
${FIELD_CUSTOMERID}    CustomerId
${FIELD_HOUSEKEEPERINFO}    HouseKeeperInfo
${FIELD_HOUSEKEEPERSINFO}    HousekeepersInfo
${FIELD_ID}    Id
${FIELD_CONDITIONPROPERTIES}    ConditionProperties
${FIELD_TYPE}    Type
${FIELD_NAME}    Name
${FIELD_BINDINGTYPE}    BindingType
${FIELD_BINDINGKEY}    BindingKey

${FIELD_ICCIDPRE}    896603
${ACCOUNTID_NULL}    Null
${ACCOUNTKEY_INVALID}    xx

#used flow ActivateThing and TransferThings for Crate WhiteList
${TYPE_CUSTOMER}    Customer 
${TYPE_TENANT}    Tenant 
${TYPE_ACCOUNT}    Account 

#used for Remove
${PARTNERACCOUNT}    PartnerAccount
${PARTNERACCOUNTTHINGARRCORECREATEAHOUSEKEEPER}    CreateAHouseKeeper_PartnerAccountThingArrCore
${PARTNERACCOUNTTHINGARRCORE}    PartnerAccountThingArrCore
${PARTNER}    Partner
${UPDATEAHOUSEKEEPER_DELETE}    UpdateAHouseKeeper_Delete
${UPDATEAHOUSEKEEPER_PARTNER}    UpdateAHouseKeeper_Partner
