import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firestore_ui/animated_firestore_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:logger/logger.dart';
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
          return FirebaseAnimatedList(
              query: FirebaseDatabase.instance.ref()
              .child("Drugs").child(cat),
              itemBuilder: (
                  BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                  return FadeTransition(
                      opacity: animation,
                      child: const CategoryListItem(),
                  ) ;
              },


           );



          // return GridView.builder(
          //     itemCount: 6,
          //     padding: const EdgeInsets.all(12),
          //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //       childAspectRatio: orientation == Orientation.portrait ?
          //       ((orientSize.width / 2) / 205) : ((orientSize.width / 2) / 290),
          //       crossAxisSpacing: 10,
          //       mainAxisSpacing: 10,
          //       crossAxisCount: orientation == Orientation.portrait ? 2 : 3
          //     ),
          //     itemBuilder: (BuildContext context, int index){
          //       return const CategoryListItem();
          //     }
          // );
        }),

    );
  }
  @override
  bool get wantKeepAlive => true;
}

class CategoryListItem extends StatefulWidget {
  const CategoryListItem({Key? key}) : super(key: key);

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
                  child: Image.asset("assets/dtest.jpg",fit: BoxFit.cover,),
                ),
                Text("Ibuprofen"),
                Text("Box of 100 capsules"),
                Text("GHC 104.00"),

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




