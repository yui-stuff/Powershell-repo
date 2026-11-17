Get-ADUser -Filter 'Enabled -eq $false' -Properties Mail,UserPrincipalName |
#ADUser enabled false#
Select-Object Name,SamAccountName,Mail,UserPrincipalName |
Export-Csv "C:\Temp\DisabledUsers.csv" -NoTypeInformation
#Only show name, sam, mail, full name and export into a csv#
