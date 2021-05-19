import 'dart:ui';

import 'package:enigna_flutter_test/widgets/menu.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class UsagePage extends StatefulWidget {
  @override
  _UsagePageState createState() => _UsagePageState();
}

class _UsagePageState extends State<UsagePage> with SingleTickerProviderStateMixin {
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
    return Container();
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

