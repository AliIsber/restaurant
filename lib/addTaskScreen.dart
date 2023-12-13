import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/cubitTasks/TasksState.dart';
import 'package:todoapp/cubitTasks/cubitTasks.dart';
import 'models/taskModel.dart';
class AddTasks extends StatefulWidget {
  const AddTasks({super.key});

  @override
  State<AddTasks> createState() => _AddTasksState();
}

class _AddTasksState extends State<AddTasks> {
  final textformkey =GlobalKey<FormState>();
var taskTimeController=TextEditingController();
// ignore: non_constant_identifier_names
var TaskTitleController=TextEditingController();
// ignore: non_constant_identifier_names
var TaskDateController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CubitTasks,TasksStates>(
        listener:(constext,state){},
        builder:(constext,state)=> Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: textformkey,
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20,),
                TextFormField(
                  controller:TaskTitleController ,
                  decoration:  InputDecoration(
                                  label:const Text('Task Title'),
                                  prefixIcon:const Icon(Icons.title),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
                                        
                                    
                              
                                  errorBorder:const OutlineInputBorder(
                              
                                      borderSide:BorderSide(color: Colors.red) ),
                                  filled: true,
                                  
                                     ),
                                     validator: (value) {
                                if (value!.isEmpty) {
                                  return 'task title must not be empty';
                                }
                                return null;
                              },
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  
                  controller: taskTimeController,
                  onTap:(){
                    showTimePicker(context: context, initialTime: TimeOfDay.now(), ).then((value) {
                  taskTimeController.text= value!.format(context);
                    });
                  },
                 decoration:  InputDecoration(
                                  label:const Text('Date Time'),
                                  prefixIcon:const Icon(Icons.timer_sharp),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
                                        
                                    
                                  
                                      
                                  
                                  errorBorder:const OutlineInputBorder(
                              
                                      borderSide:BorderSide(color: Colors.red) ),
                                 
                                  filled: true,
                                  
                                     ),
                                     validator: (value) {
                                if (value!.isEmpty) {
                                  return 'date  must not be empty';
                                }
                                return null;
                              },
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  controller: TaskDateController,
                  onTap: (){
                    showDatePicker(context: context, firstDate: DateTime.now(), initialDate: DateTime.now(),lastDate: DateTime(2101)).then((value) {
                      //intl package
                      TaskDateController.text= DateFormat.yMMMd().format(value!) ;     ;
                    
                    });
                  },
                  decoration:  InputDecoration(
                                  label:const Text('Task Date'),
                                  prefixIcon:const Icon(Icons.date_range),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
                           
                                      
                               
                                  errorBorder:const OutlineInputBorder(
                              
                                      borderSide:BorderSide(color: Colors.red) ),
                                
                                  filled: true,
                                  
                                     ),
                                     validator: (value) {
                                if (value!.isEmpty) {
                                  return 'time must not be empty';
                                }
                                return null;
                              },
                ),
              const  SizedBox(height: 20,),
                Container(
                                     
                               decoration: BoxDecoration(  
                                      color:Colors.blue[200],
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      
                                      ),
                                      borderRadius: BorderRadius.circular(4),
                                      boxShadow:const [
                                        BoxShadow(
                                         color: Colors.grey ,
                                         blurRadius: 2.0,
                                       )
                                      ]
                                      ),
                                      
                                     // decoration:  BoxDecoration(border: Border.all(color: Colors.red)),
                                     width: MediaQuery.of(context).size.width*0.7,
                                     height: 40,
                                     
                                     
                                     child: TextButton(onPressed: ()async{
                                      if(textformkey.currentState!.validate()){
                                     CubitTasks.get(context).addtask(title: TaskTitleController.text, date: TaskDateController.text, time: taskTimeController.text);
                                          


                                      }
                                     }, child:const Text('Add Task',style: TextStyle(color:Colors.black 
                                     , fontSize: 30.0),
                                     ),
                                     ),
                                     ),
              ],),
            ),
          ),
        ),
      ),
    );
  }
}
