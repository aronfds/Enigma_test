import 'dart:ui';

import 'package:enigna_flutter_test/widgets/menu.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({
    Key key,
  }) : super(key: key);
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> with SingleTickerProviderStateMixin{
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
              Text("Historic Meter Reads",style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 30,),
              Container(
                padding: EdgeInsets.only(top: 20,bottom: 20),
                width: MediaQuery.of(context).size.width,
                decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  boxShadow: [
                    BoxShadow(color: Colors.grey[100].withOpacity(0.6),),
                  ],
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20),topRight: Radius.circular(20)),
                ),
                child: DataTable(
                  columns: [
                    DataColumn(label:Text(
                        'Bill Date',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)

                    )),
                    DataColumn(label: Text(
                        'Bill Amount',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)

                    )),
                    DataColumn(label:Text(
                        'Due Date',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)

                    )),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text('2021.09.01',style: dataCellPayment,)),
                      DataCell(Align(
                          alignment: Alignment.centerLeft,
                          child: Text('2000.00 £',style: dataCellPayment,))),
                      DataCell(Align(
                          alignment: Alignment.centerRight,
                          child: Text('2021.09.01',style: dataCellPayment,))),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('2021.09.01',style: dataCellPayment,)),
                      DataCell(Align(
                          alignment: Alignment.centerLeft,
                          child: Text('2000.00 £',style: dataCellPayment,))),
                      DataCell(Align(
                          alignment: Alignment.centerRight,
                          child: Text('2021.09.01',style: dataCellPayment,))),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('2021.09.01',style: dataCellPayment,)),
                      DataCell(Align(
                          alignment: Alignment.centerLeft,
                          child: Text('2000.00 £',style: dataCellPayment,))),
                      DataCell(Align(
                          alignment: Alignment.centerRight,
                          child: Text('2021.09.01',style: dataCellPayment,))),
                    ]),

                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 100,
                  height: 30,
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
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
                      Text("View",style: TextStyle(
                          color: Colors.white,
                          fontSize: 12
                      ),),
                      SizedBox(width: 5,),
                      Icon(Icons.chevron_right,color: Colors.white,size: 15,)
                    ],
                  ),

                ),
              ),
              SizedBox(height: 30,),
              Container(
                height: 150,
                width: 360,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Text("Make a Card Payment",style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),),
                        SizedBox(height: 40,),
                        Padding(
                          padding: const EdgeInsets.only(left:30.0,right: 30.00),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            height: 80,
                            width: 360,
                            decoration: new BoxDecoration(
                              shape: BoxShape.rectangle,
                              boxShadow: [
                                BoxShadow(color: Colors.grey[100].withOpacity(0.6),),
                              ],
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right:70.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text("Total Balance",style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400
                                      ),),
                                      SizedBox(height: 5,),
                                      Text("£ 1500.00",style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold
                                      ),)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      right: 40,
                        top: 40,
                        child: Image.asset(moneyBag,height: 100,))
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Text("Setup your payment method",style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 10,),
              Container(
                width: 200,
                height: 30,
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
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
                child: Center(
                  child: Text("Setup Direct Debit",style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600
                  ),),
                ),

              ),
              SizedBox(height: 10,),
              Text("OR",style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                    borderRadius: new BorderRadius.all(Radius.circular(10)),
                    child: Container(
                      color: Colors.white,
                        child: Image.asset(americanExpress,height: 30,width: 60,)),
                  ),
                  ClipRRect(
                    borderRadius: new BorderRadius.all(Radius.circular(10)),
                    child: Container(
                      color: Colors.white,
                        child: Image.asset(mastercard,height: 30,width: 60,)),
                  ),
                  ClipRRect(
                    borderRadius: new BorderRadius.all(Radius.circular(10)),
                    child: Container(
                      color: Colors.white,
                        child: Image.asset(visa,height: 30,width: 60,)),
                  ),
                  ClipRRect(
                    borderRadius: new BorderRadius.all(Radius.circular(10)),
                    child: Container(
                        color: Colors.white,
                        child: Image.asset(paypal,height: 30,width: 60,)),
                  ),
                ],
              )



            ],
          ),
        ));
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

