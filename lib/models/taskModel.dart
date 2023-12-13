// ignore_for_file: non_constant_identifier_names

class TasksModel {
  String? title;
  String? date;
  String? time;
 

  TasksModel({
    required this.title,
    required this.time,
    required this.date,
   
  });

  TasksModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    time = json['time'];
    date = json['date'];

    // selectedStartingDate = json['selectedStartingDate'].toDate();

 
  }

  Map<String, dynamic> tomap() {
    return {
      'title': title,
      'time': time,
      'date': date,
  
    };
  }
}
