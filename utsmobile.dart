// Kelas Abstrak Transportasi
abstract class Transportasi {
  String id;
  String nama;
  double _tarifDasar;
  int kapasitas;

  Transportasi(this.id, this.nama, this._tarifDasar, this.kapasitas);

  double get tarifDasar => _tarifDasar;
  double hitungTarif(int jumlahPenumpang); // abstrak
  void tampilInfo() {
    print("[$id] $nama | Kapasitas: $kapasitas | Tarif Dasar: $_tarifDasar");
  }
}

// Kelas Taksi
class Taksi extends Transportasi {
  double jarak;
  Taksi(String id, String nama, double tarifDasar, int kapasitas, this.jarak)
    : super(id, nama, tarifDasar, kapasitas);

  @override
  double hitungTarif(int jumlahPenumpang) => tarifDasar * jarak;
}

// Kelas Bus
class Bus extends Transportasi {
  bool adaWifi;
  Bus(String id, String nama, double tarifDasar, int kapasitas, this.adaWifi)
    : super(id, nama, tarifDasar, kapasitas);

  @override
  double hitungTarif(int jumlahPenumpang) =>
      (tarifDasar * jumlahPenumpang) + (adaWifi ? 5000 : 0);
}

// Kelas Pesawat
class Pesawat extends Transportasi {
  String kelas;
  Pesawat(String id, String nama, double tarifDasar, int kapasitas, this.kelas)
    : super(id, nama, tarifDasar, kapasitas);

  @override
  double hitungTarif(int jumlahPenumpang) =>
      tarifDasar * jumlahPenumpang * (kelas == "Bisnis" ? 1.5 : 1.0);
}

// Kelas Pemesanan
class Pemesanan {
  String idPemesanan;
  String namaPelanggan;
  Transportasi transportasi;
  int jumlahPenumpang;
  double totalTarif;

  Pemesanan(
    this.idPemesanan,
    this.namaPelanggan,
    this.transportasi,
    this.jumlahPenumpang,
    this.totalTarif,
  );

  void cetakStruk() {
    print(
      "\n=== Struk Pemesanan ===\nID: $idPemesanan\nPelanggan: $namaPelanggan\nTransportasi: ${transportasi.nama}\nJumlah Penumpang: $jumlahPenumpang\nTotal Tarif: Rp$totalTarif\n",
    );
  }

  Map<String, dynamic> toMap() => {
    "idPemesanan": idPemesanan,
    "namaPelanggan": namaPelanggan,
    "transportasi": transportasi.nama,
    "jumlahPenumpang": jumlahPenumpang,
    "totalTarif": totalTarif,
  };
}

// Fungsi Global: buatPemesanan
Pemesanan buatPemesanan(
  Transportasi t,
  String nama,
  int jumlahPenumpang,
  String idPemesanan,
) {
  double total = t.hitungTarif(jumlahPenumpang);
  return Pemesanan(idPemesanan, nama, t, jumlahPenumpang, total);
}

// Fungsi Global: tampilSemuaPemesanan
void tampilSemuaPemesanan(List<Pemesanan> daftar) {
  print("\n=== Riwayat Pemesanan ===");
  for (var p in daftar) {
    p.cetakStruk();
  }
}

// Fungsi main()
void main() {

  // Membuat objek transportasi
  var taksi = Taksi("T01", "Taksi nuca", 10000, 4, 12.5);
  var bus = Bus("B01", "Bus ternatekota", 5000, 40, true);
  var pesawat = Pesawat("P01", "garuda", 1500000, 180, "Ekonomi");

  // Membuat daftar pemesanan
  List<Pemesanan> daftar = [];
  daftar.add(buatPemesanan(taksi, "sila", 1, "PSN01"));
  daftar.add(buatPemesanan(bus, "nir", 10, "PSN02"));
  daftar.add(buatPemesanan(pesawat, "dea", 2, "PSN03"));

  // Menampilkan semua hasil pemesanan
  tampilSemuaPemesanan(daftar);
}