
import 'package:flutter_program/src/models/sign_up_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocalStorage extends GetxService {

  GetStorage? getStorage;

  Future<LocalStorage> init() async {
    getStorage = GetStorage();
    await GetStorage.init();
    return this;
  }

  void clearStorage() {
    getStorage?.erase();
  }

  final isLogin = false.val('isLogin');
  final _signUpModel = SignUpModel().val('signUpModel');

  SignUpModel get signUpModel => _signUpModel.val;
  void setSignUpModel(SignUpModel signUpModel) {
    _signUpModel.val = signUpModel;
  }

}
