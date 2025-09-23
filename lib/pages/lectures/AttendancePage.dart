import 'package:flutter/material.dart';
import 'package:geomark/components/AppColor.dart';

class Attendancepage extends StatelessWidget {
  const Attendancepage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Attenance Page",
            style: TextStyle(
              color: AppColors.appbarTextcolor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppColors.appbarcolor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppColors.appbariconcolor),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
