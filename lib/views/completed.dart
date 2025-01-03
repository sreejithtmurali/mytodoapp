import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:mytodoapp/views/dashboard.dart';
import 'package:mytodoapp/views/landing.dart';
import 'package:mytodoapp/main.dart';

class Completed extends StatefulWidget {
  const Completed({super.key});

  @override
  State<Completed> createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
            return Dashboard();
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
              child: Lottie.asset(
                width: 150,
                height: 150,
                'assets/json/pending.json',
                fit: BoxFit.fill,
              ),
            );
          }
          else  if(constraints.maxWidth>600){
            return  Center(
              child: Image.asset(
                width: 150,
                height: 150,
                'assets/json/pending.json',
                fit: BoxFit.fill,
              ),
            );
          }
          else {
            return  Center(
              child: Image.asset(
                width: 150,
                height: 150,
                'assets/json/pending.json',
                fit: BoxFit.fill,
              ),
            );
          }
        },

      ),
    );
  }
}
