# 🚀 Panduan Deploy Arcy Agency Website

## ✅ Status Project: SIAP DEPLOY

Project ini sudah **100% siap** untuk:

- ✅ Dijalankan di lokal
- ✅ Di-push ke GitHub
- ✅ Di-deploy ke Vercel

---

## 📋 Checklist Sebelum Deploy

### 1. Verifikasi Lokal

```bash
# Install dependencies
npm install

# Test development server
npm run dev
# Buka http://localhost:3000

# Test build
npm run build
# Harus berhasil tanpa error
```

### 2. Konfigurasi (Opsional)

- [ ] Ganti nomor WhatsApp di `pages/index.tsx` (line 70)
- [ ] Update email kontak jika perlu
- [ ] Review data layanan di `data/services.json`

---

## 📦 Deploy via GitHub + Vercel (Recommended)

### Step 1: Inisialisasi Git

```bash
# Di root folder project
git init
git add .
git commit -m "Initial commit: Arcy Agency landing page"
```

### Step 2: Buat Repository di GitHub

1. Buka [github.com](https://github.com) dan login
2. Klik tombol **"+"** di kanan atas → **"New repository"**
3. Isi:
   - **Repository name**: `arcy-agency-website` (atau nama lain)
   - **Description**: (opsional)
   - **Visibility**: Public atau Private (sesuai kebutuhan)
   - **JANGAN** centang "Initialize with README"
4. Klik **"Create repository"**

### Step 3: Push ke GitHub

```bash
# Ganti USERNAME dan REPO-NAME dengan milik Anda
git remote add origin https://github.com/USERNAME/REPO-NAME.git
git branch -M main
git push -u origin main
```

**Contoh:**

```bash
git remote add origin https://github.com/bhevi/arcy-agency-website.git
git branch -M main
git push -u origin main
```

### Step 4: Deploy di Vercel

1. Buka [vercel.com](https://vercel.com)
2. Login dengan akun GitHub Anda
3. Klik **"Add New Project"** atau **"New Project"**
4. Pilih repository yang baru saja di-push
5. Vercel akan otomatis detect:
   - Framework: **Next.js**
   - Build Command: `next build`
   - Output Directory: `.next`
6. Klik **"Deploy"**
7. Tunggu proses deploy (1-2 menit)
8. Website akan live di URL: `https://your-project.vercel.app`

**Done!** 🎉

---

## 📤 Deploy via Upload (Tanpa Git)

### ⚠️ PENTING: Error "Couldn't find pages directory"

Jika Anda mengalami error ini, berarti folder `pages/` tidak ikut ter-upload. Ikuti langkah di bawah dengan TELITI!

### Step 1: Gunakan Script Otomatis (Recommended)

**Windows PowerShell:**

```powershell
# Di root folder project
.\create-upload-zip.ps1
```

Script ini akan otomatis membuat ZIP dengan struktur yang benar.

### Step 2: Manual - Siapkan File untuk Upload

**CARA YANG BENAR:**

1. **Buka folder project** di File Explorer:

   ```
   C:\Users\bhevi\arcy-agency-ai
   ```

2. **Pilih SEMUA file dan folder** (`Ctrl + A`)

3. **Buat ZIP:**

   - Klik kanan → "Send to" → "Compressed (zipped) folder"
   - Atau gunakan WinRAR/7-Zip

4. **VERIFIKASI ZIP (PENTING!):**
   - Buka file ZIP
   - **PASTIKAN** folder `pages/` ada di dalam ZIP
   - **PASTIKAN** ada file `pages/index.tsx`
   - **PASTIKAN** ada file `package.json` di root ZIP

**Struktur ZIP yang benar:**

```
arcy-agency-ai.zip
├── pages/              ← HARUS ADA!
│   ├── _app.tsx
│   ├── index.tsx       ← HARUS ADA!
│   └── layanan/
├── components/
├── data/
├── styles/
├── types/
├── package.json        ← HARUS ADA!
├── next.config.js
├── tailwind.config.js
└── ... (file lain)
```

**Jika folder `pages/` TIDAK ADA → JANGAN UPLOAD! Buat ZIP ulang!**

### Step 3: Upload ke Vercel

1. Buka [vercel.com](https://vercel.com)
2. Login
3. Klik **"Add New Project"**
4. Pilih tab **"Upload"** atau **"Browse"**
5. Upload file ZIP
6. Vercel akan:
   - Extract file
   - Install dependencies (`npm install`)
   - Build project (`npm run build`)
   - Deploy
7. Tunggu proses selesai
8. Website live!

---

## 🔧 Troubleshooting

### Build Error di Vercel

**Error:** "Module not found" atau "Cannot find module"

- **Solusi**: Pastikan semua dependencies ada di `package.json`
- Pastikan `lucide-react` ada di dependencies (sudah ditambahkan)

**Error:** "TypeScript error"

- **Solusi**: Pastikan `tsconfig.json` benar
- Cek error message di Vercel dashboard → Deployments → Logs

**Error:** "Couldn't find any 'pages' or 'app' directory" ⚠️

- **Penyebab**: Folder `pages/` tidak ikut ter-upload dalam ZIP
- **Solusi**:
  1. Buka file ZIP yang akan di-upload
  2. Pastikan folder `pages/` ada di dalam ZIP
  3. Pastikan ada file `pages/index.tsx`
  4. Jika tidak ada, buat ZIP ulang dengan benar
  5. Gunakan script `create-upload-zip.ps1` untuk memastikan struktur benar
  6. Lihat file `VERCEL_UPLOAD_CHECKLIST.md` untuk panduan detail

### Website Tidak Muncul

1. Cek **Deployments** di Vercel dashboard
2. Klik deployment terbaru
3. Lihat **Logs** untuk error
4. Pastikan build berhasil (status "Ready")

### WhatsApp Link Tidak Bekerja

- Pastikan format nomor benar: `6281234567890` (tanpa + dan spasi)
- Test di browser desktop dan mobile

---

## 📝 Catatan Penting

1. **Environment Variables**: Jika ada, tambahkan di Vercel dashboard → Project Settings → Environment Variables

2. **Custom Domain**:

   - Setelah deploy, bisa tambahkan custom domain
   - Vercel → Project Settings → Domains

3. **Automatic Deployments**:

   - Setiap push ke GitHub akan trigger auto-deploy
   - Branch `main` = Production
   - Branch lain = Preview

4. **Build Time**:
   - Build pertama mungkin lebih lama (2-3 menit)
   - Build berikutnya lebih cepat (30-60 detik)

---

## ✅ Final Checklist

- [x] `npm install` berhasil
- [x] `npm run dev` jalan tanpa error
- [x] `npm run build` berhasil
- [x] Semua dependencies ada di `package.json`
- [x] `.gitignore` sudah benar
- [x] README.md sudah update
- [x] Nomor WhatsApp sudah benar
- [x] Siap untuk deploy!

---

**Selamat! Website Arcy Agency siap go live! 🚀**
