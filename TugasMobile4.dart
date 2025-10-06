import 'dart:io';

void main() {
  final String namaRestoran = "NucaRestaurant ";

  final Map<int, Map<String, dynamic>> makanan = {
    1: {"nama": "Spicy Chiken", "harga": 25000},
    2: {"nama": "Cheese Sandwich", "harga": 30000},
    3: {"nama": "Chiken Burgers", "harga": 30000},
  };

  final Map<int, Map<String, dynamic>> minuman = {
    1: {"nama": "Milk Shake", "harga": 15000},
    2: {"nama": "Lemon Tea", "harga": 1000},
    3: {"nama": "Coffee", "harga": 8000},
  };

  bool lanjut = true;

  while (lanjut) {
    int total = 0;

    print("\n==============================");
    print("   Selamat Datang di $namaRestoran");
    print("==============================\n");

    // Pilih makanan
    printMenu(makanan, "MENU MAKANAN");
    int pilihMakanan = readMenuChoice(makanan, "Pilih makanan (angka): ");
    print("Anda memilih: ${makanan[pilihMakanan]!['nama']}");
    total += (makanan[pilihMakanan]!['harga'] as int);

    // Pilih minuman
    printMenu(minuman, "MENU MINUMAN");
    int pilihMinuman = readMenuChoice(minuman, "Pilih minuman (angka): ");
    print("Anda memilih: ${minuman[pilihMinuman]!['nama']}");
    total += (minuman[pilihMinuman]!['harga'] as int);

    // Total
    print("\n=== TOTAL PESANAN ===");
    print("Total yang harus dibayar: Rp$total");

    // Pembayaran (beri opsi ulang jika kurang)
    while (true) {
      int bayar = readInt("Masukkan uang pembayaran (angka): Rp");
      if (bayar >= total) {
        int kembalian = bayar - total;
        print("Pembayaran berhasil! Kembalian: Rp$kembalian");
        break;
      } else {
        print("Uang tidak cukup. Kurang Rp${total - bayar}.");
        bool cobaLagi = readYesNo("Ingin coba bayar lagi? (y/n): ");
        if (!cobaLagi) {
          print("Transaksi dibatalkan.");
          break;
        }
      }
    }

    lanjut = readYesNo("\nApakah ingin memesan lagi? (y/n): ");
    if (!lanjut) {
      print("\nTerima kasih sudah berkunjung ke $namaRestoran!");
    }
  }
}

void printMenu(Map<int, Map<String, dynamic>> menu, String judul) {
  print("\n=== $judul ===");
  menu.forEach((key, value) {
    print("$key. ${value['nama']} - Rp${value['harga']}");
  });
}

int readMenuChoice(Map<int, Map<String, dynamic>> menu, String prompt) {
  while (true) {
    stdout.write(prompt);
    String? line = stdin.readLineSync();
    if (line == null || line.trim().isEmpty) {
      print("Input tidak boleh kosong. Coba lagi.");
      continue;
    }
    int? n = int.tryParse(line.trim());
    if (n == null) {
      print("Masukkan angka yang valid.");
      continue;
    }
    if (!menu.containsKey(n)) {
      print("Pilihan tidak tersedia. Pilih sesuai nomor di menu.");
      continue;
    }
    return n;
  }
}

int readInt(String prompt) {
  while (true) {
    stdout.write(prompt);
    String? line = stdin.readLineSync();
    if (line == null || line.trim().isEmpty) {
      print("Input tidak boleh kosong. Coba lagi.");
      continue;
    }
    int? n = int.tryParse(line.trim());
    if (n == null) {
      print("Masukkan angka yang valid.");
      continue;
    }
    return n;
  }
}

bool readYesNo(String prompt) {
  while (true) {
    stdout.write(prompt);
    String? line = stdin.readLineSync();
    if (line == null) {
      print("Masukkan 'y' atau 'n'.");
      continue;
    }
    String v = line.trim().toLowerCase();
    if (v == 'y' || v == 'yes') return true;
    if (v == 'n' || v == 'no') return false;
    print("Masukkan 'y' (ya) atau 'n' (tidak).");
  }
}
