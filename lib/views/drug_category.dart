import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:logger/logger.dart';
import 'package:netlyfe/controllers/drugs_controller.dart';
import 'package:netlyfe/models/drugs_model.dart';
import 'package:netlyfe/services/net_theme.dart';
import 'package:netlyfe/views/drug_details.dart';
import 'package:netlyfe/views/single_drug_view.dart';

class DrugCategory extends StatefulWidget {
  String category = '';
  DrugCategory({Key? key, required this.category}) : super(key: key);
  @override
  State<DrugCategory> createState() => _DrugCategoryState();
}

class _DrugCategoryState extends State<DrugCategory>
    with AutomaticKeepAliveClientMixin {
  final log = Logger();
  final drugsController = DrugsController();

  @override
  Widget build(BuildContext context) {
    String cat = widget.category;
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: context.theme.backgroundColor,
        iconTheme: const IconThemeData(color: Colors.black54),
        title: Text(cat, style: titleStyle.copyWith(fontSize: 18)),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(CupertinoIcons.shopping_cart))
        ],
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        final orientSize = MediaQuery.of(context).size;
        return StreamBuilder<List<Drugs>>(
            stream: drugsController.getDrugsByCategory(cat),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(
                    child: CircularProgressIndicator(color: appColor));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator(color: appColor));
              }
              if (snapshot.data == null) {
                return const Center(
                    child: CircularProgressIndicator(color: appColor));
              }
              if (snapshot.data!.isEmpty) {
                return Center(
                    child: Image.asset(
                  "assets/notfound.gif",
                  height: 250,
                  width: 250,
                ));
              }
              return GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: orientation == Orientation.portrait
                          ? ((orientSize.width / 2) / 205)
                          : ((orientSize.width / 2) / 290),
                      crossAxisCount:
                          orientation == Orientation.portrait ? 2 : 3,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 10),
                  itemCount: snapshot.data == null ? 0 : snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final drugs = snapshot.data!.toList()[index];
                    return InkWell(
                      child: CategoryListItem(drugs: drugs),
                      onTap: () {
                        Get.to(DrugDetailsView(drugs: drugs));
                      },
                    );
                    // return CategoryListItem(
                    //   drugs: drugs,
                    // );
                  });
            });
      }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
