import 'package:demo01/createToDo.dart';
import 'package:demo01/todoController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {

  final controller = Get.put(TodoController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init:controller ,
        builder: (controller){
    return Scaffold(
      appBar: AppBar(
        title: Text("To do List"),
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CreateTodo()));

            },
            child: Center(child: Text("add todo")),
          )
        ],
      ),
      body: controller!.todoList.length > 0 ? ListView.builder(
          itemCount:controller!.todoList.length,
          itemBuilder: (c, i) => myitem(c, i)):CircularProgressIndicator()
          ,
    );
  });}
  Widget? myitem(c, i) {
    return Container(
        child: ListTile(

          title: GestureDetector(
              onTap: () {

                //print("sdsds");
              },
              child: Text(
                  "${controller!.todoList[i].title}")),
            subtitle:Text(
                "${controller!.todoList[i].message}") ,

            trailing: GestureDetector(
                onTap: (){
                  controller.deleteDO(i);
                },
                child: Icon(Icons.delete)),
        ));
  }
}
