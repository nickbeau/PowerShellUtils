# Check Office 365
# Checks if an Email Address is using Office 365
Param(
  [string]$CSVFile
)
$Addresses = Import-csv $csvfile
foreach ($Address in $Addresses)
{
$NameExchange = (Resolve-DnsName -Type MX -Name $Address.email.Split("@")[1])[0].NameExchange
if($NameExchange -like "*mail.protection.outlook.com")
{
    Write-Host $Address.email "is using Office 365"
}
}
