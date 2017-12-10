iex (get-command refreshenv).source

$secpasswd = ConvertTo-SecureString "vagrant" -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential ("vagrant", $secpasswd)

$boxstarter_module = (get-module -ListAvailable Boxstarter.Common).path
Import-Module -Name $boxstarter_module
Create-BoxstarterTask $Credential
Install-WindowsUpdate -acceptEula -SuppressReboots
Remove-BoxstarterTask
