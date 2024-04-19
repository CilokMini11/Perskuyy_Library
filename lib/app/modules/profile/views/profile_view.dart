import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/routes/app_pages.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.find<ProfileController>();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Profile',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFF0E1C34),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
        backgroundColor: Color(0xFF0E1C34),
        body: ListView(
          children: [
            Stack(
              children: [
                Container(
                  child: Image.asset("assets/background_profile.png"),
                ),
                Center(
                  heightFactor: 2,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(
                            "assets/profile.png"), // Ganti dengan path gambar profil Anda
                      ),
                      SizedBox(height: 5),
                      Text(
                        controller.username.value,
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "PEMINJAM",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                // Positioned(
                //   // right: 80,
                //   // left: 175,
                //   // top: 100,
                //   // bottom: 100,
                //   child: Text(
                //     controller.username.value,
                //     style: TextStyle(color: Colors.white),
                //   ),
                // ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Icon(Iconsax.receipt, color: Colors.white),
              title: Text(
                "List Peminjaman",
                style: GoogleFonts.lato(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Get.toNamed(Routes.LIST_PEMINJAMAN);
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              // Sesuaikan dengan ukuran padding yang diinginkan
              child: Divider(
                thickness: 1.0, // Ubah ketebalan garis
                color: Colors.grey, // Ubah warna garis
              ),
            ),
            ListTile(
              leading: Icon(Iconsax.receipt_search, color: Colors.white),
              title: Text(
                "Riwayat Peminjaman",
                style: GoogleFonts.lato(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Get.toNamed(Routes.RIWAYAT_PEMINJAMAN);
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              // Sesuaikan dengan ukuran padding yang diinginkan
              child: Divider(
                thickness: 1.0, // Ubah ketebalan garis
                color: Colors.grey, // Ubah warna garis
              ),
            ),
            ListTile(
              leading: Icon(Iconsax.save_2, color: Colors.white),
              title: Text(
                "Koleksi",
                style: GoogleFonts.lato(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Get.toNamed(Routes.KOLEKSI);
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              // Sesuaikan dengan ukuran padding yang diinginkan
              child: Divider(
                thickness: 1.0, // Ubah ketebalan garis
                color: Colors.grey, // Ubah warna garis
              ),
            ),
            ListTile(
              leading: Icon(Iconsax.logout, color: Colors.white),
              title: Text(
                "Logout",
                style: GoogleFonts.lato(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                _showLogoutConfirmationDialog(context);
              },
            ),
          ],
        )
    );
  }
}

void _showLogoutConfirmationDialog(BuildContext context) {
  final ProfileController controller = Get.find<ProfileController>();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Logout',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.blueGrey,
        content: Text(
          'Apakah Anda yakin ingin logout?',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Tutup dialog
            },
            child: Text(
              'Batal',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              // Lakukan logout jika pengguna mengkonfirmasi
              controller.logout();
              Navigator.of(context).pop(); // Tutup dialog
            },
            child: Text(
              'Logout',
              style: GoogleFonts.poppins(
                color: Colors.red,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      );
    },
  );
}
