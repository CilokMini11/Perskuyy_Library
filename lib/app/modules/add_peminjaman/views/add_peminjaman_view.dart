import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/routes/app_pages.dart';
import '../controllers/add_peminjaman_controller.dart';

class AddPeminjamanView extends GetView<AddPeminjamanController> {
  const AddPeminjamanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Peminjaman',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        // centerTitle: true,
        backgroundColor: Color(0xFF0E1C34),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Get.toNamed(
              Routes.PEMINJAMAN,
              parameters: {
                'id': '${Get.parameters['id'].toString()}',
                'judul': '${Get.parameters['judul']}',
                'image': '${Get.parameters['image']}',
                'penulis': '${Get.parameters['penulis']}',
                'penerbit': '${Get.parameters['penerbit']}',
                'tahun_terbit': '${Get.parameters['tahun_terbit']}',
                'deskripsi_buku': '${Get.parameters['deskripsi_buku']}',
                'nama_kategory': '${Get.parameters['nama_kategory']}',
                'rating': '${Get.parameters['rating']}',
              },
            );
          },
        ),
      ),
      backgroundColor: Color(0xFF0E1C34),
      body: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              SizedBox(
                height: 15,
              ),
              Center(
                child: Text(
                  '${Get.parameters['judul']}',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: Text(
                  '${Get.parameters['penulis']}',
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: Image.network(
                  "${Get.parameters['image']}",
                  width: 160,
                  // height: 180,
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    }
                  },
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Center(
                      child: Icon(
                        Icons.error_outline,
                        color: Colors.red,
                        size: 40,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Container(
                  child: Column(
                    children: [
                      DateTimePicker(
                        icon: Icon(Iconsax.calendar_add, color: Colors.white), // Mengatur warna ikon
                        controller: controller.tanggal_pinjamController,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        dateLabelText: 'Pilih tanggal pinjam',
                        dateMask: 'yyyy-MM-dd',
                        onChanged: (val) => print(val),
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Tanggal pinjam harus diisi';
                          }
                          return null;
                        },
                        onSaved: (val) => print(val),
                        style: TextStyle(color: Colors.white), // Mengatur warna teks
                      ),
                      DateTimePicker(
                        icon: Icon(Iconsax.calendar_add, color: Colors.white),
                        controller: controller.tanggal_kembaliController,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        dateLabelText: 'Pilih tanggal kembali',
                        dateMask: 'yyyy-MM-dd',
                        onChanged: (val) => print(val),
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Tanggal Kembali harus diisi';
                          }
                          return null;
                        },
                        onSaved: (val) => print(val),
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Obx(
                            () => controller.loading.value
                                ? CircularProgressIndicator()
                                : ElevatedButton(
                                    onPressed: () {
                                      controller.addPeminjaman();
                                    },
                                    child: Text('Tambah'),
                                    style: ElevatedButton.styleFrom(
                                      textStyle: GoogleFonts.lato(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      //  Sesuaikan properti lain sesuai kebutuhan
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
