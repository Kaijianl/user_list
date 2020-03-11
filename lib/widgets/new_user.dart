import 'package:flutter/material.dart';

class NewUser extends StatefulWidget {
  final Function addUser;

  NewUser(this.addUser);

  @override
  _NewUserState createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  final lastnameController = TextEditingController();
  final firstnameController = TextEditingController();
  final schoolController = TextEditingController();
  final emailController = TextEditingController();
  final majorController = TextEditingController();
  final ageController = TextEditingController();


  void submitData() {
    final enteredLastname = lastnameController.text;
    final enteredFirstname = firstnameController.text;
    final enteredSchool = schoolController.text;
    final enteredEmail = emailController.text;
    final enteredMajor = majorController.text;
    final enteredAge = int.parse(ageController.text);

    if (enteredLastname.isEmpty || enteredFirstname.isEmpty ||
        enteredSchool.isEmpty || enteredEmail.isEmpty ||
        enteredMajor.isEmpty || enteredAge <= 0) {
      return;
    }

    widget.addUser(
      enteredLastname,
      enteredFirstname,
      enteredSchool,
      enteredEmail,
      enteredMajor,
      enteredAge,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'lastname'),
              controller: lastnameController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'firstname'),
              controller: firstnameController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'school'),
              controller: schoolController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'email'),
              controller: emailController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'major'),
              controller: majorController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'age'),
              controller: ageController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
              child: Text('Add User'),
              textColor: Colors.purple,
              onPressed: submitData,
            ),
          ],
        ),
      ),
    );
  }
}
