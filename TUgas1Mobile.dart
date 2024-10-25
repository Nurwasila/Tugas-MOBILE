class Mobil {

  String merek;
  String warna;
  
  Mobil(this.merek, this.warna);
  
  void infoMobil(String tahun, String tipeMesin, String harga) {
    print("Mobil ini adalah $merek dengan warna $warna.");
    print("Tahun pembuatan: $tahun,\n Tipe mesin: $tipeMesin,\n Harga: $harga.");
  }
  
  void ubahWarna(String warnaBaru, String alasan, String biaya) {
    print("Mengubah warna dari $warna menjadi $warnaBaru.");
    print("Alasan perubahan:$alasan"); 
    print("Biaya: $biaya.");
    warna = warnaBaru;
  }
}

void main() {
  Mobil mobilSaya = Mobil("Toyota", "Hitam");
  mobilSaya.infoMobil("2020", "V6", "Rp 300.000.000");
  mobilSaya.ubahWarna("Merah", "Ingin tampil beda dan meningkatkan estetika", "Rp 5.000.000");
}