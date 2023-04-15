import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void nextScreen(context, page) {
  Navigator.push(context, CupertinoPageRoute(builder: (context) => page));
  // Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  // Get.off(LoadingWidget);
}

void nextScreeniOS(context, page) {
  Navigator.push(context, CupertinoPageRoute(builder: (context) => page));
}

void nextScreenCloseOthers(context, page) {
  Navigator.pushAndRemoveUntil(
      context, MaterialPageRoute(builder: (context) => page), (route) => false);
}

void nextScreenReplace(context, page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}

void nextScreenPopup(context, page) {
  Navigator.push(
    context,
    CupertinoPageRoute(fullscreenDialog: true, builder: (context) => page),
  );
}


// void navigateToDetailsScreenByReplace(context, Posts article, bool? replace) {
//   if (replace == null || replace == false) {
//     navigateToDetailsScreen(context, article);
//   } else {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(
//           builder: (context) => PostDetailsPage(
//                 data: article,
//               )),
//     );
//   }

