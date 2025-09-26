import 'package:flutter/material.dart';
import 'package:geomark/components/MyButton.dart';
import 'package:geomark/components/myTextField.dart';
import 'package:go_router/go_router.dart';

class Mybox extends StatelessWidget {
  Mybox({super.key});

  // Declare controllers as final fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10, left: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      //height: 600,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () => context.pop(),
            icon: Icon(Icons.arrow_back),
          ),
          Center(
            child: Text(
              "Create Account",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          SizedBox(height: 5),
          Center(
            child: Text("join GEOMARK today", style: TextStyle(fontSize: 15)),
          ),
          SizedBox(height: 10),
          Mytextfield(
            controller: nameController,
            hintText: "NAME",
            obscureText: false,
            icon: Icons.person,
          ),
          SizedBox(height: 20),
          Mytextfield(
            controller: emailController,
            hintText: "INSTITUTION EMAIL",
            obscureText: false,
            icon: Icons.email,
          ),
          SizedBox(height: 20),
          Mytextfield(
            controller: passwordController,
            hintText: "PASSWORD",
            obscureText: true,
            icon: Icons.lock,
          ),
          SizedBox(height: 20),
          Mytextfield(
            controller: confirmPasswordController,
            hintText: "CONFIRM PASSWORD",
            obscureText: true,
            icon: Icons.lock,
          ),
          SizedBox(height: 20),
          Mybutton(
            text: "Create Account",
            onPressed: () {
              // TODO: Add registration logic here
              context.go('/homepage');
            },
          ),
          SizedBox(height: 15),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("already have an account?"),
                GestureDetector(
                  onTap: () => context.go('/signinpage'),
                  child: Text(
                    " Sign in",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xC0072474),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
