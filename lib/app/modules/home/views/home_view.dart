import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = Get.height;
    var width = Get.width;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Obx(() => Opacity(
                opacity: controller.isLoading.value == true ? 0.5 : 1.0,
                child: IgnorePointer(
                  ignoring: controller.isLoading.value == true ? true : false,
                  child: Container(
                    height: height,
                    width: width,
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              SizedBox(
                                height: height / 2.5,
                                width: width,
                                child: Image.asset(
                                  'assets/images/event_img.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Positioned(
                                  child: Container(
                                width: width,
                                decoration: const BoxDecoration(
                                    color: Color.fromRGBO(240, 241, 242, 0.95),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15))),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: height / 50,
                                      right: height / 50,
                                      bottom: height / 100,
                                      top: height / 100),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Login',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 20,
                                            color:
                                                Color.fromRGBO(55, 71, 79, 1),
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: height / 100,
                                      ),
                                      const Text(
                                        'Do you have account, please login.',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 15,
                                            color:
                                                Color.fromRGBO(55, 71, 79, 1),
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ),
                              ))
                            ],
                          ),
                          Form(
                              key: _formKey,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: height / 50, right: height / 50),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: height / 30,
                                    ),
                                    TextFormField(
                                      controller: controller.phoneController,
                                      keyboardType: TextInputType.emailAddress,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.deny(
                                            RegExp(r"\s\b|\b\s")),
                                        FilteringTextInputFormatter.deny(
                                            RegExp('[ ]')),
                                      ],
                                      validator: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'Please Enter Mobile Number';
                                        } else if (!value.isPhoneNumber) {
                                          return "Mobile number is not valid";
                                        } else {
                                          return null;
                                        }
                                      },
                                      decoration: InputDecoration(
                                          prefixIcon: const Icon(
                                            Icons.call_outlined,
                                            color: Colors.black,
                                          ),
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: height / 50),
                                          prefix: const Padding(
                                            padding: EdgeInsets.only(left: 10),
                                          ),
                                          hintText: 'Phone',
                                          hintStyle: const TextStyle(
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w500,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 16,
                                              color: Colors.black),
                                          fillColor: const Color.fromRGBO(
                                              229, 229, 229, 1),
                                          filled: true,
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide:
                                                const BorderSide(width: 1),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          )),
                                    ),
                                    SizedBox(
                                      height: height / 50,
                                    ),
                                    Obx(() => TextFormField(
                                          controller:
                                              controller.passwordController,
                                          keyboardType: TextInputType.text,
                                          obscureText:
                                              controller.hidePassword.value,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.deny(
                                                RegExp(r"\s\b|\b\s")),
                                            FilteringTextInputFormatter.deny(
                                                RegExp('[ ]')),
                                          ],
                                          validator: (value) {
                                            if (value!.length < 8) {
                                              return "Password at least 8 character or number";
                                            } else {
                                              return null;
                                            }
                                          },
                                          decoration: InputDecoration(
                                              prefixIcon: const Icon(
                                                Icons.lock_outlined,
                                                color: Colors.black,
                                              ),
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: height / 50),
                                              suffixIcon: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10),
                                                child: IconButton(
                                                    icon: Icon(
                                                      controller.hidePassword
                                                              .value
                                                          ? Icons.visibility_off
                                                          : Icons.visibility,
                                                      color: Colors.black,
                                                    ),
                                                    onPressed: () {
                                                      controller.passwordHide();
                                                    }),
                                              ),
                                              prefix: const Padding(
                                                padding:
                                                    EdgeInsets.only(left: 10),
                                              ),
                                              hintText: 'Password',
                                              hintStyle: const TextStyle(
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 16,
                                                  color: Colors.black),
                                              fillColor: const Color.fromRGBO(
                                                  229, 229, 229, 1),
                                              filled: true,
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.circular(6)),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide:
                                                    const BorderSide(width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              )),
                                        )),
                                  ],
                                ),
                              )),
                          SizedBox(
                            height: height / 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: TextButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  var mobileNumber =
                                      controller.phoneController.text;
                                  var password =
                                      controller.passwordController.text;

                                  controller.loginUser(mobileNumber, password);
                                }
                              },
                              style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  minimumSize: Size(width, 60),
                                  backgroundColor:
                                      const Color.fromRGBO(94, 196, 1, 1),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                  textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Roboto',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500)),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                      width: width,
                                      alignment: Alignment.centerRight,
                                      child: const Icon(
                                          Icons.arrow_forward_outlined)),
                                  const Text("Login"),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height / 20,
                          ),
                          Center(
                            child: RichText(
                              text: TextSpan(
                                  text: "Don't have an account? ",
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                  children: [
                                    TextSpan(text: ' ', children: [
                                      TextSpan(
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Get.toNamed('/registration');
                                            },
                                          text: "Registration",
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w600,
                                              color: Colors.red))
                                    ])
                                  ]),
                            ),
                          ),
                          SizedBox(
                            height: height / 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
          Positioned(
              child: Obx(() => controller.isLoading.value == true
                  ? const Opacity(
                      opacity: 1,
                      child: CircularProgressIndicator(),
                    )
                  : Container()))
        ],
      ),
    );
  }
}
