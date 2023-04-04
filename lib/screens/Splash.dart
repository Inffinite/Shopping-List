import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shlop/constants/colors.dart';
import 'package:shlop/constants/textStyling.dart';
import 'package:shlop/screens/Apptips.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  loader() {
    var timer = Timer(
        Duration(seconds: 5),
        () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Apptips(),
                ),
              )
            });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loader();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkLighter,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Image(
                  image: AssetImage("assets/cream.png"),
                  height: 150.0,
                ),
                SizedBox(height: 30.0),
                Text(
                  "Happy Shopper",
                  style: hSplashTitle,
                ),
                SizedBox(height: 10.0),
                Text(
                  "Your personal shopping list",
                  style: hNormalText,
                ),
                SizedBox(height: 50.0),
                CupertinoActivityIndicator(
                  color: creamLight,
                  radius: 15.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
