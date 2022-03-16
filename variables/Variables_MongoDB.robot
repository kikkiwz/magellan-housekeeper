*** Variables ***
#STAGING
# mongodb://{$user}:{$pass}@{$ip}:${port}/mgcore?authSource=admin	
# ${CONNECT_TO_MONGODB}    mongodb://admin:ais.co.th@104.215.197.5:27018/mgcore?authSource=admin

#IOT
# mongodb://{$user}:{$pass}@{$ip}:${port}/mgcore?authSource=admin
${CONNECT_TO_MONGODB}    mongodb://admin:ais.co.th@52.163.210.190:27018/mgcore?authSource=admin

#----------------------------------------------------------------------------------------#
${MONGODB_TYPE_ALL}    All
${MONGODB_TYPE_SEARCHBYSELECTFIEDS}    SearchBySelectFields
${MONGODB_TYPE_INSERTDATA}    InsertData
#-------------------------------------- Table --------------------------------------------------#
${MONGODB_DBNAME_MGCORE}    mgcore
${MONGODB_DBCOLLNAME_TB_HOUSEKEEPERS}    housekeepers
#-------------------------------------- Detail Provisioning --------------------------------------------------#
${VALUE_DB_HOUSEKEEPER}    "{'_id': ObjectId('[HouseKeeperId]'), 'ConditionProperties': [ConditionProperties], 'Type': '[Type]', 'BindingType': '[BindingType]', 'BindingKey': '[BindingKey]', 'Name': '[Name]', 'Resource': [Resource], 'Status': '[Status]', 'CreatedDateTime': datetime.datetime([CreatedDateTime]), 'LastUpdatedTimestamp': datetime.datetime([LastUpdatedTimestamp]), 'RemoveStatus': [RemoveStatus]}"
