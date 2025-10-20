# --- CONFIGURAÇÕES ---
$projectPath = "C:\ws-lojainterativa\front-testes\jogo-da-memoria-transpetro"
$chromePath = "C:\Program Files\Google\Chrome\Application\chrome.exe"
$devUrl = "http://localhost:3000" 
$waitTimeInSeconds = 5
# --- FIM DAS CONFIGURAÇÕES ---

$Host.UI.RawUI.WindowTitle = "Iniciador Kiosk Vue.js"

Write-Host "Verificando o diretório do projeto..." -ForegroundColor Cyan
if (-not (Test-Path -Path $projectPath)) {
    Write-Host "ERRO: O diretório do projeto '$projectPath' não foi encontrado." -ForegroundColor Red
    Read-Host "Pressione Enter para sair."
    exit
}
Set-Location -Path $projectPath
Write-Host "Diretório alterado para: $(Get-Location)" -ForegroundColor Green


# 2. Inicia o servidor para a pasta 'dist'
Write-Host "Iniciando o servidor de produção (npm run serve)..." -ForegroundColor Cyan
Start-Process powershell -ArgumentList "-NoExit", "-Command", "serve -s dist"

# 3. Aguarda um tempo para o servidor iniciar
Write-Host "Aguardando $waitTimeInSeconds segundos para o servidor iniciar..." -ForegroundColor Cyan
Start-Sleep -Seconds $waitTimeInSeconds

# 4. Abre o Google Chrome em modo Kiosk
Write-Host "Abrindo o Google Chrome em modo Kiosk..." -ForegroundColor Cyan
if (-not (Test-Path -Path $chromePath)) {
    Write-Host "ERRO: Google Chrome não encontrado em '$chromePath'." -ForegroundColor Red
    Read-Host "Pressione Enter para sair."
    exit
}
Start-Process -FilePath $chromePath -ArgumentList "--kiosk `"$devUrl`""

Write-Host "Script concluído com sucesso!" -ForegroundColor Green