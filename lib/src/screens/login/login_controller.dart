
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_program/common_utils/app_colors.dart';
import 'package:flutter_program/common_utils/utils.dart';
import 'package:flutter_program/main.dart';
import 'package:flutter_program/src/models/sign_up_model.dart';
import 'package:flutter_program/src/screens/home/home_screen.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SignInController extends GetxController {

  RxString profession = ''.obs;

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController eMail = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confPwd = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
  }

  void saveLocalDB() {

    // SignUpModel signUpModel = SignUpModel();
    // signUpModel =

    log('name = ${firstName.text.trim()}${lastName.text.trim()} ,,, ${password.text.trim()} ,,, ${eMail.text.trim()} ,,, ${phoneNumber.text.trim()}');

    localStorage.setSignUpModel(SignUpModel.fromJson({
      "data": {
        "firstName": firstName.text.trim(),
        "lastName": lastName.text.trim(),
        "password": password.text.trim(),
        "email": eMail.text.trim(),
        "phoneNumber": phoneNumber.text.trim(),
        "profession": 'ABC',
      }
    }));


  }

  void verifySignIn(BuildContext context) {
    var email = eMail.text.trim();
    var password = this.password.text.trim();

    var localEmail = localStorage.signUpModel.toJson().isEmpty;

    log('localEMail ==> $localEmail');

    if(localEmail) {
      Utils.message("There is no data in Database! Please register first.",context,error: true);
      return;
    }

    if((localStorage.signUpModel.data?.email?.isEmpty ?? false) && (localStorage.signUpModel.data?.email?.isEmpty ?? false)) {
      Utils.message("There is no data in Database! Please register first.",context,error: true);
      return;
    }

    if(email == (localStorage.signUpModel.data?.email ?? "") && password == (localStorage.signUpModel.data?.password ?? "")) {

      Utils.message("Successfully Login",context);
      Get.offAllNamed(HomeScreen.route);

    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Invalid Credentials',
          style: TextStyle(
            fontSize: 16.sp,
          ),
        ),
        backgroundColor: colorError,
      ));

    }

  }

}
