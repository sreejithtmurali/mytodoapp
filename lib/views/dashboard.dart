import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mytodoapp/views/addtask.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Color(0xff0560FD),
        centerTitle: true,
        title: Text("Plan Your Day with ToDo",style: TextStyle(color: Colors.white),),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: (){
Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
  return AddTask();
}));
        },
      child: Icon(Icons.add,color: Colors.white,),),
    );
  }
}
