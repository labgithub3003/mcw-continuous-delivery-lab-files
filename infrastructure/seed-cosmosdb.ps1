$studentprefix = "574204"
$githubAccount = "labgithub3003"
$resourcegroupName = "fabmedical-rg-" + $studentprefix
$cosmosDBName = "fabmedical-cdb-" + $studentprefix

# Fetch CosmosDB Mongo connection string
$mongodbConnectionString = `
    $(az cosmosdb keys list `
        --name $cosmosDBName `
        --resource-group $resourcegroupName `
        --type connection-strings `
        --query 'connectionStrings[0].connectionString')

# Seed CosmosDB database
docker run -ti `
    -e MONGODB_CONNECTION="$mongodbConnectionString" `
    ghcr.io/labgithub3003/fabrikam-init:sha256-5dd9e81d1135a77d9ac0dd0476569cb63cebd12a10204c4bf494846baf12a01a.sig
