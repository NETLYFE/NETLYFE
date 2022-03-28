import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:netlyfe/models/drugs_model.dart';
import 'package:netlyfe/services/net_theme.dart';
import 'package:netlyfe/widgets/cached_image_with_dark.dart';

class DrugDetailsView extends StatefulWidget {
  Drugs drugs;
  DrugDetailsView({Key? key, required this.drugs}) : super(key: key);

  @override
  State<DrugDetailsView> createState() => _DrugDetailsViewState();
}

class _DrugDetailsViewState extends State<DrugDetailsView> {
  double _rightPaddingValue = 100;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 100)).then((value) {
      setState(() {
        _rightPaddingValue = 10;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          bottom: true,
          top: false,
          child: Column(
            children: [
              Expanded(
                  child: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    elevation: 0,
                    expandedHeight: 290,
                    systemOverlayStyle: SystemUiOverlayStyle.light,
                    flexibleSpace: FlexibleSpaceBar(
                        background: CustomCacheImageWithDarkFilterFull(
                            imageUrl: widget.drugs.imgUrl!, radius: 0.0)),
                    actions: <Widget>[
                      const SizedBox(
                        width: 15,
                      ),
                      CircleAvatar(
                        radius: 17,
                        backgroundColor: Colors.white.withOpacity(0.6),
                        child: IconButton(
                          alignment: Alignment.center,
                          icon: Icon(Icons.arrow_back_ios_sharp,
                              size: 18, color: Colors.grey[900]),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                      const Spacer(),
                      CircleAvatar(
                        radius: 17,
                        backgroundColor: Colors.white.withOpacity(0.7),
                        child: IconButton(
                            icon: Icon(Icons.shopping_cart_checkout,
                                size: 18, color: Colors.grey[900]),
                            onPressed: () {}),
                      ),
                      const SizedBox(
                        width: 15,
                      )
                    ],
                  ),
                  SliverToBoxAdapter(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("AntiBiotics 200mg",
                                    style: detailstitleStyle),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text("10 tablets", style: detailsubtitleStyle)
                              ],
                            )),
                            Container(
                                alignment: Alignment.center,
                                // height: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: greenkishClr),
                                child: AnimatedPadding(
                                  duration: const Duration(milliseconds: 800),
                                  padding: EdgeInsets.only(
                                      left: 10,
                                      right: _rightPaddingValue,
                                      top: 5,
                                      bottom: 5),
                                  child: Text("Ghc 128.05",
                                      style: buttonTextStyle),
                                )),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text("General Usage",
                            style: detailstitleStyle.copyWith(fontSize: 14)),
                        const SizedBox(height: 5),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.80,
                          child: Text(
                            "Antibiotics, also known as antibacterials, are medications that destroy or slow down the growth of bacteria.",
                            style: detaildescriptionStyle.copyWith(
                                letterSpacing: 0.1),
                            maxLines: 3,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text("Composition",
                            style: detailstitleStyle.copyWith(fontSize: 14)),
                        const SizedBox(height: 5),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.80,
                          child: Text(
                            "maize starch, potassium sorbate, purified talc, stearic acid, povidone, and soluble starch.",
                            style: detaildescriptionStyle.copyWith(
                                letterSpacing: 0.1),
                            maxLines: 3,
                          ),
                        ),
                        const SizedBox(height: 60),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            children: const [
                              Text("Cart Button"),
                              Text("BUY NOW")
                            ],
                          ),
                        )
                      ],
                    ),
                  ))
                ],
              ))
            ],
          )),
    );
  }
}
