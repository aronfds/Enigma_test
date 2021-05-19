import 'dart:async';
import 'dart:ui';

import 'package:enigna_flutter_test/views/welcomePage.dart';
import 'package:enigna_flutter_test/widgets/menu.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({
    Key key,
  }) : super(key: key);

  @override
  _ExampleStaggeredAnimationsState createState() =>
      _ExampleStaggeredAnimationsState();
}

class _ExampleStaggeredAnimationsState extends State<LandingPage>
    with SingleTickerProviderStateMixin {
   AnimationController _drawerSlideController;

   bool showWelcome = true;

   List<Color> gradientColors = [
     const Color(0xff23b6e6),
        ];

   List<Color> curveColor = [Colors.white];

   bool showAvg = false;

  @override
  void initState() {
    super.initState();
    _drawerSlideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    Future.delayed(const Duration(milliseconds: 2000), () {

        // Here you can write your code
      setState(() {
        // Here you can write your code for open new view
        showWelcome = false;
      });

    });


  }
  @override
  void dispose() {
    _drawerSlideController.dispose();
    super.dispose();
  }

  bool _isDrawerOpen() {
    return _drawerSlideController.value == 1.0;
  }

  bool _isDrawerOpening() {
    return _drawerSlideController.status == AnimationStatus.forward;
  }

  bool _isDrawerClosed() {
    return _drawerSlideController.value == 0.0;
  }

  void toggleDrawer() {
    if (_isDrawerOpen() || _isDrawerOpening()) {
      _drawerSlideController.reverse();
    } else {
      _drawerSlideController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return showWelcome ? WelcomePage() : Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Container(
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
            child: Stack(
              children: [
                _buildContent(),
                _buildDrawer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text("Flutter Test",style: loginAppBarTextStyle,textAlign: TextAlign.center,),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      actions: [
        AnimatedBuilder(
          animation: _drawerSlideController,
          builder: (context, child) {
            return IconButton(
              onPressed: toggleDrawer,
              icon: _isDrawerOpen() || _isDrawerOpening()
                  ? const Icon(
                Icons.clear,
                color: Colors.black,
              )
                  : const Icon(
                Icons.menu,
                color: Colors.black,
              ),
            );
          },
        ),
      ],
    );
  }

   LineChartData mainData() {
     return LineChartData(
       gridData: FlGridData(
         show: false,
         drawVerticalLine: false,
         getDrawingHorizontalLine: (value) {
           return FlLine(
             color: Colors.grey[300],
             strokeWidth: 1,
           );
         },
         getDrawingVerticalLine: (value) {
           return FlLine(
             color: Colors.grey[300],
             strokeWidth: 1,
           );
         },
       ),
       lineTouchData: LineTouchData(
         touchTooltipData: LineTouchTooltipData(
           tooltipBgColor: Colors.grey
         )
       ),
       titlesData: FlTitlesData(
         show: true,
         bottomTitles: SideTitles(
           showTitles: true,
           reservedSize: 20,
           getTextStyles: (value) =>
               TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 10),
           getTitles: (value) {
             switch (value.toInt()) {
               case 1:
                 return 'JAN';
               case 2:
                 return 'FEB';
               case 3:
                 return 'MAR';
               case 4:
                 return 'APR';
               case 5:
                 return 'MAY';
               case 6:
                 return 'JUN';
               case 7:
                 return 'JUL';
               case 8:
                 return 'AUG';
               case 9:
                 return 'SEP';
               case 10:
                 return 'OCT';
               case 11:
                 return 'NOV';
               case 12:
                 return 'DEC';
             }
             return '';
           },
           margin: 8,
         ),
         leftTitles: SideTitles(
           showTitles: true,
           getTextStyles: (value) => const TextStyle(
             color: Colors.black,
             fontWeight: FontWeight.bold,
             fontSize: 15,
           ),
           getTitles: (value) {
             switch (value.toInt()) {
               case 1:
                 return '50';
               case 3:
                 return '250';
               case 5:
                 return '500';
             }
             return '';
           },
           reservedSize: 30,
           margin: 12,
         ),
       ),
       borderData:
       FlBorderData(show: false, border: Border.all(color: const Color(0xff37434d), width: 1)),
       minX: 0,
       maxX: 12,
       minY: 0,
       maxY: 6,
       lineBarsData: [
         LineChartBarData(
           spots: [
             FlSpot(0, 0),
             FlSpot(1, 3),
             FlSpot(2, 2),
             FlSpot(3, 5),
             FlSpot(4, 3.1),
             FlSpot(5, 4),
             FlSpot(6, 3),
             FlSpot(7, 4),
             FlSpot(8, 2),
             FlSpot(9, 3),
             FlSpot(10, 2),
             FlSpot(11, 4),
             FlSpot(12, 3),
           ],
           isCurved: true,
           colors: curveColor,
           barWidth: 1,
           isStrokeCapRound: true,
           dotData: FlDotData(
             show: false,
           ),
           belowBarData: BarAreaData(
             show: true,

             colors: gradientColors.map((color) => color.withOpacity(0.2)).toList(),
           ),
         ),
       ],
     );
   }

  Widget _buildContent() {
    // Put page content here.
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom:10.0),
                  child: Text("Hi Sam, ",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 30
                  ),),
                ),
                Image.asset(kissingGirl,height: 100)
              ],
            ),
            Center(
              child: Text("   How are you doing today ?",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18
              ),),
            ),
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.only(left:20.0,right: 20.00),
              child: Container(
                padding: EdgeInsets.all(10),
                height: 80,
                decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  boxShadow: [
                    BoxShadow(color: Colors.white),
                  ],
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Balance",style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                          ),),
                          Text("£ 99.11",style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text("Your last statement\nwas £ 99.11 on Friday\n3rd January 2021.",style: TextStyle(
                          fontSize: 11
                        ),),
                        Image.asset(moneyBag)
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 40,),
            Container(
              padding: EdgeInsets.all(20),
              height: 350,
              alignment: Alignment.center,
              decoration: new BoxDecoration(
                shape: BoxShape.rectangle,
                boxShadow: [
                  BoxShadow(color: Colors.grey[100].withOpacity(0.6),),
                ],
                borderRadius: BorderRadius.circular(10.0),

              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Energy consumption\nfor the month",style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold

                      ),),
                      Container(
                        width: 100,
                        height: 30,
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
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("view",style: TextStyle(
                                color: Colors.white
                              ),),
                              SizedBox(width: 5,),
                              Icon(Icons.chevron_right,color: Colors.white,)
                            ],
                          ),

                      )
                    ],
                  ),
                  Expanded(
                    child: LineChart(
                      mainData(),
                    ),
                  ),
                ],
              ),

            ),


          ],
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return AnimatedBuilder(
      animation: _drawerSlideController,
      builder: (context, child) {
        return FractionalTranslation(
          translation: Offset(1.0 - _drawerSlideController.value, 0.0),
          child: _isDrawerClosed() ? const SizedBox() : Menu(toggle: toggleDrawer,),
        );
      },
    );
  }
}




