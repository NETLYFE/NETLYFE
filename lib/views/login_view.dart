import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:netlyfe/Utils/screen_intents.dart';
import 'package:netlyfe/Utils/strings.dart';
import 'package:netlyfe/services/net_theme.dart';
import 'package:netlyfe/views/otp_view.dart';
import 'package:netlyfe/widgets/input_field.dart';
import 'package:netlyfe/widgets/loading_button.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final btnController = RoundedLoadingButtonController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: context.theme.backgroundColor,
            elevation: 0),
        body: SingleChildScrollView(
          padding:
              const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome", style: headingStyle),
              const SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Phone Number", style: subHeadingStyle),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                      'We will send you a one time password(otp) on the mobile number ',
                      style: descriptionStyle),
                  const SizedBox(
                    height: 10,
                  ),
                  MyInputField(
                    hint: "00 000 000",
                    widget: CountryCodePicker(
                      initialSelection: 'GH',
                      favorite: const ['+233', 'GH'],
                      alignLeft: false,
                    ),
                  ),
                  const SizedBox(height: 20),
                  LoadingButton(
                      controller: btnController,
                      onTap: () {
                        Get.to(() => const OTPView());
                        btnController.reset();
                      },
                      label: "NEXT")
                ],
              )
            ],
          ),
        ));
  }
}
