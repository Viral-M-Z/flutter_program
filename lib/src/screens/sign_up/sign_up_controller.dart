
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_program/common_utils/app_colors.dart';
import 'package:flutter_program/main.dart';
import 'package:flutter_program/src/models/sign_up_model.dart';
import 'package:flutter_program/src/screens/home/home_screen.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SignUpController extends GetxController {

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

  void saveLocalDB(BuildContext context) {

    log('name = ${firstName.text.trim()}${lastName.text.trim()} ,,, ${password.text.trim()} ,,, ${eMail.text.trim()} ,,, ${phoneNumber.text.trim()}');

    localStorage.setSignUpModel(SignUpModel.fromJson({
      "data": {
        "firstName": firstName.text.trim(),
        "lastName": lastName.text.trim(),
        "password": password.text.trim(),
        "email": eMail.text.trim(),
        "phoneNumber": phoneNumber.text.trim(),
        "profession": profession.value,
      }
    }));

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        'SuccessFully Registered',
        style: TextStyle(
          fontSize: 16.sp,
        ),
      ),
      backgroundColor: colorSuccess,
    ));

    Get.toNamed(HomeScreen.route);

  }





}
