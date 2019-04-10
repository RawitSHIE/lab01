import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BookScreenState();
  }
}

class BookScreenState extends State<BookScreen> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController authorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Book"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(labelText: "Title"),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Missing Title";
                  }
                },
              ),
              TextFormField(
                controller: authorController,
                decoration: InputDecoration(labelText: "Author"),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Missing Author";
                  }
                },
              ),
              RaisedButton(
                child: Text("Save"),
                onPressed: () {
                  if (_formkey.currentState.validate()) {
                    print("$authorController $titleController");
                    Firestore.instance.collection('books').add({
                      "title": titleController.text,
                      "author": authorController.text
                    }).then((doc) {
                      print(doc.toString());
                    });
                  } else {
                    print("Value error");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
