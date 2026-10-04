# Tugas2_SistemPerpustakaan

Nama: Dias Mayri

# Problem Statement

Sistem perpustakaan ini merupakan sistem sederhana yang digunakan untuk mengecek proses peminjaman buku. Sistem akan mengecek jumlah buku yang sedang dipinjam dan jumlah buku yang ingin dipinjam. Jika jumlah buku lebih dari 3 maka peminjaman gagal. Sistem juga mengecek apakah buku masih tersedia atau sedang dipinjam.

Selain itu sistem dapat menghitung denda apabila pengguna terlambat mengembalikan buku. Denda yang diberikan adalah Rp1000 untuk setiap hari keterlambatan.

# Actor

Aktor yang menggunakan sistem adalah petugas perpustakaan yang mengatur proses peminjaman dan denda buku.

# Input dan Output

## Input

- dipinjam (int): jumlah buku yang sedang dipinjam
- barupinjam (int): jumlah buku yang ingin dipinjam
- tersedia (bool): mengecek apakah buku tersedia atau tidak
- hari (int): jumlah hari keterlambatan

## Output

Program akan menampilkan hasil peminjaman seperti berhasil meminjam buku, gagal karena maksimal 3 buku, atau gagal karena buku sedang dipinjam.

Program juga menampilkan jumlah denda keterlambatan.

# Functional Requirements

- dapat mengecek jumlah buku yang sedang dipinjam
- dapat mengecek jumlah buku yang ingin dipinjam
- dapat mengecek maksimal peminjaman 3 buku
- dapat mengecek buku tersedia atau sedang dipinjam
- dapat menghitung denda berdasarkan jumlah hari keterlambatan
- dapat menampilkan hasil peminjaman dan denda

# Business Rule

- BR-01 : Jumlah buku yang dapat dipinjam maksimal 3 buku
- BR-02 : Jika jumlah buku yang dipinjam lebih dari 3 maka peminjaman gagal
- BR-03 : Jika buku tersedia maka peminjaman berhasil
- BR-04 : Jika buku tidak tersedia maka peminjaman gagal
- BR-05 : Denda keterlambatan dikenakan biaya Rp1000 per hari
- BR-06 : Jika tidak ada keterlambatan maka denda Rp0

# Decomposition

Sistem Perpustakaan
|
|-- dipinjam -> mengecek jumlah buku yang sedang dipinjam
|-- barupinjam -> mengecek jumlah buku yang ingin dipinjam
|-- tersedia -> mengecek apakah buku tersedia atau sedang dipinjam
|-- prosesPeminjaman -> mengecek apakah peminjaman berhasil atau gagal
|-- hari -> menghitung jumlah hari keterlambatan
|-- hitungDenda -> menghitung total denda berdasarkan hari keterlambatan

# Pattern Recognition

- Pola pengecekan jumlah buku: jumlah buku yang sedang dipinjam ditambah dengan jumlah buku baru kemudian dicek apakah lebih dari 3.
- Pola pengecekan ketersediaan: menggunakan tipe data bool untuk melihat buku tersedia atau tidak.
- Pola perhitungan denda: jumlah hari keterlambatan dikalikan dengan Rp1000.
- Pola kondisi: menggunakan if untuk menentukan hasil peminjaman dan denda.

# Abstraction

Sistem Perpustakaan
|
|-- dipinjam
|-- barupinjam
|-- tersedia
|-- hari
|-- prosesPeminjaman
|-- hitungDenda

Tipe data utama:
int digunakan untuk menghitung jumlah buku dan jumlah hari keterlambatan, sedangkan bool digunakan untuk mengecek apakah buku tersedia atau tidak.

# Flowchart

[Start]
     |
     ▼
[panggil prosesPeminjaman]
     |
     ▼
[dipinjam + barupinjam > 3?]
     |
    ya ─────────────► [return Gagal: Maksimal pinjam 3 buku]
     |
   tidak
     |
     ▼
[tersedia?]
     |
    ya ─────────────► [return Berhasil meminjam buku]
     |
   tidak
     |
     ▼
[return Gagal: Buku sedang dipinjam]
     |
     ▼
[panggil hitungDenda]
     |
     ▼
[hari > 0?]
     |
    ya ─────────────► [hari × 1000]
     |
   tidak
     |
     ▼
[return 0]
     |
     ▼
[selesai]

# Pseudocode

String prosesPeminjaman(int dipinjam, int barupinjam, bool tersedia) {

  if (dipinjam + barupinjam > 3) {
    return "Gagal: Maksimal pinjam 3 buku";
  }

  if (tersedia) {
    return "Berhasil meminjam buku";
  }

  return "Gagal: Buku sedang dipinjam";
}

int hitungDenda(int hari) {

  if (hari > 0) {
    return hari * 1000;
  }

  return 0;
}

# Implementasi Dart

String prosesPeminjaman(int dipinjam, int barupinjam, bool tersedia) {
  if (dipinjam + barupinjam > 3) {
    return 'Gagal: Maksimal pinjam 3 buku';
  }

  if (tersedia) {
    return 'Berhasil meminjam buku';
  }

  return 'Gagal: Buku sedang dipinjam';
}

int hitungDenda(int hari) {
  if (hari > 0) {
    return hari * 1000;
  }

  return 0;
}

void main() {
  print(prosesPeminjaman(1, 1, true));
  print(prosesPeminjaman(2, 2, true));
  print(prosesPeminjaman(0, 1, false));

  print('Denda: Rp${hitungDenda(0)}');
  print('Denda: Rp${hitungDenda(4)}');
}

# Output

Berhasil meminjam buku
Gagal: Maksimal pinjam 3 buku
Gagal: Buku sedang dipinjam
Denda: Rp0
Denda: Rp4000