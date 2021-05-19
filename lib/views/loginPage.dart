import 'dart:ui';

import 'package:enigna_flutter_test/widgets/gradientButton.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Member Login",style: loginHeaderStyle,),
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.only(right: 30,left: 30),
                    child: TextFormField(textAlign: TextAlign.center,
                      cursorHeight: 15,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                        border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25.0)),
                            borderSide: BorderSide(color: Colors.white, width: 0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25.0)),
                            borderSide: BorderSide(color: Colors.white, width: 0),
                          ),
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: "Enter email address",
                        fillColor: Colors.white,
                        filled: true
                        )
                    ),
                  ),
                  SizedBox(height: 20,),
                  GradientButtonWidget("Get OTP"),
                  SizedBox(height: 10,),
                  Text("A four digit OTP will be sent via email to sign in",style: loginNoteStyle,)
                ],
              )
            ),
          ),
        ),
      ),
    );
  }
}
