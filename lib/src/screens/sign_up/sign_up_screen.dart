
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_program/common_utils/field_validator.dart';
import 'package:flutter_program/src/_common_widgets/app_elevated_btn.dart';
import 'package:flutter_program/src/_common_widgets/app_text_form_field.dart';
import 'package:flutter_program/src/screens/login/login_screen.dart';
import 'package:flutter_program/src/screens/sign_up/sign_up_controller.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  static const String route = "/signUp";
  final SignUpController _signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign Up',
          style: TextStyle(
            fontSize: 24.sp,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(() {

        _signUpController.profession.value;

        return SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 8.w, top: 4.h, right: 8.w, ),
            child: Column(
              children: [

                Form(
                  key: _signUpController.formKey,
                  child: Column(
                    children: [
                      MyTextField(
                          controller: _signUpController.firstName,
                          header: "First Name",
                          // contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                          validator: (val) {
                            // if(val?.trim().isEmpty ?? false) {
                            //   return "Enter First Name";
                            // }
                            // return null;
                            return FieldValidator.firstName(val);
                          }
                      ),
                      const SizedBox(height: 12,),
                      MyTextField(
                          controller: _signUpController.lastName,
                          header: "Last Name",
                          // contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                          validator: (val) {
                            return FieldValidator.lastName(val);
                          }
                      ),
                      const SizedBox(height: 12,),
                      MyTextField(
                          controller: _signUpController.eMail,
                          header: "Email",
                          // contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) {
                            return FieldValidator.email(val);
                          }
                      ),
                      const SizedBox(height: 12,),
                      MyTextField(
                        controller: _signUpController.phoneNumber,
                        header: "Phone Number",
                        // contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                        keyboardType: TextInputType.number,
                        validator: (val) {
                          return FieldValidator.phone(val);
                        },
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter. digitsOnly,
                        ],
                      ),
                      const SizedBox(height: 12,),
                      MyTextField(
                        controller: _signUpController.password,
                        header: "Password",
                        // contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                        validator: (val) {
                          return FieldValidator.password(val);
                        },
                      ),
                      const SizedBox(height: 12,),
                      MyTextField(
                        controller: _signUpController.confPwd,
                        header: "Confirm Password",
                        // contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                        validator: (val) {
                          return FieldValidator.confirmPassword(val, _signUpController.password.text);
                        },
                      ),
                      const SizedBox(height: 12,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        children: [

                          const Text('Select Profession'),

                          SizedBox(
                            width: Get.width * .4,
                            child: DropdownButtonFormField2(
                              // isExpanded: true,

                              // selectedItemBuilder: ,

                              hint: Text(
                                'Select Item',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),

                              validator: (val) {
                                if(val?.isEmpty ?? false) {
                                  return "Empty";
                                }
                                return null;
                              },

                              items: ["Painter","Designer","Teacher","Plumber"].map((String item) => DropdownMenuItem(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              )).toList(),
                              value: _signUpController.profession.value.isEmpty ? null : _signUpController.profession.value,
                              onChanged: (String? value) {
                                _signUpController.profession.value = value ?? "";
                              },
                              buttonStyleData: const ButtonStyleData(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                height: 40,
                                width: 140,
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                height: 40,
                              ),
                            ),
                          ),
                        ],
                      ),
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
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 18.sp,
                    ),
                  ),
                  onPress: () {
                    if(_signUpController.formKey.currentState?.validate() ?? false) {
                      _signUpController.saveLocalDB(context);
                    }
                  },
                ),

                SizedBox(height: Get.height * .02),

                Row(
                  children: [
                    const Text('Already have an account? '),
                    TextButton(
                      onPressed: () {
                        Get.offNamed(SignInScreen.route);
                      },
                      child: const Text('Sign IN'),
                    ),
                  ],
                ),

              ],
            ),
          ),
        );
      }),

    );
  }
}

