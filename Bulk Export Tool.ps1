<#
This script is designed to allow the user to quickly generate a number of batch file from a generic base:
1. Create a folder on your datacenter desktop "batchscript" and place ALL files there

2. Use base.txt to create template that should be used for all accounts. The text that will be replaced w/ each acct num should be "xxxxxx"
2b. If there is also a parent number different from the account number that needs to be in the file, go on and replace it in the base prior to running

3. Create a text file "accounts.txt" that should just be a list of all the account numbers:
123456
234567
345678...

4. Run the below code it will do the following:

A) It will turn the base.txt into a listing of files with each account's account number in the name based on the list: x:\batchscript\<number>_migrated_export.bat
B) It will find/replace the "xxxxxx" in each file's contents with the correct account number based on the name list.
C) It will copy each x:\batchscript\<number>_migrated_export.bat file to their correct folder as "L:\HCASP\<Number>\migrated_export.bat"

#>

# Loops through the accounts.txt file line by line to create the individual batch files
foreach($line in Get-Content .\accounts.txt) {
    echo "Working on line: $line"
    
    $filename = "$line.bat"
    
    echo "$filename"
	
	# Copies the base.txt file to all of the needed individual files - just do as many lines of this as needed for all of them

	Copy-Item "x:\batchscript\base.txt" -Destination "x:\batchscript\$filename"

	# Replaces xxxxx with client ID. If you need to use 2 diff, change the xxxxx to yyyyy where needed to replace w/ different numbers

	((Get-Content -path "x:\batchscript\$filename") -replace 'xxxxxx', $line) | Set-Content -Path "x:\batchscript\$filename"

	# Moves the individual files to their respective folders

	Copy-Item "x:\batchscript\$filename" -Destination "L:\HCASP\$line\migrated_export_test.bat"
}
 

