
class TodoModel {
  String? todoTitle;
  bool? isCompleted;

  TodoModel({this.todoTitle, this.isCompleted});

  TodoModel.fromJson(Map<String, dynamic> json) {
    if(json["todoTitle"] is String) {
      todoTitle = json["todoTitle"];
    }
    if(json["isCompleted"] is bool) {
      isCompleted = json["isCompleted"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["todoTitle"] = todoTitle;
    _data["isCompleted"] = isCompleted;
    return _data;
  }
}