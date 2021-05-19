import 'dart:ui';

import 'package:enigna_flutter_test/widgets/menu.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ReadingPage extends StatefulWidget {
  const ReadingPage({
    Key key,
  }) : super(key: key);

  @override
  _readingPageState createState() => _readingPageState();
}

class _readingPageState extends State<ReadingPage> with SingleTickerProviderStateMixin {

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
        height: 865,
        padding: EdgeInsets.all(20),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Your bill details for the period",style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 80,
                      height: 30,
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
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
                          Text("Jan",style: TextStyle(
                              color: Colors.white,
                              fontSize: 12
                          ),),
                          SizedBox(width: 5,),
                          Icon(Icons.keyboard_arrow_down,color: Colors.white,size: 15,)
                        ],
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
                  padding: EdgeInsets.only(top: 20,bottom: 20),
                  width: MediaQuery.of(context).size.width,
                  decoration: new BoxDecoration(
                    shape: BoxShape.rectangle,
                    boxShadow: [
                      BoxShadow(color: Colors.grey[100].withOpacity(0.6),),
                    ],
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)),
                  ),
                  child: DataTable(
                    columns: [
                      DataColumn(label:Text(
                          'Bill Amount: 44.00 £',
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)

                      )),
                      DataColumn(label: Text(
                          'Due Date:2021.09.01',
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)

                      )),
                    ],
                    rows: [
                      DataRow(cells: [
                        DataCell(Text('Last Month Charges:',style: dataCell,)),
                        DataCell(Align(
                            alignment: Alignment.centerRight,
                            child: Text('£ 2000.00',style: dataCellRight,))),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('When You Paid:',style: dataCell,)),
                        DataCell(Align(
                            alignment: Alignment.centerRight,
                            child: Text('2021.09.01',style: dataCellRight))),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('How You Paid:',style: dataCell,)),
                        DataCell(Align(
                            alignment: Alignment.centerRight,
                            child: Text('DD',style: dataCellRight))),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Unpaid Balance',style: dataCell,)),
                        DataCell(Align(
                            alignment: Alignment.centerRight,
                            child: Text('£ 0.00',style: dataCellRight))),
                      ]),

                      DataRow(cells: [
                        DataCell(Text('Monthly Consumption:',style: dataCell,)),
                        DataCell(Align(
                            alignment: Alignment.centerRight,
                            child: Text('307.67 KWH',style: dataCellRight,))),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Cost of Energy Used\n(Excluding VAT)',style: dataCell,)),
                        DataCell(Align(
                            alignment: Alignment.centerRight,
                            child: Text('2021.09.01',style: dataCellRight))),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('VAT at 5%:',style: dataCell,)),
                        DataCell(Align(
                            alignment: Alignment.centerRight,
                            child: Text('£ 2.95',style: dataCellRight))),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Sub Total Including VAT:',style: dataCell,)),
                        DataCell(Align(
                            alignment: Alignment.centerRight,
                            child: Text('£ 44.95',style: dataCellRight))),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('TOTAL AMOUNT DUE:',style: dataCell,)),
                        DataCell(Align(
                            alignment: Alignment.centerRight,
                            child: Text('£ 44.95',style: dataCellRight))),
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
                        Text("Save PDF",style: TextStyle(
                            color: Colors.white,
                            fontSize: 12
                        ),),
                        SizedBox(width: 5,),
                        Icon(Icons.download_rounded,color: Colors.white,size: 15,)
                      ],
                    ),

                  ),
                )

              ],
            ),
            Positioned(
                bottom: 0,
                left: 40,
                child: Transform.rotate(
                    angle: - 3.14 / 0.8,
                    child: Image.asset(paper,height: 150,width: 120,))),
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

