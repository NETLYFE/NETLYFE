
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netlyfe/Utils/strings.dart';
import 'package:netlyfe/services/net_theme.dart';
import 'package:netlyfe/services/theme_services.dart';
import 'package:netlyfe/views/login_view.dart';
import 'package:netlyfe/widgets/custom_button.dart';
class ProfileFragment extends StatefulWidget {
  const ProfileFragment({Key? key}) : super(key: key);

  @override
  _ProfileFragmentState createState() => _ProfileFragmentState();
}

class _ProfileFragmentState extends State<ProfileFragment>with AutomaticKeepAliveClientMixin{
  bool getNoti = false;
  bool isdarkmode = Get.isDarkMode ? true : false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              expandedHeight: 140,
              pinned: true,
              backgroundColor: appColor,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                title: Text('Settings',style: TextStyle(color: Colors.white,),),
                titlePadding: EdgeInsets.only(left: 20,bottom: 20,right: 20),
              ),
            ),

            SliverToBoxAdapter(
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(top: 15,bottom: 20),
                child: Column(
                  children: [
                    SettingsCard(
                        widget: Column(
                          children: [
                            SettingTile(
                                circlebgColor: StringData.pneumoColor,
                                circleIcon: Icons.account_circle_outlined,
                                titleText: "Profile",
                                trailingWidget: const Icon(Icons.arrow_forward_ios,size: 18,),
                            ),
                            const _Divider(),
                            SettingTile(
                                circlebgColor: StringData.cont1Color,
                                circleIcon: Icons.backspace_outlined,
                                titleText: "Logout",
                                trailingWidget: const Icon(Icons.arrow_forward_ios,size: 18,),
                                onTap: (){
                                  openLogoutDialogue(context);
                                 }
                            )
                          ],
                        )
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    //GENERAL SETTINGS CARD//
                    SettingsCard(
                        widget: Column(
                          // crossAxisAlignment:CrossAxisAlignment.center,
                          children: [
                            const Align(
                              alignment:Alignment.topLeft,
                              child: Text(
                                'General Settings',
                                style: TextStyle(
                                  fontSize:  15,
                                  fontWeight:  FontWeight.w600,
                                  letterSpacing: -0.7,
                                  wordSpacing: 1
                              ),),
                            ),
                            const SizedBox(height: 15,),
                            SettingTile(
                                circlebgColor: appColor,
                                circleIcon: CupertinoIcons.bell,
                                titleText: "Get Notifications",
                                trailingWidget: Switch(
                                   activeColor: appColor,
                                    value: getNoti,
                                    onChanged: (bool value){
                                      setState(() {
                                        getNoti = value;
                                      });
                                    }
                                ),
                            ),
                            const _Divider(),
                            SettingTile(
                                circlebgColor: Colors.blueGrey,
                                circleIcon: Theme.of(context).brightness == Brightness.dark ?
                                Icons.wb_sunny : Icons.nightlight,
                                titleText: Theme.of(context).brightness == Brightness.dark
                                    ? "Light Mode" : "Dark Mode",
                                trailingWidget: const Icon(Icons.arrow_forward_ios,size: 18,),
                                onTap: (){
                                  ThemeServices().toggleTheme();
                                },
                            ),
                            const _Divider(),
                            SettingTile(
                                circlebgColor: Colors.purpleAccent,
                                circleIcon: CupertinoIcons.padlock,
                                titleText: "Privacy Policy",
                                trailingWidget: const Icon(Icons.arrow_forward_ios,size: 18,),
                            )
                          ],
                        )
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    //SOCIAL SETTINGS CARD//
                    SettingsCard(
                        widget: Column(
                          children: [
                            const Align(
                              alignment:Alignment.topLeft,
                              child: Text(
                                'Social Settings',
                                style: TextStyle(
                                    fontSize:  15,
                                    fontWeight:  FontWeight.w600,
                                    letterSpacing: -0.7,
                                    wordSpacing: 1
                                ),),
                            ),
                            const SizedBox(height: 15),
                            SettingTile(
                                circlebgColor: Colors.redAccent.shade100,
                                circleIcon: CupertinoIcons.mail,
                                titleText: "Contact Us",
                                trailingWidget: const Icon(Icons.arrow_forward_ios,size: 18,),
                            ),
                            const _Divider(),
                            SettingTile(
                              circlebgColor: Colors.blueAccent,
                              circleIcon: Icons.facebook_outlined,
                              titleText: "Facebook Page",
                              trailingWidget: const Icon(Icons.arrow_forward_ios,size: 18,),
                            ),
                            const _Divider(),
                            SettingTile(
                              circlebgColor: Colors.orangeAccent.shade200,
                              circleIcon: Icons.link,
                              titleText: "Our Website",
                              trailingWidget: const Icon(Icons.arrow_forward_ios,size: 18,),
                            ),
                            const _Divider(),
                            SettingTile(
                              circlebgColor: Colors.redAccent,
                              circleIcon: CupertinoIcons.video_camera,
                              titleText: "Youtube Channel",
                              trailingWidget: const Icon(Icons.arrow_forward_ios,size: 18,),
                            ),



                          ],
                        )
                    )

                  ],
                ),
              ),
            )
          ],
        )
    );
  }
  @override
  bool get wantKeepAlive => true;
}

class _Divider extends StatelessWidget {
  const _Divider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 0.0,
      thickness: 0.2,
      indent: 50,
      color: Colors.grey[400],
    );
  }
}

class SettingsCard extends StatelessWidget {
  final Widget widget;
  const SettingsCard({Key? key, required this.widget}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: context.theme.backgroundColor
      ),
      child: widget,
    );
  }
}

void openLogoutDialogue(BuildContext ctx){
  showDialog(
      context: ctx,
      builder: (context) {
        return AlertDialog(
          content: const Text(StringData.logoutmsg),
          title: const Text(StringData.logouttitle),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel')),
            TextButton(
                onPressed: () async {
                  Navigator.pop(context);
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const LoginView())
                  );
                },
                child: const Text('Logout')),
          ],
        );
      });
}

class SettingTile extends StatelessWidget {
  final Color circlebgColor;
  final IconData circleIcon;
  final String titleText;
  Function()? onTap;
  Widget? trailingWidget;

   SettingTile({Key? key,
  required this.circlebgColor,
  required this.circleIcon,
  required this.titleText,
  this.trailingWidget,this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.all(0),
      leading: CircleAvatar(
        backgroundColor: circlebgColor,
        radius: 18,
        child: Icon(circleIcon,size: 18,color: Colors.white,),
      ),
      title: Text(
        titleText,
        style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        // color: Colors.black
      ),),
      trailing: trailingWidget,
    );
  }
}






