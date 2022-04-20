import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netlyfe/services/net_theme.dart';
import 'package:netlyfe/test/drug_text.dart';
import 'package:netlyfe/widgets/cached_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DrugTestDetails extends StatefulWidget {
  DrugTest test;
  DrugTestDetails({Key? key, required this.test}) : super(key: key);

  @override
  State<DrugTestDetails> createState() => _DrugTestDetailsState();
}

class _DrugTestDetailsState extends State<DrugTestDetails> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black54),
          backgroundColor: context.theme.backgroundColor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            widget.test.drug_name!,
            style: titleStyle,
          ),
        ),
        body: Stack(children: [
          Column(
            children: [
              Expanded(
                  child: Container(
                color: kWhiteColor,
                child: Container(
                  decoration: const BoxDecoration(
                      color: kBGColor,
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(50))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //AppBar Section of the Page
                      const SizedBox(height: 16),
                      CarouselSlider.builder(
                          options: CarouselOptions(
                              height: 150,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 3),
                              enlargeCenterPage: true,
                              // enlargeStrategy:
                              //     CenterPageEnlargeStrategy.height
                              onPageChanged: (index, reason) {
                                setState(() {
                                  activeIndex = index;
                                });
                              }),
                          itemCount: widget.test.drug_images!.length,
                          itemBuilder: (context, index, realindex) {
                            final imgUrl = widget.test.drug_images![index];
                            return carouselImage(imgUrl, index);
                          }),

                      const SizedBox(
                        height: 24,
                      ),
                      carouselIndicator()
                    ],
                  ),
                ),
              )),
              Expanded(
                  child: Container(
                color: kBGColor,
                child: Container(
                  decoration: const BoxDecoration(
                      color: kWhiteColor,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(50))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.test.drug_name!,
                              style: detailstitleStyle),
                          const SizedBox(height: 5),
                          Text(widget.test.drug_manufact!,
                              style: detailsubtitleStyle.copyWith(
                                  fontStyle: FontStyle.italic)),
                          const SizedBox(height: 25),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: appColor,
                              ),
                              child: Center(
                                child: Text("Add To Cart",
                                    style: detailstitleStyle.copyWith(
                                        color: Colors.white, fontSize: 18)),
                              ),
                            ),

                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ))
            ],
          ),
        ]));
  }

  Widget carouselImage(String imgUrl, int index) => Container(
          child: CachedNetworkImage(
        imageUrl: imgUrl,
        fit: BoxFit.fitHeight,
      ));

  Widget carouselIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: widget.test.drug_images!.length,
        effect: const JumpingDotEffect(
            dotHeight: 10, dotWidth: 10, activeDotColor: appColor),
      );
}
