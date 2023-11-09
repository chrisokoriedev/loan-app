import 'package:flutter/material.dart';
import 'package:mobile_app_challenge/Screens/login-screen.dart';

class First extends StatelessWidget {
  const First({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
             body: SingleChildScrollView(
               child: Column(
                 children:  [
                   Image.asset('Assets/images/Office work 2.png'),
                  const  Text('Welcome to Ghostlamp', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),),
                  const  SizedBox(height: 20,),
                   const Text('A workplace to over 12 Million influencers', style: TextStyle(color: Colors.black45, fontSize: 18),),
                  const  SizedBox(height: 15,),
                  const  Text('around the global of the world', style: TextStyle(color: Colors.black45, fontSize: 18),),
                   const SizedBox(height: 40,),

                  GestureDetector(
                    onTap: () {
                      // Navigate to the new page when the container is tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Loginscreen()),
                      );
                    },
                    child: Container(
                      height: 50,
                      width: 330,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        color: Colors.blue,
                      ),
                      child: const Center(
                          child: Text('Login Now', style: TextStyle(color: Colors.white, fontSize: 20),)
                      ),
                    ),
                  ),

                  const  SizedBox(height: 15,),
                   Container(
                     height: 50,
                     width: 330,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       color: Colors.white,
                       boxShadow: [
                         BoxShadow(
                           color: Colors.grey.withOpacity(0.5),
                           spreadRadius: 5,
                           blurRadius: 7,
                           offset: Offset(0,3),
                         )
                       ]


                     ),
                     child: const Center(
                         child: Text('Create Account', style: TextStyle(color: Colors.black, fontSize: 20),)
                     ),
                   ),
                 ],

               ),
             ),
    );
  }
}
