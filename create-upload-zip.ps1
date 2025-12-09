# PowerShell Script untuk Membuat ZIP Upload Vercel
# Jalankan dengan: .\create-upload-zip.ps1

Write-Host "🚀 Membuat ZIP untuk upload ke Vercel..." -ForegroundColor Cyan

# Hapus ZIP lama jika ada
if (Test-Path "arcy-agency-upload.zip") {
    Remove-Item "arcy-agency-upload.zip" -Force
    Write-Host "✅ ZIP lama dihapus" -ForegroundColor Green
}

# File dan folder yang akan di-include
$itemsToInclude = @(
    "pages",
    "components",
    "data",
    "styles",
    "types",
    "package.json",
    "next.config.js",
    "tailwind.config.js",
    "postcss.config.js",
    "tsconfig.json",
    ".gitignore",
    "README.md"
)

Write-Host "`n📦 Menambahkan file dan folder ke ZIP..." -ForegroundColor Yellow

# Cek setiap item
$missingItems = @()
foreach ($item in $itemsToInclude) {
    if (Test-Path $item) {
        Write-Host "  ✅ $item" -ForegroundColor Green
    } else {
        Write-Host "  ❌ $item (TIDAK DITEMUKAN!)" -ForegroundColor Red
        $missingItems += $item
    }
}

# Jika ada item yang hilang, stop
if ($missingItems.Count -gt 0) {
    Write-Host "`n❌ ERROR: File/folder berikut tidak ditemukan:" -ForegroundColor Red
    foreach ($item in $missingItems) {
        Write-Host "   - $item" -ForegroundColor Red
    }
    Write-Host "`nPastikan Anda menjalankan script ini di root folder project!" -ForegroundColor Yellow
    exit 1
}

# Buat ZIP
try {
    Compress-Archive -Path $itemsToInclude -DestinationPath "arcy-agency-upload.zip" -Force
    Write-Host "`n✅ ZIP berhasil dibuat: arcy-agency-upload.zip" -ForegroundColor Green
    
    # Verifikasi ZIP
    Write-Host "`n🔍 Memverifikasi struktur ZIP..." -ForegroundColor Cyan
    $zip = [System.IO.Compression.ZipFile]::OpenRead("$PWD\arcy-agency-upload.zip")
    
    $requiredFiles = @(
        "pages/",
        "pages/index.tsx",
        "package.json"
    )
    
    $allFound = $true
    foreach ($required in $requiredFiles) {
        $found = $zip.Entries | Where-Object { $_.FullName -like "*$required*" }
        if ($found) {
            Write-Host "  ✅ $required" -ForegroundColor Green
        } else {
            Write-Host "  ❌ $required (TIDAK DITEMUKAN!)" -ForegroundColor Red
            $allFound = $false
        }
    }
    
    $zip.Dispose()
    
    if ($allFound) {
        Write-Host "`n🎉 ZIP SIAP UNTUK UPLOAD!" -ForegroundColor Green
        Write-Host "📁 File: arcy-agency-upload.zip" -ForegroundColor Cyan
        Write-Host "📏 Ukuran: $((Get-Item 'arcy-agency-upload.zip').Length / 1MB) MB" -ForegroundColor Cyan
        Write-Host "`n➡️  Upload file ini ke Vercel!" -ForegroundColor Yellow
    } else {
        Write-Host "`n❌ ZIP TIDAK VALID! Jangan upload!" -ForegroundColor Red
    }
    
} catch {
    Write-Host "`n❌ ERROR saat membuat ZIP: $_" -ForegroundColor Red
    exit 1
}
