<#
In the referenced and simplofied file we can create a single user with multiple parameter, however we can 
use our existing knowledge a step further to read employee accounts from a CSV file and use New-ADUser to 
create AD user accounts

This solution has been tested for large scale deployment, we are basically automating account creation in 
in conjuction with HR Systems that creates flast files for new employee onboarding information.

Examples: 
Let's say that you've been sent a list of new employees in a CSV file. Each row in the CSV file 
represents a single row and has the following columns.
 FirstName, LastName, Department, State, EmployeeID, and Office.
 The naming convention for the user login account is the employee’s first initial
 concatenated with the last name such as ksapp for the employee Kevin Sapp.

Once you have the CSV file, then use Import-Csv to read the CSV file and capture each row as a single
object. Then iterate over each of those rows passing the appropriate fields in the CSV file to the 
expected parameters of New-ADUser. You can see an example of this below.





CSV Data Sample: 
FirstName, LastName, Department, State, EmployeeID, Office, UserPrincipalName, SamAccountName, Password
Micheal, Jordan, NBA, Chicago, 23, Chicago Bulls, mjordan@mylab.local, mjordan, p@ssw0rd1
Lebron, James, NBA, Los Angeles,24, LA Lakers,ljames@mylab.local, ljames, p@ssw0rd2
Dwayne, Wade, NBA, Miami, 13, Miami Heat, dwade@mylab.local, dwade, p@ssw0rd3

#>


$import_users = Import-Csv -Path sample.csv


$import_users | ForEach-Object {
    New-ADUser `
        -Name $($_.FirstName + " " + $_.LastName) `
        -GivenName $_.FirstName `
        -Surname $_.LastName `
        -Department $_.Department `
        -State $_.State `
        -EmployeeID $_.EmployeeID `
        -DisplayName $($_.FirstName + " " + $_.LastName) `
        -Office $_.Office `
        -UserPrincipalName $_.UserPrincipalName `
        -SamAccountName $_.SamAccountName `
        -AccountPassword $(ConvertTo-SecureString $_.Password -AsPlainText -Force) `
        -Enabled $True
}


  

