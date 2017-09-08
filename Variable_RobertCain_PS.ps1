# Variable basics
# All variables start with a $ show a simple assignment
$hi = "Hello world !!"

$hi

Write-Host $hi

# show the type
$hi.GetType()

# types are mutable
$hi = 5
$hi.GetType()

[System.Int32]$myint = 32 # strongly typed variables
$myint.GetType()

$myint = "Make this work"

# short cut can be as below
[int]$myotherint = 43
$myotherint.GetType()

[string]$mystring = "this is great"
$mystring.GetType() 

"This is grate".ToUpper()

# Comparison
$var = 42

$var -gt 40
$var -lt 40
$var -eq 42

# calculation
$var = 3 * 4
$var

# *Very Very IMP
# Whatever is on the right side is converted to the datatype on the left

#----------------------------------------------------------------------------------------------------------------#

# Using the *-Variable cmdlets

#----------------------------------------------------------------------------------------------------------------#

Clear-Host

# Normal variable usage
$normal = 33
$normal

$text = "In the morning"
$text

# long version of $var = 123
New-Variable -Name var -Value 123
$var

Get-Variable var -ValueOnly

Get-Variable

# new value for the variable
Set-Variable -Name var -Value 22
$var

Clear-Variable -Name var
Get-Variable -Name var

Remove-Variable -Name var
Get-Variable -Name var

#---------------------------------------------------------------#
# strings
#---------------------------------------------------------------#

Clear-Host
'This is a string'
"This 'is ""double"" quote string"

Clear-Host

# Special char support
"Plural`bsight"

"Plural`nSight"

"Plural`rsight"

"Pular`tsight"

# Here strings - for large blocks of text
Clear-Host

$heretext = @"
Some text here 
das
ddasda


dasd Blank liens
"@

$heretext






























