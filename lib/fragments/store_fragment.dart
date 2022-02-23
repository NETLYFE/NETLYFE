import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netlyfe/Utils/app_name.dart';
import 'package:netlyfe/Utils/strings.dart';
import 'package:netlyfe/widgets/c_container1.dart';
import 'package:netlyfe/widgets/category_container.dart';
import 'package:netlyfe/widgets/products_container.dart';
import 'package:netlyfe/widgets/upload_prescription_container.dart';

class StoreFragment extends StatefulWidget {
  const StoreFragment({Key? key}) : super(key: key);
  @override
  _StoreFragmentState createState() => _StoreFragmentState();
 }

class _StoreFragmentState extends State<StoreFragment> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
       appBar: AppBar(
         backgroundColor: Theme.of(context).backgroundColor,
         automaticallyImplyLeading: false,
         title: const AppName(fontSize: 20, title: 'Net', span: 'Store'),
         actions: [
           IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart_outlined,size: 18,))
         ],
       ),
        body: ListView(
          padding: const EdgeInsets.only(left: 15,top: 10,right: 15),
          children: [
           const CustomContainer1(),
           const SizedBox(height: 16,),
           const Text("OR",textAlign: TextAlign.center,style: TextStyle(
              fontWeight: FontWeight.w600
            ),),
           const SizedBox(height: 10,),
           const UploadPresContainer(),
           const SizedBox(height: 16,),
           const Text("Categories",style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18
            ),),
         const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const[
               CategoryContainer(
                catColor: StringData.bpColor,
                catImg: StringData.bpimg,
                catTitle: "Blood Pressure",
              ),
              CategoryContainer(
                catColor: StringData.pneumoColor,
                catImg: StringData.pneumoimg,
                catTitle: "Pneumonia",
              ),
              CategoryContainer(
                catColor: StringData.diabetColor,
                catImg: StringData.diabetimg,
                catTitle: "Diabetes",
              ),
              CategoryContainer(
                catColor: StringData.malaColor,
                catImg: StringData.malaimg,
                catTitle: "Malaria",
              )
            ],),
            const SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const[
                 Text("Products",style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18
                ),),
                Text("View All",style: TextStyle(
                  color: StringData.sophiaColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 15
                ),)
              ],
            ),
            const SizedBox(height: 10,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const[
                   ProductsContainer(),
                   ProductsContainer(),
                   ProductsContainer()
                ],
              ),
            )


          ],
        )
    );
  }
}
