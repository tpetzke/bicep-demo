# Azure BICEP Demo
### Use BICEP to setup a storage account that can hold the terraform state

This code demostrates the use of BICEP to setup an azure storage account wth a blob storage container
that can hold the terraform state for a subsequent deployment of infrastructure with terraform

BICEP is a DSC (Desired State Configuration) language that simplifies the deployment through the 
Azure Resource Manager (ARM) that usually works with hard to read JSON files. BICEP is similar to terraform but
does not require an external state file. The state is hold in Azure itself.

This makes it suitable to deploy the storage accont for Terraform as itself does not require a state itself. If the
storage account already exists (from a pevious run) it will do nothing.

The yml file uses the BICEP files to create a 1 stage pipeline. This could be the initial stage in a pipeline that runs
terraform in later stages.

Note: The current yml code assumes a windows agent for deployment, either self-hosted on Windows or 
using the vmImage: windows-latest. For unix based agents the scriptType must be changed from batch to bash and the 
end-of-line character is \ instead of ^. Also the repository directory names must be adjusted.



