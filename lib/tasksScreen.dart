import 'package:flutter/material.dart';


class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => tasksItem(),
      itemCount:3 ,
      separatorBuilder: (context, index) =>Container(
        width: double.infinity,
        height: 1
        ,
        color: Colors.grey,
      ) ,
    );
  }
Widget tasksItem(){
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
          const CircleAvatar(
            radius: 40,
            child: Text('9pm'),
            ),
         const   SizedBox(width: 20,),
            Column(
              children:const [
  Text('Task Title',style: TextStyle(fontWeight: FontWeight.bold,fontSize:16,color: Colors.black),),
  Text('Task Date',style: TextStyle(color: Colors.grey,fontSize: 14)),
              ],
            )
      ],
    ),
  );
}
}
