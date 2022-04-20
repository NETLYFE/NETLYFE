class DrugTest {
  String? testid;
  String? drug_name;
  String? drug_manufact;
  List<dynamic>? drug_images;

  DrugTest({this.testid, this.drug_name, this.drug_manufact, this.drug_images});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['testid'] = testid;
    data['drug_name'] = drug_name;
    data['drug_manufact'] = drug_manufact;
    data['drug_images'] = drug_images;
    return data;
  }

  DrugTest.fromJson(Map<String, dynamic> json) {
    testid = json['testid'];
    drug_name = json['drug_name'];
    drug_manufact = json['drug_manufact'];
    if(json['drug_images'] != null) {
      drug_images = json['drug_images'];
    }
  }
}























































































// class DrugTest {
//   String? testid;
//   String? drug_name;
//   String? drug_manufact;
//   List<DrugImageUrls>? drug_images;

//   DrugTest({this.testid, this.drug_name, this.drug_manufact, this.drug_images});

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['testid'] = testid;
//     data['drug_name'] = drug_name;
//     data['drug_manufact'] = drug_manufact;
//     data['drug_images'] = drug_images;
//     return data;
//   }

//   DrugTest.fromJson(Map<String, dynamic> json) {
//     testid = json['testid'];
//     drug_name = json['drug_name'];
//     drug_manufact = json['drug_manufact'];
//     if (json['drug_images'] != null) {
//       drug_images = <DrugImageUrls>[];
//       (json['drug_images'] as List).forEach((element) {
//         drug_images!.add(DrugImageUrls.fromJson(element));
//       });
//     }
//   }
// }

// class DrugImageUrls {
//   String? imgUrl1;
//   String? imgUrl2;
//   String? imgUrl3;

//   DrugImageUrls({this.imgUrl1, this.imgUrl2, this.imgUrl3});

//   DrugImageUrls.fromJson(Map<String, dynamic> json) {
//     imgUrl1 = json['img_url1'];
//     imgUrl2 = json['img_url2'];
//     imgUrl3 = json['img_url3'];
//   }
// }





// class DrugTest {
//   String? testid;
//   String? drug_name;
//   String? drug_manufact;
//   List<String>? drug_images;

//   DrugTest({this.testid, this.drug_name, this.drug_manufact, this.drug_images});

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['testid'] = testid;
//     data['drug_name'] = drug_name;
//     data['drug_manufact'] = drug_manufact;
//     data['drug_images'] = drug_images;
//     return data;
//   }

//   DrugTest.fromJson(Map<String, dynamic> json) {
//     testid = json['testid'];
//     drug_name = json['drug_name'];
//     drug_manufact = json['drug_manufact'];
//     if(json['drug_images'] != null) {
//       drug_images = json['drug_images'];
//     }
//   }
// }


