// Setting the scope to resourceGroup, it is the default but shown here for better readability
targetScope = 'resourceGroup'

// we get the storage account name as parameter from main
param storageAccountName string
param location string = resourceGroup().location

resource sa_state 'Microsoft.Storage/storageAccounts@2021-08-01' = {
  name: storageAccountName
  location: location
  sku:  {
    name: 'Standard_LRS'
  }
  kind:'StorageV2'
  properties:{
    accessTier:'Hot'
  }
}

resource sa_state_conatainer 'Microsoft.Storage/storageAccounts/blobServices/containers@2021-08-01' = {
  name: '${sa_state.name}/default/tfstate'
}

