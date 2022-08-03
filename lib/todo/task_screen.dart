import 'package:flutter/material.dart';
import 'package:mi_card/flash_chat/constants.dart';
import 'package:mi_card/todo/task.dart';


class TaskScreen extends StatefulWidget {

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<Task> task = [
    Task(task: "Go for buying milk"),
    Task(task: "Disappear 😂")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(context: context, builder: (context) => BottomSheetTaskAdding(taskList: task,), isScrollControlled: true);
        },
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.label_important_sharp,
                    color: Colors.lightBlueAccent,
                    size: 30.0,),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  "To do ",
                  style: kTodoTitle,
                ),
                Text(
                  "12 Tasks",
                  style: kTodoSubText,
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: TaskList(taskList: task),
              ),
            )
          )
        ],
      ),
    );
  }
}

class TaskList extends StatelessWidget {
  TaskList({required this.taskList});

  List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index) {
      return TodoItem(
        task: taskList[index].task ,
        isDone: taskList[index].isDone,
      );
    }
    );
  }
}

// single todo item.
class TodoItem extends StatefulWidget {
  
  TodoItem({required this.task, required this.isDone});

  final String task;
  bool isDone = false;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, bottom: 0.0, left: 8.0, right: 8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            widget.isDone = !widget.isDone;
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.task,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20.0,
                color: Colors.black,
                decoration: widget.isDone ? TextDecoration.lineThrough : null,
              ),
            ),
            Icon(
              widget.isDone ? Icons.check_box : Icons.check_box_outline_blank,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}

// bottom sheet to add new task.
class BottomSheetTaskAdding extends StatefulWidget {
  BottomSheetTaskAdding({required this.taskList});
  List<Task> taskList;

  @override
  State<BottomSheetTaskAdding> createState() => _BottomSheetTaskAddingState();
}

class _BottomSheetTaskAddingState extends State<BottomSheetTaskAdding> {
  late String value;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: const Color(0xFF757575),
        child: Container(
          decoration: const BoxDecoration(
            color:  Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Enter task",
                  style: kTodoBottomText,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: TextField(
                    onChanged: (input) {
                      value = input;
                    },
                    style: const TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                MaterialButton(
                  height: 60.0,
                  onPressed: () {
                    setState((){
                      if(value != null){
                        widget.taskList.add(
                          Task(task: value),
                        );
                      }
                      Navigator.of(context).pop();
                    });
                  },
                  color: Colors.lightBlueAccent,
                  child: const Text(
                    "Add",
                    style: kTodoBottomButtonText,
                  ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


