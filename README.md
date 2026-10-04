# Tugas 2 - Sistem Perpustakaan

**Nama:** Dias Mayri

## Problem Statement

Sistem perpustakaan digunakan untuk mengatur peminjaman buku.  
Pengguna hanya boleh meminjam maksimal 3 buku. Buku yang sedang dipinjam tidak bisa dipinjam lagi. Jika terlambat mengembalikan buku, maka dikenakan denda Rp1.000 per hari.

## Actor

**Petugas Perpustakaan**

Petugas dapat mengecek peminjaman buku dan menghitung denda.

## Input dan Output

### Input
- Daftar buku yang sedang dipinjam
- Buku yang ingin dipinjam
- Status ketersediaan buku
- Jumlah hari keterlambatan

### Output
- Berhasil atau tidaknya peminjaman buku
- Jumlah denda keterlambatan

## Functional Requirements

1. Mengecek apakah pengguna masih bisa meminjam buku.
2. Mengecek apakah buku tersedia.
3. Menambahkan buku ke daftar peminjaman jika bisa dipinjam.
4. Menghitung denda jika buku terlambat dikembalikan.

## Business Rule

- Maksimal meminjam 3 buku.
- Buku yang sedang dipinjam tidak dapat dipinjam lagi.
- Jika terlambat, denda sebesar Rp1.000 per hari.
- Jika tidak terlambat, denda Rp0.

## Decomposition

Program dibagi menjadi beberapa bagian:

1. Mengecek peminjaman buku.
2. Memproses peminjaman buku.
3. Menghitung denda.

## Pattern Recognition

Pola yang digunakan adalah pengecekan kondisi.

Contohnya:
- Jika jumlah buku sudah 3, maka tidak bisa meminjam.
- Jika buku tidak tersedia, maka tidak bisa dipinjam.
- Jika terlambat, maka denda dihitung berdasarkan jumlah hari.

## Abstraction

Data yang digunakan cukup berupa:

- `dipinjam` = jumlah atau daftar buku yang sedang dipinjam.
- `barupinjam` = buku yang ingin dipinjam.
- `tersedia` = status buku.
- `hari` = jumlah hari keterlambatan.

## Algorithm

1. Masukkan data buku yang sedang dipinjam.
2. Masukkan buku yang ingin dipinjam.
3. Cek jumlah buku yang sedang dipinjam.
4. Cek apakah buku tersedia.
5. Jika memenuhi syarat, buku berhasil dipinjam.
6. Masukkan jumlah hari keterlambatan.
7. Jika terlambat, hitung denda Rp1.000 per hari.
8. Tampilkan hasil.

## Flowchart

```text
Mulai
  |
Input data peminjaman
  |
Cek jumlah buku
  |
Apakah masih kurang dari 3?
  |--- Tidak ---> Gagal meminjam
  |
 Ya
  |
Cek ketersediaan buku
  |
Apakah buku tersedia?
  |--- Tidak ---> Gagal meminjam
  |
 Ya
  |
Berhasil meminjam
  |
Input hari keterlambatan
  |
Hitung denda
  |
Tampilkan hasil
  |
Selesai
```

## Pseudocode

```text
Mulai

Input dipinjam
Input barupinjam
Input tersedia

Jika jumlah dipinjam >= 3
    Tampilkan "Tidak bisa meminjam"
Jika tidak
    Jika tersedia = false
        Tampilkan "Buku tidak tersedia"
    Jika tidak
        Tampilkan "Berhasil meminjam buku"

Input hari

Jika hari <= 0
    denda = 0
Jika tidak
    denda = hari * 1000

Tampilkan denda

Selesai
```

## Implementasi Dart

```dart
void prosesPeminjaman(
  List<String> dipinjam,
  String barupinjam,
  bool tersedia,
) {
  if (dipinjam.length >= 3) {
    print("Tidak bisa meminjam, maksimal 3 buku.");
  } else if (!tersedia) {
    print("Buku tidak tersedia.");
  } else {
    dipinjam.add(barupinjam);
    print('Berhasil meminjam "$barupinjam".');
  }
}

int hitungDenda(int hari) {
  if (hari <= 0) {
    return 0;
  }

  return hari * 1000;
}

void main() {
  List<String> dipinjam = ["Bumi", "Laskar Pelangi"];

  print("Daftar buku: $dipinjam");

  prosesPeminjaman(dipinjam, "Filosofi Teras", true);
  prosesPeminjaman(dipinjam, "Laut Bercerita", true);

  print("Daftar akhir: $dipinjam");

  print("Denda 0 hari: Rp ${hitungDenda(0)}");
  print("Denda 3 hari: Rp ${hitungDenda(3)}");
}
```