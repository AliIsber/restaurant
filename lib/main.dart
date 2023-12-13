import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/cubitTasks/TasksState.dart';
import 'package:todoapp/cubitTasks/cubitTasks.dart';
import 'package:todoapp/homeScreen.dart';
import 'package:todoapp/tasksScreen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options:const FirebaseOptions(

            apiKey: "AIzaSyCNbtRMO8LMS735WUMbdcUyDmws13v78n4",
  projectId: "todoapp123-3d0c0",
  messagingSenderId: "655944262104",
  appId: "1:655944262104:web:706454faf11443cd1bd2ad",
          
          )
          );
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CubitTasks(),
      child: BlocConsumer<CubitTasks,TasksStates>(
        listener: (context, state) {
          
        },
        builder: (context, state) =>const MaterialApp(
          home: HomeScreen(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
