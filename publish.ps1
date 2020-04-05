param (
    [Parameter(Mandatory = $true)] [string] $ApiKey
)

Publish-Module -Name Sips.PowerCli -NuGetApiKey $ApiKey
