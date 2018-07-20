# Check Office 365
# Checks if an Email Address is using Office 365
Param(
  [string]$EmailAddress
)

$NameExchange = (Resolve-DnsName -Type MX -Name $EmailAddress.Split("@")[1])[0].NameExchange
if($NameExchange -like "*mail.protection.outlook.com")
{
    Write-Host $EmailAddress "is using Office 365"
}
