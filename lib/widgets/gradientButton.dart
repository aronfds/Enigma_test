import 'package:enigna_flutter_test/views/landingPage.dart';
import 'package:flutter/material.dart';

class GradientButtonWidget extends StatelessWidget {
  final String buttonText;
  GradientButtonWidget(this.buttonText);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/1.9,
      height: 35,
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color(0xFFfbab66),
          ),
          BoxShadow(
            color: Color(0xFFf7418c),
          ),
        ],
        gradient: new LinearGradient(
            colors: [Color(0xFFf7418c),Color(0xFFfbab66),],
            begin: const FractionalOffset(0, 0.6),
            end: const FractionalOffset(0, 0.0),
            stops: [0.0, 1.0],
            ),
      ),
      child: MaterialButton(
          highlightColor: Colors.transparent,
          splashColor: Color(0xFFf7418c),
          //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
          child: Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 42.0),
            child: Text(
              buttonText,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600),
            ),
          ),
          onPressed: (){
          Navigator.of(context).push(
              new MaterialPageRoute(builder: (context) => new LandingPage()));
          }),
    );
  }
}