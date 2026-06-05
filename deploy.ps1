#!/usr/bin/env pwsh
# ============================================================
#  deploy.ps1 — Publicar alterações no GitHub
#  Uso: Clique com botão direito > "Executar com PowerShell"
#       OU no terminal: .\deploy.ps1
#       OU com mensagem: .\deploy.ps1 "mensagem do commit"
# ============================================================

$ProjectPath = "c:\Users\eletrica2\Desktop\Nova pasta (2)"
$CommitMsg = if ($args[0]) { $args[0] } else { "update: alteracoes na plataforma - $(Get-Date -Format 'dd/MM/yyyy HH:mm')" }

Set-Location $ProjectPath

Write-Host ""
Write-Host "  Paginas de Amor — Deploy Automatico" -ForegroundColor Magenta
Write-Host "  =====================================" -ForegroundColor DarkGray
Write-Host ""

# Verificar se há mudanças
$status = git status --porcelain
if (-not $status) {
    Write-Host "  Nenhuma alteracao encontrada. Tudo ja esta atualizado!" -ForegroundColor Green
    Write-Host ""
    Read-Host "  Pressione ENTER para fechar"
    exit 0
}

Write-Host "  Arquivos alterados:" -ForegroundColor Yellow
git status --short
Write-Host ""

# Adicionar todos os arquivos
git add .

# Fazer o commit
git commit -m $CommitMsg
if ($LASTEXITCODE -ne 0) {
    Write-Host "  ERRO no commit!" -ForegroundColor Red
    Read-Host "  Pressione ENTER para fechar"
    exit 1
}

Write-Host ""
Write-Host "  Enviando para o GitHub..." -ForegroundColor Cyan

# Push para o GitHub
git push origin main
if ($LASTEXITCODE -ne 0) {
    Write-Host ""
    Write-Host "  ERRO ao enviar. Possivel causa:" -ForegroundColor Red
    Write-Host "  - Repositorio nao existe no GitHub ainda" -ForegroundColor Yellow
    Write-Host "  - Autenticacao necessaria" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "  Crie o repositorio em: https://github.com/new" -ForegroundColor Cyan
    Write-Host "  Nome: Amor-no-Ar" -ForegroundColor Cyan
    Read-Host "  Pressione ENTER para fechar"
    exit 1
}

Write-Host ""
Write-Host "  Publicado com sucesso!" -ForegroundColor Green
Write-Host ""
Write-Host "  Site ao vivo em:" -ForegroundColor White
Write-Host "  https://henri-rodrigues.github.io/Amor-no-Ar/" -ForegroundColor Cyan
Write-Host ""
Read-Host "  Pressione ENTER para fechar"
