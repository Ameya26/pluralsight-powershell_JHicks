#---------------------------------------------------------------#
# Programming - Branching
#---------------------------------------------------------------#

Clear-Host
# Branching - if else condition

$var = 3
if($var -eq 1)
{
    Clear-Host
    "If branch"
}
else
{
    Clear-Host
    "Else branch"
    if($var -eq 3)
    {
        Clear-Host
        "if -eq 3"
    }
    else
    {
        Clear-Host
        "Else inner"
    }
}

# Switch statement for multiple conditions
Clear-Host

$var = 42
switch($var)
{
    41 {"Forty one"}
    42 {"Forty two"}
    43 {"Forty three"}
    default {"default"}
}


# will match all lines that match
Clear-Host
$var = 42
switch($var)
{
    42 {"Forty two"}
    "42" {"Forty two string"}
    default {"Default"}

}

# To stop processing once a block is found use break
Clear-Host
$var = 42
switch($var)
{
    42 {"Forty two"; break}
    "42" {"Forty two string"}
}


# Switch works with collections, looping and executing for each match
Clear-Host
switch(3,1,4,24)
{
    3 {"3 found"}
    1 {"1 found"}
    32 {"32 found"}
    24 {"24 found"}

}

#String compares are case in-sensitive by default
Clear-Host
switch("Pluralsight")
{
    "pluralsight" {"lowercase"}
    "PLURALSIGHT" {"Uppercase"}
    "PluralSight" {"mixed case"}

}

#use the -caseSensitive switch to make it so
Clear-Host
switch -CaseSensitive ("PluralSight")
{
    "pluralsight" {"lowercase"}
    "PLURALSIGHT" {"Uppercase"}
    "PluralSight" {"mixed case"}

}

# Switch also supports wildcard case
Clear-Host
switch -Wildcard ("PluralSight")
{
    "plural*" {"*"}
    "?luralsight" {"?"}
}

# Note it will also support reqgex matches

##

#---------------------------------------------------------------#
# Programming - Looping
#---------------------------------------------------------------#

#While
Clear-host
$i = 1
while($i -le 5)
{
    "`$i = $i"
    $i = $i + 1
}

# won't execute if condition is already true
$i = 6
while($i -le 5)
{
    "`$i = $i"
    $i = $i + 1
}

#do loop
Clear-Host

$i = 1
do
{
    "`$i = $i"
    $i ++

}while($i -le 5)

# do executes atleast once
Clear-Host
$i = 6
do{
    "`$i = $i"
    $i++

}while($i -le 5)

# Use until to make the check more positive
Clear-Host
$i = 1
do{
    "`$i = $i"
    $i ++
}until($i -gt 5)

# for loop iterates a number of times
Clear-Host
for($f=0; $f -le 5; $f++)
{
    "`$f = $f"
}

# Note the initalizer can be set seperately
Clear-Host
$f = 0
for(;$f -le 5; $f++)
{
    "`$f= $f"
}

# Iterating over a collection 1 by 1
Clear-Host

$array = @(11,12,13,14,15)
for($f=0; $f -lt $array.Length; $f++)
{
    "`$array[$f] = " +$array[$f]
}

# foreach works on a collection
Clear-Host
$array = @(11,12,13, 14, 15) #simple array
foreach($item in $array)
{
    "`$item = $item"
}

# foreach works with an array of objects
Clear-Host
Set-Location "C:\GitRepos\PluralSight\Powershell\pluralsight-powershell_JHicks"
foreach($file in Get-ChildItem)
{
    $file.Name
}

# foreach loop with logic to print only *.ps1 files
Clear-Host
Set-Location "C:\GitRepos\PluralSight\Powershell\pluralsight-powershell_JHicks"

foreach($file in Get-ChildItem)
{
    if($file.Name -like "*.ps1")
    {
        $file.Name
        break
    }

}

# Use continue to skip the rest of a loop but go onto the next iteration
Clear-Host
Set-Location "C:\GitRepos\PluralSight\Powershell\pluralsight-powershell_JHicks"

foreach($file in Get-ChildItem)
{
    if($file.Name -like "*.ps1")
    {
        $file.Name
        continue
    }
    "This isn't a powershell file : $file"
}

# when used in a nested loop, break exists to the outer loop
Clear-Host
foreach($outerside in 1..3) # returns the collection
{
    "`$outerside = $outerside"
    foreach($innerside in 4..6)
    {
        "     `$innerside = $innerside"
        break
    }
}

# use Loop Labels to break to a certain loop
Clear-Host
:outersideLoop foreach($out in 1..3)
{
    "`$out = $out"
    foreach($in in 4..6)
    {
        "    `$in = $in"
        break outersideLoop
    }
}


#---------------------------------------------------------------#
# Programming - Script block
#---------------------------------------------------------------#

# A basic script block is code inside {}
# The for (as well as other loops) execute a script block

for ($f=0;$f -le 5;$f++)
{
    "`$f = $f"
}

# (note, to put multiple commands on a single line use the ;)
{Clear-Host; "Powershell and bowties are cool."}

# you can store script block inside a variable
$cool = {Clear-Host; "Powershell and bowties are cool."}

$cool # doesn't run it just show comments

& $cool # To actually run it, use the & character

& {Clear-Host ; "You are pretty cool "} # doesn't need the actual variable it can be just script block 

# since scripts can be put in a variable, you can do interesting things
$coolwall = {"This script block is pretty coolll...."}
$subXerowall = $coolwall
for($f=0;$f-le5;$f++)
{
    & $coolwall
    & $subXerowall
    "`$f = $f"
}


# to return a value from a script, output it so it's not consumed
$value = {41+1}
& $value

1 + (& $value) # to use in equation warp in ()

1 + & $value  # this fails

$value = {return 42; Write-Host "This is cool"}
&$value

# Parameters 1: Using the args collection. Count parameter can be used with args
$qa = {
    $question = $args[0]
    $answer = $args[1]
    Write-Host "Here is your question: $question, The answer is $answer"
}
&$qa "What is cool? " "Powershell !!!"

# Parameter 2: more readable method - using the param block (More use)
$qa = {
    param($question,$answer)
    Write-Host "Here is your question $question and the answer is $answer"

}
& $qa "What else is really cool " "C# is really cool"

# You can pass by name
&$qa -question "Wht is cool" -answer "Stuff"

# param order is not important
&$qa -answer "Oh kay" -question "What next"

# shortcut can also be passed as parameter
&$qa -q "What do you eat" -a "Chicken paremasan"

# you can pass error message when parameter is not provided by the user for e.g
$qa = {
    param($question, $answer)
    if(!$answer) {$answer = "Error: You must pass the answer"}
    Write-Host "Here is your question: $question and The answer is $answer"
}

&$qa "Question???"


# passing default value in param
$qa = {
    param($question, $answer = "This is a default answer")
    Write-Host "Here is your question: $question and The answer is $answer"

}


&$qa "Question???"

# You can use explicit typing on parameters
Clear-Host
$math = {
    param([int]$x , [int]$y)
    return $x * $y
}

& $math 100 4
& $math 100 x

# Pipeline enabling a block can be used using process keyword
Clear-Host

$onlyCoolFiles = {
    process {
        if($_.Name -like "*.ps1")
        { return $_.Name }
    }
}

Get-ChildItem | &$onlyCoolFiles

# Keyword - begin...process...end block useful for adding header text
$onlyCoolFiles = {
    begin { $retval = "Here are some cool files ....... `r`n"}
    process {
        if($_.Name -like "*.ps1")
        { $retval = $retval + "`t " + $_.Name + "`r`n " }
    }
    end { return $retval}
}

Get-ChildItem | &$onlyCoolFiles

# Using param to pass the text dynamically
$onlyCoolFiles = {
    param($headerText)
    begin { $retval = $headerText + "`r`n"}
    process {
        if($_.Name -like "*.ps1")
        { $retval = $retval + "`t" + $_.Name + "`r`n"}
    }
    end {return $retval}
}

Clear-Host

Get-ChildItem | &$onlyCoolFiles "This is dynamic text"


#---------------------------------------------------------------#
# Programming - Variable scope
#---------------------------------------------------------------#

$var = 42
& {Write-Host "Inside block. $var"}

# to access the parent variable in the script block use -scope parameter
# 0 is current scope
# 1 is its parent
# 2 is its grandparent and so on.....

$var = 42
& { $var = 33;
    Write-Host "Inside the block : $var" 
    Write-Host "Parent : " (Get-Variable var -valueOnly -scope 1)}
Write-Host "Outside the block: $var"

# set variable can be used to override the value BAD Practice
Clear-Host
$var = 13
& {Set-Variable var 99 -Scope 1;
   Write-Host "Inside the block: $var"}
Write-Host "Outside the block $var"

#global scope
# Making it global allows it to be used inside the script, and won't be copied
$global:var = 42
& {$global:var = 33}
Write-Host "Outside block : $global:var"

# on the reverse side private makes in very private
Clear-Host
$private:unmentionables = 33
& {if($unmentionables -eq $null)
    { Write-Host "I can't show you they are null"}
    }
Write-Host "Outside the block $private:unmentionables"


#Variables declared inside a block are available only in it (i.e., it has local scope)
Clear-Host
&{ $localvar = 43; Write-Host "Inside the block $localvar" }
Write-Host "Outside the block $localvar"

#---------------------------------------------------------------#
# Programming - Functions
#---------------------------------------------------------------#

# Functions are basically script blocks with names
function Get-Fullname($firstName, $lastName)
{
    Write-Host($firstName + " " +$lastName)
}

Get-Fullname("Ameya","Deshpande")

Get-Fullname "Ameya" "Deshpande"

# Affect the value of the parameter passed in
# Rather than using Set-Variable with its -scope, you can pass by ref
# Note however it turns it into an OBJECT, thus requiring the .value synctax
function Set-FVar([ref] $myparam)
{
    $myparam.Value = 23
}

Clear-Host
$fvar = 32
"fvar before: $fvar"
Set-FVar([ref]$fvar) # must add ref to call
"favr after a $fvar"

# read from pipeline
function Get-CoolFiles()
{
    begin {$retval = "Here are some cool files: `r`n"}
    process {
        if($_.Name -like "*.ps1")
        {
            $retval = $retval + "`t " + $_.Name + "`r`n"
        }
    }
    end {return $retval}
}

Set-Location "C:\GitRepos\PluralSight\Powershell\pluralsight-powershell_JHicks"

Clear-Host
Get-ChildItem | Get-CoolFiles

# Above works fine but ties it to PS1

# instead use filter function, Filters can be built to remove unwanted files
filter Show-PS1Files
{
    $filename = $_.Name
    if($filename -like "*.ps1")
    {
        return $_
    
    }
}

Clear-Host

Get-ChildItem | Show-PS1Files

# This version doesn't check for the ps1, it just lists what's passed in
function List-FileNames
{
    begin {$retval = "This will list all the files in the current directory `r`n"}
    process {$retval = $retval + "`t" + $_.Name + "`r`n"}
    end { return $retval }
}

Clear-Host
Get-ChildItem | List-FileNames

# Now combine the two for real flexibility
Get-ChildItem | Show-PS1Files | List-FileNames

# Now to do other files txt files, just create another filter
filter Show-TxtFiles
{
    $filename = $_.Name
    if ($filename -like "*.txt")
    {
        return $_
    }
}

Get-ChildItem | Show-TxtFiles | List-FileNames

# Now you have two ways to us your function
Clear-Host
Get-ChildItem | Show-PS1Files | List-FileNames
Get-ChildItem | Show-TxtFiles | List-FileNames


# having your function output to the pipeline
Clear-Host
Set-Location "C:\GitRepos\PluralSight\Powershell\pluralsight-powershell_JHicks"
Get-ChildItem | Select-Object "Name"

function Get-ChildName()
{
    Write-Output (Get-ChildItem | Select-Object "Name")
}

Clear-Host

Get-ChildName | Where-Object {$_.Name -like "*.txt"}

# Supporting -verbose and -debug options
# To support, first need to change the values of the special variables:
# $DebugPreference   Default is SilentlyContinue, change to Continue
# $VerbosePreference Default is SilentlyContinue, change to COntinue

function Get-ChildName()
{
    param([switch]$verbose, [switch]$debug)

    if($verbose.IsPresent)
    {
        $VerbosePreference = "Continue"
    }
    else
    {
        $VerbosePreference = "SilentlyContinue"
    }
    if($debug.IsPresent)
    {
        $DebugPreference = "Continue"
    }
    else
    {
        $DebugPreference = "SilentlyContinue"
    }

    Write-Verbose "Currently working location is $(Get-Location)"
    Write-Output (Get-ChildItem | Select-Object "Name")
    Write-Debug "Ok I have selected some...."
}

Clear-Host

Get-ChildName
Get-ChildName -verbose
Get-ChildName -debug
Get-ChildName -verbose -debug

#---------------------------------------------------------------#
# Adding help to YOur functions
#---------------------------------------------------------------#
Clear-Host

Get-Help  Get-ChildName

# Custom tags within a comment block that Get-Help will recognize
# Note that not all of them are required
# .SYNOPSIS - A brief description of the Command
# .DESCRIPTION - Detailed command description
# .PARAMETER Name - Include one description for each parameter
# .EXAMPLE - Detailed examples on how to use the command
# .INPUTS - what pipeline inputs are supported
# .OUTPUTS - What this function outputs
# .NOTES - Any misc notes you havent put anywhere else
# .LINK - A link to the URL for more help, Use one .LINK per URL
# Use "Get-Help about_commen_based_help" for full list and details



function Get-ChildName()
{
<#
    .SYNOPSIS
    Returns a list of only the names for the child items in the current directory

    .DESCRIPTION
    This function is similar to Get-ChildItem, except that it returns only the name property
#>

    param([switch]$verbose, [switch]$debug)

    if($verbose.IsPresent)
    {
        $VerbosePreference = "Continue"
    }
    else
    {
        $VerbosePreference = "SilentlyContinue"
    }
    if($debug.IsPresent)
    {
        $DebugPreference = "Continue"
    }
    else
    {
        $DebugPreference = "SilentlyContinue"
    }

    Write-Verbose "Currently working location is $(Get-Location)"
    Write-Output (Get-ChildItem | Select-Object "Name")
    Write-Debug "Ok I have selected some...."
}


Clear-Host

Get-Help Get-ChildName -Full


#---------------------------------------------------------------#
# Error handling
#---------------------------------------------------------------#

function Divver($enum, $denom)
{
    Write-Host "Divver Begins"
    $result = $enum / $denom
    Write-Host "Result = $result"
    Write-Host "Divver done "

    trap{
        Write-Host "Oh No!!! An error has occurred !!!"
        Write-Host $_.ErrorID
        Write-Host $_.Exception.Message
        continue # continue will continue with the next line of the code after the error
    }

}

Clear-Host
Divver 22 11

Divver 33 0

# break in trap

function Divver($enum, $denom)
{
    Write-Host "Divver Begins"
    $result = $enum / $denom
    Write-Host "Result = $result"
    Write-Host "Divver done "

    trap{
        Write-Host "Oh No!!! An error has occurred !!!"
        Write-Host $_.ErrorID
        Write-Host $_.Exception.Message
        break # break with break or omitting it error bubbles up the parent.
    }

}


Divver 33 0

Clear-Host


function Divver($enum, $denom)
{
    trap [System.DivideByZeroException]
    {
        Write-Host "Hey..... you cant divide by zero !!!"
        continue
    }

    trap{
        Write-Host "Oh No!!! An error has occurred !!!"
        Write-Host $_.ErrorID
        Write-Host $_.Exception.Message
        break # break with break or omitting it error bubbles up the parent.
    }

    
    Write-Host "Divver Begins"
    $result = $enum / $denom
    Write-Host "Result = $result"
    Write-Host "Divver done "


}

Clear-Host
Divver 33 0


# Two main ways to Handle errors
# Option 1 - Handle Error Internally - See above function
# Option 2 - Add trap logic in parent

# Change continue to break

function Divver($enum, $denom)
{
    trap [System.DivideByZeroException]
    {
        Write-Host "Hey..... you cant divide by zero !!!"
        break  # breaking or omitting to bubble up
    }

    trap{
        Write-Host "Oh No!!! An error has occurred !!!"
        Write-Host $_.ErrorID
        Write-Host $_.Exception.Message
        break # break with break or omitting it error bubbles up the parent.
    }

    
    Write-Host "Divver Begins"
    $result = $enum / $denom
    Write-Host "Result = $result"
    Write-Host "Divver done "
}

# Now call routine in a script block or other function

& {
    
    Clear-Host
    Divver 33 0

    # Assume child has handled error, Keep going Silently
    trap
    {
        continue
    }
}


#---------------------------------------------------------------#
# Working with Files VERY IMP
#---------------------------------------------------------------#

Clear-Host
Set-Location "C:\GitRepos\PluralSight\Powershell\pluralsight-powershell_JHicks"
Get-ChildItem "*.txt"

Get-Content ".\Objective.txt"
$a = Get-Content ".\Objective.txt"

Clear-Host
$a

# Looks are deceptive, this is actually an array
$a[0]
$a[4]

$a.GetType()

Clear-Host
for($i=0; $i -le $a.Count; $i++)
{
    $a[$i]
}

# To combine, we can use Join, passing in the seperator and the variable
$seperator = [System.Environment]::NewLine # could have used `r`n
$all = [string]::Join($seperator, $a)

$all
$all.GetType()

Clear-Host

# supports wildcards
Set-Location "C:\GitRepos\PluralSight\Powershell\pluralsight-powershell_JHicks"
$courses = Get-Content "*.txt"
$courses

$courses.GetType()

$allcourses = [string]::Join($seperator, $courses)
$allcourses.Gettype()

# To write things to disk, use Set-Content

# Just to prove its not there
Get-ChildItem "All Courses.txt"

Set-Content -Value $allcourses -Path "All Courses.txt"

Get-ChildItem "All Courses.txt"

# Set-Content is destructive REMEMBER, instead use Add-Content to append the content
Add-Content -Value "Powershell added by add content function" -Path "All Courses.txt"
Get-Content "All Courses.txt"

# Clean up afterwards
Remove-Item "All Courses.txt"













