import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeView extends StatefulWidget {
  final String user;

  HomeView({Key key, this.user}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Icon(Icons.location_on, color: Colors.blue),
            Text(
              'Indore',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.normal),
            ),
            Icon(Icons.arrow_drop_down, color: Colors.blue),
          ],
        ),
        leading: Icon(
          Icons.menu,
          color: Colors.blue,
        ),
        actions: [
          Icon(Icons.search_rounded),
          IconButton(
              icon: Icon(Icons.notifications, color: Colors.blue),
              onPressed: () {})
        ],
      ),
      body: Center(
        child: Text('Welcome, ${widget.user}'),
      ),
    );
  }
}
