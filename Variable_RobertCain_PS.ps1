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

# also works with single quote string


# String interpolation
Clear-Host
$items = (Get-ChildItem).Count
$loc = Get-Location

"There are $items items in the folder $loc"

# To actually display the vairable, escape it with a backtick
"There are `$items items are in the folder `$loc"

# string interpolation works with only double quotes

# Can use expression in string, need to be wrapped in $()
Clear-Host

"There are $((Get-ChildItem).Count) items are in the folder $(Get-Location)"

# String formating - C# like syntax is supported
[String]::Format("There are {0} items. ", $items)

# Powershell shortcuts
"There are {0} items ...." -f $items

"There are {0} items in the location {1} " -f $items, $loc

# Additional formating can be provided using {0:0.00}
"THerea are {0:0.00} dollar in my account " -f (33.13 * 323)

# Wildcards
Clear-Host
"Pluralshight" -like "Plural*"
"Pluralsight" -like "arcane*"
"Pluralsight" -like "?luralsight"    # question mark work for single characters
"Pluralsight" -like "Plural*[s-v]"   # ends in a char btw s and v
"Pluralsight" -like "Plural*[a-c]"   # ends in a char btw a and c

# Regular expressions
Clear-Host
"888-011-3125" -match "[0-9]{3}-[0-9]{3}-[0-9]{4}" # phone validation
"100.122.0122" -match "[0-9]{3}-[0-9]{3}-[0-9]{4}"

#---------------------------------------------------------------#
# Array
#---------------------------------------------------------------#

Clear-Host
$array = "ameya", "deshpande"
$array[0]
$array[1]
$array

$array.GetType()

#updating arrays
$array = "plural", "sight"
$array

# Formal array creation syntax
$array = @("mayura", "deshpande")
$array

# Empty array can be created only formal array creation syntax
$array = @()
$array.Count

# Cool method to load arrays using numeric range notation
$array = 1..5
$array

# Item exits in an array
Clear-Host
$array = @(1, 43,323)
$array -contains 43
$array -inotcontains 99
$array -notcontains 43

#---------------------------------------------------------------#
# Hash tables
#---------------------------------------------------------------#

Clear-Host

$hash = @{"Key" = "Value";
          "Pluralsight" = "pluralsight.com";}

$hash                # Display all values
$hash["Pluralsight"] # Get a single value from the key

$hash."Pluralsight"  # Get single value using object syntax

# Can be used as a variable as keys
$mykey = "Pluralsight"
$hash.$mykey       # using variable as property
$hash.$($mykey)    # evaluating as an expression
$hash.$("Plural" + "Sight")

# Adding and removing
$hash

$hash["new Key"] = "top gera.com"
$hash.Remove("Key")
$hash

# see if key exists
$hash.Contains("new Key")
$hash.Contains("key")

# See if value exists using ContainsValue
$hash.ContainsValue("value")
$hash.ContainsValue("top gera.com")

# list keys and values
$hash.Keys
$hash.Values

# Find if key or value is present in the hash table
$hash.Keys -contains "new key"

$hash.Values -contains "top gera.com"


#---------------------------------------------------------------#
# Built in variables
#---------------------------------------------------------------#

Clear-Host

# False and True
$false
$true

# Null
$Null

# current directory $pwd
$PWD

# Users home directory $Home
$HOME

# Info about a user machine $Host
$Host

# Process ID
$PID

# Current version of the powershell $PSVersionTable
$PSVersionTable

# $_ # Current Object
Get-ChildItem | Where-Object {$_.Name -like "*.ps1"}
Get-ChildItem | Where-Object {$_.Name -like "*.txt"}



































