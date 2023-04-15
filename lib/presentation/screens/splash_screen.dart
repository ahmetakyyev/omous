import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:omous/presentation/screens/navbar.dart';

import '../../data/config.dart';
import '../../utils/next_screen.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  AnimationController? _controller;

  Animation<Color>? animation;
  double progress = 0;
  @override
  void initState() {
    connectivityCheck();

    super.initState();
  }

  connectivityCheck() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        //RoutesClass().chekamk().then((value) =>
        Future.delayed(
          Duration(milliseconds: 1500),
        ).then((value) => gotoHomePage());
      }
    } on SocketException catch (_) {
      Future.delayed(
        Duration(milliseconds: 2000),
      ).then((value) => tryAgainPage());
    }
  }

  gotoHomePage() {
    nextScreenReplace(context, const NavBar());
  }

  tryAgainPage() {
    // nextScreenReplace(context, const TryAgainPage());
    nextScreenReplace(context, const NavBar());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Theme.of(context).primaryColorLight,
      body: FutureBuilder(builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Image(
                    image: AssetImage(Config().splashIcon),
                    //color: Theme.of(context).primaryColorDark,
                    height: 500,
                    width: 500,
                    //fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                SpinKitDancingSquare(),
              ],
            ),
          );
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Image(
                    image: AssetImage(Config().splashIcon),
                    //color: Theme.of(context).primaryColorDark,
                    height: 500,
                    width: 500,
                    //fit: BoxFit.contain,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: SpinKitDancingSquare(
                      color: Theme.of(context).primaryColorDark,
                      size: 75,
                    ),
                  ),
                )
              ],
            ),
          );
        }
      }),
    );
  }
}
