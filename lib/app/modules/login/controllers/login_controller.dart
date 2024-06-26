import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/model/response_login.dart';

import '../../../data/contant/endpoint.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final loading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    // cek status login jika sudah login akan di redirect ke menu home
    String status = StorageProvider.read(StorageKey.status);
    log('status : $status');
    if (status == 'logged') {
      Get.offAllNamed(Routes.HOME);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  login() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      formKey.currentState?.save();
      if (formKey.currentState!.validate()) {
        final response = await ApiProvider.instance().post(Endpoint.login,
            data: {
              'username': usernameController.text.toString(),
              'password': passwordController.text.toString()
            });
        if (response.statusCode == 200) {
          final ResponseLogin responseLogin = ResponseLogin.fromJson(response.data);
          await StorageProvider.write(StorageKey.status, 'logged');
          await StorageProvider.write(StorageKey.idUser, responseLogin.user!.id.toString());
          await StorageProvider.write(StorageKey.username, responseLogin.user!.username.toString());
          Get.offAllNamed(Routes.HOME);
        } else {
          Get.snackbar('Sorry', 'Login Gagal', backgroundColor: Colors.orange);
        }
      }
    } on dio.DioError catch (e) {
      loading(false);
      if (e.response != null) {
        if (e.response!.data != null) {
          Get.snackbar('Sorry', '${e.response!.data['message']}',
              backgroundColor: Colors.orange);
        }
      } else {
        Get.snackbar('Sorry', e.message ?? '', backgroundColor: Colors.red);
      }
    } catch (e) {
      loading(false);
      Get.snackbar('Error', e.toString(), backgroundColor: Colors.red);
    } finally {
      loading(false);
    }
  }
}