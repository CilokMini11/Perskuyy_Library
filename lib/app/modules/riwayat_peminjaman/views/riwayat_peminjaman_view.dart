import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/model/response_peminjaman.dart';

import '../controllers/riwayat_peminjaman_controller.dart';

class RiwayatPeminjamanView extends GetView<RiwayatPeminjamanController> {
  const RiwayatPeminjamanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RiwayatPeminjamanController riwayatPeminjamanController =
        Get.put(RiwayatPeminjamanController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Riwayat Peminjaman',
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
      ),
      body: Obx(
        () => ListView.builder(
          // scrollDirection: Axis.horizontal,
          itemCount: riwayatPeminjamanController.dataRiwayatList.length,
          itemBuilder: (context, index) {
            DataPeminjaman dataPeminjaman =
                riwayatPeminjamanController.dataRiwayatList[index];
            return Padding(
              padding:
                  const EdgeInsets.only(top: 14.0, left: 12.0, right: 12.0),
              child: Container(
                // height: 160,
                width: 500,
                // title: Text('${dataPeminjaman.buku!.judul}'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(13.0),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(141, 141, 141, 1.0),
                      blurRadius: 4,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 13),
                            child: Container(
                              width: 100,
                              // height: 140,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(7.0),
                                child: Image.network(
                                  "${dataPeminjaman.buku?.image}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 13.0, top: 12.0),
                              child: Container(
                                width: 230,
                                // height: 135,
                                // color: Colors.white,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${dataPeminjaman.buku!.judul}",
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "${dataPeminjaman.buku!.penulis}",
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Penerbit                   :   ',
                                          style: GoogleFonts.poppins(
                                            fontSize: 13,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            "${dataPeminjaman.buku!.penerbit}",
                                            style: GoogleFonts.poppins(
                                              fontSize: 13,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Tahun Terbit            :   ',
                                          style: GoogleFonts.poppins(
                                            fontSize: 13,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            "${dataPeminjaman.buku!.tahunTerbit}",
                                            style: GoogleFonts.poppins(
                                              fontSize: 13,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Kategory                  :   ',
                                          style: GoogleFonts.poppins(
                                            fontSize: 13,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            "${dataPeminjaman.buku!.namaKategory}",
                                            style: GoogleFonts.poppins(
                                              fontSize: 13,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Tanggal Pinjam      :   ',
                                          style: GoogleFonts.poppins(
                                            fontSize: 13,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            "${dataPeminjaman.tanggalPinjam}",
                                            style: GoogleFonts.poppins(
                                              fontSize: 13,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Tanggal Kembali    :   ',
                                          style: GoogleFonts.poppins(
                                            fontSize: 13,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            "${dataPeminjaman.tanggalKembali}",
                                            style: GoogleFonts.poppins(
                                              fontSize: 13,
                                              color: Colors.white,
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
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (dataPeminjaman.buku != null && dataPeminjaman.buku!.image != null) {
                                _showBottomSheet(context, dataPeminjaman.buku!.image!, "${dataPeminjaman.buku!.judul!}");
                              } else {
                                // Penanganan ketika image null
                                print("Error: Gambar buku tidak tersedia.");
                              }
                            },
                            child: Text(
                              "Beri ulasan",
                              style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                color: Colors.white,),
                            ),
                            style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(
                                  Size(50, 30)), // Ubah ukuran sesuai kebutuhan
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

void _showBottomSheet(BuildContext context, String image, String judul) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        width: 500,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
          child: Column(
            children: [
              Image.network(image, width: 110, height: 170,),
              SizedBox(
                height: 10,
              ),
              Text(judul, style: GoogleFonts.poppins(
                color: Color(0xff000000),
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),),
              SizedBox(
                height: 15,
              ),
              // RatingBar.builder(
              //   initialRating: 0,
              //   minRating: 1,
              //   direction: Axis.horizontal,
              //   allowHalfRating: true,
              //   itemCount: 5,
              //   itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              //   itemBuilder: (context, _) => Icon(
              //     Icons.star,
              //     color: Colors.amber,
              //   ),
              //   onRatingUpdate: (rating) {
              //     print(rating);
              //   },
              // ),
              SizedBox(
                height: 30,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Berikan Ulasan",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10), // Mengatur border radius menjadi 0
                        ),
                        side: BorderSide(
                          color: Colors.black, // Warna border
                          width: 0.5, // Lebar border
                        ),
                        backgroundColor: Colors.white,
                      ),
                      child: Text(
                        "Cancel",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                          color: Colors.white,),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10), // Mengatur border radius menjadi 0
                        ),
                        backgroundColor: Colors.blue,
                      ),
                      child: Text(
                        "Submit",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                          color: Colors.white,
                      ),
                    ),
                  ),
                  )
                ],
              )
            ],
          ),
        ),
      ); // Menggunakan widget yang telah dibuat sebelumnya
    },
  );
}
