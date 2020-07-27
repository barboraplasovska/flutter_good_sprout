// home_screen.dart

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:good_sprout/constants.dart';
import 'package:good_sprout/services/auth.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.auth, this.userId, this.onSignedOut})
      : super(key: key); //update this to include the uid in the constructor

  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;

  @override
  void initState() {
    super.initState();
    initUser();
  }

  initUser() async {
    // ignore: unused_local_variable
    final FirebaseUser user = await _auth.currentUser();
  }

  @override
  Widget build(BuildContext context) {
    // final AuthService _auth = AuthService();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: lightGreenColor,
          leading: IconButton(
            icon: Icon(Icons.menu),
            iconSize: 40.0,
            color: Colors.white,
            onPressed: () {
              _showMenu();
            },
          ),
          title: Text(
            'My plants',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          actions: <Widget>[
            FlatButton.icon(
              padding: EdgeInsets.only(right: size.width * 0.04),
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: Text(
                'Log out',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              onPressed: () {
                _signOut();
              },
            ),
          ],
        ),
        body: Container(
            color: Colors.white,
            height: size.height,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: size.height * 0.2,
                  ),
                  Text(
                    'Hello ${user?.displayName}',
                    style: TextStyle(color: Colors.black, fontSize: 48),
                  ),
                  SizedBox(
                    height: size.height * 0.12,
                  ),
                ],
              ),
            )));
  }

  _signOut() async {
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  void _removeUser() {
    widget.auth.deleteUser();
  }

  Widget _showMenu() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(26.0),
        children: <Widget>[
          MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            onPressed: () {
              _removeUser();
            },
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            color: Colors.red,
            textColor: Colors.white,
            child: Text(
              "Remove User",
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
