import 'dart:io';

void main() {
  print("=== Program Sistem Penilaian Mahasiswa ===");

  stdout.write("Masukkan skor Anda (0 - 100): ");
  String? input = stdin.readLineSync();

  if (input != null) {
    int? skor = int.tryParse(input);

    if (skor == null) {
      print("Error: Input bukan angka!");
    } else if (skor < 0 || skor > 100) {
      print("Error: Skor harus dalam rentang 0 - 100.");
    } else {
      String grade;
      if (skor >= 85 && skor <= 100) {
        grade = "A";
      } else if (skor >= 70 && skor <= 84) {
        grade = "B";
      } else if (skor >= 60 && skor <= 69) {
        grade = "C";
      } else if (skor >= 50 && skor <= 59) {
        grade = "D";
      } else {
        grade = "E";
      }

      print("Skor Anda: $skor");
      print("Grade Anda: $grade");
    }
  } else {
    print("Error: Input kosong!");
  }
}
