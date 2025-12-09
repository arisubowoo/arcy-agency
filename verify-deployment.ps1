# PowerShell Script untuk Verifikasi Deployment
# Jalankan dengan: .\verify-deployment.ps1

Write-Host "🔍 Verifikasi Deployment Setup" -ForegroundColor Cyan
Write-Host "=" * 60 -ForegroundColor Cyan
Write-Host ""

# 1. Cek folder pages
Write-Host "📁 Step 1: Verifikasi Folder Pages..." -ForegroundColor Yellow
if (Test-Path "pages/index.tsx") {
    Write-Host "   ✅ pages/index.tsx ada" -ForegroundColor Green
} else {
    Write-Host "   ❌ pages/index.tsx TIDAK ADA!" -ForegroundColor Red
    exit 1
}

if (Test-Path "pages/_app.tsx") {
    Write-Host "   ✅ pages/_app.tsx ada" -ForegroundColor Green
} else {
    Write-Host "   ❌ pages/_app.tsx TIDAK ADA!" -ForegroundColor Red
    exit 1
}

# 2. Cek Git tracking
Write-Host "`n🔗 Step 2: Verifikasi Git Tracking..." -ForegroundColor Yellow
$pagesFiles = git ls-files | Select-String "^pages/"
if ($pagesFiles) {
    Write-Host "   ✅ Folder pages ter-track di Git" -ForegroundColor Green
    Write-Host "   File yang ter-track:" -ForegroundColor Gray
    $pagesFiles | ForEach-Object { Write-Host "     - $_" -ForegroundColor Gray }
} else {
    Write-Host "   ❌ Folder pages TIDAK ter-track di Git!" -ForegroundColor Red
    Write-Host "   Menambahkan folder pages ke Git..." -ForegroundColor Yellow
    git add pages/
    git commit -m "fix: add pages directory"
}

# 3. Cek build
Write-Host "`n🔨 Step 3: Verifikasi Build..." -ForegroundColor Yellow
$buildResult = npm run build 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "   ✅ Build berhasil" -ForegroundColor Green
} else {
    Write-Host "   ❌ Build gagal!" -ForegroundColor Red
    Write-Host $buildResult
    exit 1
}

# 4. Cek Git remote
Write-Host "`n🌐 Step 4: Verifikasi Git Remote..." -ForegroundColor Yellow
$remote = git remote get-url origin 2>$null
if ($remote -like "*arisubowoo/arcy-agency*") {
    Write-Host "   ✅ Remote benar: $remote" -ForegroundColor Green
} else {
    Write-Host "   ⚠️  Remote: $remote" -ForegroundColor Yellow
}

# 5. Summary
Write-Host "`n" -NoNewline
Write-Host "=" * 60 -ForegroundColor Cyan
Write-Host "✅ VERIFIKASI SELESAI!" -ForegroundColor Green
Write-Host "=" * 60 -ForegroundColor Cyan
Write-Host ""
Write-Host "📋 Langkah Selanjutnya:" -ForegroundColor Yellow
Write-Host "   1. Pastikan semua file ter-push: git push origin main" -ForegroundColor White
Write-Host "   2. Cek Vercel Dashboard untuk deployment" -ForegroundColor White
Write-Host "   3. Jika masih error, trigger Redeploy di Vercel" -ForegroundColor White
Write-Host ""
