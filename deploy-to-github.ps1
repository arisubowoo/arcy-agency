# PowerShell Script untuk Push ke GitHub dan Deploy Vercel
# Jalankan dengan: .\deploy-to-github.ps1

param(
    [Parameter(Mandatory=$false)]
    [string]$GitHubUsername = "",
    
    [Parameter(Mandatory=$false)]
    [string]$RepoName = "arcy-agency-website"
)

Write-Host "🚀 Deploy Arcy Agency ke GitHub & Vercel" -ForegroundColor Cyan
Write-Host "=" * 60 -ForegroundColor Cyan
Write-Host ""

# Step 1: Setup Git
Write-Host "📦 Step 1: Setup Git Repository..." -ForegroundColor Yellow

if (-not (Test-Path ".git")) {
    Write-Host "   Inisialisasi Git..." -ForegroundColor Gray
    git init
}

# Add semua file
Write-Host "   Menambahkan file..." -ForegroundColor Gray
git add .

# Check status
$status = git status --porcelain
if ($status) {
    Write-Host "   Membuat commit..." -ForegroundColor Gray
    git commit -m "Initial commit: Arcy Agency landing page with AI loading animation"
    Write-Host "   ✅ Commit berhasil" -ForegroundColor Green
} else {
    Write-Host "   ✅ Tidak ada perubahan" -ForegroundColor Green
}

Write-Host ""

# Step 2: Setup GitHub Remote
Write-Host "🔗 Step 2: Setup GitHub Remote..." -ForegroundColor Yellow

# Cek apakah sudah ada remote
$remote = git remote get-url origin 2>$null
if ($remote) {
    Write-Host "   ✅ Remote sudah ada: $remote" -ForegroundColor Green
    Write-Host "   Gunakan perintah berikut untuk push:" -ForegroundColor Cyan
    Write-Host "   git push -u origin main" -ForegroundColor White
} else {
    if ($GitHubUsername -eq "") {
        Write-Host "   ⚠️  Remote belum di-setup" -ForegroundColor Yellow
        Write-Host ""
        Write-Host "   Untuk setup remote, jalankan:" -ForegroundColor Cyan
        Write-Host "   git remote add origin https://github.com/USERNAME/REPO-NAME.git" -ForegroundColor White
        Write-Host "   git branch -M main" -ForegroundColor White
        Write-Host "   git push -u origin main" -ForegroundColor White
    } else {
        Write-Host "   Menambahkan remote..." -ForegroundColor Gray
        $repoUrl = "https://github.com/$GitHubUsername/$RepoName.git"
        git remote add origin $repoUrl
        git branch -M main
        Write-Host "   ✅ Remote ditambahkan: $repoUrl" -ForegroundColor Green
        Write-Host ""
        Write-Host "   Sekarang push ke GitHub:" -ForegroundColor Cyan
        Write-Host "   git push -u origin main" -ForegroundColor White
    }
}

Write-Host ""
Write-Host "=" * 60 -ForegroundColor Cyan
Write-Host "✅ GIT SETUP SELESAI!" -ForegroundColor Green
Write-Host "=" * 60 -ForegroundColor Cyan
Write-Host ""

# Step 3: Instruksi Deploy Vercel
Write-Host "🌐 Step 3: Deploy ke Vercel" -ForegroundColor Yellow
Write-Host ""
Write-Host "   Setelah push ke GitHub, deploy di Vercel:" -ForegroundColor Cyan
Write-Host ""
Write-Host "   1. Buka: https://vercel.com" -ForegroundColor White
Write-Host "   2. Login dengan GitHub" -ForegroundColor White
Write-Host "   3. Klik 'Add New Project'" -ForegroundColor White
Write-Host "   4. Pilih repository: $RepoName" -ForegroundColor White
Write-Host "   5. Klik 'Deploy'" -ForegroundColor White
Write-Host "   6. Tunggu 1-2 menit → Website LIVE! 🎉" -ForegroundColor White
Write-Host ""
