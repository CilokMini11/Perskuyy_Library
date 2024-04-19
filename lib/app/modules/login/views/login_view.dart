import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _obscurePassword = true;
    // TextEditingController _usernameController = TextEditingController();
    // String? _usernameErrorText;

    return Scaffold(
      backgroundColor: Color(0xFF0E1C34),
      body: SafeArea(
        child: ListView(
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
                            'Login',
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
                        child: TextFormField(
                          controller: controller.usernameController,
                          decoration: InputDecoration(
                            hintText: 'Masukan Username',
                            border: InputBorder.none,
                            // errorText: _usernameController.text.isEmpty ? 'Masukkan Username' : null,
                          ),
                          // validator: (value) {
                          //   if (value!.isEmpty) {
                          //     return 'Masukkan Username';
                          //   }
                          //   return null;
                          // },
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
                          // obscureText: _obscurePassword,
                          obscureText: true,
                          controller: controller.passwordController,
                          decoration: const InputDecoration(
                            hintText: 'Masukan Password',
                            border: InputBorder.none,

                            // suffixIcon: IconButton(
                            //   icon: Icon(
                            //     _obscurePassword ? Icons.visibility : Icons.visibility_off,
                            //     color: Colors.grey,
                            //   ),
                            //   onPressed: () {
                            //     setState(() {
                            //       // Memflip nilai boolean untuk mengubah teks menjadi tersembunyi atau ditampilkan
                            //       _obscurePassword = !_obscurePassword;
                            //     });
                            //   },
                            // ),
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                      SizedBox(height: 25),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        // Text('Sudah Punya Akun? '),
                        InkWell(
                          child: Text(
                            'Lupa Password?',
                            style: TextStyle(
                              color: Colors.lightBlue,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.blue,
                            ),
                          ),
                          onTap: () {
                            // Navigator.of(context).pushReplacement(
                            //     MaterialPageRoute(builder: (
                            //         BuildContext context) =>login_page()));
                          },
                        ),
                      ]),
                      SizedBox(height: 40),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                controller.login();
                                // Navigator.push(context, MaterialPageRoute(builder: (context) => homepage()));
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Color(0xff182F57),
                              ),
                              child: Text(
                                'Login',
                                style: TextStyle(fontFamily: 'inter-bold'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 3),
                      Text('Atau'),
                      SizedBox(height: 3),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () => Get.toNamed(Routes.REGISTER),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Color(0xff182F57),
                              ),
                              child: Text(
                                'Sign Up',
                                style: TextStyle(fontFamily: 'inter-bold'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 130),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class p extends StatefulWidget {
  const p({super.key});

  @override
  State<p> createState() => _pState();
}

class _pState extends State<p> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
