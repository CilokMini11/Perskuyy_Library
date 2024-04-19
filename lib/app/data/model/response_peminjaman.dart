import 'dart:ffi';

/// Statuscode : 200
/// message : "SUCCESS"
/// data : [{"id":6,"user_id":48,"buku_id":14,"tanggal_pinjam":"2024-03-06","tanggal_kembali":"2024-03-07","status":"DIPINJAM","buku":{"judul":"Attack on Titan 06","image":"/image/image_1709131169254.jpg","penulis":"Hajime Isayama","penerbit":"Elex Media Komputindo","tahun_terbit":"2021","kategorybuku_id":1,"deskripsi_buku":"Ceritanya berlatar di dunia tempat umat manusia hidup di wilayah yang dikelilingi tiga lapis tembok besar, yang melindungi mereka dari makhluk pemakan manusia berukuran raksasa yang dikenal sebagai Titan. Manga ini dimuat berseri dalam majalah Bessatsu Shōnen Magazine terbitan Kodansha sejak bulan September 2009 hingga April 2021, dan telah diterbitkan menjadi 34 volume tankōbon per bulan Desember 2020.\n\n\nBerikut cuplikan ceritanya, Pasukan Penyelidik akhirnya melakukan ekspedisi ke luar tembok bersama Eren dan para prajurit baru lainnya. Mereka pergi menuju Wall Maria dengan melewati jalur baru. Namun, di tengah perjalanan, mereka bertemu dengan \"Titan Wanita\" yang menghancurkan formasi mereka.","rating":"5","created_at":"0000-00-00 00:00:00","updated_at":null,"nama_kategory":"Comic"}}]

class ResponsePeminjaman {
  ResponsePeminjaman({
      this.statuscode, 
      this.message, 
      this.data,});

  ResponsePeminjaman.fromJson(dynamic json) {
    statuscode = json['Statuscode'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataPeminjaman.fromJson(v));
      });
    }
  }
  int? statuscode;
  String? message;
  List<DataPeminjaman>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Statuscode'] = statuscode;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 6
/// user_id : 48
/// buku_id : 14
/// tanggal_pinjam : "2024-03-06"
/// tanggal_kembali : "2024-03-07"
/// status : "DIPINJAM"
/// buku : {"judul":"Attack on Titan 06","image":"/image/image_1709131169254.jpg","penulis":"Hajime Isayama","penerbit":"Elex Media Komputindo","tahun_terbit":"2021","kategorybuku_id":1,"deskripsi_buku":"Ceritanya berlatar di dunia tempat umat manusia hidup di wilayah yang dikelilingi tiga lapis tembok besar, yang melindungi mereka dari makhluk pemakan manusia berukuran raksasa yang dikenal sebagai Titan. Manga ini dimuat berseri dalam majalah Bessatsu Shōnen Magazine terbitan Kodansha sejak bulan September 2009 hingga April 2021, dan telah diterbitkan menjadi 34 volume tankōbon per bulan Desember 2020.\n\n\nBerikut cuplikan ceritanya, Pasukan Penyelidik akhirnya melakukan ekspedisi ke luar tembok bersama Eren dan para prajurit baru lainnya. Mereka pergi menuju Wall Maria dengan melewati jalur baru. Namun, di tengah perjalanan, mereka bertemu dengan \"Titan Wanita\" yang menghancurkan formasi mereka.","rating":"5","created_at":"0000-00-00 00:00:00","updated_at":null,"nama_kategory":"Comic"}

class DataPeminjaman {
  DataPeminjaman({
      this.id, 
      this.userId, 
      this.bukuId, 
      this.tanggalPinjam, 
      this.tanggalKembali, 
      this.status, 
      this.denda,
      this.username,
      this.email,
      this.image_profile,
      this.buku,});

  DataPeminjaman.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    bukuId = json['buku_id'];
    tanggalPinjam = json['tanggal_pinjam'];
    tanggalKembali = json['tanggal_kembali'];
    status = json['status'];
    denda = json['denda'];
    username = json['username'];
    email = json['email'];
    image_profile = json['image_profile'];
    buku = json['buku'] != null ? Buku.fromJson(json['buku']) : null;
  }
  int? id;
  int? userId;
  int? bukuId;
  String? tanggalPinjam;
  String? tanggalKembali;
  String? status;
  int? denda;
  String? username;
  String? email;
  String? image_profile;
  Buku? buku;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['buku_id'] = bukuId;
    map['tanggal_pinjam'] = tanggalPinjam;
    map['tanggal_kembali'] = tanggalKembali;
    map['status'] = status;
    map['denda'] = denda;
    map['username'] = username;
    map['email'] = email;
    map['image_profile'] = image_profile;
    if (buku != null) {
      map['buku'] = buku?.toJson();
    }
    return map;
  }

}

/// judul : "Attack on Titan 06"
/// image : "/image/image_1709131169254.jpg"
/// penulis : "Hajime Isayama"
/// penerbit : "Elex Media Komputindo"
/// tahun_terbit : "2021"
/// kategorybuku_id : 1
/// deskripsi_buku : "Ceritanya berlatar di dunia tempat umat manusia hidup di wilayah yang dikelilingi tiga lapis tembok besar, yang melindungi mereka dari makhluk pemakan manusia berukuran raksasa yang dikenal sebagai Titan. Manga ini dimuat berseri dalam majalah Bessatsu Shōnen Magazine terbitan Kodansha sejak bulan September 2009 hingga April 2021, dan telah diterbitkan menjadi 34 volume tankōbon per bulan Desember 2020.\n\n\nBerikut cuplikan ceritanya, Pasukan Penyelidik akhirnya melakukan ekspedisi ke luar tembok bersama Eren dan para prajurit baru lainnya. Mereka pergi menuju Wall Maria dengan melewati jalur baru. Namun, di tengah perjalanan, mereka bertemu dengan \"Titan Wanita\" yang menghancurkan formasi mereka."
/// rating : "5"
/// created_at : "0000-00-00 00:00:00"
/// updated_at : null
/// nama_kategory : "Comic"

class Buku {
  Buku({
      this.judul, 
      this.image, 
      this.penulis, 
      this.penerbit, 
      this.tahunTerbit, 
      this.kategorybukuId, 
      this.deskripsiBuku, 
      this.rating, 
      this.createdAt, 
      this.updatedAt, 
      this.namaKategory,});

  Buku.fromJson(dynamic json) {
    judul = json['judul'];
    image = json['image'];
    penulis = json['penulis'];
    penerbit = json['penerbit'];
    tahunTerbit = json['tahun_terbit'];
    kategorybukuId = json['kategorybuku_id'];
    deskripsiBuku = json['deskripsi_buku'];
    rating = json['rating'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    namaKategory = json['nama_kategory'];
  }
  String? judul;
  String? image;
  String? penulis;
  String? penerbit;
  String? tahunTerbit;
  int? kategorybukuId;
  String? deskripsiBuku;
  String? rating;
  String? createdAt;
  String? updatedAt;
  String? namaKategory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['judul'] = judul;
    map['image'] = image;
    map['penulis'] = penulis;
    map['penerbit'] = penerbit;
    map['tahun_terbit'] = tahunTerbit;
    map['kategorybuku_id'] = kategorybukuId;
    map['deskripsi_buku'] = deskripsiBuku;
    map['rating'] = rating;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['nama_kategory'] = namaKategory;
    return map;
  }

}