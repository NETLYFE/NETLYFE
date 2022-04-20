import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netlyfe/controllers/cart_controller.dart';
import 'package:netlyfe/models/cart_model.dart';
import 'package:netlyfe/models/drugs_model.dart';
import 'package:netlyfe/services/firebase_service.dart';
import 'package:netlyfe/services/net_theme.dart';
import 'package:netlyfe/widgets/cached_image.dart';
import 'package:netlyfe/widgets/loading_button.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class DrugDetailsView extends StatelessWidget {
  Drugs drugs;
  DrugDetailsView({Key? key, required this.drugs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final btnController = RoundedLoadingButtonController();
    final cartController = CartController();
    var units = 1;
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Stack(children: [
          Column(
            children: [
              Expanded(
                  child: Container(
                color: kWhiteColor,
                child: Container(
                  decoration: const BoxDecoration(
                      color: kBGColor,
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(50))),
                  child: Column(
                    children: [
                      //AppBar Section of the Page
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                size: 20,
                                color: Colors.black54,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.shopping_cart_outlined,
                                size: 20,
                                color: Colors.black54,
                              )),
                        ],
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 16),
                          child: CustomCacheImage(
                              imageUrl: drugs.imgUrl, radius: 5))
                    ],
                  ),
                ),
              )),
              Expanded(
                  child: Container(
                color: kBGColor,
                child: Container(
                  decoration: const BoxDecoration(
                      color: kWhiteColor,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(50))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(drugs.name!, style: detailstitleStyle),
                                Text(
                                  r'$' + drugs.price!,
                                  style:
                                      detailstitleStyle.copyWith(fontSize: 16),
                                ),
                              ]),
                          const SizedBox(height: 5),
                          Text("Mfr: " + drugs.manufacturedBy!,
                              style: detailsubtitleStyle.copyWith(
                                  fontStyle: FontStyle.italic)),
                          const SizedBox(height: 25),
                          Text("Description",
                              style: detailstitleStyle.copyWith(fontSize: 16)),
                          const SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.only(right: 18),
                            child: Text(
                              "Antibiotics, also known as antibacterials, are medications that destroy or slow down the growth of bacteria. Antibiotics, also known as antibacterials, are medications that destroy or slow down the growth of bacteria.",
                              textAlign: TextAlign.justify,
                              style:
                                  detaildescriptionStyle.copyWith(height: 1.5),
                            ),
                          ),
                          const SizedBox(height: 25),
                          LoadingButton(
                              controller: btnController,
                              onTap: () async {
                                bool isAdded =
                                    await cartController.addDrugsToCart(
                                        cartmodel: CartModel(
                                            cartName: drugs.name,
                                            cartPrice: drugs.price,
                                            cartMfr: drugs.manufacturedBy,
                                            cartImageUrl: drugs.imgUrl,
                                            counter: units.toString()));
                                if (isAdded) {
                                  btnController.success();
                                } else {
                                  btnController.reset();
                                  Get.snackbar("Adding To Cart",
                                      "Failed Adding Item to Cart");
                                }
                              },
                              label: "Add To Cart")
                          // GestureDetector(
                          //   onTap: () {

                          //   },
                          //   child: Container(
                          //     height: 50,
                          //     width: double.infinity,
                          //     decoration: const BoxDecoration(
                          //       color: appColor,
                          //     ),
                          //     child: Center(
                          //       child: Text("Add To Cart",
                          //           style: detailstitleStyle.copyWith(
                          //               color: Colors.white, fontSize: 18)),
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ),
                ),
              ))
            ],
          ),
        ])));
  }
}
