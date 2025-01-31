import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    super.key,
   required this.taskName,
   required this.taskCompleted,
   required this.onChanged,
   required this.deleteFunction,
   });

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          top:15,
          bottom:0,
          right:10,
          left:10,
        ),
        child:Slidable(
          endActionPane: ActionPane(
            motion:const StretchMotion(), 
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete_sweep_rounded,
              borderRadius: BorderRadius.circular(15),
            ),
            ],
            ),
          child: Container(
            padding:const EdgeInsets.all(20),
            decoration: BoxDecoration(
            color: Colors.indigo,
            borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Checkbox(
                  value: taskCompleted, 
                 onChanged: onChanged,
                 checkColor:Colors.black,
                 activeColor: Colors.white,
                 side:const BorderSide(color:Colors.white )
                 ),
                Text(
                  taskName,
                  style: TextStyle(
                    color: Colors.blue.shade50,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    decoration: taskCompleted?
                     TextDecoration.lineThrough :
                     TextDecoration.none,
                     decorationColor: Colors.white,
                     decorationThickness: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}