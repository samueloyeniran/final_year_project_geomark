import 'package:flutter/material.dart';
import 'package:geomark/components/AppColor.dart';
import 'package:geomark/components/MyButton.dart';
import 'package:go_router/go_router.dart';
//import 'package:geomark/pages/registerPage.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.background,
        body: Container(
          padding: EdgeInsets.only(top: 100, left: 20, right: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF000000).withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  height: 100,
                  width: 100,
                  child: Icon(
                    Icons.schedule_outlined,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ),
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
                "Track time and stay connected",
                style: TextStyle(fontSize: 20, color: AppColors.textSecondary),
              ),
              SizedBox(height: 200),
              Mybutton(
                text: "Get Started",
                onPressed: () {
                  context.go('/signinpage');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
