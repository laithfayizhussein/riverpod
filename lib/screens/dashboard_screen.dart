import 'package:flutter/material.dart';

import '../widget/note_widget.dart';
import './add_note_screen.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

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
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('appBar'),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: buildButtomSheet,
                );
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: NoteWidget('', ''),
    );
  }
}
