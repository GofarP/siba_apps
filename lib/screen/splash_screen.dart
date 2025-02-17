import 'dart:async';

import 'package:flutter/material.dart';
import 'package:siba_apps/screen/cek_resi_screen.dart';
import 'package:siba_apps/screen/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 2),(){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context)=>const MainScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(0, 119, 195, 1),
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ResponsiveImage(
                imagePath: 'assets/sibacargo.png',
                percentageWidth: 0.8,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ResponsiveImage extends StatelessWidget{
  final String imagePath;
  final double percentageWidth;

  ResponsiveImage({required this.imagePath, required this.percentageWidth});

  @override
  Widget build(BuildContext context) {
    double screenWidth=MediaQuery.of(context).size.width;
    double imageWidth=screenWidth * percentageWidth;

    return Image.asset(
      imagePath,
      width: imageWidth,
      height: imageWidth,
      fit: BoxFit.contain,
    );
  }

}