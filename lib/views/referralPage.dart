import 'dart:ui';

import 'package:enigna_flutter_test/widgets/menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ReferralPage extends StatefulWidget {
  @override
  _ReferralPageState createState() => _ReferralPageState();
}

class _ReferralPageState extends State<ReferralPage> with SingleTickerProviderStateMixin {
  AnimationController _drawerSlideController;

  void initState() {
    super.initState();
    _drawerSlideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(gift,height: 40,width: 40,),
                Text(" Refer and Earn",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25
                ),)
              ],
            ),
            SizedBox(height: 50,),
            Text("Refer your friends to Super Power. Its a win-win we'll give you and your friends up to £50 each, to say thanks when they join through your referral link. They save, you save and we all help protect the planet.",textAlign: TextAlign.center
              ,),
            SizedBox(height: 20,),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        partyBackground),
                    fit: BoxFit.cover),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Padding(
                    padding: const EdgeInsets.only(left:30.0,right: 30.00),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      decoration: new BoxDecoration(
                        shape: BoxShape.rectangle,
                        boxShadow: [
                          BoxShadow(color: Colors.grey[100].withOpacity(0.5),),
                        ],
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Center(child: Text("Hurry! Refer a Friend Now",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text("Heres your personal link",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12
                  ),),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        height: 35,
                        width: MediaQuery.of(context).size.width/2,
                        decoration: new BoxDecoration(
                          shape: BoxShape.rectangle,
                          boxShadow: [
                            BoxShadow(color: Colors.grey[100].withOpacity(1),),
                          ],
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(CupertinoIcons.link,size: 12,),
                            Text("superpower.co.uk/refer/realgifts",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.all(10),
                          height: 35,
                          width: 45,
                          decoration: new BoxDecoration(
                            shape: BoxShape.rectangle,
                            boxShadow: [
                              BoxShadow(color: Colors.green,),
                            ],
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child:Center(
                            child: Icon(Icons.send,size: 15,color: Colors.white,),
                          )
                      ),
                      Container(
                          padding: EdgeInsets.all(10),
                          height: 35,
                          width: 45,
                          decoration: new BoxDecoration(
                            shape: BoxShape.rectangle,
                            boxShadow: [
                              BoxShadow(color: Colors.blue,),
                            ],
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child:Center(
                              child: Image.asset(twitter)
                          )
                      ),
                      Container(
                          padding: EdgeInsets.all(10),
                          height: 35,
                          width: 45,
                          decoration: new BoxDecoration(
                            shape: BoxShape.rectangle,
                            boxShadow: [
                              BoxShadow(color: Colors.blueAccent[400],),
                            ],
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child:Center(
                              child: Image.asset(fb)
                          )
                      ),

                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 45,
                    width: MediaQuery.of(context).size.width/2,
                    decoration: new BoxDecoration(
                      shape: BoxShape.rectangle,
                      boxShadow: [
                        BoxShadow(color: Colors.grey[100].withOpacity(0.7),),
                      ],
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Center(child: Text("Refer Super Power to your friends.\nyou get £50, they get £50 Each Time.",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500),textAlign: TextAlign.center,)),
                  ),
                  SizedBox(height: 10,),
                  Text("How it Works",style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 10,),
                  Text("Invite your friends to sign up, once their switch\ncompletes after 21 days you'll both get your\nrewards.",style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold
                  ),
                    textAlign: TextAlign.center,),
                  SizedBox(height: 20,),
                  Container(
                    height: 150,
                    width: 210,
                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          height: 120,
                          width: MediaQuery.of(context).size.width/2.2,
                          decoration: new BoxDecoration(
                            shape: BoxShape.rectangle,
                            border: Border.all(color: Colors.white,width: 6),
                            boxShadow: [
                              BoxShadow(color: Colors.indigo,),
                            ],
                            borderRadius: BorderRadius.circular(60.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("My total rewards",style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Colors.pink[50]
                              ),),
                              SizedBox(height: 5,),
                              Text("£50",style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black
                              ),),
                              SizedBox(height: 3,),
                              Text("My rewards this month",style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.pink[50]
                              ),),
                              SizedBox(height: 5,),
                              Text("£50",style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black
                              ),),
                              SizedBox(height: 2,),
                              Text("See my referrals",style: TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black
                              ),),


                            ],
                          ),
                        ),
                        Positioned(
                          right: 0,
                            bottom: 0,
                            child: Image.asset(openBox,height: 80,))
                      ],
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

