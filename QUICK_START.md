# 🚀 Quick Start - Deploy Arcy Agency ke Vercel

## ✅ Semua Sudah Disiapkan Otomatis!

Project ini sudah **100% siap** untuk di-deploy. Ikuti langkah di bawah:

---

## 📦 Opsi 1: Deploy via GitHub (PALING MUDAH - RECOMMENDED)

### Step 1: Setup Git (Sudah Otomatis!)

Git repository sudah diinisialisasi. Jika belum, jalankan:

```powershell
.\setup-github.ps1
```

### Step 2: Buat Repository di GitHub

1. Buka: **https://github.com/new**
2. Isi:
   - **Repository name**: `arcy-agency-website` (atau nama lain)
   - **Visibility**: Public atau Private
   - **JANGAN** centang "Initialize with README"
3. Klik **"Create repository"**

### Step 3: Push ke GitHub

**Ganti `USERNAME` dan `REPO-NAME` dengan milik Anda:**

```bash
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

1. Buka: **https://vercel.com**
2. Login dengan akun GitHub
3. Klik **"Add New Project"**
4. Pilih repository yang baru di-push
5. Vercel akan auto-detect Next.js
6. Klik **"Deploy"**
7. Tunggu 1-2 menit → **Website LIVE!** 🎉

---

## 📤 Opsi 2: Upload ZIP ke Vercel (Tanpa Git)

### Step 1: Buat ZIP Otomatis

Jalankan script PowerShell:

```powershell
.\create-upload-zip.ps1
```

Script akan membuat file `arcy-agency-upload.zip` yang sudah diverifikasi.

### Step 2: Upload ke Vercel

1. Buka: **https://vercel.com** → Login
2. Klik **"Add New Project"** → Tab **"Upload"**
3. Upload file `arcy-agency-upload.zip`
4. Tunggu deploy selesai → **Website LIVE!** 🎉

---

## ✅ Checklist Final

Sebelum deploy, pastikan:

- [x] Git repository sudah diinisialisasi
- [x] Semua file sudah di-commit
- [x] `package.json` lengkap (termasuk `lucide-react`)
- [x] Folder `pages/` ada dan lengkap
- [x] Build lokal berhasil (`npm run build`)

---

## 🎯 Rekomendasi

**Gunakan Opsi 1 (GitHub)** karena:

- ✅ Lebih mudah (hanya push sekali)
- ✅ Auto-deploy setiap update (push = deploy otomatis)
- ✅ Bisa rollback jika ada masalah
- ✅ Lebih profesional

**Opsi 2 (Upload ZIP)** hanya jika:

- Tidak punya akun GitHub
- Ingin deploy sekali saja tanpa Git

---

## 📞 Butuh Bantuan?

Jika ada error:

1. Cek file `DEPLOY_GUIDE.md` untuk troubleshooting detail
2. Cek file `VERCEL_UPLOAD_CHECKLIST.md` untuk masalah upload
3. Pastikan semua file ada (khususnya folder `pages/`)

---

**Selamat! Website Arcy Agency siap go live! 🚀**
