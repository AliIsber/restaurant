import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoapp/cubitTasks/TasksState.dart';
import 'package:todoapp/models/taskModel.dart';

class CubitTasks extends Cubit<TasksStates> {
  CubitTasks() : super(TasksInitialStates());
  static CubitTasks get(context) => BlocProvider.of(context);




//   void addTask({
//     required date,
//     required time,
//     required title,
//   }) async {
//     emit(AddTasksLoadingStates());
//     TasksModel model = TasksModel(date: date, time: time, title: title);
//     await FirebaseFirestore.instance
//         .collection('tasks')
//         .add(model.tomap())
//         .then((value) {
// emit(AddTasksSuccessStates());
//         }).catchError((error){
// emit(AddTasksErrorStates(error.toString()));
//         });
//   }






void addtask(
{
  required title,
  required date,
  required time,
}
){
emit(AddTasksLoadingStates());

TasksModel x=TasksModel(title: title, time: date, date: time);
FirebaseFirestore.instance.collection('tasks').add(x.tomap()).then((value) {
emit(AddTasksSuccessStates());
}).catchError((error){

});

}

List<TasksModel>y=[]   ;

void getTask(){


  FirebaseFirestore.instance.collection('tasks').get().then((value) {
value.docs.forEach((element) {
  y.add(TasksModel.fromJson(element.data()));
  emit(GetTasksSuccessStates());

}
);
  }).catchError((error){

  });
}
}
