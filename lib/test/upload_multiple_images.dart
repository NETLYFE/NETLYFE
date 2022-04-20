import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:netlyfe/services/net_theme.dart';
import 'package:netlyfe/test/drug_test_page.dart';
import 'package:netlyfe/test/drug_text.dart';
import 'package:netlyfe/test/test_controller.dart';
import 'package:netlyfe/widgets/custom_form_field.dart';
import 'package:path/path.dart' as Path;

class UploadMultipLeImagesView extends StatefulWidget {
  const UploadMultipLeImagesView({Key? key}) : super(key: key);

  @override
  State<UploadMultipLeImagesView> createState() =>
      _UploadMultipLeImagesViewState();
}

class _UploadMultipLeImagesViewState extends State<UploadMultipLeImagesView> {
  List<File> imagesList = [];
  var drugName = TextEditingController();
  var drugMfr = TextEditingController();
  final picker = ImagePicker();
  var log = Logger();
  bool uploading = false;
  double? val = 0;

  CollectionReference testcol =
      FirebaseFirestore.instance.collection('DrugTest');
  FirebaseStorage storage = FirebaseStorage.instance;
  final testControl = DrugTestController();
  List<String>? dwdImgList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: context.theme.backgroundColor,
        elevation: 0,
        title: const Text("upload drug", style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                uploading = true;
              });
              uploadFile().whenComplete(() {
                setState(() {
                  uploading = false;
                });
                Get.snackbar(
                    "Multipart Images Upload", "DrugTest Upload Success");
                drugName.clear();
                drugMfr.clear();
                dwdImgList!.clear();
                imagesList.clear();
              });
            },
            icon: const Icon(Icons.file_upload_outlined),
            color: Colors.black,
          ),
          IconButton(
              onPressed: () {
                Get.to(() => const DrugTestPage());
              },
              icon: const Icon(Icons.next_plan_outlined, color: Colors.black))
        ],
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: [
          GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemCount: imagesList.length + 1,
            itemBuilder: (context, index) {
              return index == 0
                  ? DottedBorder(
                      borderType: BorderType.RRect,
                      strokeWidth: .5,
                      dashPattern: [10, 6],
                      child: Center(
                        child: IconButton(
                            onPressed: () {
                              chooseImage();
                            },
                            icon: const Icon(Icons.add_a_photo)),
                      ))
                  : Container(
                      margin: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: FileImage(
                                imagesList[index - 1],
                              ),
                              fit: BoxFit.cover)));
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomFormField(
            title: "Drug Name",
            hint: "Enter drug name",
            controller: drugName,
          ),
          const SizedBox(height: 16),
          CustomFormField(
            title: "Manufactured By",
            hint: "Enter manufacturer",
            controller: drugMfr,
          ),
          uploading
              ? Center(
                  child: Column(
                  children: const [
                    Text(
                      "uploading....",
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(height: 10),
                    CircularProgressIndicator(
                      value: 0,
                      valueColor: AlwaysStoppedAnimation<Color>(appColor),
                    )
                  ],
                ))
              : Container()
        ],
      ),
    );
  }

  chooseImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imagesList.add(File(pickedFile!.path));
    });
    pickedFile == null ? retrieveLostData() : null;
  }

  Future retrieveLostData() async {
    final LostDataResponse res = await picker.retrieveLostData();
    if (res.isEmpty) {
      return;
    }
    if (res.file != null) {
      setState(() {
        imagesList.add(File(res.file!.path));
      });
    } else {
      log.d(res.exception);
    }
  }

  Future uploadFile() async {
    int i = 1;
    for (var img in imagesList) {
      setState(() {
        val = i / imagesList.length;
      });

      Reference ref = storage.ref().child('images/${Path.basename(img.path)}');
      await ref.putFile(img).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          dwdImgList!.add(value);
          i++;
        });
      });
    }
    await testControl.addDrugTest(
        test: DrugTest(
            drug_name: drugName.text,
            drug_manufact: drugMfr.text,
            drug_images: dwdImgList));
  }
}
