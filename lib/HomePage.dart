import 'package:flutter/material.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'package:todo_app/TodoModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TodoModel> todoList = [
    TodoModel(
      todoTitle: "Cooking food at 06:00AM",
      isCompleted: false,
    ),
    TodoModel(
      todoTitle: "Upload video at 09:00 AM",
      isCompleted: true,
    ),
    TodoModel(
      todoTitle: "Record video for youtube",
      isCompleted: false,
    ),
    TodoModel(
      todoTitle: "Buy A pen from market",
      isCompleted: true,
    ),
    TodoModel(
      todoTitle: "Make a dinner alu and chawal",
      isCompleted: false,
    ),
  ];

  void addTodo(String tile) {
    var newTodo = TodoModel(
      todoTitle: tile,
      isCompleted: false,
    );

    setState(() {
      todoList.add(newTodo);
    });
  }

  void makeCompleted(String title)
  {

    todoList.forEach((e){
      if(e.todoTitle == title)
      {
      setState(() {
          e.isCompleted = !e.isCompleted!;
      });
      }
    });



    print(title);

  } 
  @override
  Widget build(BuildContext context) {
    TextEditingController title = TextEditingController();
    return Scaffold(
      backgroundColor: Color(0xff191B28),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "TODO APP",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xff34374B),
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 58,
                      width: 50,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(7),
                            bottomLeft: Radius.circular(7),
                          )),
                      child: Center(
                        child: Icon(
                          Icons.add,
                          size: 28,
                          color: Color(0xffF36600),
                        ),
                      ),
                    ),
                    SizedBox(width: 7),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        // height: 50,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(7),
                              bottomRight: Radius.circular(7),
                            )),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: title,
                                  decoration: InputDecoration(
                                    hintText: "Enter todo",
                                    suffix: InkWell(
                                      onTap: () {
                                        addTodo(title.text);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color: Color(0xffF36600),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Icon(
                                          Icons.done_rounded,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ]),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                        children: todoList
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(7),
                                            bottomLeft: Radius.circular(7),
                                          )),
                                      child: Center(
                                        child: InkWell(
                                          onTap: () {
                                                makeCompleted(e.todoTitle!);
                                          },
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: e.isCompleted!
                                                  ? Color(0xffF36600)
                                                  : Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              border: Border.all(
                                                width: 2,
                                                color: Color(0xffF36600),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 7),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        height: 50,
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(7),
                                              bottomRight: Radius.circular(7),
                                            )),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  e.todoTitle!,
                                                  maxLines: 1,
                                                  style:  TextStyle(
                                                    decoration:e.isCompleted! ? TextDecoration.lineThrough : TextDecoration.none ,
                                                    fontSize: 18,
                                                    color:  e.isCompleted! ? Colors.grey : Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    todoList.removeWhere((t) =>
                                                        t.todoTitle ==
                                                        e.todoTitle);
                                                  });
                                                },
                                                child: Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                ),
                                              )
                                            ]),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                            .toList()),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
