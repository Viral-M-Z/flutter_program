

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_program/common_utils/app_colors.dart';
import 'package:flutter_program/common_utils/utils.dart';
import 'package:flutter_program/main.dart';
import 'package:flutter_program/src/_common_widgets/app_elevated_btn.dart';
import 'package:flutter_program/src/_common_widgets/app_image_with_shimmer.dart';
import 'package:flutter_program/src/screens/company_info/company_info_controller.dart';
import 'package:flutter_program/src/screens/home/home_controller.dart';
import 'package:flutter_program/src/screens/login/login_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

class ContactInfoScreen extends StatelessWidget {
  ContactInfoScreen({super.key});
  static const String route = "/contactInfo";
  final ContactInfoController _contactInfoController = Get.put(ContactInfoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Company Info Screen',
          style: TextStyle(
            fontSize: 20.sp,
          ),
        ),
        centerTitle: true,
        backgroundColor: colorWhite,
      ),

      body: Obx(() {
        _contactInfoController.a.value;
        return Container(
          margin: EdgeInsets.only(left: 2.w, top: 2.h, right: 4.w, bottom: 2.h,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              getData('Company', 'Geeksynergy Technologies Pvt Ltd'),
              SizedBox(height: 2.h),

              getData('Address', 'Sanjayanagar, Bengaluru-56'),
              SizedBox(height: 2.h),

              getData('Phone', '9384747409'),
              SizedBox(height: 2.h),

              getData('Email', 'GeeksynergyTechnologiesPvtLtd@gmail.com'),
              SizedBox(height: 2.h),

            ],
          ),
        );
      }),
    );
  }

  Widget getData(String title, String body) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "$title : ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: colorBlack,
            ),
          ),

          TextSpan(
            text: body,
            style: TextStyle(
              color: colorBlack,
            ),
          ),
        ]
      ),
    );
  }

}


