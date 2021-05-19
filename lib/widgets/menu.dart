import 'dart:ui';

import 'package:enigna_flutter_test/views/landingPage.dart';
import 'package:enigna_flutter_test/views/paymentPage.dart';
import 'package:enigna_flutter_test/views/readingPage.dart';
import 'package:enigna_flutter_test/views/referralPage.dart';
import 'package:enigna_flutter_test/views/usagePage.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class Menu extends StatefulWidget {

  const Menu({this.toggle});

  final VoidCallback toggle;

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> with SingleTickerProviderStateMixin {
  static const _menuTitles = [
    'Landing Page',
    'Reading',
    'Payment',
    'Referral',
    'Usage',
    'About Us',
  ];


  static const _initialDelayTime = Duration(milliseconds: 50);
  static const _itemSlideTime = Duration(milliseconds: 250);
  static const _staggerTime = Duration(milliseconds: 50);
  static const _buttonDelayTime = Duration(milliseconds: 150);
  static const _buttonTime = Duration(milliseconds: 500);
  final _animationDuration = _initialDelayTime +
      (_staggerTime * _menuTitles.length) +
      _buttonDelayTime +
      _buttonTime;

  AnimationController _staggeredController;
  final List<Interval> _itemSlideIntervals = [];
  Interval _buttonInterval;


  @override
  void initState() {
    super.initState();

    _createAnimationIntervals();

    _staggeredController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..forward();
  }

  void _createAnimationIntervals() {
    for (var i = 0; i < _menuTitles.length; ++i) {
      final startTime = _initialDelayTime + (_staggerTime * i);
      final endTime = startTime + _itemSlideTime;
      _itemSlideIntervals.add(
        Interval(
          startTime.inMilliseconds / _animationDuration.inMilliseconds,
          endTime.inMilliseconds / _animationDuration.inMilliseconds,
        ),
      );
    }

    final buttonStartTime =
        Duration(milliseconds: (_menuTitles.length * 50)) + _buttonDelayTime;
    final buttonEndTime = buttonStartTime + _buttonTime;
    _buttonInterval = Interval(
      buttonStartTime.inMilliseconds / _animationDuration.inMilliseconds,
      buttonEndTime.inMilliseconds / _animationDuration.inMilliseconds,
    );
  }

  @override
  void dispose() {
    _staggeredController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        fit: StackFit.expand,
        children: [
          _buildContent(),
        ],
      ),
    );
  }

  Widget _buildFlutterLogo() {
    return const Positioned(
      right: -100,
      bottom: -30,
      child: Opacity(
        opacity: 0.2,
        child: FlutterLogo(
          size: 400,
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Container(
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLogo(),
              const SizedBox(height: 25),
              ..._buildListItems(),

            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildListItems() {
    final listItems = <Widget>[];
    for (var i = 0; i < _menuTitles.length; ++i) {
      listItems.add(
        AnimatedBuilder(
          animation: _staggeredController,
          builder: (context, child) {
            final animationPercent = Curves.easeOut.transform(
              _itemSlideIntervals[i].transform(_staggeredController.value),
            );
            final opacity = animationPercent;
            final slideDistance = (1.0 - animationPercent) * 150;

            return Opacity(
              opacity: opacity,
              child: Transform.translate(
                offset: Offset(slideDistance, 0),
                child: child,
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 16),
            child: Center(
              child: InkWell(
                onTap: (){
                  print(_menuTitles[i]);
                  if(_menuTitles[i] == 'Reading'){
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => ReadingPage()),
                    );
                  }else if(_menuTitles[i] == 'Landing Page'){
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => LandingPage()),
                    );
                  }else if(_menuTitles[i] == 'Payment'){
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => PaymentPage()),
                    );
                  }else if(_menuTitles[i] == 'Referral'){
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => ReferralPage()),
                    );
                  }
                  else if(_menuTitles[i] == 'Usage'){
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => UsagePage()),
                    );
                  }

                  // widget.toggle();
                },
                child: Text(
                    _menuTitles[i],
                    textAlign: TextAlign.left,
                    style: listStyle
                ),
              ),
            ),
          ),
        ),
      );
    }
    return listItems;
  }

  Widget _buildLogo() {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: AnimatedBuilder(
            animation: _staggeredController,
            builder: (context, child) {
              final animationPercent = Curves.elasticOut.transform(
                  _buttonInterval.transform(_staggeredController.value));
              final opacity = animationPercent.clamp(0.0, 1.0);
              final scale = (animationPercent * 0.5) + 0.5;

              return Opacity(
                opacity: opacity,
                child: Transform.scale(
                  scale: scale,
                  child: child,
                ),
              );
            },
            child: Image.asset(logo,width: 200,height: 200,)
        ),
      ),
    );
  }
}