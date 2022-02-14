// Setting the scope to subscription
targetScope = 'subscription'

param location string = 'westeurope'
param storageAccountName string = 'sastate4242'

resource rg_state 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-state'
  location:location
}

// Deploying storage account using module
module stg './storage.bicep' = {
  name: 'storageDeployment'
  scope: rg_state    // Deployed in the scope of resource group we created above
  params: {
    storageAccountName: storageAccountName
    location:rg_state.location
  }
}

