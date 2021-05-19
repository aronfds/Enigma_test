import 'dart:ui';

import 'package:enigna_flutter_test/widgets/menu.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class UsagePage extends StatefulWidget {
  @override
  _UsagePageState createState() => _UsagePageState();
}

class _UsagePageState extends State<UsagePage> with SingleTickerProviderStateMixin {
  AnimationController _drawerSlideController;

  final Color leftBarColor = const Color(0xff1976d2);
  final Color rightBarColor = const Color(0xFFf7418c);
  final double width = 7;

   List<BarChartGroupData> rawBarGroups;
   List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(barsSpace: 4, x: x, barRods: [
      BarChartRodData(
        y: y1,
        colors: [leftBarColor],
        width: width,
      ),
      BarChartRodData(
        y: y2,
        colors: [rightBarColor],
        width: width,
      ),
    ]);
  }

  void initState() {
    super.initState();
    _drawerSlideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    final barGroup1 = makeGroupData(0, 5, 1);
    final barGroup2 = makeGroupData(1, 12, 5);
    final barGroup3 = makeGroupData(2, 11, 6);
    final barGroup4 = makeGroupData(3, 4, 6);
    final barGroup5 = makeGroupData(4, 14, 2);
    final barGroup6 = makeGroupData(5, 7, 8);
    final barGroup7 = makeGroupData(6, 12, 5);
    final barGroup8 = makeGroupData(7, 3, 9);
    final barGroup9 = makeGroupData(8, 14, 7);
    final barGroup10 = makeGroupData(9, 3, 12);
    final barGroup11 = makeGroupData(10, 10, 5);
    final barGroup12 = makeGroupData(11, 14, 8);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
      barGroup8,
      barGroup9,
      barGroup10,
      barGroup11,
      barGroup12
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
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

  Widget _buildContent() {
    // Put page content here.
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 150,
                  height: 30,
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.white,
                        ),
                      ]
                  ),
                  child: Center(
                    child: Text("Electricity and Gas",style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold
                    ),),
                  ),

                ),
                Container(
                  width: 80,
                  height: 30,
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(20)),
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
                      Text("2021",style: TextStyle(
                          color: Colors.white,
                          fontSize: 12
                      ),),
                      SizedBox(width: 5,),
                      Icon(Icons.keyboard_arrow_down,color: Colors.white,size: 15,)
                    ],
                  ),

                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(20),
              height: 350,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              decoration: new BoxDecoration(
                shape: BoxShape.rectangle,
                boxShadow: [
                  BoxShadow(color: Colors.grey[100].withOpacity(0.6),),
                ],
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: BarChart(
                        BarChartData(
                          maxY: 15,
                          barTouchData: BarTouchData(
                              touchTooltipData: BarTouchTooltipData(
                                tooltipBgColor: Colors.grey,
                                getTooltipItem: (_a, _b, _c, _d) => null,
                              ),
                              touchCallback: (response) {
                                if (response.spot == null) {
                                  setState(() {
                                    touchedGroupIndex = -1;
                                    showingBarGroups = List.of(rawBarGroups);
                                  });
                                  return;
                                }

                                touchedGroupIndex = response.spot.touchedBarGroupIndex;

                                setState(() {
                                  if (response.touchInput is PointerExitEvent ||
                                      response.touchInput is PointerUpEvent) {
                                    touchedGroupIndex = -1;
                                    showingBarGroups = List.of(rawBarGroups);
                                  } else {
                                    showingBarGroups = List.of(rawBarGroups);
                                    if (touchedGroupIndex != -1) {
                                      var sum = 0.0;
                                      for (var rod in showingBarGroups[touchedGroupIndex].barRods) {
                                        sum += rod.y;
                                      }
                                      final avg =
                                          sum / showingBarGroups[touchedGroupIndex].barRods.length;

                                      showingBarGroups[touchedGroupIndex] =
                                          showingBarGroups[touchedGroupIndex].copyWith(
                                            barRods: showingBarGroups[touchedGroupIndex].barRods.map((rod) {
                                              return rod.copyWith(y: avg);
                                            }).toList(),
                                          );
                                    }
                                  }
                                });
                              }),
                          titlesData: FlTitlesData(
                            show: true,
                            bottomTitles: SideTitles(

                              showTitles: true,
                              getTextStyles: (value) => const TextStyle(
                                  color: Colors.black, fontWeight: FontWeight.w500, fontSize: 8),
                              margin: 20,
                              getTitles: (double value) {
                                switch (value.toInt()) {
                                  case 0:
                                    return 'Jan';
                                  case 1:
                                    return 'Feb';
                                  case 2:
                                    return 'Mar';
                                  case 3:
                                    return 'Apr';
                                  case 4:
                                    return 'May';
                                  case 5:
                                    return 'Jun';
                                  case 6:
                                    return 'Jul';
                                  case 7:
                                    return 'Aug';
                                  case 8:
                                    return 'Sep';
                                  case 9:
                                    return 'Oct';
                                  case 10:
                                    return 'Nov';
                                  case 11:
                                    return 'Dec';
                                  default:
                                    return '';
                                }
                              },
                            ),
                            leftTitles: SideTitles(
                              showTitles: true,
                              getTextStyles: (value) => const TextStyle(
                                  color: Colors.black, fontWeight: FontWeight.w500, fontSize: 8),
                              margin: 20,
                              reservedSize: 16,
                              getTitles: (value) {
                                if (value == 0) {
                                  return '£ 100';
                                } else if (value == 2) {
                                  return '£ 500';
                                } else if (value == 4) {
                                  return '£ 1000';
                                } else if (value == 6) {
                                  return '£ 5000';
                                }else if (value == 8) {
                                  return '£ 10000';
                                }else if (value == 10) {
                                  return '£ 50000';
                                }else if (value == 12) {
                                  return '£ 100K';
                                }else if (value == 14) {
                                  return '£ 500K';
                                }else {
                                  return '';
                                }
                              },
                            ),
                          ),
                          borderData: FlBorderData(
                            show: false,
                          ),
                          barGroups: showingBarGroups,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40,),

            Container(
              padding: EdgeInsets.all(10),
              height: 35,
              width: MediaQuery.of(context).size.width/1.5,
              decoration: new BoxDecoration(
                shape: BoxShape.rectangle,
                boxShadow: [
                  BoxShadow(color: Colors.grey[100].withOpacity(1),),
                ],
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                    Icon(Icons.arrow_back_ios_outlined,size: 18,),
                    Text("Usage Details - January",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12
                    ),),
                    Icon(Icons.arrow_forward_ios_outlined,size: 18,)
                ],
              ),
            ),
            SizedBox(height: 40,),
            Container(
              height: 200,
              width: 350,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:30.0,right: 30.00),
                        child: Container(
                          padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                          height: 80,
                          width: MediaQuery.of(context).size.width,
                          decoration: new BoxDecoration(
                            shape: BoxShape.rectangle,
                            boxShadow: [
                              BoxShadow(color: Colors.indigo[500],),
                            ],
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Electricity",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600
                              ),),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("1300 KWH",style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold
                                  ),),
                                  Text("£ 1100",style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold
                                  ),),
                                ],
                              )
                            ],
                          )
                        ),
                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.only(left:30.0,right: 30.00),
                        child: Container(
                            padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                            height: 80,
                            width: MediaQuery.of(context).size.width,
                            decoration: new BoxDecoration(
                              shape: BoxShape.rectangle,
                              boxShadow: [
                                BoxShadow(color: Colors.pinkAccent),
                              ],
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Gas",style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600
                                ),),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("1300 KWH",style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold
                                    ),),
                                    Text("£ 1100",style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold
                                    ),),
                                  ],
                                )
                              ],
                            )
                        ),
                      ),
                    ],
                  ),

                  Positioned(
                    top: 0,
                    right: 25,
                    child: Transform.rotate(
                      angle: - 3.14 / 16,
                      child: Container(
                          padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                          height: 80,
                          width: 150,
                          decoration: new BoxDecoration(
                            shape: BoxShape.rectangle,
                            boxShadow: [
                              BoxShadow(color: Colors.white.withOpacity(0.6),),
                            ],
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 20,
                    right: 25,
                    child: Transform.rotate(
                      angle: - 3.14 / 16,
                      child: Container(
                        padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                        height: 80,
                        width: 150,
                        decoration: new BoxDecoration(
                          shape: BoxShape.rectangle,
                          boxShadow: [
                            BoxShadow(color: Colors.white.withOpacity(0.6),),
                          ],
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
}

