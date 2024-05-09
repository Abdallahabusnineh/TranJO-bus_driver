import 'package:flutter/cupertino.dart';

navigateTo(BuildContext context, Widget page) =>
    Navigator.push(context, CupertinoPageRoute(builder: (_) => page));

navigateBack(BuildContext context) => Navigator.pop(context);

navigateOff(BuildContext context, Widget page) => Navigator.pushAndRemoveUntil(
    context, CupertinoPageRoute(builder: (_) => page), (route) => false);
