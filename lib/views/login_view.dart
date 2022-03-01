import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netlyfe/Utils/screen_intents.dart';
import 'package:netlyfe/views/otp_view.dart';
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
                "Welcome",
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
                    "Phone Number",
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
                    'We will send you a one time password(otp) on the mobile number ',
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
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Row(
                      children: [
                        CountryCodePicker(
                          initialSelection: 'GH',
                          favorite: const ['+233','GH'],
                          alignLeft: false,
                        ),

                        Expanded(child: TextFormField(
                          // controller: userNameController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            hintText: "+233 00 000 000",
                            hintStyle: TextStyle(fontWeight: FontWeight.w500,fontSize:15,color:Colors.grey),
                            border: InputBorder.none,
                          ),
                        ),)
                      ],
                    )
                  ),
                  const SizedBox(height: 20),
                  RoundedLoadingButton(
                    controller: btnController,
                    width: MediaQuery.of(context).size.width * 1.0,
                    color: Theme.of(context).primaryColor,
                    child: Wrap(
                      children: const [
                        Text(
                          "NEXT",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      nextScreen(context, const OTPView());
                      btnController.reset();
                    },
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
