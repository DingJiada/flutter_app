import 'package:flutter/material.dart';

class ListViewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView Demo Page"),
      ),
      body: ListView.builder(
        itemCount: 100,
        itemExtent: 50,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text("$index"));
        },
      ),
    );
  }
}