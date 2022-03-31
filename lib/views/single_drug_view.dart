import 'dart:async';
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:netlyfe/controllers/drugs_controller.dart';
import 'package:netlyfe/models/drugs_model.dart';
import 'package:netlyfe/services/net_theme.dart';

class DrugCategoryListItem extends StatelessWidget {
  final Function() ontap;
  final Drugs drugs;
  DrugCategoryListItem({Key? key, required this.ontap, required this.drugs})
      : super(key: key);

  int counter = 0;
  final drugController = DrugsController();
  bool isloading = false;
  final log = Logger();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.19,
        width: MediaQuery.of(context).size.width * 0.42,
        decoration: BoxDecoration(
            color: catboxColor, borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 90,
                    height: 70,
                    child: CachedNetworkImage(
                      imageUrl: drugs.imgUrl!,
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height,
                      placeholder: (context, url) => Container(
                        color: Colors.grey[300],
                      ),
                      errorWidget: (context, url, error) => Container(
                        color: Colors.grey[300],
                        child: const Icon(Icons.error),
                      ),
                    ),
                  ),
                  Text(drugs.name!),
                  Text('Mfr: ' + drugs.manufacturedBy!),
                  Text('GHC ' + drugs.price!),
                ],
              ),
            ),

            // Container(
            //   height: 35,
            //   width: double.infinity,
            //   decoration: const BoxDecoration(
            //     borderRadius: BorderRadius.only(
            //         bottomLeft: Radius.circular(12),
            //         bottomRight: Radius.circular(12)),
            //     color: cartBtn,
            //   ),
            //   child: counter == 0
            //       ? InkWell(
            //           onTap: () async {
            //             setState(() {
            //               isloading = true;
            //             });
            //             bool isAdded = await drugController.addDrugToCart(
            //                 cartItemName: drug.name,
            //                 cartItemPrice: drug.price,
            //                 cartItemMfr: drug.manufacturedBy,
            //                 cartItemImageUrl: drug.imgUrl,
            //                 cartItemKey: drug.drugKey,
            //                 cartItemCounter: (counter + 1).toString());
            //             if (isAdded) {
            //               print("cart item added");
            //               setState(() {
            //                 isloading = false;
            //                 counter = counter + 1;
            //               });
            //             }
            //           },
            //           child: Container(
            //             width: double.infinity,
            //             child: isloading == true
            //                 ? SizedBox(
            //                     width: 20,
            //                     height: 20,
            //                     child: CircularProgressIndicator(
            //                       color: Colors.grey[200],
            //                       strokeWidth: 2.0,
            //                     ),
            //                   )
            //                 : const Text("ADD TO CART",
            //                     style: TextStyle(
            //                         fontWeight: FontWeight.w700,
            //                         color: Colors.white)),
            //             alignment: Alignment.center,
            //           ),
            //         )
            //       : IntrinsicHeight(
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //             children: [
            //               IconButton(
            //                 icon: const Icon(Icons.remove,
            //                     size: 20, color: Colors.white),
            //                 onPressed: () {
            //                   // counter = counter - 1;
            //                   // bool isUpdate =
            //                   //     await drugController.updateCartItems(
            //                   //         counter: counter.toString(),
            //                   //         price: (counter * double.parse(drug.price!))
            //                   //             .toString(),
            //                   //         itemKey: drug.drugKey);
            //                   // if (isUpdate) {
            //                   //   setState(() {
            //                   //     counter = counter - 1;
            //                   //   });
            //                   // }
            //                 },
            //               ),
            //               const VerticalDivider(
            //                   color: Colors.white, thickness: 0.5),
            //               Text(counter.toString(),
            //                   style: headingStyle.copyWith(
            //                       fontSize: 20, color: Colors.white)),
            //               const VerticalDivider(
            //                   color: Colors.white, thickness: 0.5),
            //               IconButton(
            //                 icon: const Icon(Icons.add,
            //                     size: 20, color: Colors.white),
            //                 onPressed: () async {
            //                   log.d(drug.drugKey);
            //                   // setState(() {
            //                   //   counter = counter + 1;
            //                   // });
            //                   // bool isUpdate =
            //                   //     await drugController.updateCartItems(
            //                   //         counter: counter.toString(),
            //                   //         price: (counter * double.parse(drug.price!))
            //                   //             .toString(),
            //                   //         itemKey: drug.drugKey);
            //                 },
            //               ),
            //             ],
            //           ),
            //         ),
            // )
          ],
        ),
      ),
    );
  }
}
