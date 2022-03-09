import 'package:flutter/material.dart';
import 'package:netlyfe/Utils/strings.dart';

class AppointmentContainer extends StatelessWidget {
  const AppointmentContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Container(
            width: MediaQuery.of(context).size.width * 0.85,
            height: 148,
            decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: const BorderRadius.all(Radius.circular(12)))),
        Container(
          width: MediaQuery.of(context).size.width * 1,
          height: 140,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: StringData.appThemeColor1),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        image: DecorationImage(
                            image: AssetImage(StringData.cdoc),
                            fit: BoxFit.cover)),
                  ),
                  title: Text(
                    "Dr Ntiamoah Opoku Ware",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                  subtitle: const Text("General Practitioner",
                      style: TextStyle(color: StringData.smallTextColor)),
                  trailing: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).colorScheme.onPrimary),
                    child: const Center(
                      child: Icon(Icons.arrow_forward_outlined,
                          color: StringData.appThemeColor1, size: 16),
                    ),
                  ),
                ),
                const Divider(
                  height: 1,
                  indent: 25,
                  endIndent: 25,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: ListTile(
                    minLeadingWidth: 5,
                    leading: Icon(
                      Icons.schedule_outlined,
                      color: StringData.smallTextColor,
                    ),
                    title: Text("Friday, March 27 at 08:000 - 09:00",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w500)),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
