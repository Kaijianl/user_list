import 'package:flutter/material.dart';

import './widgets/new_user.dart';
import './widgets/user_list.dart';
import './models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ListView',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.amber,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          )),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<User> _users = [
    User(firstname: "Billie", 
        lastname: "Kaila",
        email: "bk21@gatech.edu",
        school: "Gatech",
        major: "Computer Science",
        age: 21,
        pictureURL: "assets/images/profile1.jpg"),
    User(firstname: "Kaijian", 
        lastname: "Li",
        email: "lkj19@gatech.edu",
        school: "Gatech",
        major: "Electrical Engineering",
        age: 19,
        pictureURL: "assets/images/profile4.jpg"),
    User(firstname: "Jessie", 
        lastname: "Price",
        email: "ja23@gatech.edu",
        school: "Gatech",
        major: "Chemical Engieering",
        age: 23,
        pictureURL: "assets/images/profile3.jpg"),
    User(firstname: "Ruth", 
        lastname: "Petit",
        email: "pr23@gatech.edu",
        school: "Gatech",
        major: "Business",
        age: 23,
        pictureURL: "assets/images/profile2.jpg"),
  ];

  void _addNewTransaction(String lastname, String firstname, 
                          String school, String email,
                          String major, int age, String pictureURL) {
    final newUser = User(
       lastname: lastname,
       firstname: firstname,
       school: school,
       email: email,
       major: major,
       age: age,
       pictureURL: pictureURL,
    );

    setState(() {
      _users.add(newUser);
    });

  }

  void _startAddNewUser(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewUser(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Find Ur Interests',
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewUser(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            UserList(_users),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewUser(context),
      ),
    );
  }
}
