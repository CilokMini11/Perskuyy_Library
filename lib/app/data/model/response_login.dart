/// message : "Login berhasil"
/// user : {"id":4,"nama_lengkap":"jose","username":"jos","password":"0842","email":"jose@gmail.com","alamat":"sukoharjo"}

class ResponseLogin {
  ResponseLogin({
      this.message, 
      this.user,});

  ResponseLogin.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? message;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}

/// id : 4
/// nama_lengkap : "jose"
/// username : "jos"
/// password : "0842"
/// email : "jose@gmail.com"
/// alamat : "sukoharjo"

class User {
  User({
    this.id,
    this.image,
    this.namaLengkap,
    this.username,
    this.password,
    this.email,
    this.alamat,
  });

  User.fromJson(dynamic json) {
    id = json['id'];
    image = json['image']; // Sesuaikan dengan nama properti yang benar
    namaLengkap = json['nama_lengkap'];
    username = json['username'];
    password = json['password'];
    email = json['email'];
    alamat = json['alamat'];
  }

  int? id;
  String? image; // Ubah sesuai key yang sesuai di respons
  String? namaLengkap;
  String? username;
  String? password;
  String? email;
  String? alamat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['image'] = image;
    map['nama_lengkap'] = namaLengkap;
    map['username'] = username;
    map['password'] = password;
    map['email'] = email;
    map['alamat'] = alamat;
    return map;
  }
}
