import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netlyfe/Utils/screen_intents.dart';
import 'package:netlyfe/Utils/strings.dart';
import 'package:netlyfe/views/home_view.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class OTPView extends StatefulWidget {
  const OTPView({Key? key}) : super(key: key);

  @override
  State<OTPView> createState() => _OTPiewState();
}

class _OTPiewState extends State<OTPView> {
  final btnController = RoundedLoadingButtonController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // key: scaffoldKey,
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.close)),
        ),
        body: SingleChildScrollView(
          padding:
              const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringData.otpText,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.7,
                    wordSpacing: 1,
                    color: Theme.of(context).colorScheme.primary),
              ),
              const SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "OTP",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        wordSpacing: 1,
                        letterSpacing: -0.7),
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    StringData.otpcodeText,
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    margin: const EdgeInsets.only(top: 10, bottom: 30),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      // color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: OTPTextField(
                      length: 5,
                      width: MediaQuery.of(context).size.width,
                      fieldWidth: 50,
                      style: const TextStyle(fontSize: 17),
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldStyle: FieldStyle.box,
                    ),
                  ),
                  const SizedBox(height: 20),
                  RoundedLoadingButton(
                    controller: btnController,
                    width: MediaQuery.of(context).size.width * 1.0,
                    color: Theme.of(context).primaryColor,
                    child: Wrap(
                      children: const [
                        Text(
                          "VERIFY",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      btnController.reset();
                      nextScreen(context, const HomeView());
                    },
                  ),

                  // Container(
                  //   width: double.infinity,
                  //   alignment:Alignment.center,
                  //   padding: const EdgeInsets.only(top: 10),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Text(
                  //           "don't have an account?",
                  //           style: TextStyle(
                  //               color: Theme.of(context).colorScheme.secondary,
                  //               fontSize:14,
                  //               fontWeight: FontWeight.w500
                  //           )
                  //       ),
                  //       TextButton(
                  //           onPressed: () => {},
                  //           child: Text(
                  //             "Create account",
                  //             style: TextStyle(
                  //                 letterSpacing:-0.7,
                  //                 wordSpacing: 1,
                  //                 fontWeight: FontWeight.w600,
                  //                 fontSize:16,
                  //                 color: Theme.of(context).colorScheme.primary
                  //             ),
                  //           )
                  //       )
                  //     ],
                  //   ),
                  // )
                ],
              )
            ],
          ),
        ));
  }
}
