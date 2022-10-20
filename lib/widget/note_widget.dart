import 'package:flutter/material.dart';
import '../screens/add_note_screen.dart';

class NoteWidget extends StatefulWidget {
  final String id;
  final String noteContent;
  NoteWidget(this.id, this.noteContent);
  @override
  State<NoteWidget> createState() => _NoteWidgetState();
}

class _NoteWidgetState extends State<NoteWidget> {
  Widget buildButtomSheet(BuildContext context) {
    return AddNote(
        //newTaskTitle // it was passing to the obj
        // setState(() {
        //   // tasks.add(Task(name: newTaskTitle));
        //   // Navigator.pop(context);
        // });
        );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: buildButtomSheet,
          );
        },
        child: Card(
          child: Container(
            decoration: BoxDecoration(
                border: Border(left: BorderSide(color: Colors.red, width: 5))),
            child: ListTile(
              leading: Text('lorem lorem lorem '),
              trailing: IconButton(
                padding: EdgeInsets.only(left: 40),
                onPressed: () {},
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
