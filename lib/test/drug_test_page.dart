import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:netlyfe/models/drugs_model.dart';
import 'package:netlyfe/services/net_theme.dart';
import 'package:netlyfe/test/drug_test_details.dart';
import 'package:netlyfe/test/drug_text.dart';
import 'package:netlyfe/test/test_controller.dart';

class DrugTestPage extends StatefulWidget {
  const DrugTestPage({Key? key}) : super(key: key);

  @override
  State<DrugTestPage> createState() => _DrugTestPageState();
}

class _DrugTestPageState extends State<DrugTestPage> {
  final testControl = DrugTestController();
  final log = Logger();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.backgroundColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: StreamBuilder<List<DrugTest>>(
        stream: testControl.getDrugTests(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            log.d(snapshot.error);
            return const Center(
                child: CircularProgressIndicator(color: Colors.black));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(color: Colors.amber));
          }
          if (snapshot.data == null) {
            return const Center(
                child: CircularProgressIndicator(color: Colors.blue));
          }
          if (snapshot.data!.isEmpty) {
            return Center(
                child: Image.asset(
              "assets/notfound.gif",
              height: 250,
              width: 250,
            ));
          }
          return ListView.builder(
              itemCount: snapshot.data == null ? 0 : snapshot.data!.length,
              itemBuilder: (context, index) {
                final drugTests = snapshot.data!.toList()[index];
                log.d(drugTests.drug_images![0]);
                return DrugTestSingleCard(
                    test: drugTests,
                    onPressed: () {
                      Get.to(() => DrugTestDetails(test: drugTests,));
                    });
              });
        },
      ),
    );
  }
}

class DrugTestSingleCard extends StatelessWidget {
  final DrugTest test;
  final Function() onPressed;
  const DrugTestSingleCard(
      {Key? key, required this.test, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.theme.backgroundColor,
      ),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        leading: Container(
          width: 80,
          height: 120,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: CachedNetworkImage(
            imageUrl: test.drug_images![0],
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          test.drug_name!,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        subtitle: Text(test.drug_manufact!,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        trailing: IconButton(
            onPressed: onPressed, icon: const Icon(Icons.arrow_forward_ios)),
      ),
    );
  }
}
