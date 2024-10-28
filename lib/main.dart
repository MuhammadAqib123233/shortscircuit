import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shortscircuit/views/screens/CircuitPage.dart';
import 'package:shortscircuit/views/screens/FavScreen.dart';
import 'package:shortscircuit/views/screens/Homepage.dart';
import 'package:shortscircuit/views/screens/Nearme.dart';
import 'package:shortscircuit/views/screens/PageRouter.dart';
import 'package:shortscircuit/views/screens/SearchPage.dart';
import 'package:shortscircuit/views/screens/SplashScreen.dart';
import 'package:shortscircuit/views/screens/StopPage.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
    
}
class NoGlowScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
       builder: (context, child) {
        return ScrollConfiguration(
          behavior: NoGlowScrollBehavior(),
          child: child!,
        );
      },
      debugShowCheckedModeBanner: false,
      title: 'ShortsCircuit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/pageroute', page: () => PageRouter()),
        GetPage(name: '/homepage', page: () => HomePage(screenIndex: 0,), transition: Transition.zoom),
        GetPage(name: '/favscreen', page: () => FavScreen(screenIndex: 1,), transition: Transition.zoom),
        GetPage(name: '/nearme', page: ()=> Nearme())
        // Add more GetPage entries for other screens
      ],
    );
  }
}


