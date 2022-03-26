// import 'dart:async';
// import 'dart:developer';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:logger/logger.dart';
// import 'package:netlyfe/controllers/drugs_controller.dart';
// import 'package:netlyfe/models/drugs_model.dart';
// import 'package:netlyfe/services/net_theme.dart';

// class CategoryListItem extends StatefulWidget {
//   Drugs drugs;
//   CategoryListItem({Key? key, required this.drugs}) : super(key: key);
//   @override
//   State<CategoryListItem> createState() => _CategoryListItemState();
// }

// class _CategoryListItemState extends State<CategoryListItem> {
//   int counter = 0;
//   final drugController = DrugsController();
//   bool isloading = false;
//   final log = Logger();

//   @override
//   Widget build(BuildContext context) {
//     Drugs drug = widget.drugs;
//     return Container(
//       height: MediaQuery.of(context).size.height * 0.19,
//       width: MediaQuery.of(context).size.width * 0.42,
//       decoration: BoxDecoration(
//           color: catboxColor, borderRadius: BorderRadius.circular(12)),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Expanded(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   width: 90,
//                   height: 70,
//                   child: CachedNetworkImage(
//                     imageUrl: drug.imgUrl!,
//                     fit: BoxFit.cover,
//                     height: MediaQuery.of(context).size.height,
//                     placeholder: (context, url) => Container(
//                       color: Colors.grey[300],
//                     ),
//                     errorWidget: (context, url, error) => Container(
//                       color: Colors.grey[300],
//                       child: const Icon(Icons.error),
//                     ),
//                   ),
//                 ),
//                 Text(drug.name!),
//                 Text('Mfr: ' + drug.manufacturedBy!),
//                 Text('GHC ' + drug.price!),
//               ],
//             ),
//           ),
//           Container(
//             height: 35,
//             width: double.infinity,
//             decoration: const BoxDecoration(
//               borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(12),
//                   bottomRight: Radius.circular(12)),
//               color: cartBtn,
//             ),
//             child: counter == 0
//                 ? InkWell(
//                     onTap: () async {
//                       setState(() {
//                         isloading = true;
//                       });
//                       bool isAdded = await drugController.addDrugToCart(
//                           cartItemName: drug.name,
//                           cartItemPrice: drug.price,
//                           cartItemMfr: drug.manufacturedBy,
//                           cartItemImageUrl: drug.imgUrl,
//                           cartItemKey: drug.drugKey,
//                           cartItemCounter: (counter + 1).toString());
//                       if (isAdded) {
//                         print("cart item added");
//                         setState(() {
//                           isloading = false;
//                           counter = counter + 1;
//                         });
//                       }
//                     },
//                     child: Container(
//                       width: double.infinity,
//                       child: isloading == true
//                           ? SizedBox(
//                               width: 20,
//                               height: 20,
//                               child: CircularProgressIndicator(
//                                 color: Colors.grey[200],
//                                 strokeWidth: 2.0,
//                               ),
//                             )
//                           : const Text("ADD TO CART",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w700,
//                                   color: Colors.white)),
//                       alignment: Alignment.center,
//                     ),
//                   )
//                 : IntrinsicHeight(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         IconButton(
//                           icon: const Icon(Icons.remove,
//                               size: 20, color: Colors.white),
//                           onPressed: () {
//                             // counter = counter - 1;
//                             // bool isUpdate =
//                             //     await drugController.updateCartItems(
//                             //         counter: counter.toString(),
//                             //         price: (counter * double.parse(drug.price!))
//                             //             .toString(),
//                             //         itemKey: drug.drugKey);
//                             // if (isUpdate) {
//                             //   setState(() {
//                             //     counter = counter - 1;
//                             //   });
//                             // }
//                           },
//                         ),
//                         const VerticalDivider(
//                             color: Colors.white, thickness: 0.5),
//                         Text(counter.toString(),
//                             style: headingStyle.copyWith(
//                                 fontSize: 20, color: Colors.white)),
//                         const VerticalDivider(
//                             color: Colors.white, thickness: 0.5),
//                         IconButton(
//                           icon: const Icon(Icons.add,
//                               size: 20, color: Colors.white),
//                           onPressed: () async {
//                             log.d(drug.drugKey);
//                             // setState(() {
//                             //   counter = counter + 1;
//                             // });
//                             // bool isUpdate =
//                             //     await drugController.updateCartItems(
//                             //         counter: counter.toString(),
//                             //         price: (counter * double.parse(drug.price!))
//                             //             .toString(),
//                             //         itemKey: drug.drugKey);
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//           )
//         ],
//       ),
//     );
//   }
// }

// Future<bool> addToCart() async {
//   // final DatabaseReference dbreference =
//   //     FirebaseDatabase.instance.ref().child('Cart-Items');
//   // await dbreference.child(cate).set(drug!.toJson());
//   return true;
// }

import 'package:flutter/material.dart';
import 'package:netlyfe/models/drugs_model.dart';
import 'package:netlyfe/widgets/custom_text.dart';

class SingleDrugView extends StatelessWidget {
  final Drugs drugs;
  const SingleDrugView({Key? key, required this.drugs}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(.5),
                offset: const Offset(3, 2),
                blurRadius: 7)
          ]),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  drugs.imgUrl!,
                  width: double.infinity,
                )),
          ),
          CustomText(
            text: drugs.name,
            size: 18,
            weight: FontWeight.bold,
          ),
          CustomText(
            text: drugs.manufacturedBy,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: CustomText(
                  text: "\$GHC{drugs.price}",
                  size: 22,
                  weight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              IconButton(
                  icon: const Icon(Icons.add_shopping_cart), onPressed: () {})
            ],
          ),
        ],
      ),
    );
  }
}
