//@dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:hexcolor/hexcolor.dart';

class Config {
  Widget spinKit() {
    return SpinKitCircle(
      color: Colors.blue,
      size: 40,
    );
  }

  final String appName = 'OMOUS';
  final String splashIcon = 'assets/images/logo.png';
  final String supportEmail = 'akyyev2002@gmail.com';
  // final String websiteURL = 'beyan.wiki';
  // final String dataurl = 'https://beyan.wiki/';
  // final String imageAdress = 'https://beyan.wiki/public/uploadedimages/';
  final String websiteURL = 'beyan.wiki';
  final String dataurl = 'https://beyan.wiki/api/';
  //final String dataurl = 'http://192.168.2.86:8000/api/';
  final String imageAdress = 'https://beyan.wiki/public/uploadedimages/';
  //final String imageAdress = 'http://192.168.2.86:8000/uploadedimages/';
  //social links
  final String instagramURL = '';
  final String facebookURL = '';
  final String twitterURL = '';

  //app theme color
  final Color appColor = HexColor("#0784b5");
  final Color lightModeColor = HexColor('#dee4e7');
  final Color darkModeColor = HexColor('#182029');
  //Language Setup
  final List<String> languages = [
    'English',
    'Turkmen',
    'Russian',
  ];
}

class App {
  BuildContext _context;
  double _height;
  double _width;
  double _heightPadding;
  double _widthPadding;

  App(_context) {
    this._context = _context;
    MediaQueryData _queryData = MediaQuery.of(this._context);
    _height = _queryData.size.height / 100.0;
    _width = _queryData.size.width / 100.0;
    _heightPadding = _height -
        ((_queryData.padding.top + _queryData.padding.bottom) / 100.0);
    _widthPadding =
        _width - (_queryData.padding.left + _queryData.padding.right) / 100.0;
  }

  double appHeight(double v) {
    return _height * v;
  }

  double appWidth(double v) {
    return _width * v;
  }

  double appVerticalPadding(double v) {
    return _heightPadding * v;
  }

  double appHorizontalPadding(double v) {
    return _widthPadding * v;
  }
}
