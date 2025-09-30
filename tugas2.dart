import 'dart:io';

void main() {
  String nama;
  int jamKerja;
  double upahPerJam;
  bool statusTetap;

  stdout.write("Masukkan nama karyawan: ");
  nama = stdin.readLineSync()!;

  stdout.write("Masukkan jumlah jam kerja dalam seminggu: ");
  jamKerja = int.parse(stdin.readLineSync()!);

  stdout.write("Masukkan upah per jam: ");
  upahPerJam = double.parse(stdin.readLineSync()!);

  stdout.write("Apakah karyawan tetap? (true/false): ");
  statusTetap = stdin.readLineSync()!.toLowerCase() == 'true';

  double gajiKotor = jamKerja * upahPerJam;
  double pajak = statusTetap ? gajiKotor * 0.10 : gajiKotor * 0.05;
  double gajiBersih = gajiKotor - pajak;

  print("\n=== Rincian Gaji Karyawan ===");
  print("Nama Karyawan : $nama");
  print("Gaji Kotor    : Rp ${gajiKotor.toStringAsFixed(2)}");
  print("Pajak         : Rp ${pajak.toStringAsFixed(2)}");
  print("Gaji Bersih   : Rp ${gajiBersih.toStringAsFixed(2)}");
}
