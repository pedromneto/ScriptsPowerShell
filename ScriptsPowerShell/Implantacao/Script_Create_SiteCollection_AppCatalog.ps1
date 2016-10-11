if ((gsnp Microsoft.SharePoint.Powershell -ea SilentlyContinue) -eq $null){
    asnp Microsoft.SharePoint.Powershell -ea Stop 
}
cls

$siteUrl = "http://portal/sites/appcatalog"
$siteName = "Catalogo de Aplicativos"
$owner = "Contoso\sp_admin"
$secondaryOwner = "contoso\current_user"

New-SPSite -Url $siteUrl -OwnerAlias $owner -SecondaryOwnerAlias $secondaryOwner -Name $siteName -Template "APPCATALOG#0" -Language 1046