import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mytodoapp/models/Todo.dart';
import 'package:mytodoapp/views/dashboard.dart';

import '../service/dbservicehelper.dart';
import 'completed.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController datectlr=TextEditingController();
  TextEditingController tmectlr=TextEditingController();
  TextEditingController titlectlr=TextEditingController();
  TextEditingController discriptionctlr=TextEditingController();
  TextEditingController priorityctlr=TextEditingController();
  DbServiceHelper dbServiceHelper=DbServiceHelper();
  final formKey=GlobalKey<FormState>();

  Future<void> selectdate(BuildContext context) async {
    DateTime? _pickeddate = await showDatePicker(
        context: context,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        initialDate: DateTime.now());

    if (_pickeddate != null) {

      // controller.text=_pickeddate.toString()!;
      String formateddate = DateFormat('dd-MM-yyyy').format(_pickeddate);

     setState(() {
       datectlr.text = formateddate;
     });

    }
  }

  Future<void> select_time(BuildContext context) async {
    TimeOfDay? pickedtime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, child) {
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
              child: child!);
        });
    if (pickedtime != null) {
setState(() {
  tmectlr.text = "${pickedtime.hour}:${pickedtime.minute}";
});


    }
  }
  static const List<String> _options = <String>[
    'High',
    'Low',
    'Medium',

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Color(0xff0560FD),
        centerTitle: true,
        title: Text("Add Task",style: TextStyle(color: Colors.white),),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              TextFormField(
                controller: titlectlr,
                validator: (value){
                  if(value!.length==0){
                    return "must fill this field";
                  }
                  else{
                    return null;
                  }
                },
                decoration: InputDecoration(
                  border:  OutlineInputBorder(),
                  hintText: "Title"

                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: discriptionctlr,
                validator: (value){
                  if(value!.length==0){
                    return "must fill this field";
                  }
                  else{
                    return null;
                  }
                },
                decoration: InputDecoration(
                    border:  OutlineInputBorder(),
                    hintText: "Discription"

                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                readOnly: true,
                onTap: (){
                  selectdate(context);
                },
                controller: datectlr,
                validator: (value){
                  if(value!.length==0){
                    return "must fill this field";
                  }
                  else{
                    return null;
                  }
                },
                decoration: InputDecoration(
                    border:  OutlineInputBorder(),
                    hintText: "Pick-Date"

                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                readOnly: true,
                onTap: (){
                  select_time(context);
                },
                controller: tmectlr,
                validator: (value){
                  if(value!.length==0){
                    return "must fill this field";
                  }
                  else{
                    return null;
                  }
                },
                decoration: InputDecoration(
                    border:  OutlineInputBorder(),
                    hintText: "Pick-Time"

                ),
              ),
              SizedBox(height: 10,),
            Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text.isEmpty) {
                  return const Iterable<String>.empty();
                }
                return _options.where((String option) {
                  return option.toLowerCase().contains(
                    textEditingValue.text.toLowerCase(),
                  );
                });
              },
              onSelected: (String selection) {
                priorityctlr.text=selection;
              },
              fieldViewBuilder: (BuildContext context, TextEditingController textEditingController, FocusNode focusNode, VoidCallback onFieldSubmitted) {
                return TextFormField(
                  validator: (value){
                    if(value!.length==0){
                      return "must fill this field";
                    }
                    else{
                      return null;
                    }
                  },
                  controller: textEditingController,
                  focusNode: focusNode,
                  decoration: InputDecoration(
                    labelText: 'Priority(High/Low/Medium)',
                    border: OutlineInputBorder(),
                  ),
                  onFieldSubmitted: (String value) {
                    onFieldSubmitted();
                  },
                );
              },
            ),

              SizedBox(height: 10,),
              Container(
                width: double.maxFinite,
                  height: 50,
                  child: ElevatedButton(onPressed: (){
                    if(formKey.currentState!.validate()){

                      Todo todo=Todo(title: titlectlr.text, discription: discriptionctlr.text,
                          date: datectlr.text, time:tmectlr.text , priority: priorityctlr.text, status: "pending");
                      dbServiceHelper.insertTodo(todo).then((onValue){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) {
                          return Completed();
                        }));
                      });
                    }


                  }, child: Text("Add Task",style: TextStyle(color: Colors.white),),style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)
                    )
                  ),))

            ],),
          ),
        ),
      ),

    );
  }
}
