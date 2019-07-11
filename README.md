# Bulk-Export-Tool
Written to exponentially speed up work by allowing me to create/update our export files in bulk based on a template. Prior each file would have to be individually updated,which could take weeks. Now it can be done in minutes. It's been disseminated company-wide. 

Generally, updating exports requires navigating to the folder for each account and opening the .bat file inside of that folder, editing that file, saving, and archiving the old one. In the case of 10+ accounts, this means repeating this process as many times. Firstly, a minor change, such as to 1 line can take an extended time being done serially. Second, the chances for human error are increased each time a person has to touch a file. It is highly unlikely a person will repeat this process 30 times without creating a single error. 

1. Create a folder on your datacenter desktop named "batchscript" and place all files there.
2. Use base.txt to create a template of the batch file that the export for all accounts will be built on. Name this file "base.txt" and ensure each place where the individual account numbers will be used is "xxxxxx" in the file. If there is a parent account that differs from the product accounts, go on and place that in the base file as it appears. 
3. Create a text file named "accounts.txt" that should just be a list of all of the account numbers:
  123456
  234567
  345678
4.Run "Bulk Export Tool.ps1" to do the following:

A) It will generate a collection of batch files from base.txt for each account number in the accounts.txt file: x:\batchscript\<number>_migrated_export.bat

B) It will find/replace the "xxxxxx" in each of those file's with the correlated account number in the accounts.txt file. 

C) It will copy each batch file into their correct account folder as "L:\HCASP\<Number>\migrated_export.bat"
