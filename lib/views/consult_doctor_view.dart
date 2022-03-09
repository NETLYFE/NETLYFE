import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netlyfe/Utils/app_name.dart';
import 'package:netlyfe/Utils/bottom_nav_icon_list.dart';
import 'package:netlyfe/Utils/strings.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:netlyfe/widgets/appointment_container.dart';

class ConsultDoctor extends StatefulWidget {
  const ConsultDoctor({Key? key}) : super(key: key);
  @override
  _ConsultDoctorState createState() => _ConsultDoctorState();
}

class _ConsultDoctorState extends State<ConsultDoctor> {
  int choiceselect = 0;
  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          title: const AppName(fontSize: 20, title: 'Consult ', span: 'Doctor'),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.bell))
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
          children: [
            const SearchContainer(),
            const SizedBox(height: 25),
            Text("My Appointment",
                style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const AppointmentContainer(),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Talk to a Doctor",
                    style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w700)),
                const SizedBox(height: 7),
              ],
            ),
            const SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(categoryList.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: ChoiceChip(
                        elevation: 3,
                        label: Text(categoryList[index]),
                        selected: choiceselect == index,
                        selectedColor: StringData.appThemeColor1,
                        onSelected: (bool sel) {
                          setState(() {
                            choiceselect = sel ? index : 0;
                          });
                        },
                        backgroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                        labelStyle: const TextStyle(color: Colors.black),
                      ),
                    );
                  })),
            ),
            const SizedBox(height: 5),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                  children: List.generate(docList.length, (index) {
                return DoctorListContainer(
                  name: docList[index].name,
                  role: docList[index].role,
                  rating: docList[index].ratings,
                  reviews: docList[index].reviews,
                );
              })),
            )
          ],
        ));
  }
}

class DoctorListContainer extends StatelessWidget {
  final String name;
  final String role;
  final double rating;
  final String reviews;
  const DoctorListContainer(
      {Key? key,
      required this.name,
      required this.role,
      required this.rating,
      required this.reviews})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        width: double.infinity,
        height: 130,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.grey.shade300)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage(StringData.cdoc)),
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.transparent,
                      border: Border.all(color: StringData.smallTextColor))),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Theme.of(context).colorScheme.primary)),
                    const SizedBox(height: 3),
                    Text(role,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: StringData.smallTextColor)),
                    const SizedBox(height: 8),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RatingBar.builder(
                            itemBuilder: (context, index) =>
                                const Icon(Icons.star, color: Colors.amber),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                            initialRating: rating,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 15,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                          ),
                          VerticalDivider(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          Text(
                            "$reviews reviews",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: Theme.of(context).colorScheme.surface, width: 0.5)),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search_outlined,
                  size: 18,
                )),
            const Text(
              StringData.consultsearchtext,
              style: TextStyle(fontWeight: FontWeight.w300),
            )
          ],
        ));
  }
}
