import 'package:flutter/material.dart';
import 'package:geomark/components/AppColor.dart';
import 'package:geomark/components/SignInBox.dart';
import 'package:geomark/components/box.dart';

class Signinpage extends StatelessWidget {
  Signinpage({super.key});
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                Box(),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    "GEOMARK",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Track your  time and boost productivity",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
                SizedBox(height: 30),
                Signinbox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
