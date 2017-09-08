# Get-Command - Reterives a list of all system commands
Get-Command

# Can expand by seraching for just a verb or noun
Get-Command -Verb "get"
Get-Command -Noun "service"

# Get-Help can be used to explain a command
Get-Help Get-Command
Get-Help Get-command -Examples
Get-Help Get-Command -Detailed
Get-Help Get-Command -Full

# Can also be used for help
Get-Command -?

# Moving around the file tree
# Get-ChildItem lists all items in current path
Get-ChildItem

# Set-Location will change the current path
Set-Location "C:\ADCC"
Set-Location "C:\GitRepos\PluralSight\Powershell\pluralsight-powershell_JHicks"

# pipelining - combine cmdLets for power, $_ current object
Get-ChildItem | Where-Object {$_.Length -gt 1mb }

Get-ChildItem | Where-Object {$_.Length -gt 0.1kb} | Sort-Object Length

# can break commands up among serveral lines
# (note pipe must be last character on the line)
Get-ChildItem |
    Where-Object {$_.Length -gt 0.1kb } |
    Sort-Object Length
    
Get-ChildItem |
    Where-Object {$_.Length -gt 0.1kb } |
    Sort-Object Length |
    Format-Table -Property Name, Length -AutoSize

# you can also use Select-Object to retrieve certain properties from an object
Get-ChildItem |
    Select-Object Name, Length


# .Net everywhere
$a = "I am now a Powershell expert"
$a
$a.Length
$a.GetType()

$b = 100.323
$b
$b.GetType()

















