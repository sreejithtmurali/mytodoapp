import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mytodoapp/views/addtask.dart';

import '../service/dbservicehelper.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DbServiceHelper dbServiceHelper=DbServiceHelper();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          backgroundColor: Color(0xff0560FD),
          centerTitle: true,
          title: Text("Plan Your Day with ToDo",style: TextStyle(color: Colors.white),),
          bottom: TabBar(
            labelColor: Colors.white,
              unselectedLabelColor: Colors.white60,
              tabs: [
            Tab(
              text: "Pending",
            ),
            Tab(
              text: "Completed",
            ),
            Tab(
              text: "InProgress",
            )
          ]),
        ),
        body: TabBarView(children: [
          Container(height: double.infinity,width: double.infinity,
            child: FutureBuilder(future:dbServiceHelper.getallTodos(),
              builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
              if(snapshot.hasError){
                return Center(child: Text("Error"),);
              }
              else if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    if(snapshot.data![index]["status"]=="pending"){
                      return ListTile(
                        title: Text("${snapshot.data![index]["title"]}"),
                      );
                    }else{
                      return SizedBox();
                    }

                },);
              }
              else{
                return Center(child: CircularProgressIndicator(),);
              }
            } ,),),
          Container(height: double.infinity,width: double.infinity,
            child: FutureBuilder(future:dbServiceHelper.getallTodos(),
              builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                if(snapshot.hasError){
                  return Center(child: Text("Error"),);
                }
                else if(snapshot.hasData){
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      if(snapshot.data![index]["status"]=="Completed"){
                        return ListTile(
                          title: Text("${snapshot.data![index]["title"]}"),
                        );
                      }else{
                        return SizedBox();
                      }

                    },);
                }
                else{
                  return Center(child: CircularProgressIndicator(),);
                }
              } ,),),
          Container(height: double.infinity,width: double.infinity,
            child: FutureBuilder(future:dbServiceHelper.getallTodos(),
              builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                if(snapshot.hasError){
                  return Center(child: Text("Error"),);
                }
                else if(snapshot.hasData){
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      if(snapshot.data![index]["status"]=="Inprogress"){
                        return ListTile(
                          title: Text("${snapshot.data![index]["title"]}"),
                        );
                      }else{
                        return SizedBox();
                      }

                    },);
                }
                else{
                  return Center(child: CircularProgressIndicator(),);
                }
              } ,),),

        ]),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
        return AddTask();
      }));
          },
        child: Icon(Icons.add,color: Colors.white,),),
      ),
    );
  }
}
