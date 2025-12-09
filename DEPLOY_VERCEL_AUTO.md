# 🚀 Deploy Otomatis ke Vercel - Panduan Lengkap

## ✅ Status Project

- ✅ **Project Type**: Next.js 14 (Pages Router)
- ✅ **Build Status**: `npm run build` ✅ BERHASIL
- ✅ **Git Remote**: https://github.com/arisubowoo/arcy-agency.git
- ✅ **Dependencies**: Lengkap (termasuk `lucide-react`)

---

## 🎯 CARA TERMUDAH: Deploy via Vercel Dashboard (RECOMMENDED)

### Langkah 1: Push ke GitHub (Sudah Selesai!)

Repository sudah di-push ke: **https://github.com/arisubowoo/arcy-agency.git**

### Langkah 2: Deploy di Vercel Dashboard

1. **Buka Vercel Dashboard:**

   - Buka: **https://vercel.com**
   - Login dengan akun GitHub Anda

2. **Import Project:**

   - Klik **"Add New Project"** atau **"New Project"**
   - Pilih **"Import Git Repository"**
   - Pilih **GitHub** sebagai provider
   - Pilih repository: **arisubowoo/arcy-agency**
   - Klik **"Import"**

3. **Konfigurasi Project:**

   - **Framework Preset**: Next.js (auto-detect)
   - **Root Directory**: `./` (default)
   - **Build Command**: `npm run build` (default)
   - **Output Directory**: `.next` (default)
   - **Install Command**: `npm install` (default)
   - Klik **"Deploy"**

4. **Tunggu Deploy:**

   - Vercel akan otomatis:
     - Install dependencies
     - Build project
     - Deploy ke production
   - Tunggu 1-2 menit

5. **Setup Auto-Deploy (Otomatis!):**

   - Setelah deploy pertama, Vercel akan **otomatis**:
     - Terhubung dengan GitHub
     - Setiap push ke branch `main` akan trigger auto-deploy
     - Tidak perlu setup tambahan!

6. **Website LIVE!** 🎉
   - URL akan muncul di dashboard
   - Format: `https://arcy-agency-xxxxx.vercel.app`
   - Atau custom domain jika sudah di-setup

---

## 🔧 CARA ALTERNATIF: Deploy via Vercel CLI

Jika Anda lebih suka menggunakan CLI:

### Step 1: Login Vercel

```bash
vercel login
```

**Akan muncul:**

- Browser akan terbuka untuk login
- Atau copy link yang muncul ke browser
- Login dengan akun GitHub/Vercel Anda
- Kembali ke terminal setelah login berhasil

### Step 2: Link Project

```bash
vercel link
```

**Jawab prompt:**

- **Set up and develop "arcy-agency-ai"?** → `Y`
- **Which scope?** → Pilih akun Anda
- **Link to existing project?** → `N` (buat baru)
- **What's your project's name?** → `arcy-agency`
- **In which directory is your code located?** → `./` (default)

### Step 3: Deploy Production

```bash
vercel --prod
```

**Jawab prompt:**

- **Deploy to production?** → `Y`
- **Set up and deploy "arcy-agency"?** → `Y`

**Tunggu deploy selesai** → URL akan muncul!

### Step 4: Setup GitHub Integration (via Dashboard)

Setelah deploy pertama:

1. Buka Vercel Dashboard → Project Settings
2. Tab **"Git"**
3. Klik **"Connect Git Repository"**
4. Pilih **GitHub** → Pilih **arisubowoo/arcy-agency**
5. **Production Branch**: `main`
6. **Auto-deploy**: Aktifkan

**Selesai!** Setiap push ke `main` akan auto-deploy.

---

## ✅ Verifikasi Auto-Deploy

Setelah setup:

1. Edit file di project (contoh: `pages/index.tsx`)
2. Commit & push:
   ```bash
   git add .
   git commit -m "test: update website"
   git push origin main
   ```
3. Cek Vercel Dashboard → Deployments
4. Akan muncul deployment baru otomatis! 🎉

---

## 📋 Checklist Final

- [x] Project build berhasil
- [x] Git remote sudah benar
- [x] Repository sudah di-push ke GitHub
- [x] Vercel CLI terinstall
- [ ] Login ke Vercel (via dashboard atau CLI)
- [ ] Deploy pertama ke Vercel
- [ ] Setup GitHub integration (otomatis atau manual)
- [ ] Verifikasi auto-deploy bekerja

---

## 🎯 Rekomendasi

**Gunakan CARA 1 (Dashboard)** karena:

- ✅ Lebih mudah (tidak perlu CLI)
- ✅ GitHub integration otomatis
- ✅ Auto-deploy langsung aktif
- ✅ Bisa lihat logs dan analytics

**CARA 2 (CLI)** hanya jika:

- Lebih suka command line
- Ingin otomatisasi via script

---

## 📞 Troubleshooting

### Error: "Not logged in"

- Login dulu: `vercel login` atau via dashboard

### Error: "Project not found"

- Pastikan repository sudah di-push ke GitHub
- Pastikan nama repository benar: `arisubowoo/arcy-agency`

### Auto-deploy tidak jalan

- Cek Vercel Dashboard → Project Settings → Git
- Pastikan GitHub terhubung
- Pastikan branch `main` aktif untuk production

---

**Selamat! Website Arcy Agency siap go live! 🚀**
