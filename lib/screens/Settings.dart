import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shlop/constants/colors.dart';
import 'package:shlop/constants/textStyling.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackDark,
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: creamLight,
                      size: 25.0,
                    ),
                  ),
                ),
                Text("Settings", style: hSplashTitle),
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.info,
                      color: creamLight,
                      size: 25.0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.0),
            Container(
              padding: EdgeInsets.all(0.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: darkLighter,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15.0, bottom: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Dark mode",
                          style: hNormalText,
                        ),
                        CupertinoSwitch(
                          value: true,
                          onChanged: (value) {},
                          activeColor: creamLight.withOpacity(0.3),
                          thumbColor: creamLight,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: creamLight.withOpacity(0.2),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 10.0, bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Theme",
                          style: hNormalText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                color: creamLight,
                              ),
                            ),
                            SizedBox(width: 15.0),
                            Container(
                              padding: EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                color: tealLight,
                              ),
                            ),
                            SizedBox(width: 15.0),
                            Container(
                              padding: EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                color: orangeLight,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25.0),
            Container(
              width: double.infinity,
              child: Text(
                "Support",
                textAlign: TextAlign.start,
                style: hSmallTitleText,
              ),
            ),
            SizedBox(height: 15.0),
            Container(
              padding: EdgeInsets.all(0.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: darkLighter,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  SettingsTab(
                    name: "Report a problem",
                    info: "Tell us about issues with the app",
                    icon: CupertinoIcons.chevron_right,
                    dividerStatus: true,
                  ),
                  SettingsTab(
                    name: "Feedback",
                    info: "Send us your thoughts and ideas",
                    icon: CupertinoIcons.chevron_right,
                    dividerStatus: false,
                  ),
                ],
              ),
            ),
            SizedBox(height: 25.0),
            Container(
              width: double.infinity,
              child: Text(
                "App",
                textAlign: TextAlign.start,
                style: hSmallTitleText,
              ),
            ),
            SizedBox(height: 15.0),
            Container(
              padding: EdgeInsets.all(0.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: darkLighter,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  SettingsTab(
                    name: "Rate us",
                    info: "Rate us to unlock a hidden feature.",
                    icon: CupertinoIcons.chevron_right,
                    dividerStatus: true,
                  ),
                  SettingsTab(
                    name: "Privacy",
                    info: "How do we handle your data",
                    icon: CupertinoIcons.chevron_right,
                    dividerStatus: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsTab extends StatefulWidget {
  final String name;
  final IconData icon;
  final bool dividerStatus;
  final String info;

  SettingsTab({
    required this.name,
    required this.icon,
    required this.dividerStatus,
    required this.info,
  });

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  var paddingTop = 15.0;

  var paddingBottom = 5.0;

  calculatePadding() {
    if (widget.dividerStatus == true) {
      paddingTop = 20.0;
      paddingBottom = 10.0;
    } else {
      paddingTop = 10.0;
      paddingBottom = 20.0;
    }
  }

  @override
  void initState() {
    calculatePadding();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 15.0,
            right: 15.0,
            top: paddingTop,
            bottom: paddingBottom,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: hNormalText,
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    widget.info,
                    style: hNormalTextSmall,
                  ),
                ],
              ),
              Icon(
                widget.icon,
                size: 20.0,
                color: creamLight.withOpacity(0.6),
              ),
            ],
          ),
        ),
        widget.dividerStatus == true
            ? Divider(
                color: creamLight.withOpacity(0.2),
                endIndent: 0.0,
                indent: 0.0,
              )
            : Container(),
      ],
    );
  }
}
