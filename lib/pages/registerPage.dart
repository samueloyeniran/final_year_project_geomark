import 'package:flutter/material.dart';
import 'package:geomark/components/AppColor.dart';
import 'package:geomark/components/MyBox.dart';
//import 'package:geomark/components/MyButton.dart';
import 'package:geomark/components/box.dart';

class Registerpage extends StatelessWidget {
  const Registerpage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: Center(
            child: const Text("GEOMARK", style: TextStyle(color: Colors.white)),
          ),
          backgroundColor: AppColors.appbarcolor,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 100, left: 20, right: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(child: Box()),
                SizedBox(height: 20),
                Text(
                  "GEOMARK",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "create an account to get started",
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.textSecondary,
                  ),
                ),
                SizedBox(height: 30),
                SingleChildScrollView(child: Mybox()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
