import 'package:demo01/todoController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CreateTodo extends StatefulWidget {
   CreateTodo({Key? key}) : super(key: key);

  @override
  State<CreateTodo> createState() => _TodoListState();
}

class _TodoListState extends State<CreateTodo> {

  final controller = Get.put(TodoController());
  TextEditingController textEditingController1= TextEditingController();
  TextEditingController textEditingController2= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Todo"),

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
      //  SizedBox(height: 100,),
          Text("Enter Title"),
          Container(
            width: 300,
            child: TextFormField(
              controller: textEditingController1,
            ),
          ),
          SizedBox(height: 100,),
          Text("Enter Messsage"),
          Container(
            width: 300,
            child: TextFormField(

              controller: textEditingController2,
            ),
          ),
        SizedBox(height: 100),
        GestureDetector(
        onTap: (){
          controller.addTodo(textEditingController1.text,textEditingController2.text);
          Navigator.of(context).pop();
        },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 40),
            color: Colors.green,
              margin: EdgeInsets.all(20),
              child: Text("Add Todo")),
        )
      ],)
      ,
    );
  }

}
