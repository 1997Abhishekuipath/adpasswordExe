param (
    [string]$ADadminuser,
    [string]$adminpassword,
    [string]$user,
    [string]$domainName,
    [string]$randomPassword
)

Write-Host "ADadminuser: $ADadminuser"
Write-Host "adminpassword: $adminpassword"
Write-Host "user: $user"
Write-Host "domainName: $domainName"
Write-Host "randomPassword: $randomPassword"

$password = ConvertTo-SecureString $adminpassword -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential($ADadminuser, $password)
Set-ADAccountPassword -Server $domainName -Credential $cred -Identity $user -Reset -NewPassword (ConvertTo-SecureString -AsPlainText $randomPassword -Force)