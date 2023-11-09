
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Users.dart';
import 'home.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  List<Users> usersList = [];

  String? username = '';

  @override
  void initState() {
    super.initState();
    fetchUserAccess();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back, color: Colors.blue)),
        title: const Text(
          "Back",
          style: TextStyle(color: Colors.blue),
        ),
        titleSpacing: -15,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Keep Connected",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),

                const Text(
                  "Enter your email address and password to",
                  style: TextStyle(color: Colors.black45, fontSize: 18),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "get access to your account.",
                  style: TextStyle(color: Colors.black45, fontSize: 18),
                ),

                const SizedBox(
                  height: 40,
                ),

                Container(
                  width: 370,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ]),

                  //Textformfield
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email Address',
                      hintText: 'Enter your email',
                      prefixIcon: Icon(Icons.email),
                      suffixIcon: Icon(Icons.gpp_good),
                      border: InputBorder.none,
                      // focusedBorder: OutlineInputBorder(
                      //
                      // ),

                      // contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                    ),
                    validator: (value) {
                      if (!usersList.map((e) => e.email).contains(value)) {
                        return 'User not found';
                      }

                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: 370,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ]),
                  child: TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      prefixIcon: Icon(
                        Icons.lock,
                      ),
                      suffixIcon: Icon(Icons.gpp_good),
                      border: InputBorder.none,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                    ),
                    validator: (value) {
                      if (value != 'password') {
                        return 'password  Incorrect';
                      }
                      // Add additional validation if needed
                      return null;
                    },
                  ),
                ),

                //Login and Create account button
                const SizedBox(
                  height: 100,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to the new page when the container is tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Loginscreen()),
                    );
                  },
                  child: GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        usersList.map((e) => username = e.username);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Home(
                                    username: username!,
                                  )),
                        );
                      }
                    },
                    // print(emailController.value.text) ;

                    child: Container(
                      height: 65,
                      width: 370,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue,
                      ),
                      child: const Center(
                          child: Text(
                        'Get Login',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),

                Container(
                  height: 65,
                  width: 370,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        )
                      ]),
                  child: const Center(
                      child: Text(
                    'Create Account',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void fetchUserAccess() async {
    const url = 'https://jsonplaceholder.typicode.com/users';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      usersList = data
          .map(
              (user) => Users(email: user['email'], username: user['username']))
          .toList();
    }
  }
}
