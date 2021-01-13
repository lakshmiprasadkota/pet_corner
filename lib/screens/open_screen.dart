import 'package:flutter/material.dart';

import 'package:pet_corner/screens/home_screen.dart';

class OpenScreen extends StatefulWidget {
  @override
  _OpenScreenState createState() => _OpenScreenState();
}

class _OpenScreenState extends State<OpenScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 450,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                  image: DecorationImage(
                      image: AssetImage("assets/images/lady.png"),
                      fit: BoxFit.cover),
                ),
              ),
              Container(


                child: Column(
                  children: [
                    SizedBox(height: 70,),
                    Container(

                      child: Text(
                        "Make a new Friend",
                        style: TextStyle(
                            color: Color(0xFF3D015B),
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                    ),
                    SizedBox(height: 21,),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Center(child: Text("Find the best pet in your location and get them in your arms",style: TextStyle(color: Color(0xff222222),fontSize: 18,fontWeight: FontWeight.w400),))),
                    SizedBox(height: 68,),

                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xff3D015B),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0x333B83FC),
                                  offset: Offset(0, 5),
                                  blurRadius: 10)
                            ]),
                        child: Stack(
                          children: [
                            Center(child: Text("sign in" ,style: TextStyle(color: Colors.white ,fontSize: 14),) ),
                            Positioned(
                              right: 4,
                              top: 4,
                              bottom: 4,
                              child: Container(
                                height: 42,
                                width: 42,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/forward.png")),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Stack(
                    //   children: [
                    //     Positioned(
                    //       top: 70,
                    //       child: Container(
                    //         padding: EdgeInsets.only(left: 19, right: 19),
                    //         child: Text(
                    //           "Make a new Friend",
                    //           style: TextStyle(
                    //               color: Color(0xFF3D015B),
                    //               fontWeight: FontWeight.bold,
                    //               fontSize: 24),
                    //         ),
                    //       ),
                    //     ),
                    //     Positioned(
                    //       top: 115,
                    //       child: Container(
                    //         height: 100,
                    //         width: 330,
                    //         child: Text(
                    //           "Find the best pet in your location and get them in your arms",
                    //           style: TextStyle(
                    //               color: Color(0xFF222222),
                    //               fontWeight: FontWeight.w400,
                    //               fontSize: 18),
                    //         ),
                    //       ),
                    //     ),
                    //     Positioned(
                    //       top: 231,
                    //       child: InkWell(
                    //         onTap: () {
                    //           Navigator.push(
                    //               context,
                    //               MaterialPageRoute(
                    //                   builder: (context) => HomePage()));
                    //         },
                    //         child: Container(
                    //           height: 50,
                    //           width: double.infinity,
                    //           decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(20),
                    //               color: Color(0xffFF8701),
                    //               boxShadow: [
                    //                 BoxShadow(
                    //                     color: Color(0x333B83FC),
                    //                     offset: Offset(0, 5),
                    //                     blurRadius: 10)
                    //               ]),
                    //           child: Stack(
                    //             children: [
                    //               Center(child: Text("sign in")),
                    //               Positioned(
                    //                 right: 4,
                    //                 top: 4,
                    //                 bottom: 4,
                    //                 child: Container(
                    //                   height: 42,
                    //                   width: 42,
                    //                   decoration: BoxDecoration(
                    //                     image: DecorationImage(
                    //                         image: AssetImage(
                    //                             "assets/images/forward.png")),
                    //                   ),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
