
import 'package:flutter/material.dart';
import 'package:flutter_program/common_utils/app_colors.dart';
import 'package:flutter_program/common_utils/field_validator.dart';
import 'package:flutter_program/src/_common_widgets/app_elevated_btn.dart';
import 'package:flutter_program/src/_common_widgets/app_text_form_field.dart';
import 'package:flutter_program/src/screens/login/login_controller.dart';
import 'package:flutter_program/src/screens/sign_up/sign_up_screen.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  static const String route = "/signIn";
  final SignInController _signInController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign In',
          style: TextStyle(
            fontSize: 24.sp,
          ),
        ),
        centerTitle: true,
        backgroundColor: colorWhite,

      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 8.w, top: 4.h, right: 8.w, ),
          child: Column(
            children: [

              Form(
                key: _signInController.formKey,
                child: Column(
                  children: [

                    MyTextField(
                      controller: _signInController.eMail,
                      header: "Email",
                      // contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                      keyboardType: TextInputType.emailAddress,
                      validator: (val) {
                        return FieldValidator.email(val);
                      },
                    ),
                    const SizedBox(height: 12,),

                    MyTextField(
                      controller: _signInController.password,
                      header: "Password",
                      // contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                      validator: (val) {
                        return FieldValidator.password(val);
                      },
                    ),

                    const SizedBox(height: 12,),
                  ],
                ),
              ),

              SizedBox(height: Get.height * .024),

              ElevatedBtn(
                height: Get.height * .06,
                width: Get.width,
                circularBtn: true,
                customBorderRadius: BorderRadius.circular(8.0),
                bgColor: Colors.blue,
                // btnText: "Save",
                btnWidget: Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: 18.sp,
                  ),
                ),
                onPress: () {
                  if(_signInController.formKey.currentState?.validate() ?? false) {
                    _signInController.verifySignIn(context);
                  }
                },
              ),

              SizedBox(height: Get.height * .02),

              Row(
                children: [
                  const Text('Already have an account? '),
                  TextButton(
                    onPressed: () {
                      Get.offNamed(SignUpScreen.route);
                    },
                    child: const Text('Sign Up'),
                  ),
                ],
              ),
              

            ],
          ),
        ),
      ),
    );
  }
}

