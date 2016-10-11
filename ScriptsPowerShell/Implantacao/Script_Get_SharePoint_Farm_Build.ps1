if ((gsnp Microsoft.SharePoint.Powershell -ea SilentlyContinue) -eq $null){
    asnp Microsoft.SharePoint.Powershell -ea Stop 
}

(Get-SPFarm).BuildVersion | Format-Table -AutoSize