import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:netlyfe/Utils/screen_intents.dart';
import 'package:netlyfe/Utils/strings.dart';
import 'package:netlyfe/controllers/phone_auth_controller.dart';
import 'package:netlyfe/services/net_theme.dart';
import 'package:netlyfe/views/home_view.dart';
import 'package:netlyfe/widgets/loading_button.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class OTPView extends StatefulWidget {
  const OTPView({Key? key}) : super(key: key);

  @override
  State<OTPView> createState() => _OTPiewState();
}

class _OTPiewState extends State<OTPView> {
  final btnController = RoundedLoadingButtonController();
  PhoneAuthController authController = Get.find();
  String otpCode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: context.theme.backgroundColor,
          elevation: 0,
          iconTheme: IconThemeData(
              color: Get.isDarkMode ? Colors.white : Colors.black),
        ),
        body: SingleChildScrollView(
          padding:
              const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(StringData.otpText, style: headingStyle),
              const SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "OTP",
                    style: subHeadingStyle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(StringData.otpcodeText, style: descriptionStyle),
                  const SizedBox(
                    height: 15,
                  ),
                  OtpTextField(
                    numberOfFields: 6,
                    borderColor:
                        Get.isDarkMode ? Colors.grey[300]! : Colors.grey,
                    focusedBorderColor: appColor,
                    showFieldAsBox: true,
                    onSubmit: (code) {
                      setState(() {
                        otpCode = code;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  LoadingButton(
                      controller: btnController,
                      onTap: () async {
                        if(otpCode.isEmpty){
                          btnController.reset();
                          return Get.snackbar("Verification Error", "please enter verification code sent to your phone number");
                        }
                        await authController.verifyOTP(otpCode);
                        // Get.to(() => const HomeView());
                        // btnController.reset();
                      },
                      label: "VERIFY")
                ],
              )
            ],
          ),
        ));
  }
}
