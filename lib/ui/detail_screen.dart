import 'package:flutter/material.dart';
class DetailScreen extends StatelessWidget{
  String title;
  DetailScreen({this.title});
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("$title Screen"),
      ),
      body: Center(
        child: FlatButton(child: Text("Back to firstscreen"),
        onPressed: () {
          Navigator.pushNamed(context, "/second");
        },)
      ),
    );
  }
}
