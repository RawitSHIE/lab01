import 'dart:io';

import 'package:flutter/material.dart';
import './detail_screen.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

class FirstScreen extends StatefulWidget {
  @override
  FirstScreenState createState() {
    // TODO: implement createState
    return FirstScreenState();
  }
}

class FirstScreenState extends State<FirstScreen> {
  List<String> _passengers = <String>['', '1', '2', '3', '4', '5', '6'];
  String _passenger = "";
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState((){
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera),
        onPressed: (){
          getImage();
        },
      ),
      appBar: AppBar(
        title: Text("First Screen"),
      ),
      body: Column(
        children: <Widget>[
          _image == null? Text("None is selected") : Image.file(_image),
          InputDecorator(
            decoration: InputDecoration(
              icon: Icon(Icons.people),
              labelText: "Passenger",
            ),
            isEmpty: _passenger == "",
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _passenger,
                isDense: true,
                onChanged: (value) {
                  setState(() {
                    _passenger = value;
                  });
                },
                items: _passengers.map((String value) {
                  return DropdownMenuItem(
                    child: Text(value),
                    value: value,
                  );
                }).toList(),
              ),
            ),
          ),
          DateTimePickerFormField(
            inputType: InputType.date,
            format: DateFormat("yyy/MM/dd"),
            decoration: InputDecoration(labelText: "Date"),
          )
        ],
      ),
    );
  }
}
