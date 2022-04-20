import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netlyfe/Utils/app_name.dart';
import 'package:netlyfe/Utils/list_objects.dart';
import 'package:netlyfe/Utils/strings.dart';
import 'package:netlyfe/services/net_theme.dart';
import 'package:netlyfe/services/theme_services.dart';
import 'package:netlyfe/test/upload_multiple_images.dart';
import 'package:netlyfe/views/drug_category.dart';
import 'package:netlyfe/widgets/c_container1.dart';
import 'package:netlyfe/widgets/category_container.dart';
import 'package:netlyfe/widgets/products_container.dart';
import 'package:netlyfe/widgets/upload_prescription_container.dart';

class StoreFragment extends StatefulWidget {
  const StoreFragment({Key? key}) : super(key: key);
  @override
  _StoreFragmentState createState() => _StoreFragmentState();
}

class _StoreFragmentState extends State<StoreFragment>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: context.theme.backgroundColor,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: const AppName(fontSize: 20, title: 'Net', span: 'Store'),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  size: 18,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                )),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.only(left: 15, top: 10, right: 15),
          children: [
            const CustomContainer1(),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "OR",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
                onTap: () {
                  Get.to(() => const UploadMultipLeImagesView());
                },
                child: const UploadPresContainer()),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Categories",
              style: titleStyle.copyWith(
                  fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            Wrap(
                alignment: WrapAlignment.spaceBetween,
                children: List<Widget>.generate(diseaseList.length, (index) {
                  return CategoryContainer(
                    catColor: index == 0
                        ? greenkishClr
                        : index == 1
                            ? bluishClr
                            : index == 2
                                ? yellowishClr
                                : pinkishClr,
                    catImg: diseaseList[index].img,
                    catTitle: diseaseList[index].name,
                    onTap: () {
                      Get.to(() =>
                          DrugCategory(category: diseaseList[index].name));
                      print(diseaseList[index].slug);
                    },
                  );
                })),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Products",
                  style: titleStyle.copyWith(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Text(
                  "view All",
                  style: titleStyle.copyWith(
                      color: yellowishClr,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  ProductsContainer(),
                  ProductsContainer(),
                  ProductsContainer()
                ],
              ),
            )
          ],
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
