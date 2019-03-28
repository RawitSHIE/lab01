import 'package:flutter/material.dart';
import '../model/todo.dart';
class TodoScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    TodoProvider todo = TodoProvider();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("TodoScreen"),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(child: Text("Open DB"),
          onPressed: (){
            todo.open("todo.db");
          },),

          RaisedButton(child: Text("Insert"),
          onPressed: () async{
            Todo data = Todo();
            data.title = "";
            data.done = false;
            Todo result1 = await todo.insert(data);
            print(result1);
          },),

          RaisedButton(child: Text("Get"),
          onPressed: () async{
            Todo data = await todo.getTodo(1);
            print(data.toMap());
          },),

          RaisedButton(child: Text("Update"),
          onPressed: () async{
            Todo newData = Todo();
            newData.id = 1;
            newData.title = "New Test";
            newData.done = true;

            int result = await todo.update(newData);
            print(result);
          },),

          RaisedButton(child: Text("Delete"),
          onPressed: () async{
            int result = await todo.delete(1);
            print(result);
          },),

          RaisedButton(child: Text("Close DB"),
          onPressed: (){
            todo.close();
          },),

        ],
      ),
    );
  }
  
}