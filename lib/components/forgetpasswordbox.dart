import 'package:flutter/material.dart';
import 'package:geomark/pages/SignInpage.dart';
import 'package:geomark/pages/registerPage.dart';
import 'package:geomark/splashscreen.dart';
//import 'package:geomark/splashscreen.dart';

class Forgetpasswordbox extends StatelessWidget {
  const Forgetpasswordbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10, left: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop(
                MaterialPageRoute(builder: (context) => const Splashscreen()),
              );
            },
            icon: Icon(Icons.arrow_back),
          ),
          Center(
            child: Text(
              "Forget Password?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          SizedBox(height: 5),
          Center(
            child: Text(
              "No Worries, We'll send you reset instruction",
              style: TextStyle(fontSize: 15),
            ),
          ),
          SizedBox(height: 50),
          SizedBox(
            height: 40,
            width: MediaQuery.of(context).size.width,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "EMAIL",
                labelText: "INSTITUTION EMAIL",
                hintStyle: TextStyle(fontSize: 15),
                prefixIcon: Icon(Icons.email),
                enabledBorder: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 30),
          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Registerpage()),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xC0072474),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Create Accoount",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Remember Your Password?",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Signinpage()),
                  );
                },
                child: Text(
                  "sign in here",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xC0072474),
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
