
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/contant/endpoint.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/model/response_peminjaman.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/provider/api_provider.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/provider/storage_provider.dart';

class ListPeminjamanController extends GetxController {

  var dataPeminjamanList = <DataPeminjaman>[].obs;

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
      final responsePeminjaman = await ApiProvider.instance().get("${Endpoint.pinjam}/${user_id.value}");

      if (responsePeminjaman.statusCode == 200) {
        final List<DataPeminjaman> dataPeminjaman = (responsePeminjaman.data[0]['data'] as List)
            .map((json) => DataPeminjaman.fromJson(json))
            .toList();

        dataPeminjamanList.assignAll(dataPeminjaman);
      } else {
        Get.snackbar("Sorry", "Gagal Memuat Buku", backgroundColor: Colors.orange);
      }
      loading(false);
    } catch (e) {
      loading(false);
      Get.snackbar("Error", "Terjadi kesalahan saat memuat data: ${e.toString()}", backgroundColor: Colors.red);
    }
  }


  // getData() async {
  //   change(null, status: RxStatus.loading());
  //   try {
  //     final response = await ApiProvider.instance().get("${Endpoint.pinjam}/${user_id.value}");
  //     if (response.statusCode == 200) {
  //       final ResponsePeminjaman responsePeminjaman = ResponsePeminjaman.fromJson(response.data);
  //       if(responsePeminjaman.data!.isEmpty){
  //         change(null, status: RxStatus.empty());
  //       } else {
  //         change(responsePeminjaman.data, status: RxStatus.success());
  //       }
  //     } else {
  //       change(null, status: RxStatus.error('Gagal mengambil data'));
  //     }
  //   } on DioException catch (e) {
  //     if (e.response != null) {
  //       if (e.response?.data != null) {
  //         change(null, status: RxStatus.error(" dio ${e.response?.data['message']}"));
  //       }
  //     } else {
  //       change(null, status: RxStatus.error('cek' + (e.message ?? '')));
  //     }
  //   } catch (e) {
  //     change(null, status: RxStatus.error('catch'+e.toString()));
  //   }
  // }

  void increment() => count.value++;
}
