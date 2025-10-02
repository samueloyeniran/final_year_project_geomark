import 'package:flutter/material.dart';
import 'package:geomark/components/myTextField.dart';
import 'package:go_router/go_router.dart';
import 'package:geomark/pages/Auth/registerPage.dart';

class Signinbox extends StatefulWidget {
  const Signinbox({super.key});

  @override
  State<Signinbox> createState() => _SigninboxState();
}

class _SigninboxState extends State<Signinbox> {
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
          IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(Icons.arrow_back),
          ),
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
                onTap: () => context.go('/forgotten_password'),
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
              onPressed: () {
                context.go('/homePage');
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
                "Sign in",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
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
                  context.go('/registerpage');
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
