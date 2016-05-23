Add-PSSnapin Microsoft.SharePoint.PowerShell
cls
#Parametros

$urlSite = "http://seusite"

$usuarios = @("dominio\usuario1","dominio\usuario2")

#Fim dos parâmetros


$site = Get-SPSite $urlSite

$usuarios.ForEach({
    Write-Host "Usuario Atual: $_" -ForegroundColor Yellow
    $usuarioAtual = $_
    $ContentDataBases = $site.WebApplication.ContentDatabases
    $ContentDataBases.ForEach({
        Write-Host "   Concedendo permissao na base de conteudo" $_.Name
        $ContentDataBaseID = $_.Id    
        
        try
        {
            Add-SPShellAdmin -UserName $usuarioAtual  -database $ContentDataBaseID
            Write-Host "   Ok" -ForegroundColor Green
        }
        catch
        {
            Write-Host "   Erro:" $_.Exception.Message -ForegroundColor Red
        }
    })
    Write-Host ""
    
})

Write-Host "Fim"