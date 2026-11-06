# Menu Kafe - Tugas Praktik Flutter Pertemuan 4 dan 5

Aplikasi ini menggabungkan halaman Detail Menu Kafe (Pertemuan 4) dengan fitur interaktif (Pertemuan 5).

## Fitur
- Halaman detail menu dengan gambar, nama, harga, informasi, dan deskripsi.
- Tombol favorit dengan perubahan ikon dan warna.
- Pengatur jumlah pesanan (+ dan -), jumlah minimum 1.
- Total harga otomatis dihitung berdasarkan harga satuan dikali jumlah pesanan.
- Catatan pesanan dengan pratinjau langsung saat diketik.

## Cara menjalankan
1. Pastikan Flutter SDK dan Android Studio/VS Code sudah terpasang.
2. Buat proyek Flutter:
   ```bash
   flutter create menu_kafe
   ```
3. Salin file `lib/main.dart` dari paket ini ke folder `menu_kafe/lib/main.dart`, lalu timpa file yang lama.
4. Jalankan perintah:
   ```bash
   cd menu_kafe
   flutter pub get
   flutter run
   ```

Tidak ada package tambahan yang perlu dipasang. Gambar memakai `Image.network`, jadi koneksi internet diperlukan agar gambar tampil. Jika gambar gagal dimuat, aplikasi menampilkan ikon pengganti.

## Pemeriksaan
Jalankan:
```bash
flutter analyze
```

## Pengumpulan
Sesuai instruksi tugas, siapkan:
- Screenshot halaman bagian atas.
- Screenshot halaman setelah digulir ke bagian bawah.
- File `lib/main.dart`.

Unggah file proyek ke repository GitHub, lalu kirim tautan repository sesuai instruksi dosen.
