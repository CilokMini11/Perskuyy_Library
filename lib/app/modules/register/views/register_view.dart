import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0E1C34),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                height: 300,
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 200,
                  height: 20, // Sesuaikan dengan ukuran logo yang Anda inginkan
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF0E1C34),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)),
              border: Border.all(
                color: Colors.white, // Warna putih
                width: 2.0, // Lebar garis
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontFamily: 'Inter-bold',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(children: [
                      Text(
                        'Nama Lengkap',
                        style: TextStyle(fontFamily: 'inter-bold',color: Colors.white),
                      ),
                    ]),
                    SizedBox(height: 5),
                    Container(
                      height: 45,
                      padding: EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(141, 141, 141, 1.0),
                              blurRadius: 5,
                              offset: Offset(3, 3),
                            )
                          ]),
                      child: TextField(
                        controller: controller.namalengkapController,
                        decoration: InputDecoration(
                          hintText: 'Masukan Nama Lengkap',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                        children: [
                      Text(
                        'Username',
                        style: TextStyle(fontFamily: 'inter-bold',color: Colors.white),
                      ),
                    ]),
                    SizedBox(height: 5),
                    Container(
                      height: 45,
                      padding: EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(141, 141, 141, 1.0),
                              blurRadius: 5,
                              offset: Offset(3, 3),
                            )
                          ]),
                      child: TextField(
                        controller: controller.usernameController,
                        decoration: InputDecoration(
                          hintText: 'Masukan Username',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(children: [
                      Text(
                        'Password',
                        style: TextStyle(fontFamily: 'inter-bold',color: Colors.white),
                      ),
                    ]),
                    SizedBox(height: 5),
                    Container(
                      height: 45,
                      padding: EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(141, 141, 141, 1.0),
                              blurRadius: 5,
                              offset: Offset(3, 3),
                            )
                          ]),
                      child: TextField(
                        obscureText: true,
                        controller: controller.passwordController,
                        decoration: const InputDecoration(
                          hintText: 'Masukan Password',
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(children: [
                      Text(
                        'Email',
                        style: TextStyle(fontFamily: 'inter-bold',color: Colors.white),
                      ),
                    ]),
                    SizedBox(height: 5),
                    Container(
                      height: 45,
                      padding: EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(141, 141, 141, 1.0),
                              blurRadius: 5,
                              offset: Offset(3, 3),
                            )
                          ]),
                      child: TextField(
                        // obscureText: true,
                        controller: controller.emailController,
                        decoration: const InputDecoration(
                          hintText: 'Masukan Email',
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(children: [
                      Text(
                        'Alamat',
                        style: TextStyle(fontFamily: 'inter-bold',color: Colors.white),
                      ),
                    ]),
                    SizedBox(height: 5),
                    Container(
                      height: 45,
                      padding: EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(141, 141, 141, 1.0),
                              blurRadius: 5,
                              offset: Offset(3, 3),
                            )
                          ]),
                      child: TextField(
                        // obscureText: true,
                        controller: controller.alamatController,
                        decoration: const InputDecoration(
                          hintText: 'Masukan Alamat',
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Text(
                        'Sudah punya akun? ',
                        style: TextStyle(fontFamily: 'inter-bold',color: Colors.white),
                      ),
                      InkWell(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.lightBlue,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.blue,
                          ),
                        ),
                        onTap: () {
                          Get.toNamed(Routes.LOGIN);
                        },
                      ),
                    ]),
                    SizedBox(height: 20),
                    Obx(
                      () => controller.loading.value
                          ? CircularProgressIndicator()
                          : Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      controller.regist();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white, backgroundColor: Color(0xffC81E1E)),
                                    child: Text('Sign Up'),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      // child: Form(
      //     key: controller.formKey,
      //     child: Column(
      //       children: [
      //         TextFormField(
      //           controller: controller.nama_lengkapController,
      //           decoration: InputDecoration(
      //             hintText: "Masukan Nama",
      //           ),
      //           validator: (value) {
      //             if (value!.length < 2) {
      //               return "Nama tidak boleh kosong";
      //             }
      //             return null;
      //           },
      //         ),
      //         TextFormField(
      //           // obscureText: true,
      //           controller: controller.usernameController,
      //           decoration: InputDecoration(
      //             hintText: "Masukan Username",
      //           ),
      //           validator: (value) {
      //             if (value!.length < 2) {
      //               return "Username tidak boleh kosong";
      //             }
      //             return null;
      //           },
      //         ),
      //         TextFormField(
      //           // obscureText: true,
      //           controller: controller.passwordController,
      //           decoration: InputDecoration(
      //             hintText: "Masukan password",
      //           ),
      //           validator: (value) {
      //             if (value!.length < 2) {
      //               return "password tidak boleh kosong";
      //             }
      //             return null;
      //           },
      //         ),
      //         TextFormField(
      //           // obscureText: true,
      //           controller: controller.emailController,
      //           decoration: InputDecoration(
      //             hintText: "Masukan email",
      //           ),
      //           validator: (value) {
      //             if (value!.length < 2) {
      //               return "email tidak boleh kosong";
      //             }
      //             return null;
      //           },
      //         ),
      //         TextFormField(
      //           // obscureText: true,
      //           controller: controller.alamatController,
      //           decoration: InputDecoration(
      //             hintText: "Masukan alamat",
      //           ),
      //           validator: (value) {
      //             if (value!.length < 2) {
      //               return "alamat tidak boleh kosong";
      //             }
      //             return null;
      //           },
      //         ),
      //         Obx(() => controller.loading.value
      //             ? CircularProgressIndicator()
      //             : ElevatedButton(
      //                 onPressed: () {
      //                   controller.regist();
      //                 },
      //                 child: Text('Register'))),
      //       ],
      //     ))
    );
  }
}
