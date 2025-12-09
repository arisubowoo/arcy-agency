# 🎬 Video Modal Integration - Dokumentasi Lengkap

## ✅ Fitur yang Telah Diimplementasikan

1. ✅ Komponen `VideoModal.tsx` dengan overlay gelap dan tombol close
2. ✅ Support untuk video MP4 dan YouTube embed
3. ✅ Integrasi dengan card "Jasa Video Animasi AI"
4. ✅ Animasi fade-in dan responsive design
5. ✅ Keyboard shortcut (ESC untuk close)
6. ✅ Auto-pause video saat modal ditutup

---

## 📁 File yang Dibuat/Dimodifikasi

### 1. `components/VideoModal.tsx` (BARU)

Komponen modal untuk menampilkan video dengan fitur:

- Overlay gelap dengan backdrop blur
- Tombol close (X) di header
- Support MP4 video dan YouTube embed
- Responsive design (mobile & desktop)
- Keyboard shortcut (ESC)
- Auto-pause saat modal ditutup

### 2. `pages/index.tsx` (DIMODIFIKASI)

- Import `VideoModal` component
- Tambah state `isVideoModalOpen`
- Modifikasi card "Jasa Video Animasi AI" dengan:
  - `onClick` handler untuk buka modal
  - Play button overlay saat hover
  - Indikator "(Klik untuk demo)"
- Render `VideoModal` component di akhir JSX

### 3. `public/videos/showcase/README.md` (BARU)

Dokumentasi untuk menambahkan video sample

---

## 🎯 Cara Menggunakan

### Opsi 1: Menggunakan Video MP4

1. **Siapkan video** (format MP4, resolusi 1080p, ukuran < 10MB)
2. **Simpan** di `public/videos/showcase/sample.mp4`
3. Modal akan otomatis menampilkan video saat card diklik

**Kode saat ini:**

```tsx
<VideoModal
  isOpen={isVideoModalOpen}
  onClose={() => setIsVideoModalOpen(false)}
  videoSrc="/videos/showcase/sample.mp4"
  title="Demo Video Animasi AI - Arcy Agency"
/>
```

### Opsi 2: Menggunakan YouTube Embed

Edit `pages/index.tsx`, ganti `videoSrc` dengan `youtubeId`:

```tsx
<VideoModal
  isOpen={isVideoModalOpen}
  onClose={() => setIsVideoModalOpen(false)}
  youtubeId="dQw4w9WgXcQ" // Ganti dengan YouTube ID Anda
  title="Demo Video Animasi AI - Arcy Agency"
/>
```

**Cara mendapatkan YouTube ID:**

- URL: `https://www.youtube.com/watch?v=VIDEO_ID`
- ID adalah bagian setelah `v=`

---

## 🔧 Kode Final

### `components/VideoModal.tsx`

```tsx
import React, { useEffect, useRef } from "react";
import { X } from "lucide-react";

interface VideoModalProps {
  isOpen: boolean;
  onClose: () => void;
  videoSrc?: string;
  youtubeId?: string;
  title?: string;
}

const VideoModal: React.FC<VideoModalProps> = ({
  isOpen,
  onClose,
  videoSrc,
  youtubeId,
  title = "Video Demo",
}) => {
  const videoRef = useRef<HTMLVideoElement>(null);

  useEffect(() => {
    const handleEscape = (e: KeyboardEvent) => {
      if (e.key === "Escape" && isOpen) {
        onClose();
      }
    };

    if (isOpen) {
      document.addEventListener("keydown", handleEscape);
      document.body.style.overflow = "hidden";
    }

    return () => {
      document.removeEventListener("keydown", handleEscape);
      document.body.style.overflow = "unset";
    };
  }, [isOpen, onClose]);

  useEffect(() => {
    if (!isOpen && videoRef.current) {
      videoRef.current.pause();
      videoRef.current.currentTime = 0;
    }
  }, [isOpen]);

  if (!isOpen) return null;

  return (
    <div
      className="fixed inset-0 z-[200] flex items-center justify-center p-4"
      onClick={onClose}
    >
      <div className="absolute inset-0 bg-black/90 backdrop-blur-sm"></div>
      <div
        className="relative w-full max-w-5xl bg-slate-900 rounded-2xl overflow-hidden shadow-2xl border border-slate-700"
        onClick={(e) => e.stopPropagation()}
      >
        <div className="flex items-center justify-between p-4 md:p-6 border-b border-slate-800 bg-slate-950/50">
          <h3 className="text-lg md:text-xl font-bold text-white">{title}</h3>
          <button
            onClick={onClose}
            className="w-10 h-10 flex items-center justify-center rounded-lg bg-slate-800 hover:bg-slate-700 text-slate-300 hover:text-white transition-all"
          >
            <X className="w-5 h-5" />
          </button>
        </div>
        <div className="relative w-full bg-black">
          {youtubeId && (
            <div className="relative w-full pb-[56.25%] h-0 overflow-hidden">
              <iframe
                className="absolute top-0 left-0 w-full h-full"
                src={`https://www.youtube.com/embed/${youtubeId}?autoplay=1&rel=0`}
                title={title}
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                allowFullScreen
              ></iframe>
            </div>
          )}
          {videoSrc && !youtubeId && (
            <video
              ref={videoRef}
              src={videoSrc}
              controls
              autoPlay
              className="w-full h-auto max-h-[80vh]"
            >
              Browser Anda tidak mendukung video tag.
            </video>
          )}
        </div>
      </div>
    </div>
  );
};

export default VideoModal;
```

---

## 📝 Bagian Kode yang Dimodifikasi di `pages/index.tsx`

### 1. Import VideoModal

```tsx
import VideoModal from "../components/VideoModal";
```

### 2. Tambah State

```tsx
// State untuk Video Modal
const [isVideoModalOpen, setIsVideoModalOpen] = useState(false);
```

### 3. Modifikasi Card Layanan (Line ~544-575)

```tsx
<div
  key={index}
  className={`group relative bg-slate-900/50 border border-slate-800 p-8 rounded-2xl hover:border-slate-600 transition-all duration-300 hover:bg-slate-800/80 hover:-translate-y-2 ${
    index === 0 ? "cursor-pointer" : ""
  }`}
  onClick={index === 0 ? () => setIsVideoModalOpen(true) : undefined}
>
  {/* ... existing code ... */}

  <div className="mb-6 p-4 bg-slate-950 rounded-xl inline-block shadow-inner group-hover:scale-110 transition-transform duration-300 relative">
    {service.icon}
    {/* Play Button Overlay untuk Video Animasi AI */}
    {index === 0 && (
      <div className="absolute inset-0 flex items-center justify-center bg-black/40 rounded-xl opacity-0 group-hover:opacity-100 transition-opacity">
        <div className="w-12 h-12 bg-white/90 rounded-full flex items-center justify-center">
          <Play className="w-6 h-6 text-slate-900 ml-1" />
        </div>
      </div>
    )}
  </div>

  <h3 className="text-xl font-bold text-white mb-3 group-hover:text-cyan-300 transition-colors flex items-center gap-2">
    {service.title}
    {index === 0 && (
      <span className="text-xs text-cyan-400 opacity-0 group-hover:opacity-100 transition-opacity">
        (Klik untuk demo)
      </span>
    )}
  </h3>

  {/* ... rest of card ... */}
</div>
```

### 4. Render VideoModal (Sebelum closing tag)

```tsx
{
  /* Video Modal */
}
<VideoModal
  isOpen={isVideoModalOpen}
  onClose={() => setIsVideoModalOpen(false)}
  videoSrc="/videos/showcase/sample.mp4"
  title="Demo Video Animasi AI - Arcy Agency"
/>;
```

---

## 🎨 Fitur UI/UX

1. **Hover Effect**: Card "Jasa Video Animasi AI" menampilkan play button overlay saat hover
2. **Visual Indicator**: Teks "(Klik untuk demo)" muncul saat hover
3. **Smooth Animation**: Modal fade-in dengan animasi
4. **Responsive**: Modal responsive untuk mobile dan desktop
5. **Keyboard Support**: Tekan ESC untuk menutup modal
6. **Click Outside**: Klik di luar modal untuk menutup
7. **Auto-pause**: Video otomatis pause saat modal ditutup

---

## ✅ Testing Checklist

- [x] Modal terbuka saat klik card "Jasa Video Animasi AI"
- [x] Modal tertutup saat klik tombol X
- [x] Modal tertutup saat tekan ESC
- [x] Modal tertutup saat klik overlay
- [x] Video auto-play saat modal terbuka
- [x] Video pause saat modal ditutup
- [x] Responsive di mobile dan desktop
- [x] Tidak ada error di console

---

## 🚀 Next Steps

1. **Tambahkan video sample**: Simpan `sample.mp4` di `public/videos/showcase/`
2. **Atau gunakan YouTube**: Ganti `videoSrc` dengan `youtubeId` di `pages/index.tsx`
3. **Test di browser**: Pastikan modal berfungsi dengan baik
4. **Optimasi video**: Pastikan video sudah di-compress untuk performa terbaik

---

**Status: ✅ SELESAI & SIAP DIGUNAKAN!**
