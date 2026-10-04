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
