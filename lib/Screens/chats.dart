import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String image;
  final String title;
  final String msg;
  ChatScreen({this.image, this.title, this.msg});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: ListTile(
            leading: Container(
              width: 70,
              height: 100,
              child: CircleAvatar(
                backgroundImage: AssetImage(image),
              ),
            ),
            title: Text(title),
            subtitle: Text(msg),
            trailing: Column(
              children: [
                Text("10:30 pm"),
                Container(
                  width: 24,
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColorLight,
                    child: Text(
                      "3",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Divider()
      ],
    );
  }
}
