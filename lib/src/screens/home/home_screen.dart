
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_program/common_utils/app_colors.dart';
import 'package:flutter_program/common_utils/utils.dart';
import 'package:flutter_program/main.dart';
import 'package:flutter_program/src/_common_widgets/app_elevated_btn.dart';
import 'package:flutter_program/src/_common_widgets/app_image_with_shimmer.dart';
import 'package:flutter_program/src/screens/company_info/company_info_screen.dart';
import 'package:flutter_program/src/screens/home/home_controller.dart';
import 'package:flutter_program/src/screens/login/login_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  static const String route = "/home";
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _homeController.scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Home Screen',
          style: TextStyle(
            fontSize: 20.sp,
          ),
        ),
        centerTitle: true,
        backgroundColor: colorWhite,
        // automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            // Scaffold.of(context).openDrawer();
            _homeController.scaffoldKey.currentState?.openDrawer();
          },
          icon: const Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Utils.message('Successfully Logout',context);
              Get.offAllNamed(SignInScreen.route);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  const Center(
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 60.0,
                    ),
                  ),
                  Center(
                    child: Text(
                      'Welcome ${localStorage.signUpModel.data?.firstName ?? ""} '
                        '${localStorage.signUpModel.data?.lastName ?? ""},',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16.sp),
                    ),
                  ),



                ],
              ),
            ),

            ListTile(
              title: const Text('Company Info'),
              onTap: () {
                Get.toNamed(ContactInfoScreen.route);
              },
            ),
          ],
        ),
      ),

      body: PopScope(
        canPop: false,
        onPopInvoked:(val) {
          log('onPopInvoked $val');
        },
        child: Obx(() {
          return SingleChildScrollView(
            child: RefreshIndicator(
              onRefresh: () async {
                _homeController.getMoviesList();
              },
              child: Container(
                margin: EdgeInsets.only(left: 2.w, top: 2.h, right: 4.w, bottom: 2.h,),
                child: Column(
                  children: [

                    // Text('Home Page ${localStorage.signUpModel.data?.firstName ?? ""} ${localStorage.signUpModel.data?.email ?? ""}'),

                    if(_homeController.moviesListModel.value.code == null) ...[
                      const CircularProgressIndicator(),
                    ],

                    // Container(
                      // color: colorPrimary1,
                      // height: Get.height,
                      // margin: EdgeInsets.only(left: 0.4.w, top: 4.h, right: 4.w, ),
                      // child:
                      ListView.builder(
                        itemCount: _homeController.moviesListModel.value.result?.length ?? 0,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        padding: const EdgeInsets.all(0),
                        itemBuilder: (BuildContext context, int index) {

                          var date = DateFormat("yyyy-MM-dd").parse(DateTime.fromMillisecondsSinceEpoch((_homeController.moviesListModel.value.result?[index].releasedDate ?? 0) * 1000).toString() ?? "", true);
                          var outputDateFormat = DateFormat('dd MMM');
                          // var outputDate = outputDateFormat.format(date);
                          var formatDate = outputDateFormat.format(date);
                          // log('date => $date');

                          return Container(
                            // color: Colors.green,
                            height: 30.h,
                            margin: EdgeInsets.only(bottom: 0.8.h,right: 0, left: 0, top: 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [


                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        // Text('$formatDate '),
                                        Icon(Icons.arrow_drop_up,size: 45.sp),
                                        Text(
                                          _homeController.moviesListModel.value.result?[index].totalVoted.toString() ?? '',
                                          style: TextStyle(
                                            fontSize: 20.sp,
                                          )
                                        ),
                                        Icon(Icons.arrow_drop_down,size: 45.sp)
                                      ],
                                    ),

                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12.sp),
                                      ),
                                      child: ReusableImageWithShimmer(
                                        url: _homeController.moviesListModel.value.result?[index].poster ?? '',
                                        height: 18.h,
                                        width: 24.w,
                                        isCircle: false,
                                        borderRadius: 12.sp,
                                        boxFit: BoxFit.cover,
                                      ),
                                    ),
                                    // Image.network(
                                    //   _homeController.moviesListModel.value.result?[index].poster ?? '',
                                    // ),
                                    SizedBox(width: 2.w),

                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [

                                        SizedBox(height: 1.h),
                                        Container(
                                          width: 40.w,
                                          child: Text(
                                            '${_homeController.moviesListModel.value.result?[index].title} ',
                                            softWrap: true,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontFamily: 'Times',
                                            ),
                                          ),
                                        ),

                                        SizedBox(height: 0.3.h),
                                        Container(
                                          width: 40.w,
                                          child: Text(
                                            'Genre: ${_homeController.moviesListModel.value.result?[index].genre}',
                                            softWrap: true,
                                          ),
                                        ),

                                        SizedBox(height: 0.3.h),
                                        Container(
                                          width: 40.w,
                                          child: Text(
                                            'Director: ${_homeController.moviesListModel.value.result?[index].director?[0]}',
                                            softWrap: true,
                                          ),
                                        ),

                                        SizedBox(height: 0.3.h),
                                        Container(
                                          width: 40.w,
                                          child: Text(
                                            'Starring: ${_homeController.moviesListModel.value.result?[index].stars?[0]}',
                                            softWrap: true,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),

                                        Row(
                                          children: [
                                            const Text('Mins'),
                                            SizedBox(width: 0.01.w),
                                            const VerticalDivider(
                                              width: 10,
                                              thickness: 2,
                                              // endIndent: 2,
                                              color: Colors.black,
                                            ),
                                            Text('${_homeController.moviesListModel.value.result?[index].language}'),
                                            const VerticalDivider(
                                              width: 10,
                                              thickness: 2,
                                              // endIndent: 2,
                                              color: Colors.black,
                                            ),
                                            Text('$formatDate '),
                                          ],
                                        ),

                                        Row(
                                          children: [
                                            Text(
                                              '${_homeController.moviesListModel.value.result?[index].pageViews} views',
                                              style: const TextStyle(
                                                color: Colors.blue,
                                              )
                                            ),
                                            const VerticalDivider(
                                              width: 8,
                                              thickness: 2,
                                              // endIndent: 2,
                                              color: Colors.black,
                                            ),
                                            Text(
                                              'Voted by ${_homeController.moviesListModel.value.result?[index].totalVoted} People',
                                              style: const TextStyle(
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ],
                                        ),



                                      ],
                                    ),
                                  ],
                                ),

                                ElevatedBtn(
                                  height: Get.height * .05,
                                  width: Get.width,
                                  circularBtn: true,
                                  customBorderRadius: BorderRadius.circular(4.0),
                                  bgColor: Colors.blue,
                                  // btnText: "Save",
                                  btnWidget: Text(
                                    "Watch Trailer",
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                  onPress: () {

                                  },
                                ),

                              ],
                            ),
                          );
                        },
                      ),
                    // ),

                    // SizedBox(height: 220.h),

                  ],
                ),
              ),
            ),
          );
        }),

      ),
    );
  }
}

