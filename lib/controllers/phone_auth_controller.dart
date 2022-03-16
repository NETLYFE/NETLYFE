import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:netlyfe/views/home_view.dart';

class PhoneAuthController extends GetxController {
  var mAuth = FirebaseAuth.instance;

  var status = "welcome".obs;
  String verificationdId = "";

  String get msg => status.value;

  verifyPhone(String phoneNumber) async {
    await mAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (AuthCredential authcredential) {},
        verificationFailed: (authException) {
          status.value = "Problem sending the code";
        },
        codeSent: (String verifyId, code) {
          verificationdId = verifyId;
          status.value = 'login success';
        },
        codeAutoRetrievalTimeout: (id) {
          verificationdId = id;
        },
        timeout: const Duration(seconds: 40));
  }

  verifyOTP(String otpCode) async {
    var credential = await mAuth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationdId, smsCode: otpCode));
    if (credential != null) Get.to(() => const HomeView());
  }
}
