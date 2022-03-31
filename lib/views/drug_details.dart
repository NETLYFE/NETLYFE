import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:netlyfe/models/drugs_model.dart';
import 'package:netlyfe/services/net_theme.dart';
import 'package:netlyfe/widgets/cached_image.dart';
import 'package:netlyfe/widgets/cached_image_with_dark.dart';
import 'package:netlyfe/widgets/loading_button.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class DrugDetailsView extends StatelessWidget {
  Drugs drugs;
  DrugDetailsView({Key? key, required this.drugs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final btnController = RoundedLoadingButtonController();

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
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: appColor,
                              ),
                              child: Center(
                                child: Text("Add To Cart",
                                    style: detailstitleStyle.copyWith(
                                        color: Colors.white, fontSize: 18)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ))
            ],
          ),
        ]))
        // body: SafeArea(
        //     bottom: true,
        //     top: false,
        //     child: Column(
        //       children: [
        //         Expanded(
        //             child: CustomScrollView(
        //           slivers: <Widget>[
        //             SliverAppBar(
        //               automaticallyImplyLeading: false,
        //               elevation: 0,
        //               expandedHeight: 290,
        //               systemOverlayStyle: SystemUiOverlayStyle.light,
        //               flexibleSpace: FlexibleSpaceBar(
        //                   background: CustomCacheImageWithDarkFilterFull(
        //                       imageUrl: widget.drugs.imgUrl!, radius: 0.0)),
        //               actions: <Widget>[
        //                 const SizedBox(
        //                   width: 15,
        //                 ),
        //                 CircleAvatar(
        //                   radius: 17,
        //                   backgroundColor: Colors.white.withOpacity(0.6),
        //                   child: IconButton(
        //                     alignment: Alignment.center,
        //                     icon: Icon(Icons.arrow_back_ios_sharp,
        //                         size: 18, color: Colors.grey[900]),
        //                     onPressed: () => Navigator.pop(context),
        //                   ),
        //                 ),
        //                 const Spacer(),
        //                 CircleAvatar(
        //                   radius: 17,
        //                   backgroundColor: Colors.white.withOpacity(0.7),
        //                   child: IconButton(
        //                       icon: Icon(Icons.shopping_cart_checkout,
        //                           size: 18, color: Colors.grey[900]),
        //                       onPressed: () {}),
        //                 ),
        //                 const SizedBox(
        //                   width: 15,
        //                 )
        //               ],
        //             ),
        //             SliverToBoxAdapter(
        //                 child: Padding(
        //               padding: const EdgeInsets.symmetric(
        //                   horizontal: 14, vertical: 12),
        //               child: Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Row(
        //                     children: [
        //                       Expanded(
        //                           child: Column(
        //                         crossAxisAlignment: CrossAxisAlignment.start,
        //                         children: [
        //                           Text("AntiBiotics 200mg",
        //                               style: detailstitleStyle),
        //                           const SizedBox(
        //                             height: 8,
        //                           ),
        //                           Text("10 tablets", style: detailsubtitleStyle)
        //                         ],
        //                       )),
        //                       Container(
        //                           alignment: Alignment.center,
        //                           // height: 35,
        //                           decoration: BoxDecoration(
        //                               borderRadius: BorderRadius.circular(20),
        //                               color: greenkishClr),
        //                           child: AnimatedPadding(
        //                             duration: const Duration(milliseconds: 800),
        //                             padding: EdgeInsets.only(
        //                                 left: 10,
        //                                 right: _rightPaddingValue,
        //                                 top: 5,
        //                                 bottom: 5),
        //                             child: Text("Ghc 128.05",
        //                                 style: buttonTextStyle),
        //                           )),
        //                     ],
        //                   ),
        //                   const SizedBox(height: 20),
        //                   Text("General Usage",
        //                       style: detailstitleStyle.copyWith(fontSize: 14)),
        //                   const SizedBox(height: 5),
        //                   SizedBox(
        //                     width: MediaQuery.of(context).size.width * 0.80,
        //                     child: Text(
        //                       "Antibiotics, also known as antibacterials, are medications that destroy or slow down the growth of bacteria.",
        //                       style: detaildescriptionStyle.copyWith(
        //                           letterSpacing: 0.1),
        //                       maxLines: 3,
        //                     ),
        //                   ),
        //                   const SizedBox(height: 20),
        //                   Text("Composition",
        //                       style: detailstitleStyle.copyWith(fontSize: 14)),
        //                   const SizedBox(height: 5),
        //                   SizedBox(
        //                     width: MediaQuery.of(context).size.width * 0.80,
        //                     child: Text(
        //                       "maize starch, potassium sorbate, purified talc, stearic acid, povidone, and soluble starch.",
        //                       style: detaildescriptionStyle.copyWith(
        //                           letterSpacing: 0.1),
        //                       maxLines: 3,
        //                     ),
        //                   ),
        //                   const SizedBox(height: 60),
        //                   Align(
        //                     alignment: Alignment.bottomCenter,
        //                     child: Row(
        //                       children: const [
        //                         Text("Cart Button"),
        //                         Text("BUY NOW")
        //                       ],
        //                     ),
        //                   )
        //                 ],
        //               ),
        //             ))
        //           ],
        //         ))
        //       ],
        //     )),
        );
  }
}
