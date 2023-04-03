
import 'package:get/get.dart';

class TodoController extends GetxController{

  List<TodoModal> todoList = [];

 @override
 void onInit() {
   loadTodo();
   super.onInit();
 }

  loadTodo(){}
  addTodo(title,message){
   if(title != "") {
     TodoModal todoModal = TodoModal();
     todoList.add(TodoModal(title: title, message: message));
     update();
   }
  }
  deleteDO(i){

    todoList.removeAt(i);
    update();
  }

}

class TodoModal {
String? title;
String? message;
TodoModal({this.title,this.message});
}