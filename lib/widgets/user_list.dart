import 'package:flutter/material.dart';
import '../models/user.dart';

class UserList extends StatelessWidget {
  final List<User> users;

  UserList(this.users);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: users.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No available users!',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        child: CircleAvatar(
                            radius: 35.0,
                            backgroundImage:
                            AssetImage("${users[index].pictureURL}"),
                            backgroundColor: Colors.transparent,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Name: " + users[index].lastname + " " + users[index].firstname,
                            style: Theme.of(context).textTheme.title,
                          ),
                          Text(
                            "Major: " + users[index].major,
                            style: Theme.of(context).textTheme.title,
                          ),
                          Text(
                            "Email: " + users[index].email,
                            style: Theme.of(context).textTheme.title,
                          ),
                          Text(
                            "Age: " + '${users[index].age.toStringAsFixed(0)}',
                            style: Theme.of(context).textTheme.title,
                        ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              itemCount: users.length,
            ),
    );
  }
}
