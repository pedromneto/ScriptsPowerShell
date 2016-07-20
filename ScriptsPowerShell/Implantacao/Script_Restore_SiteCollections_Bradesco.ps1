#----------------------------------------------------------------------------------
#	Script de restore e definição de administrador da sitecollection do portal
#	Utilizado no ambiente do Bradesco
#----------------------------------------------------------------------------------

if ((gsnp Microsoft.SharePoint.Powershell -ea SilentlyContinue) -eq $null){
    asnp Microsoft.SharePoint.Powershell -ea Stop 
}

$siteCollectionOwner = "dominio\usuario"
$siteCollectionsecondaryOwner = "dominio\usuario"

$siteCollectionUrl = "";


Write-Host "Restaurando Backup das SiteCollections" -ForegroundColor Green

Restore-SPSite http://at-cw-ap-001/sites/hub -Path "E:\Deploy\20160718\Bradesco_Backup_vm-bradesco-sites-hub2016-07-19.bak" -Force -Verbose -Confirm:$false

Restore-SPSite http://at-cw-ap-001/sites/Repositoriojs -Path "E:\Deploy\20160718\Bradesco_Backup_vm-bradesco-sites-RepositorioJS2016-07-19.bak" -Force -Verbose -Confirm:$false

Restore-SPSite http://at-cw-ap-001 -Path "E:\Deploy\20160718\Bradesco_Backup_vm-bradesco2016-07-19.bak" -Force -Verbose -Confirm:$false

Restore-SPSite http://at-cw-ap-001/sites/4252 -Path "E:\Deploy\20160718\Bradesco_Backup_vm-bradesco-sites-42522016-07-19.bak" -Force -Verbose -Confirm:$false

Restore-SPSite http://at-cw-ap-001/sites/busca -Path "E:\Deploy\20160718\Bradesco_Backup_vm-bradesco-sites-Busca2016-07-19.bak" -Force -Verbose -Confirm:$false

Write-Host "Fim do restore"
Write-Host ""
Write-Host ""

Write-Host "Definindo Administradores do conjunto de site" -ForegroundColor Green
Write-Host ""



Set-SPSite http://at-cw-ap-001/sites/hub -OwnerAlias $siteCollectionOwner -SecondaryOwnerAlias $siteCollectionsecondaryOwner -Verbose
Set-SPSite http://at-cw-ap-001/sites/Repositoriojs -OwnerAlias $siteCollectionOwner -SecondaryOwnerAlias $siteCollectionsecondaryOwner -Verbose
Set-SPSite http://at-cw-ap-001/ -OwnerAlias $siteCollectionOwner -SecondaryOwnerAlias $siteCollectionsecondaryOwner -Verbose
Set-SPSite http://at-cw-ap-001/sites/4252 -OwnerAlias $siteCollectionOwner -SecondaryOwnerAlias $siteCollectionsecondaryOwner -Verbose
Set-SPSite http://at-cw-ap-001/sites/busca -OwnerAlias $siteCollectionOwner -SecondaryOwnerAlias $siteCollectionsecondaryOwner -Verbose