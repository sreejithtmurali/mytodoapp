import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'dashboard.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  int current=0;
  List<Widget> pages=[
    Container(height: 618.h,
      width: double.maxFinite,
      color: Colors.transparent,
      child: Stack(
        children: [

          Positioned(
              top: 113,
              left: 0,
              right: 0,
              child: Center(child: Lottie.asset("assets/json/completed.json",height: 226.w,width: 226.h,fit: BoxFit.fill,))),
          Positioned(
              top: 456.h,
              left: 0,
              right: 0,
              child: Center(child: Text("Plan Your LifeStyle",maxLines: 1,))),
          Positioned(
              top: 496.h,
              left: 0,
              right: 0,
              child: Center(child: Container(
                  width: 271.w,
                  child: Text("Perfect Plan makes your life Perfect\nPlan perfectly complete it on time",maxLines: 3,textAlign: TextAlign.center,))))
        ],
      ),),
    Container(height: 618.h,
      width: double.maxFinite,
      color: Colors.transparent,
      child: Stack(
        children: [

          Positioned(
              top: 113,
              left: 0,
              right: 0,
              child: Center(child: Lottie.asset("assets/json/pending.json",height: 226.w,width: 226.h,fit: BoxFit.fill,))),
          Positioned(
              top: 456.h,
              left: 0,
              right: 0,
              child: Center(child: Text("Complete All Pending Tasks",maxLines: 1,))),
          Positioned(
              top: 496.h,
              left: 0,
              right: 0,
              child: Center(child: Container(
                  width: 271.w,
                  child: Text("Perfect Plan makes your life Perfect\nPlan perfectly complete it on time",maxLines: 3,textAlign: TextAlign.center,))))
        ],
      ),),
    Container(height: 618.h,
      width: double.maxFinite,
      color: Colors.transparent,
      child: Stack(
        children: [

          Positioned(
              top: 113,
              left: 0,
              right: 0,
              child: Center(child: Lottie.asset("assets/json/progress.json",height: 226.w,width: 226.h,fit: BoxFit.fill,))),
          Positioned(
              top: 456.h,
              left: 0,
              right: 0,
              child: Center(child: Text("Update Progress of Tasks",maxLines: 1,))),
          Positioned(
              top: 496.h,
              left: 0,
              right: 0,
              child: Center(child: Container(
                  width: 271.w,
                  child: Text("Perfect Plan makes your life Perfect\nPlan perfectly complete it on time",maxLines: 3,textAlign: TextAlign.center,))))
        ],
      ),)

  ];
  PageController pageController=PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height:MediaQuery.of(context).size.height,
        width: double.maxFinite,
        child: Stack(
          children: [
            Container(height: 558.h,
            width: double.maxFinite,
            child: Stack(
              children: [
               
                PageView.builder(
                  onPageChanged: (index){
                    setState(() {
                      current=index;
                    });
                  },
                  controller: pageController,
                  itemCount: pages.length,
                  itemBuilder: (BuildContext context, int index) {
                  return pages[index];
                },),
              ],
            )),

            Positioned(
              top: 558.w,
              left: 0,
              right: 0,
              child: Center(
                child: SmoothPageIndicator(
                  axisDirection: Axis.horizontal,
                    controller: pageController,  // PageController
                    count:  pages.length,
                    effect:  WormEffect(),  // your preferred effect
                    onDotClicked: (index){
                    }
                ),
              ),
            ),

            Positioned(
              top: 609.w,
              left: 0,
              right: 0,
              child: Center(
                child: Container(width: 135,
                height: 45,
                child: ElevatedButton(onPressed: (){
                  if(current<2){
                    setState(() {
                      current++;
                    });
                    pageController.animateToPage(current, duration: Duration(seconds: 1), curve: Curves.easeInOut);

                  }else{
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                      return Dashboard();
                    }));
                  }
                   },
                  child: Text(current==2?"Get Started":"Next",style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),),),
              ),
            )

          ],
        ),
      ),
    );
  }
}
