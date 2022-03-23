import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firestore_ui/animated_firestore_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:logger/logger.dart';
import 'package:netlyfe/models/drugs_model.dart';
import 'package:netlyfe/services/net_theme.dart';

class DrugCategory extends StatefulWidget {
  String category ='';
   DrugCategory({Key? key, required this.category}) : super(key: key);
  @override
  State<DrugCategory> createState() => _DrugCategoryState();
}

class _DrugCategoryState extends State<DrugCategory>
    with AutomaticKeepAliveClientMixin {
  final log = Logger();
  final currentuser = FirebaseAuth.instance.currentUser;
  List<Drugs> drugList = [];


  Future<Map> getDrugsCategory(String selcat) async{
    DatabaseReference dbRef = FirebaseDatabase.instance.ref().child('Drugs');
    final DataSnapshot snapshot = await dbRef.child(selcat).get();
    log.d(snapshot.value);
    return snapshot.value as Map;
  }

  Stream<List<Drugs>> getDrugsCate(String selectedCategory) {
   final querySnapshot =  FirebaseFirestore.instance.collection('Drugs').where("category",isEqualTo: selectedCategory)
       .snapshots();
        return querySnapshot.map((snapshot) => snapshot.docs.map((doc) =>
        Drugs.fromJson(doc.data())).toList());
  }


  @override
  Widget build(BuildContext context) {
    String cat = widget.category;
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: context.theme.backgroundColor,
        iconTheme: const IconThemeData(color:Colors.black54),
        title: Text(cat,style: titleStyle.copyWith(fontSize: 18)),
        centerTitle: true,
        elevation: 0,
        actions: [IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.shopping_cart))],
      ),
      body:
      OrientationBuilder(
        builder: (context, orientation) {
          final orientSize = MediaQuery.of(context).size;
          return StreamBuilder<List<Drugs>>(
              stream: getDrugsCate(cat),
              builder: (context,snapshot){
                if(snapshot.hasError){
                  return const Center(child: CircularProgressIndicator(color: appColor));
                }
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const Center(child: CircularProgressIndicator(color: appColor));
                }
                if(snapshot.data == null){
                  return const Center(child: CircularProgressIndicator(color: appColor));
                }
                if(snapshot.data!.isEmpty){
                  return  Center(child: Image.asset("assets/notfound.gif",height: 180,width: 180,));
                }
                  return GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: orientation == Orientation.portrait ?
                        ((orientSize.width / 2) / 205) : ((orientSize.width / 2) / 290),
                        crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 10
                      ),
                      itemCount: snapshot.data == null ? 0 : snapshot.data!.length,
                      itemBuilder: (context,index){
                        final drugs = snapshot.data!.toList()[index];
                        log.d(drugs.category);
                        return CategoryListItem(
                          imgurl: drugs.imgUrl!,
                          drugName: drugs.name!,
                          drugPrice: drugs.price!,
                          drgManufact: drugs.manufacturedBy!,
                          drugKey: drugs.drugKey!
                        );
                      }
                  );

              });

        }),
    );
  }
  @override
  bool get wantKeepAlive => true;
}

class CategoryListItem extends StatefulWidget {
  final String imgurl;
  final String drugName;
  final String drugPrice;
  final String drgManufact;
  final String drugKey;
  const CategoryListItem({Key? key,
  required this.imgurl,
  required this.drugName,
  required this.drugPrice,
  required this.drgManufact,
  required this.drugKey
  }) : super(key: key);
  @override
  State<CategoryListItem> createState() => _CategoryListItemState();
}
class _CategoryListItemState extends State<CategoryListItem> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.19,
      width: MediaQuery.of(context).size.width * 0.42,
      decoration: BoxDecoration(
        color: catboxColor,
        borderRadius: BorderRadius.circular(12)
      ),
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
                    imageUrl: widget.imgurl,
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height,
                    placeholder: (context,url) => Container(color: Colors.grey[300],),
                    errorWidget: (context,url,error) => Container(
                      color: Colors.grey[300],
                      child: const Icon(Icons.error),
                    ),
                  ),
                ),
                Text(widget.drugName),
                Text('Mfg: ' +widget.drgManufact),
                Text('GHC ' +widget.drugPrice),
              ],
            ),
          ),

          Container(
            height: 35,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12)),
              color: cartBtn,
            ),
            child:
                counter == 0 ?
                InkWell(
                  onTap: (){
                    setState(() {
                      counter = counter + 1;
                      // addToCart();
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    child: const Text("ADD TO CART",
                      style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white)),
                    alignment: Alignment.center,),
                )
                :
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(icon: const Icon(Icons.remove,size: 20,color: Colors.white),
                      onPressed: (){
                        setState(() {
                          counter = counter - 1;
                        });
                      },),
                      const VerticalDivider(color: Colors.white,thickness: 0.5),
                      Text(counter.toString(),style: headingStyle.copyWith(fontSize: 20,color: Colors.white)),
                      const VerticalDivider(color: Colors.white,thickness: 0.5),
                      IconButton(icon: const Icon(Icons.add,size: 20,color: Colors.white),
                      onPressed: (){
                        setState(() {
                          counter = counter + 1;
                        });
                      },),
                    ],
                  ),
                ),
          )
        ],
      ),
    );
  }
}

Future<bool> addToCart() async{
  final DatabaseReference dbreference = FirebaseDatabase.instance.ref().child('Cart-Items');
  // await dbreference.child(cate).set(drug!.toJson());
  return true;
}







