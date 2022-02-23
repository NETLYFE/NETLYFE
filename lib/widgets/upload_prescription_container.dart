import 'package:flutter/material.dart';
import 'package:netlyfe/Utils/strings.dart';

class UploadPresContainer extends StatelessWidget {
  const UploadPresContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: const BoxDecoration(
        color: StringData.uploadPresColor,
        borderRadius: BorderRadius.all(Radius.circular(8))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_upward_outlined,size: 40,)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const[
            Text(
              "Upload prescription",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                 wordSpacing: 2.0
              ),
            ),
            SizedBox(height: 2,),
            Text(
                "We'll do the rest",
                style: TextStyle(
                  fontSize: 15,
                ),
            )
          ],),
          // Image(image: AssetImage("assets/pa.jpg"))
          Image.asset("assets/edit.png",width: 50,height: 50)
        ],
      ),
    );
  }
}
