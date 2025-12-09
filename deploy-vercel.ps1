# PowerShell Script untuk Deploy Otomatis ke Vercel
# Jalankan dengan: .\deploy-vercel.ps1

Write-Host "🚀 Deploy Arcy Agency ke Vercel" -ForegroundColor Cyan
Write-Host "=" * 60 -ForegroundColor Cyan
Write-Host ""

# Step 1: Verifikasi Build
Write-Host "📦 Step 1: Verifikasi Build..." -ForegroundColor Yellow
Write-Host "   Menjalankan npm run build..." -ForegroundColor Gray

$buildResult = npm run build 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host "   ❌ Build gagal!" -ForegroundColor Red
    Write-Host $buildResult
    exit 1
} else {
    Write-Host "   ✅ Build berhasil" -ForegroundColor Green
}

Write-Host ""

# Step 2: Verifikasi Git Remote
Write-Host "🔗 Step 2: Verifikasi Git Remote..." -ForegroundColor Yellow
$remote = git remote get-url origin 2>$null
if ($remote -like "*arisubowoo/arcy-agency*") {
    Write-Host "   ✅ Remote sudah benar: $remote" -ForegroundColor Green
} else {
    Write-Host "   ⚠️  Remote belum benar, mengatur..." -ForegroundColor Yellow
    git remote set-url origin https://github.com/arisubowoo/arcy-agency.git
    Write-Host "   ✅ Remote diatur" -ForegroundColor Green
}

Write-Host ""

# Step 3: Cek Vercel CLI
Write-Host "🔧 Step 3: Cek Vercel CLI..." -ForegroundColor Yellow
$vercelVersion = vercel --version 2>$null
if ($vercelVersion) {
    Write-Host "   ✅ Vercel CLI terinstall: $vercelVersion" -ForegroundColor Green
} else {
    Write-Host "   📦 Menginstall Vercel CLI..." -ForegroundColor Gray
    npm install -g vercel
    Write-Host "   ✅ Vercel CLI terinstall" -ForegroundColor Green
}

Write-Host ""
Write-Host "=" * 60 -ForegroundColor Cyan
Write-Host "✅ PREPARATION SELESAI!" -ForegroundColor Green
Write-Host "=" * 60 -ForegroundColor Cyan
Write-Host ""

# Step 4: Login Vercel (Manual - User perlu interaksi)
Write-Host "🔐 Step 4: Login ke Vercel" -ForegroundColor Yellow
Write-Host ""
Write-Host "   Jalankan perintah berikut untuk login:" -ForegroundColor Cyan
Write-Host "   vercel login" -ForegroundColor White
Write-Host ""
Write-Host "   Setelah login berhasil, lanjutkan dengan:" -ForegroundColor Cyan
Write-Host "   vercel link" -ForegroundColor White
Write-Host "   vercel --prod" -ForegroundColor White
Write-Host ""
