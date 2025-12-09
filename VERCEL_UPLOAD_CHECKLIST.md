# ✅ Checklist Upload ke Vercel (PENTING!)

## ⚠️ ERROR YANG SERING TERJADI

**Error:** `Couldn't find any 'pages' or 'app' directory`

**Penyebab:** Folder `pages/` tidak ikut ter-upload dalam file ZIP.

---

## 📦 CARA MEMBUAT ZIP YANG BENAR

### Metode 1: Windows (File Explorer)

1. **Buka folder project** di File Explorer:

   ```
   C:\Users\bhevi\arcy-agency-ai
   ```

2. **Pilih SEMUA file dan folder** dengan cara:

   - Tekan `Ctrl + A` (Select All)
   - ATAU klik kanan → "Select All"

3. **Hapus yang TIDAK perlu** dari selection:

   - Klik kanan pada `node_modules` → "Exclude from selection" (jika bisa)
   - Klik kanan pada `.next` → "Exclude from selection" (jika bisa)
   - Jika tidak bisa exclude, **biarkan saja** (Vercel akan ignore)

4. **Buat ZIP:**

   - Klik kanan pada selection
   - Pilih "Send to" → "Compressed (zipped) folder"
   - Atau gunakan WinRAR/7-Zip → "Add to archive"

5. **VERIFIKASI ZIP:**
   - Buka file ZIP yang baru dibuat
   - **PASTIKAN** folder `pages/` ada di dalam ZIP
   - **PASTIKAN** ada file `pages/index.tsx` di dalam ZIP
   - **PASTIKAN** ada file `package.json` di root ZIP

### Metode 2: PowerShell (Lebih Akurat)

1. **Buka PowerShell** di folder project:

   ```powershell
   cd C:\Users\bhevi\arcy-agency-ai
   ```

2. **Buat ZIP dengan exclude yang benar:**

   ```powershell
   Compress-Archive -Path components,data,pages,styles,types,package.json,next.config.js,tailwind.config.js,postcss.config.js,tsconfig.json,.gitignore,README.md -DestinationPath arcy-agency-upload.zip -Force
   ```

3. **Atau buat ZIP semua file kecuali yang di-exclude:**
   ```powershell
   Get-ChildItem -Exclude node_modules,.next,.git,*.zip | Compress-Archive -DestinationPath arcy-agency-upload.zip -Force
   ```

### Metode 3: Manual (Paling Aman)

1. **Buat folder baru** (contoh: `arcy-agency-upload`)

2. **Copy folder berikut** ke folder baru:

   - ✅ `pages/` (PENTING!)
   - ✅ `components/`
   - ✅ `data/`
   - ✅ `styles/`
   - ✅ `types/`

3. **Copy file berikut** ke folder baru:

   - ✅ `package.json`
   - ✅ `next.config.js`
   - ✅ `tailwind.config.js`
   - ✅ `postcss.config.js`
   - ✅ `tsconfig.json`
   - ✅ `.gitignore`
   - ✅ `README.md`

4. **JANGAN copy:**

   - ❌ `node_modules/`
   - ❌ `.next/`
   - ❌ `.git/`
   - ❌ `.env` atau `.env.local`

5. **Buat ZIP dari folder baru:**
   - Klik kanan folder `arcy-agency-upload`
   - "Send to" → "Compressed (zipped) folder"

---

## ✅ VERIFIKASI SEBELUM UPLOAD

**BUKA file ZIP dan pastikan struktur seperti ini:**

```
arcy-agency-upload.zip
├── pages/              ← HARUS ADA!
│   ├── _app.tsx
│   ├── index.tsx       ← HARUS ADA!
│   └── layanan/
│       ├── index.tsx
│       └── [id].tsx
├── components/
├── data/
├── styles/
├── types/
├── package.json        ← HARUS ADA!
├── next.config.js
├── tailwind.config.js
├── postcss.config.js
├── tsconfig.json
└── .gitignore
```

**Jika folder `pages/` TIDAK ADA di dalam ZIP → JANGAN UPLOAD!**

---

## 🚀 UPLOAD KE VERCEL

1. Buka [vercel.com](https://vercel.com) → Login
2. Klik **"Add New Project"**
3. Pilih tab **"Upload"**
4. Drag & drop file ZIP atau klik "Browse"
5. Upload file ZIP yang sudah diverifikasi
6. Tunggu proses selesai

---

## 🔍 TROUBLESHOOTING

### Masih Error "Couldn't find pages directory"?

1. **Buka ZIP file** dan cek struktur
2. **Pastikan** folder `pages/` ada di **root ZIP** (bukan di dalam subfolder)
3. **Pastikan** ada file `pages/index.tsx` di dalam ZIP
4. **Buat ZIP ulang** dengan metode manual di atas

### ZIP terlalu besar?

- **Biarkan** `node_modules/` tidak ikut (Vercel akan install sendiri)
- **Biarkan** `.next/` tidak ikut (Vercel akan build sendiri)
- ZIP seharusnya hanya 1-5 MB (tanpa node_modules)

---

## 📝 CHECKLIST FINAL

Sebelum upload, pastikan:

- [ ] Folder `pages/` ada di dalam ZIP
- [ ] File `pages/index.tsx` ada di dalam ZIP
- [ ] File `package.json` ada di root ZIP
- [ ] File `next.config.js` ada di root ZIP
- [ ] Folder `components/` ada di dalam ZIP
- [ ] Folder `data/` ada di dalam ZIP
- [ ] Folder `styles/` ada di dalam ZIP
- [ ] Struktur ZIP benar (tidak ada nested folder yang salah)

---

**Jika semua checklist ✅, baru upload ke Vercel!**
