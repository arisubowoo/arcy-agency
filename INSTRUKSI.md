# Instruksi Penggunaan - Arcy Agency Website

## 🚀 Cara Menjalankan di Lokal

1. **Install dependencies:**
   ```bash
   npm install
   ```

2. **Jalankan development server:**
   ```bash
   npm run dev
   ```

3. **Buka browser:**
   Buka [http://localhost:3000](http://localhost:3000) untuk melihat website.

## 📦 Cara Deploy ke Vercel

### Metode 1: Via Vercel Dashboard (Paling Mudah)

1. **Push code ke GitHub:**
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git remote add origin <url-repository-github-anda>
   git push -u origin main
   ```

2. **Deploy di Vercel:**
   - Buka [vercel.com](https://vercel.com)
   - Login dengan akun GitHub Anda
   - Klik tombol **"New Project"**
   - Pilih repository yang sudah di-push tadi
   - Vercel akan otomatis mendeteksi Next.js
   - Klik **"Deploy"**
   - Tunggu proses deploy selesai (sekitar 1-2 menit)
   - Website Anda akan live di URL yang diberikan Vercel

### Metode 2: Via Vercel CLI

1. **Install Vercel CLI:**
   ```bash
   npm i -g vercel
   ```

2. **Login ke Vercel:**
   ```bash
   vercel login
   ```

3. **Deploy:**
   ```bash
   vercel
   ```

4. **Ikuti instruksi** yang muncul di terminal

## ⚙️ Konfigurasi yang Perlu Diubah

### 1. Nomor WhatsApp

Ganti nomor WhatsApp di file berikut:
- `components/Navbar.tsx` (baris 7)
- `components/Footer.tsx` (baris 4)
- `pages/index.tsx` (baris 10)
- `pages/layanan/[id].tsx` (baris 19)

**Format:** `6281234567890` (tanpa + dan tanpa spasi)

**Contoh:** Jika nomor Anda +62 812-3456-7890, tulis: `6281234567890`

### 2. Lokasi Google Maps

Edit file `pages/index.tsx` dan cari bagian Google Maps (sekitar baris 150-160).

Ganti URL iframe dengan embed URL dari Google Maps lokasi Anda:
1. Buka Google Maps
2. Cari lokasi Anda
3. Klik "Share" → "Embed a map"
4. Copy kode iframe
5. Ganti di file `pages/index.tsx`

### 3. Email Kontak

Edit file `components/Footer.tsx` dan `pages/index.tsx` untuk mengganti email:
- Ganti `info@arcyagency.com` dengan email Anda

### 4. Data Layanan

Edit file `data/services.json` untuk:
- Menambah/mengubah/menghapus layanan
- Mengubah harga paket
- Menambah fitur paket
- Mengubah durasi pengerjaan

## 📁 Struktur Project

```
arcy-agency-ai/
├── components/          # Komponen yang bisa dipakai ulang
│   ├── Navbar.tsx      # Menu navigasi
│   ├── Footer.tsx      # Footer website
│   ├── ServiceCard.tsx # Card untuk layanan
│   ├── Testimonials.tsx # Testimoni klien
│   ├── Benefits.tsx    # Keuntungan bekerja dengan kami
│   └── WhatsAppButton.tsx # Tombol WhatsApp
├── data/               # Data JSON
│   └── services.json   # Data layanan dan paket
├── pages/              # Halaman website
│   ├── _app.tsx        # Konfigurasi global
│   ├── index.tsx       # Halaman Home
│   └── layanan/
│       ├── index.tsx   # Daftar semua layanan
│       └── [id].tsx    # Detail layanan & paket
├── styles/             # Styling
│   └── globals.css     # CSS global + Tailwind
└── package.json        # Dependencies
```

## 🎨 Customisasi Warna

Edit file `tailwind.config.js` untuk mengubah warna tema:
- `primary`: Warna biru (default)
- `secondary`: Warna ungu (default)

## ✅ Checklist Sebelum Deploy

- [ ] Ganti nomor WhatsApp di semua file
- [ ] Ganti email kontak
- [ ] Update lokasi Google Maps
- [ ] Review data layanan di `data/services.json`
- [ ] Test semua halaman di localhost
- [ ] Test tombol WhatsApp
- [ ] Pastikan semua gambar/icon muncul dengan benar

## 🆘 Troubleshooting

### Error saat `npm install`
- Pastikan Node.js versi 18+ terinstall
- Hapus folder `node_modules` dan file `package-lock.json`, lalu jalankan `npm install` lagi

### Website tidak muncul setelah deploy
- Cek console di Vercel dashboard untuk melihat error
- Pastikan semua file sudah di-push ke GitHub
- Pastikan `package.json` sudah benar

### WhatsApp tidak terbuka
- Pastikan nomor WhatsApp sudah benar formatnya (tanpa + dan spasi)
- Test di browser desktop dan mobile

## 📞 Support

Jika ada pertanyaan atau butuh bantuan, silakan hubungi tim development.

---

**Selamat! Website Arcy Agency siap digunakan! 🎉**

