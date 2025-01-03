import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mytodoapp/views/landing.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return Landing();
      }));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
        if(constraints.maxWidth>1000){
          return  Center(
            child: Image.asset(
              width: 150,
              height: 150,
              'assets/images/logo.png',
              fit: BoxFit.fill,
            ),
          );
        }
        else  if(constraints.maxWidth>600){
          return  Center(
            child: Image.asset(
              width: 150,
              height: 150,
              'assets/images/logo.png',
              fit: BoxFit.fill,
            ),
          );
        }
       else {
          return  Center(
            child: Image.asset(
              width: 150,
              height: 150,
              'assets/images/logo.png',
              fit: BoxFit.fill,
            ),
          );
        }
      },

      ),
    );
  }
}
