class Todo{
  int? id;
  late String title,discription,date,time,priority,status="pending";

  Todo({this.id, required this.title, required this.discription, required this.date, required this.time,
      required this.priority, required this.status});
  Map<String,dynamic> toMap(){
    return {
      "title":this.title,
      "discription":this.discription,
      "date":this.date,
      "time":this.time,
      "priority":this.priority,
      "status":this.status
    };
  }
}