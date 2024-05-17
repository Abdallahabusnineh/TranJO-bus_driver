import 'package:bus_driver/core/services/services_locater.dart';
import 'package:bus_driver/core/utils/cash_helper.dart';
import 'package:bus_driver/core/utils/dio_helper.dart';
import 'package:bus_driver/presentation/screens/main_screen/main_screen_view.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  DioHelper.init();
  WidgetsFlutterBinding.ensureInitialized();//عشان ما يعمل رن الا لما يتأكد انو كلشي معملوه initlaies
  await CashHelper.init();
  ServicesLocater().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainScreenView()
    );
  }
}

