
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/provider/storage_provider.dart';

import '../../../data/contant/endpoint.dart';
import '../../../data/provider/api_provider.dart';
import '../../../routes/app_pages.dart';

class AddPeminjamanController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // final TextEditingController user_idController = TextEditingController();
  // final TextEditingController book_idController = TextEditingController();
  final TextEditingController tanggal_pinjamController = TextEditingController();
  final TextEditingController tanggal_kembaliController = TextEditingController();
  final loading = false.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  addPeminjaman() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      formKey.currentState?.save();
      if (formKey.currentState!.validate()) {
        final response = await ApiProvider.instance().post(Endpoint.pinjam,
            data: {
              "user_id": StorageProvider.read(StorageKey.idUser),
              "buku_id":  int.parse(Get.parameters['id'].toString()),
              "tanggal_pinjam": tanggal_pinjamController.text.toString(),
              "tanggal_kembali": tanggal_kembaliController.text.toString(),
            });
        if (response.statusCode == 200) {
          Get.toNamed(
              Routes.PEMINJAMAN,
              parameters: {
                'id':
                    '${Get.parameters['id'].toString()}',
                'judul': '${Get.parameters['judul']}',
                'image': '${Get.parameters['image']}',
                'penulis':
                    '${Get.parameters['penulis']}',
                'penerbit':
                    '${Get.parameters['penerbit']}',
                'tahun_terbit':
                    '${Get.parameters['tahun_terbit']}',
                'deskripsi_buku':
                    '${Get.parameters['deskripsi_buku']}',
                'nama_kategory':
                    '${Get.parameters['nama_kategory']}',
                'rating':
                    '${Get.parameters['rating']}',
              },
            );
          // Get.offAllNamed(Routes.HOME);
        } else {
          Get.snackbar("Sorry", "Tambah Pinjam Gagal", backgroundColor: Colors.orange);
        }
      }
      loading(false);
    } on DioException catch (e) {
      loading(false);
      if (e.response != null) {
        if (e.response?.data != null) {
          Get.snackbar("Sorry", "${e.response?.data['message']}",
              backgroundColor: Colors.orange);
        }
      } else {
        Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
      }
    } catch (e) {
      loading(false);
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
    }
  }

  void increment() => count.value++;
}
