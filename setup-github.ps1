# PowerShell Script untuk Setup GitHub Repository
# Jalankan dengan: .\setup-github.ps1

Write-Host "🚀 Setup GitHub Repository untuk Arcy Agency" -ForegroundColor Cyan
Write-Host ""

# Cek apakah sudah ada git repo
if (-not (Test-Path ".git")) {
    Write-Host "📦 Inisialisasi Git repository..." -ForegroundColor Yellow
    git init
    Write-Host "✅ Git repository diinisialisasi" -ForegroundColor Green
} else {
    Write-Host "✅ Git repository sudah ada" -ForegroundColor Green
}

# Add semua file
Write-Host "`n📝 Menambahkan file ke staging..." -ForegroundColor Yellow
git add .
Write-Host "✅ Semua file ditambahkan" -ForegroundColor Green

# Check status
Write-Host "`n📊 Status repository:" -ForegroundColor Cyan
git status --short

# Commit jika ada perubahan
$status = git status --porcelain
if ($status) {
    Write-Host "`n💾 Membuat commit..." -ForegroundColor Yellow
    git commit -m "Initial commit: Arcy Agency landing page with AI loading animation"
    Write-Host "✅ Commit berhasil dibuat" -ForegroundColor Green
} else {
    Write-Host "`n✅ Tidak ada perubahan untuk di-commit" -ForegroundColor Green
}

Write-Host "`n" -NoNewline
Write-Host "=" * 60 -ForegroundColor Cyan
Write-Host "✅ GIT REPOSITORY SIAP!" -ForegroundColor Green
Write-Host "=" * 60 -ForegroundColor Cyan
Write-Host ""

Write-Host "📋 LANGKAH SELANJUTNYA:" -ForegroundColor Yellow
Write-Host ""
Write-Host "1. Buat repository baru di GitHub:" -ForegroundColor White
Write-Host "   - Buka: https://github.com/new" -ForegroundColor Gray
Write-Host "   - Repository name: arcy-agency-website (atau nama lain)" -ForegroundColor Gray
Write-Host "   - JANGAN centang 'Initialize with README'" -ForegroundColor Gray
Write-Host "   - Klik 'Create repository'" -ForegroundColor Gray
Write-Host ""
Write-Host "2. Push ke GitHub (ganti USERNAME dan REPO-NAME):" -ForegroundColor White
Write-Host "   git remote add origin https://github.com/USERNAME/REPO-NAME.git" -ForegroundColor Cyan
Write-Host "   git branch -M main" -ForegroundColor Cyan
Write-Host "   git push -u origin main" -ForegroundColor Cyan
Write-Host ""
Write-Host "3. Deploy di Vercel:" -ForegroundColor White
Write-Host "   - Buka: https://vercel.com" -ForegroundColor Gray
Write-Host "   - Login dengan GitHub" -ForegroundColor Gray
Write-Host "   - Klik 'Add New Project'" -ForegroundColor Gray
Write-Host "   - Pilih repository yang baru di-push" -ForegroundColor Gray
Write-Host "   - Klik 'Deploy'" -ForegroundColor Gray
Write-Host ""
Write-Host "✨ SELESAI! Website akan live otomatis!" -ForegroundColor Green
