PS51> New-ADUser `
	-Name "Christian Martin" `
	-GivenName "Christian" `
	-Surname "Martin" `
	-SamAccountName "christian" `
	-AccountPassword (Read-Host "-AsSecureString "Input User Password") `
	-ChangePasswordAtLogon $True `
	-Company "CloudBorgs" `
	-Title "Systems Operations Analyst" ``
	-State "Maryland" `
	-City "FortMead" `
	-Description "Account Creation" `
	-EmployeeNumber "62" `
	-Department "Operations" `
	-DisplayName "Christian Martin" `
	-Country  "USA" `
	-PostalCode "21200" `
	-Enable $True
	
