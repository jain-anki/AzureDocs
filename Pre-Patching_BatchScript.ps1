#This Script will capture the current state of the "Running" Services and export it to .xml
Write-Host "********************************************************************************************" 	-ForegroundColor Green
Write-Host "Pre-Patching Batch Script"  "Exporting the current status of the running services"              -ForegroundColor Green
Write-Host "********************************************************************************************" 	-ForegroundColor Green



#Multiple Servers

#Loads Server names from the specified .csv input file
$Servers = Import-Csv "C:\CDnA\PS\PatchScript\servers.csv"
   

#Loops through each Server and outputs .xml
ForEach ($Server in $Servers){
$ServerName = $($Server.ServerName)

Get-Service -ComputerName $ServerName *|where{$_.status -eq “Running”} |export-clixml C:\CDnA\PS\PatchScript\PrepatchStatus_$ServerName.xml
}

Write-Host "Execution Completed. Check the exported file(s)"
