import 'package:flutter/material.dart';
import '../models/notes_model.dart';

class AddNote extends StatefulWidget {
  static const String routeName = 'AddNote';
  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final _formKey = GlobalKey<FormState>(); // to use in the form
  var _editNote = NoteModel('', '');
  var _initValues = {
    'content': '',
  }; // to use it in the form as content when press to edit
  var _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final noteId = ModalRoute.of(context)!.settings.arguments as String?;
      if (noteId != null) {
        //_editNote = need to call riverpod to ues findby id
        _initValues = {'content': _editNote.content};
      } else {
        return;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Future<void> _saveForm() async {
    var isValid = _formKey.currentState!.validate();
    print({isValid, 'isValid'});
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    if (_editNote.id == 'null' || _editNote.id.isEmpty) {
      try {
        print('is empty');
        //exchange with rvierpod
        // await Provider.of<UserCategories>(context, listen: false)
        //     .addCategories(_editedCategoires);
      } catch (error) {
        print(error);
      }
    } else {
      //exchange with rvierpod
      // await Provider.of<UserCategories>(context, listen: false)
      //     .updateCategories(_editedCategoires.id!, _editedCategoires);
      print({'_editedCategoires update', _editNote});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Container(
          height: 300,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: TextFormField(
                  cursorWidth: 5,
                  initialValue: _initValues['content'],
                  decoration: InputDecoration(labelText: 'content'),
                  validator: (value) {
                    return value!.isNotEmpty ? null : "Enter any text";
                  },
                  onSaved: (val) {
                    _editNote = NoteModel(val.toString(), _editNote.id);
                  },
                ),
              ),
              InkWell(
                child: Text('OK'),
                onTap: () {
                  setState(() {
                    _saveForm();
                  });

                  print('ok');

                  // Do something like updating SharedPreferences or User Settings etc.
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ));
  }
}
