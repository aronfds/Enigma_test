import 'dart:ui';

import 'package:flutter/material.dart';

import '../constants.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("Flutter Test",style: loginAppBarTextStyle,textAlign: TextAlign.center,),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    backgroundImage),
                fit: BoxFit.cover),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: Container(
                alignment: Alignment.center,
                color: Colors.grey.withOpacity(0.1),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(partyBackground),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 400,
                width: 350,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 60,
                      right: 90,
                      child: Container(
                        padding: EdgeInsets.only(top: 20),
                        alignment: Alignment.center,
                        decoration: new BoxDecoration(
                          shape: BoxShape.rectangle,
                          boxShadow: [
                            BoxShadow(color: Colors.grey[100].withOpacity(0.9),),
                          ],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        height: 280,
                        width: 180,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Hello!",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 25
                              ),),
                              Text("Sam",style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 50
                              ),),
                              SizedBox(height: 20,),
                              Text("Welcome to flutter\n app",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize:15
                              ),),


                            ],
                          ),
                        ),
                    ),
                    Positioned(
                      left: 5,
                      top:50,
                      child: Image.asset(memojiGirlThumbsUp,height: 150,width: 120,),
                    ),
                    Positioned(
                      right: 20,
                      bottom:50,
                      child: Transform.rotate(
                          angle: - 3.14 / 10,
                          child: Image.asset(thumbsUp,height: 150,width: 120,)),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
