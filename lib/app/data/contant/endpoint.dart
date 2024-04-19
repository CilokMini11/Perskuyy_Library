
class Endpoint {
  static const String baseUrlApi = "http://192.168.6.11:3000";
  // static const String baseUrlApi = "http://192.168.1.10:3000";
  // static const String baseUrlApi = "http://192.168.10.105:3000/";
  // static const String baseUrlApi = "http://192.168.10.104:3000/";

  static const String login = "${baseUrlApi}/login";
  static const String update_user = "${baseUrlApi}/update_user";
  static const String user = "${baseUrlApi}/user";
  static const String register = "${baseUrlApi}/register";
  static const String book = "${baseUrlApi}/buku";
  static const String recommended = "${baseUrlApi}/rekomendasi-buku";
  static const String rating = "${baseUrlApi}/rating-buku";
  static const String pinjam = "${baseUrlApi}/pinjam";
  static const String riwayat = "${baseUrlApi}/riwayat";
  static const String koleksi = "${baseUrlApi}/koleksi";
}
