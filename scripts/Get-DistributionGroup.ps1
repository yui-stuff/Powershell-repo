1.
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
2.
Install-Module -Name ExchangeOnlineManagement
3.
Import-Module ExchangeOnlineManagement
4.
Connect-ExchangeOnline -UserPrincipalName username@domain.com -ShowBanner:$false
5.
login via password

groupname@businessunit.com

$email = "groupname@businessunit.com"

Get-Recipient -Identity $email |
    Format-List Name,DisplayName,PrimarySmtpAddress,RecipientType,RecipientTypeDetails
	
	
Get-DistributionGroup -Identity "groupname@businessunit.com" |
    Format-List DisplayName,PrimarySmtpAddress,IsDirSynced,ManagedBy
	
	output: 
	
	DisplayName        : Group Name
PrimarySmtpAddress : groupname@businessunit.com
IsDirSynced        : False
ManagedBy          : {User, User, User}

next: 
1. Identify User: 

mailto:Username@domain.com


$Group = "groupname@businessunit.com"
$User  = "Username@domain.com"

Add-DistributionGroupMember `
    -Identity $Group `
    -Member $User
	
	Then verify: 
	
	Get-DistributionGroupMember `
    -Identity "groupname@businessunit.com" `
    -ResultSize Unlimited |
    Select-Object DisplayName, PrimarySmtpAddress, RecipientType |
    Sort-Object DisplayName