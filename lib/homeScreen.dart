import 'package:flutter/material.dart';
import 'package:todoapp/addTaskScreen.dart';
import 'package:todoapp/tasksScreen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 var X=0;
 // ignore: non_constant_identifier_names
 List<Widget> Screens =[
  const TasksScreen(),
  const  AddTasks(),

 ];
List Hala=[
  'samer',
  'add task',
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar: AppBar(
    title:Text(Hala[X]),
    centerTitle: true,
   ),
   
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: X,
        backgroundColor: Colors.white,
showUnselectedLabels: false,
        fixedColor: Colors.blue,
        onTap: (value){
          print(value);
setState(() {
  X=value;
  print(X);
});
        },
        items:const [
        BottomNavigationBarItem(icon:  Icon(Icons.menu) ,label:'Tasks' ),
        BottomNavigationBarItem(icon:  Icon(Icons.add_circle) ,label:'add' ),
       
      ]),
      body: Screens[X],
    );
  }
}