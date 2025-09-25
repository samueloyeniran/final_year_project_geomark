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
        body: Container(
          padding: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Monitor Student's Attendance Here",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
