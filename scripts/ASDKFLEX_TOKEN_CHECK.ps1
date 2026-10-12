#name var
$varName = "ADSKFLEX_LICENSE_FILE"
#run as current user which should be system if running from an RMM
$currentUser = (Get-CimInstance Win32_ComputerSystem).UserName

#get a specific system value that has the systemkey for the license 
$systemValue = (
    Get-ItemProperty `
    -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" `
    -ErrorAction SilentlyContinue
).$varName

#output a file whether the computer has this systemkey/license or not 
if ($null -ne $systemValue -and $systemValue -ne "") {
    Write-Output "$env:COMPUTERNAME,$currentUser,FOUND"
}
else {
    Write-Output "$env:COMPUTERNAME,$currentUser,NOT FOUND"
}