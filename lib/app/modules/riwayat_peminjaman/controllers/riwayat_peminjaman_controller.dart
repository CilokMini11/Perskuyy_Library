import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/contant/endpoint.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/model/response_peminjaman.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/provider/api_provider.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/provider/storage_provider.dart';

class RiwayatPeminjamanController extends GetxController {
  var dataRiwayatList = <DataPeminjaman>[].obs;

  final loading = false.obs;
  var user_id = ''.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();

  }

  @override
  void onReady() {
    super.onReady();
    user_id.value = StorageProvider.read(StorageKey.idUser).toString();
    getData();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getData() async {
    loading(true);
    try {
      final responseRiwayat = await ApiProvider.instance().get("${Endpoint.riwayat}/${user_id.value}");

      if (responseRiwayat.statusCode == 200) {
        final List<DataPeminjaman> dataRiwayat = (responseRiwayat.data[0]['data'] as List)
            .map((json) => DataPeminjaman.fromJson(json))
            .toList();

        dataRiwayatList.assignAll(dataRiwayat);
      } else {
        Get.snackbar("Sorry", "Gagal Memuat Buku", backgroundColor: Colors.orange);
      }
      loading(false);
    } catch (e) {
      loading(false);
      Get.snackbar("Error", "Terjadi kesalahan saat memuat data: ${e.toString()}", backgroundColor: Colors.red);
    }
  }


  void increment() => count.value++;
}
