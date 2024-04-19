import 'dart:convert';

// Fungsi untuk mengonversi JSON menjadi ResponsePinjam
ResponsePinjam responsePinjamFromJson(String str) =>
    ResponsePinjam.fromJson(json.decode(str));

// Fungsi untuk mengonversi ResponsePinjam menjadi JSON
// String responseBookToJson(ResponsePinjam data) => json.encode(data.toJson());

// Menggunakan ResponsePinjam untuk mengelola data JSON
class ResponsePinjam {
  ResponsePinjam({
    this.statusCode,
    this.message,
    this.data,
  });

  int? statusCode;
  String? message;
  List<DataPinjam>? data;

  factory ResponsePinjam.fromJson(List<dynamic> json) {
    return ResponsePinjam(
      statusCode: json[0]["Statuscode"],
      message: json[0]["message"],
      data: List<DataPinjam>.from(json[0]["data"].map((x) => DataPinjam.fromJson(x))),
    );
  }
}


class Buku {
  Buku({
    this.judul,
    this.penulis,
    this.penerbit,
    this.tahunTerbit,
    this.image,
    this.deskripsiBuku,
  });

  String? judul;
  String? penulis;
  String? penerbit;
  int? tahunTerbit;
  String? image;
  String? deskripsiBuku;

  factory Buku.fromJson(Map<String, dynamic> json) => Buku(
    judul: json["judul"],
    penulis: json["penulis"],
    penerbit: json["penerbit"],
    tahunTerbit: json["tahun_terbit"],
    image: json["image"],
    deskripsiBuku: json["deskripsi_buku"],
  );

  Map<String, dynamic> toJson() => {
    "judul": judul,
    "penulis": penulis,
    "penerbit": penerbit,
    "tahun_terbit": tahunTerbit,
    "image": image,
    "deskripsi_buku": deskripsiBuku,
  };
}

class DataPinjam {
  DataPinjam({
    this.id,
    this.userId,
    this.bukuId,
    this.tanggalPinjam,
    this.tanggalKembali,
    this.status,
    this.buku,
  });

  int? id;
  String? userId;
  String? bukuId;
  String? tanggalPinjam;
  String? tanggalKembali;
  String? status;
  Buku? buku;

  factory DataPinjam.fromJson(Map<String, dynamic> json) => DataPinjam(
    id: json["id"],
    userId : json["user_id"],
    bukuId : json["buku_id"],
    tanggalPinjam : json["tanggal_pinjam"],
    tanggalKembali : json["tanggal_kembali"],
    status : json["status"],
    buku: json["buku"] != null ? Buku.fromJson(json["buku"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "buku_id": bukuId,
    "tanggal_pinjam": tanggalPinjam,
    "tanggal_kembali": tanggalKembali,
    "status": status,
    "buku": buku != null ? buku!.toJson() : null, // Mengonversi properti buku ke JSON jika tidak null
  };
}


void main() {
  // Contoh penggunaan
  String jsonString = '''

    {
        "Statuscode": 200,
        "message": "SUCCESS",
        "data": [
            {
                "id": 6,
                "user_id": "1",
                "buku_id": "6",
                "tanggal_pinjam": "2024-02-26T17:00:00.000Z",
                "tanggal_kembali": "2024-02-28T17:00:00.000Z",
                "status": "DIPINJAM",
                "buku": {
                    "judul": "solo leveling",
                    "penulis": "ptj",
                    "penerbit": "gramedia",
                    "tahun_terbit": 2023,
                    "image": "http://192.168.1.11:3000/image/image_1708315289688.jpg",
                    "deskripsi_buku": "tes"
                }
            }
        ]
    }
  ''';

  // Mengonversi JSON menjadi objek Dart
  ResponsePinjam responsePinjam = responsePinjamFromJson(jsonString);

  // Mencetak data buku dari objek Dart
  print('Status Code: ${responsePinjam.statusCode}');
  print('Message: ${responsePinjam.message}');
  print('Data Pinjam:');
  responsePinjam.data!.forEach((dataPinjam) {
    print('  - ID: ${dataPinjam.id}');
    print('    userId: ${dataPinjam.userId}');
    print('    bukuId: ${dataPinjam.bukuId}');
    print('    tanggalPinjam: ${dataPinjam.tanggalPinjam}');
    print('    tanggalKembali: ${dataPinjam.tanggalKembali}');
    print('    status: ${dataPinjam.status}');
     if (dataPinjam.buku != null) {
      print('    Buku:');
      print('      Judul: ${dataPinjam.buku!.judul}');
      print('      Penulis: ${dataPinjam.buku!.penulis}');
      print('      Penerbit: ${dataPinjam.buku!.penerbit}');
      print('      Tahun Terbit: ${dataPinjam.buku!.tahunTerbit}');
      print('      Image: ${dataPinjam.buku!.image}');
      print('      Deskripsi: ${dataPinjam.buku!.deskripsiBuku}');
    }
  });
}
