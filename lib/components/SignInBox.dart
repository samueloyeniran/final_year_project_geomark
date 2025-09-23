import 'package:flutter/material.dart';
import 'package:geomark/components/myTextField.dart';
import 'package:geomark/pages/forgettenPasswordPage.dart';
import 'package:geomark/pages/homePage.dart';
import 'package:geomark/pages/registerPage.dart';
//import 'package:geomark/pages/registerPage.dart';

class Signinbox extends StatelessWidget {
  const Signinbox({super.key});

  get emailController => null;

  get passwordController => null;

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
          IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
          Center(
            child: Text(
              "Welcome back",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          SizedBox(height: 5),
          Center(
            child: Text(
              "sign in to continue to your dashboard",
              style: TextStyle(fontSize: 15),
            ),
          ),
          SizedBox(height: 20),
          Mytextfield(
            controller: emailController,
            hintText: "Email",
            obscureText: false,
            icon: Icons.email,
          ),
          SizedBox(height: 40),
          Mytextfield(
            hintText: "password",
            obscureText: true,
            icon: Icons.lock,
            controller: passwordController,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Forgettenpasswordpage(),
                    ),
                  );
                },
                child: Text(
                  "Forgot Your Password",
                  style: TextStyle(color: const Color.fromARGB(255, 3, 31, 54)),
                ),
              ),
            ],
          ),
          SizedBox(height: 50),
          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xC0072474),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  // Handle sign-in logic here
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Homepage()),
                  );
                },
                child: Text(
                  "Sign in",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account?",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Registerpage(),
                    ),
                  );
                },
                child: Text(
                  "sign up here",
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
