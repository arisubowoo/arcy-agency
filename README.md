# Arcy Agency - AI-Powered Creative & Automation Studio

Website landing page profesional untuk Arcy Agency yang menawarkan layanan AI untuk bisnis & UMKM: Video Animasi AI, Website Modern, dan Chatbot Customer Service 24/7.

## 🚀 Tech Stack

- **Next.js 14** (Pages Router) - Framework React untuk production
- **React 18** - Library UI
- **TypeScript** - Type safety
- **Tailwind CSS 3** - Utility-first CSS framework
- **Lucide React** - Modern icon library

### 📌 Router Choice: Pages Router

Project ini menggunakan **Pages Router** (`/pages`) karena:

- ✅ Struktur yang lebih sederhana dan familiar untuk project landing page
- ✅ File-based routing yang mudah dipahami
- ✅ Kompatibilitas penuh dengan Next.js 14
- ✅ Lebih mudah untuk SEO dan static generation
- ✅ Cocok untuk website marketing/landing page yang tidak memerlukan fitur App Router yang kompleks

Pages Router adalah pilihan yang tepat untuk project ini karena fokus pada landing page statis dengan routing sederhana.

## ✨ Fitur Utama

- 🎬 **Landing Page Modern** dengan animasi loading AI robot yang elegan
- 💰 **Pricing Section** dengan 3 kategori layanan (Video, Website, Chatbot)
- 📱 **Fully Responsive** - Mobile-first design
- 🤖 **AI Loading Animation** - Preloader dengan efek cyberpunk
- 💬 **WhatsApp Integration** - Direct link ke nomor WhatsApp untuk konsultasi
- 🎨 **Dark Theme** - Tema gelap dengan accent cyan/purple
- ⚡ **Fast Performance** - Optimized untuk production

## 📦 Instalasi & Setup

### Prerequisites

- Node.js 18+
- npm atau yarn

### Langkah Instalasi

1. **Clone atau download project ini**

2. **Install dependencies:**

   ```bash
   npm install
   ```

3. **Jalankan development server:**

   ```bash
   npm run dev
   ```

4. **Buka browser:**
   Buka [http://localhost:3000](http://localhost:3000) untuk melihat website.

## 🛠️ Scripts

- `npm run dev` - Jalankan development server (port 3000)
- `npm run build` - Build untuk production
- `npm start` - Jalankan production server (setelah build)
- `npm run lint` - Run ESLint

## 📁 Struktur Project

```
arcy-agency-ai/
├── components/          # Komponen reusable (untuk halaman layanan)
│   ├── Navbar.tsx
│   ├── Footer.tsx
│   ├── ServiceCard.tsx
│   ├── Testimonials.tsx
│   ├── Benefits.tsx
│   └── WhatsAppButton.tsx
├── data/               # Data JSON
│   └── services.json
├── pages/              # Halaman Next.js
│   ├── _app.tsx        # Global app wrapper
│   ├── index.tsx       # Landing page utama (Arcy Agency)
│   └── layanan/
│       ├── index.tsx   # Services list page
│       └── [id].tsx    # Service detail page
├── styles/             # Global styles
│   └── globals.css
├── types/              # TypeScript type definitions
│   └── json.d.ts
├── package.json
├── tailwind.config.js
├── postcss.config.js
├── next.config.js
└── tsconfig.json
```

## 🔧 Konfigurasi

### Mengubah Nomor WhatsApp

Edit file `pages/index.tsx` dan cari fungsi `handleWhatsAppClick`:

```typescript
const phoneNumber = "628990462569"; // Ganti dengan nomor Anda
```

Format: `6281234567890` (tanpa + dan spasi, dengan kode negara 62)

### Mengubah Data Layanan

Edit file `data/services.json` untuk menambah, mengubah, atau menghapus layanan dan paket.

## 🚀 Deploy ke Vercel via GitHub

### Langkah-langkah Deploy

1. **Push project ke GitHub:**

   ```bash
   git add .
   git commit -m "Ready for Vercel deployment"
   git push origin main
   ```

2. **Masuk ke Vercel Dashboard:**

   - Buka [vercel.com](https://vercel.com)
   - Login dengan akun GitHub Anda

3. **Import Project:**

   - Klik **"Add New Project"** atau **"New Project"**
   - Pilih **"Import Git Repository"**
   - Pilih provider: **GitHub**
   - Pilih repository: **arisubowoo/arcy-agency** (atau repo Anda)
   - Klik **"Import"**

4. **Konfigurasi Project (Vercel akan auto-detect):**

   - **Framework Preset**: Next.js (auto-detect)
   - **Root Directory**: `./` (default)
   - **Build Command**: `npm run build` (default)
   - **Output Directory**: `.next` (default)
   - **Install Command**: `npm install` (default)
   - Klik **"Deploy"**

5. **Tunggu Deploy:**

   - Vercel akan otomatis:
     - Install dependencies (`npm install`)
     - Build project (`npm run build`)
     - Deploy ke production
   - Tunggu 1-2 menit hingga selesai

6. **Website LIVE! 🎉**
   - URL akan muncul di dashboard
   - Format: `https://arcy-agency-xxxxx.vercel.app`
   - Setiap push ke branch `main` akan trigger auto-deploy

### ✅ Auto-Deploy Setup

Setelah deploy pertama, Vercel akan **otomatis**:

- ✅ Terhubung dengan GitHub repository
- ✅ Setiap push ke branch `main` akan trigger deployment baru
- ✅ Tidak perlu setup tambahan!

## 📝 Catatan Penting

- **Environment Variables**: Jika ada variabel environment yang diperlukan, buat file `.env.local` di root project (file ini tidak akan di-commit ke Git).
- **Build Optimization**: Pastikan `npm run build` berhasil tanpa error sebelum deploy.
- **Custom Domain**: Setelah deploy, kamu bisa menambahkan custom domain di Vercel dashboard.

## 🐛 Troubleshooting

### Build Error

Jika `npm run build` error:

1. Pastikan semua dependencies terinstall: `npm install`
2. Cek error message di terminal
3. Pastikan tidak ada import yang salah atau path yang tidak valid

### Dev Server Error

Jika `npm run dev` error:

1. Hapus folder `.next/` dan `node_modules/`
2. Jalankan `npm install` lagi
3. Jalankan `npm run dev` lagi

## 📞 Support

Untuk pertanyaan atau bantuan:

- WhatsApp: 0899-0462-569
- Email: info@arcyagency.com

---

© 2025 Arcy Agency. All rights reserved.
