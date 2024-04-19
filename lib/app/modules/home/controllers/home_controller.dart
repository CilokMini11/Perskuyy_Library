import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/contant/endpoint.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/model/response_book.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/provider/api_provider.dart';

class HomeController extends GetxController  with StateMixin<List<DataBook>> {
  var rekomendasiBookList = <DataBook>[].obs;
  var ratingTertinggiBookList = <DataBook>[].obs;

  final loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  getData() async {
    loading(true);
    try {

      final responseRekomendasi = await ApiProvider.instance().get(Endpoint.recommended);
      final responseRatingTertinggi = await ApiProvider.instance().get(Endpoint.rating);

      if (responseRekomendasi.statusCode == 200 && responseRatingTertinggi.statusCode == 200) {

        final List<DataBook> booksRekomendasi = (responseRekomendasi.data[0]['data'] as List)
            .map((json) => DataBook.fromJson(json))
            .toList();

        final List<DataBook> booksRatingTertinggi = (responseRatingTertinggi.data[0]['data'] as List)
            .map((json) => DataBook.fromJson(json))
            .toList();

        rekomendasiBookList.assignAll(booksRekomendasi);
        ratingTertinggiBookList.assignAll(booksRatingTertinggi);

      } else {
        Get.snackbar("Sorry", "Gagal Memuat Buku", backgroundColor: Colors.orange);
      }
      loading(false);
    } catch (e) {
      loading(false);
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
    }
  }
}

