import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp_ui/Screens/status.dart';

import 'calls.dart';
import 'chats.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
File image;

  Widget getImageWidget() {
    if (image != null) {
      return Image(
          fit: BoxFit.cover,
          image: FileImage(image));
      // CircleAvatar(
      //     backgroundColor: Colors.transparent,
      //     radius: 80,
      //     child: Image.file(
      //       image,
      //       height: 200,
      //       width: 200,
      //       fit: BoxFit.cover,
      //     )
      // );
    }
    else {
      return CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 80,
        child: Text('no image loaded',style: TextStyle(color: Colors.green),),
      );
    }
  }

  ImagePicker imagePicker = ImagePicker();
  Future getImage() async {
    final picker = await imagePicker.getImage(source: ImageSource.camera);
    if (picker != null) {
      setState(() {
        image = File(picker.path);
      });
    }
  }

  var arr_chat = [
    {
      'title': 'ali',
      'image': 'assets/images/user.png',
      'msg': 'where are u?',
    },
    {
      'title': 'pola',
      'image': 'assets/images/user7.jpg',
      'msg': 'where are u?',
    },
    {
      'title': 'mohammed',
      'image': 'assets/images/user1.jpg',
      'msg': 'where are u?',
    },
    {
      'title': 'ali',
      'image': 'assets/images/user.png',
      'msg': 'where are u?',
    },
    {
      'title': 'ali',
      'image': 'assets/images/user.png',
      'msg': 'where are u?',
    },
    {
      'title': 'mado',
      'image': 'assets/images/user5.jpg',
      'msg': 'where are u?',
    },
    {
      'title': 'mohsen',
      'image': 'assets/images/user2.jpg',
      'msg': 'where are u?',
    },
    {
      'title': 'yasser',
      'image': 'assets/images/user3.jpg',
      'msg': 'ازيك يسطا؟',
    },
    {
      'title': 'mona',
      'image': 'assets/images/user4.jpg',
      'msg': 'فينك',
    },
    {
      'title': 'ali',
      'image': 'assets/images/user.png',
      'msg': 'where are u?',
    },
  ];

  @override
  void initState() {
    _tabController = TabController(length: 4, initialIndex: 1, vsync: this)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('WhatsApp'),
          actions: [
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
            IconButton(icon: Icon(Icons.more_vert), onPressed: () {})
          ],
          bottom: TabBar(
            isScrollable: true,
            controller: _tabController,
            indicatorColor: Colors.white,
            labelPadding: EdgeInsets.all(12),
            tabs: [
              Icon(Icons.camera_alt),
              Container(
                  width: 90, alignment: Alignment.center, child: Text('CHATS')),
              Container(
                  width: 90,
                  alignment: Alignment.center,
                  child: Text('STATUS')),
              Container(
                  width: 90, alignment: Alignment.center, child: Text('CALLS'))
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            getImageWidget(),
            ListView.builder(
                itemCount: arr_chat.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ChatScreen(
                        image: arr_chat[index]['image'],
                        title: arr_chat[index]['title'],
                        msg: arr_chat[index]['msg'],
                      ),
                    ],
                  );
                }),
            ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    StatusScreen(
                      image: "assets/images/user4.jpg",
                    )
                  ],
                );
              },
            ),
            ListView.builder(
              itemCount: arr_chat.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    CallsScreen(
                      image: arr_chat[index]['image'],
                      title: arr_chat[index]['title'],
                    )
                  ],
                );
              },
            )
          ],
        ),
        floatingActionButton: _tabController.index == 1
            ? FloatingActionButton(
          onPressed: () {},
          backgroundColor: Theme
              .of(context)
              .primaryColorLight,
          child: Icon(Icons.message),
        )
            : _tabController.index == 2 ||_tabController.index == 0 ?
        FloatingActionButton(
          onPressed: () {
            getImage();
          },
          backgroundColor: Theme
              .of(context)
              .primaryColorLight,
          child: Icon(Icons.camera_alt),
        ) : _tabController.index == 3 ? FloatingActionButton(
          onPressed: () {},
          backgroundColor: Theme
              .of(context)
              .primaryColorLight,
          child: Icon(Icons.add_call),
        ) : Text('')
    );
  }
}
