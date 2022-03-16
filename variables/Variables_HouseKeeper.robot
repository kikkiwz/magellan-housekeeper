*** Variables ***
#-------------------------------------------- Start ENV Master --------------------------------------------#
#STAGING	
# ${URL_GET_LOG}    https://mg-staging.siamimo.com:30380/elasticsearch/application*/_search?rest_total_hits_as_int=true&ignore_unavailable=true&ignore_throttled=true&preference=1620900474581&timeout=30000ms
# applicationName : supportadmin
# ${VALUE_APPLICATIONNAME_HOUSEKEEPER}    supportadmin

#IOT
${URL_GET_LOG}    https://mg-iot.siamimo.com:30380/elasticsearch/application*/_search?rest_total_hits_as_int=true&ignore_unavailable=true&ignore_throttled=true&preference=1620900474581&timeout=30000ms
# applicationName : supportadmin
${VALUE_APPLICATIONNAME_HOUSEKEEPER}    supportadmin

#-------------------------------------------- Data Provisioning SignIn   --------------------------------------------#
#IOT
#RootAdmin
${SIGNIN_USERNAME_ROOTADMIN}    QA_SC
${SIGNIN_PASSOWORD_ROOTADMIN}    VGVzdDEyMzQ=
#SupplierAdmin
${SIGNIN_USERNAME_SUPPLIERADMIN}    sctest_supplierddmin
${SIGNIN_PASSOWORD_SUPPLIERADMIN}    dGVzdDEyMzQ=
#CustomerAdmin
${SIGNIN_USERNAME_CUSTOMERADMIN}    sctest_customeradmin
${SIGNIN_PASSOWORD_CUSTOMERADMIN}    dGVzdDEyMzQ=
#Supplier
${SIGNIN_USERNAME_SUPPLIER}    sctest_supplier
${SIGNIN_PASSOWORD_SUPPLIER}    dGVzdDEyMzQ=
#Customer
${SIGNIN_USERNAME_CUSTOMER}    sctest_customer
${SIGNIN_PASSOWORD_CUSTOMER}    dGVzdDEyMzQ=

#-------------------------------------------- Data House Keeper   --------------------------------------------#
${VALUE_HOUSEKEEPER_URL}    /housekeeper
${VALUE_HOUSEKEEPER_ID_INVALID}    %20
${VALUE_HOUSEKEEPER_ID_INVALID2}    xx

${VALUE_HOUSEKEEPER_DAYS}    1
${VALUE_HOUSEKEEPER_DATETIME_STARTDATE}    2021-08-11T02:45:06.000Z
${VALUE_HOUSEKEEPER_DATETIME_ENDDATE}    2021-11-22T03:45:06.000Z
${VALUE_HOUSEKEEPER_TRANSECTION}    100000
${VALUE_HOUSEKEEPER_SIZE}    100000
${VALUE_HOUSEKEEPER_SIZE1}    342
${VALUE_HOUSEKEEPER_MORETHAN1TYPE_DAYS}    4
${VALUE_HOUSEKEEPER_MORETHAN1TYPE_TRANSECTION}    5000


${VALUE_HOUSEKEEPER_UPDATE_DAYS}    20
${VALUE_HOUSEKEEPER_UPDATE_DATETIME_STARTDATE}    2021-08-11T02:45:06.000Z
${VALUE_HOUSEKEEPER_UPDATE_DATETIME_ENDDATE}    2021-08-14T03:45:06.000Z
${VALUE_HOUSEKEEPER_UPDATE_TRANSECTION}    10
${VALUE_HOUSEKEEPER_UPDATE_SIZE}    10020
${VALUE_HOUSEKEEPER_UPDATE_MORETHAN1TYPE_DAYS}    4
${VALUE_HOUSEKEEPER_UPDATE_MORETHAN1TYPE_TRANSECTION}    

${VALUE_HOUSEKEEPER_UPDATE_DATETIME_STARTDATE_INVALID}    2021-08-19T02:45:06.000Z

#-------------------------------------------- Data Other   --------------------------------------------#
${VALUE_ACCOUNTID_OTHERROLE}    609b822cb7ae1f00014b82d1 
${VALUE_PARTNERID_OTHERROLE}    609b822cb7ae1f00014b82cd
${VALUE_CUSTOMERID_OTHERROLE}    609b822cb7ae1f00014b82cc
${VALUE_PARTNERNAME_OTHERROLE}    SC918365

${VALUE_ACCESSTOKENEXPIRE}    ibnxnVhs5Rx3IwglWv7/gVA/1TpQnKqAOBAADlRDvYhOpXwmlpYOEb5yfY5aZpoj0YRWRZM26i9HOqtc1fc1jpNDOK5JpISttmMEy59g2py7nLWonDe2YW2OPRGWSowk6+9ZihLU1fZ5d5jAqqrZaKlOAAI3N1TXDNLsHuKcOJMcERbCcaMqRaku+MY4/kzE+eyIdkfwwbjT91S2VQq+Wk2ooMWuLk6/ogqx75KEFBx4jWgDSdjc43yKZfEzo4Tys7tfqpFLnOlKVegMrc8SMg==