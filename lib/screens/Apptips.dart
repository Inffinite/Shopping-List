import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shlop/constants/textStyling.dart';
import 'package:shlop/screens/Dashboard.dart';

import '../constants/colors.dart';

class Apptips extends StatefulWidget {
  const Apptips({super.key});

  @override
  State<Apptips> createState() => _ApptipsState();
}

class _ApptipsState extends State<Apptips> {
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
            Container(
              padding: EdgeInsets.all(30.0),
              decoration: BoxDecoration(
                color: creamLight.withOpacity(0.2),
                borderRadius: BorderRadius.circular(900.0),
              ),
              child: Icon(
                CupertinoIcons.money_dollar,
                size: 80.0,
                color: creamLight,
              ),
            ),
            SizedBox(height: 30.0),
            Text(
              "It's all free",
              style: hSplashTitle,
            ),
            SizedBox(height: 15.0),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 40.0,
              ),
              child: Text(
                "No ads or extortionate subscription fees because why would anyone pay to make a grocery list!",
                textAlign: TextAlign.center,
                style: hNormalText,
              ),
            ),
            SizedBox(height: 30.0),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(
                bottom: 10.0,
                left: 20.0,
                right: 20.0,
              ),
              child: CupertinoButton(
                borderRadius: BorderRadius.circular(6.0),
                color: creamLight,
                child: Text(
                  "Continue",
                  style: TextStyle(color: blackDark),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Dashboard(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
