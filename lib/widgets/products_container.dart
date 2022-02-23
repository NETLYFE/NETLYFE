import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netlyfe/Utils/strings.dart';

class ProductsContainer extends StatelessWidget {
  const ProductsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Container(
            width: 160,
            height: 150,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              border: Border.all(color: Theme.of(context).shadowColor,width: 2.0)
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 5,right: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: const BoxDecoration(
                          image: DecorationImage(image: AssetImage("assets/drug.png"),fit: BoxFit.cover),
                          color: Colors.cyan,
                          borderRadius: BorderRadius.all(Radius.circular(12))
                        ),
                      ),
                      Column(
                        children: const[
                          Text(r"MRP $120",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                   color: StringData.smallTextColor
                              )
                          ),
                          SizedBox(height: 2,),
                          Text(r"$220.50",style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700
                          )
                        ,)
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: const[
                      Text(
                          "Ibuprofen",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14
                          ),
                      ),
                      Text(
                          "Box of 10 capsules",
                          style: TextStyle(
                            fontSize: 12,
                            color: StringData.smallTextColor,
                            fontWeight: FontWeight.w700
                          ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
              child: Container(
                height: 25,
                width: 60,
                decoration: const BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8)
                  )
                ),
                child: Center(
                  child: RichText(
                      text: TextSpan(
                      text: '20% ',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.onPrimary),
                      children: [
                        TextSpan(
                            text: '0ff',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Theme.of(context).colorScheme.onPrimary)
                        )
                      ]
                  )),
                ),
              )
          )
        ],
      ),
    );
  }
}
