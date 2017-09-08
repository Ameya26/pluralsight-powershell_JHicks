# List default Providers
Clear-Host
Get-PSProvider

Clear-Host
Get-PSDrive

# Move to ENV drive
Clear-Host
Set-Location Env:
Get-ChildItem

Clear-Host
Get-ChildItem |
    Format-Table -Property Name, Value -AutoSize

Clear-Host
Set-Location Alias:
Get-ChildItem


# Adding new provider, using concept called snappin

# Show list of snap-ins
Clear-Host
Get-PSSnapin

# Show list of registered snap-ins
Clear-Host
Get-PSSnapin -Registered















