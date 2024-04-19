import 'dart:io'; // Untuk bekerja dengan file
import 'package:dio/dio.dart' as dio; // Import pustaka Dio dengan nama alias
import 'package:flutter/material.dart'; // Untuk bekerja dengan UI Flutter
import 'package:get/get.dart'; // Untuk manajemen state dan navigasi di aplikasi Flutter
import 'package:get/get.dart' as getx; // Gunakan alias 'getx'
import 'package:image_picker/image_picker.dart'; // Untuk memilih gambar dari galeri
import 'package:peminjam_perpustakaan_kelas_c/app/data/provider/storage_provider.dart'; // Untuk bekerja dengan penyimpanan lokal
import '../../../data/contant/endpoint.dart'; // Untuk mendapatkan URL endpoint API
import '../../../data/provider/api_provider.dart'; // Untuk melakukan permintaan HTTP ke server

class EditProfileController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController nama_lengkapController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final loading = false.obs;
  var user_id = ''.obs;
  var imagePath = ''.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    user_id.value = StorageProvider.read(StorageKey.idUser).toString();
    if (user_id.value.isNotEmpty) {
      getUserData();
    } else {
      Get.snackbar("Error", "User ID is empty!", backgroundColor: Colors.red);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  updateUser() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      formKey.currentState?.save();
      if (formKey.currentState!.validate()) {
        // Buat objek FormData untuk mengirim data
        dio.FormData formData = dio.FormData.fromMap({
          "nama_lengkap": nama_lengkapController.text.toString(),
          "username": usernameController.text.toString(),
          "password": passwordController.text.toString(),
          "email": emailController.text.toString(),
          "alamat": alamatController.text.toString(),
        });
        if (selectedImage != null) {
          if (selectedImage != null) {
            formData.files.add(MapEntry(
              'image',
              await dio.MultipartFile.fromFile(
                selectedImage!.path,
                filename: "image.jpg",
              ),
            ));
          }
        }
        final response = await ApiProvider.instance().put(
          "${Endpoint.update_user}/${user_id.value}",
          data: formData,
        );
        if (response.statusCode == 200) {
          await getUserData();
        } else {
          Get.snackbar("Sorry", "Update failed", backgroundColor: Colors.orange);
        }
      }
    } on dio.DioError catch (e) {
      loading(false);
      if (e.response != null) {
        if (e.response?.data != null) {
          Get.snackbar("Error", "${e.response?.data['message']}", backgroundColor: Colors.orange);
        }
      } else {
        Get.snackbar("Error", e.message ?? "", backgroundColor: Colors.red);
      }
    } catch (e) {
      loading(false);
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
    } finally {
      loading(false);
    }
  }


  Future<void> getUserData() async {
    loading(true);
    try {
      final response = await ApiProvider.instance().get("${Endpoint.user}/${user_id.value}");
      if (response.statusCode == 200) {
        final responseData = response.data as List<dynamic>;
        if (responseData.isNotEmpty) {
          final userData = responseData[0]['data'][0];
          nama_lengkapController.text = userData['nama_lengkap'] ?? '';
          usernameController.text = userData['username'] ?? '';
          emailController.text = userData['email'] ?? '';
          alamatController.text = userData['alamat'] ?? '';

          // Periksa apakah properti 'image' ada dalam data user
          if (userData.containsKey('image')) {
            // Update imagePath dengan URL gambar
            imagePath.value = userData['image'];
          }
        } else {
          Get.snackbar("Error", "User data not found", backgroundColor: Colors.orange);
        }
      } else {
        Get.snackbar("Error", "Failed to fetch user data", backgroundColor: Colors.orange);
      }
    } on dio.DioError catch (e) {
      if (e.response != null) {
        Get.snackbar("Error", "Failed to fetch user data: ${e.response?.data}", backgroundColor: Colors.red);
      } else {
        Get.snackbar("Error", "Dio error: ${e.message}", backgroundColor: Colors.red);
      }
    } catch (e) {
      Get.snackbar("Error", "Unexpected error: $e", backgroundColor: Colors.red);
    }
    loading(false);
  }


  var _selectedImage = Rx<File?>(null);
  File? get selectedImage => _selectedImage.value;

  Future<void> pickImage() async {
    final XFile? returnImage = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnImage != null) {
      _selectedImage.value = File(returnImage.path);
      imagePath.value = returnImage.name; // Simpan path lengkap file gambar
      print("Path gambar: ${imagePath.value}");
      print("Path gambar: ${_selectedImage.value}");
    }
  }

  void increment() => count.value++;
}
