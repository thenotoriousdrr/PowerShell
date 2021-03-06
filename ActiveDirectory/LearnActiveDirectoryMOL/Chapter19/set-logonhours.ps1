<#
 Code listings from:
  Active Directory Management in a Month of Lunches
  Chapter 19

 All code supplied "as is" as an example to illustrate the text. No guarantees or warranties are supplied with this code.
 It is YOUR responsibilty to test if for suitability in YOUR environment.
 The comments match the section headings in the chapter
#>

if (-not (Get-Module ActiveDirectory)){
  Import-Module ActiveDirectory
}

<#
 see http://msmvps.com/blogs/richardsiddaway/archive/2012/01/26/setting-a-users-logon-hours.aspx
 for details of setting byte array
#>
## allow logon 8am - 6pm Monday to Friday
[byte[]]$hours = @(0,0,0,0,255,3,0,255,3,0,255,3,0,255,3,0,255,3,0,0,0)

$name = "UserA"
Get-ADUser -Identity $name |
Set-ADUser -Replace @{logonhours = $hours}

