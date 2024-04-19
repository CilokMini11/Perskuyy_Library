import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:iconsax/iconsax.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/model/response_book.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    // final HomeController controller = Get.find();
    // var recommended = controller.getRecommended();
    // controller.getRating();

    return Obx(() => controller.loading.value
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
        backgroundColor: Color(0xFF0E1C34),
        body: ListView(
          children: [
            Carousel(),
            SizedBox(height: 5,),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF0E1C34),
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                  color: Colors.white, // Warna putih
                  width: 1.0, // Lebar garis
                ),
              ),
              padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
              child: Text(
                'Recommended',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  height: 0,
                ),
              ),
            ),
             Container(
                      height: 260,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: homeController.rekomendasiBookList.length,
                        itemBuilder: (context, index) {
                          DataBook dataBook = homeController.rekomendasiBookList[index];
                          return BookCover(
                            bookTitle: '${dataBook.judul}',
                            bookAranged: '${dataBook.penulis}',
                            bookImage: '${dataBook.image}',
                            onPressed: () {
                              Get.toNamed(Routes.PEMINJAMAN, parameters: {
                                'id': (dataBook.id ?? 0).toString(),
                                'judul': '${dataBook.judul}',
                                'image': '${dataBook.image}',
                                'penulis': '${dataBook.penulis}',
                                'penerbit': '${dataBook.penerbit}',
                                'tahun_terbit': '${dataBook.tahunTerbit}',
                                'deskripsi_buku': '${dataBook.deskripsi_buku}',
                                'nama_kategory': '${dataBook.namaKategory}',
                                'rating': '${dataBook.rating}',
                              });
                            },
                          );
                        },
                        // separatorBuilder: (context, index) => Divider(),
                      ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF0E1C34),
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                  color: Colors.white, // Warna putih
                  width: 1.0, // Lebar garis
                ),
              ),
              padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
              child: Text(
                'Top Rating',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  height: 0,
                ),
              ),
            ),
            Container(
                      height: 260,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: homeController.ratingTertinggiBookList.length,
                        itemBuilder: (context, index) {
                          DataBook dataBook = homeController.ratingTertinggiBookList[index];
                          return BookCover(
                            bookTitle: '${dataBook.judul}',
                            bookAranged: '${dataBook.penulis}',
                            bookImage: '${dataBook.image}',
                            onPressed: () {
                              Get.toNamed(Routes.PEMINJAMAN, parameters: {
                                'id': (dataBook.id ?? 0).toString(),
                                'judul': '${dataBook.judul}',
                                'image': '${dataBook.image}',
                                'penulis': '${dataBook.penulis}',
                                'penerbit': '${dataBook.penerbit}',
                                'tahun_terbit': '${dataBook.tahunTerbit}',
                                'deskripsi_buku': '${dataBook.deskripsi_buku}',
                                'nama_kategory': '${dataBook.namaKategory}',
                                'rating': '${dataBook.rating}',
                              });
                            },
                          );
                        },
                        // separatorBuilder: (context, index) => Divider(),
                      ),
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () => Get.toNamed(Routes.BOOK),
                  child: Text('List Buku'),
                ),
                ElevatedButton(
                  onPressed: () => Get.toNamed(Routes.PEMINJAMAN),
                  child: Text('List Peminjaman'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  @override
  Widget build(BuildContext context) {
    final List<Image> imgList = [
      Image.asset('assets/images/carousel2.jpg', fit: BoxFit.cover),
      Image.asset('assets/images/carousel3.jpg', fit: BoxFit.cover),
      Image.asset('assets/images/carousel4.jpg', fit: BoxFit.cover),
      Image.asset('assets/images/carousel5.jpg', fit: BoxFit.cover),
    ];
    return Stack(
      children: [
        FlutterCarousel(
          options: CarouselOptions(
            height: 240.0,
            // aspectRatio: 16 / 9,
            viewportFraction: 1.0,
            enlargeCenterPage: false,
            autoPlay: true,
            enableInfiniteScroll: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            slideIndicator: CircularWaveSlideIndicator(),
          ),
          items: imgList.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  // margin: EdgeInsets.symmetric(horizontal: .0),
                  // decoration: BoxDecoration(
                  //     color: Colors.amber
                  // ),
                  child: item,
                );
              },
            );
          }).toList(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 14.0, left: 15.0, right: 15.0),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.PROFILE);
                },
                child: Icon(
                  Iconsax.profile_circle5,
                  color: Colors.white,
                  size: 33,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              SearchBar(),
              SizedBox(
                width: 8,
              ),
              Icon(
                Iconsax.notification,
                color: Colors.white,
                size: 25,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BookCover extends StatelessWidget {
  final String bookTitle;
  final String bookImage;
  final String bookAranged;
  final VoidCallback onPressed;

  const BookCover({
    Key? key,
    required this.bookTitle,
    required this.bookAranged,
    required this.bookImage,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: GestureDetector(
        onTap: onPressed,
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Container(
              // width: 125,
              // color: Colors.white,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(141, 141, 141, 1.0),
                      blurRadius: 2,
                      offset: Offset(2, 2),
                    )
                  ]
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      bookImage,
                      width: 130,
                      height: 180,
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
                    SizedBox(height: 6),
                    Container(
                      width: 120,
                      height: 30,
                      // color: Colors.red,
                      child: Text(
                        bookTitle,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Container(
                      width: 120,
                      height: 30,
                      // color: Colors.red,
                      child: Text(
                        bookAranged,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool _showSearchMenu = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 35,
        decoration: BoxDecoration(
          color: Color(0xDAFFFFFF),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          children: [
            SizedBox(width: 23),
            Icon(
              Icons.search,
              size: 15,
              color: Color(0x7F2D2D2D),
            ),

            SizedBox(width: 17),
            Expanded(
              child: _showSearchMenu
                  ? TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Cari judul buku',
                  hintStyle: TextStyle(
                    color: Color(0x7F444444),
                    fontSize: 11,
                    fontFamily: 'Inter',
                    height: 0,
                  ),
                ),
                onChanged: (value) {
                  // Handle search query here
                },
              )
                  : Text(
                'Cari judul buku',
                style: TextStyle(
                  color: Color(0x7F444444),
                  fontSize: 11,
                  fontFamily: 'Inter',
                  height: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

// class SearchPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         drawer: Drawer(
//           child: ListView(
//             // padding: EdgeInsets.zero,
//             children: <Widget>[
//               DrawerHeader(
//                 decoration: BoxDecoration(
//                   color: Colors.blue,
//                 ),
//                 child: Text(
//                   'Drawer Header',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 24,
//                   ),
//                 ),
//               ),
//               ListTile(
//                 title: Text('Item 1'),
//                 onTap: () {
//                   // Tambahkan kode yang ingin dijalankan saat item drawer dipilih
//                 },
//               ),
//               ListTile(
//                 title: Text('Item 2'),
//                 onTap: () {
//                   // Tambahkan kode yang ingin dijalankan saat item drawer dipilih
//                 },
//               ),
//               // Tambahkan item drawer lainnya sesuai kebutuhan
//             ],
//           ),
//         ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Container(
//               margin: EdgeInsets.all(8.0), // Ubah nilai margin sesuai kebutuhan Anda
//               child: AppBar(
//                 title: Container(
//                   width: 300,
//                   height: 40,
//                   decoration: BoxDecoration(
//                     color: Colors.black
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Cari Judul Buku", style: TextStyle(color: Colors.white, fontSize: 15),),
//                     ],
//                   ),
//                 ),
//                 backgroundColor: Colors.white,
//                 shadowColor: Colors.black54,
//               ),
//             ),
//           ],
//         ),
//       )
//     );
//   }
}