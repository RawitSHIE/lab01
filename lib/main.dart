import 'package:flutter/material.dart';
import './ui/first_screen.dart';
import './ui/second_screen.dart';
import './ui/my_custom_form.dart';
import './ui/todo_screen.dart';
import './ui/login_screen.dart';
import './ui/register_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MyHomePage(),
      initialRoute: "/",
      routes: {
        "/": (context) => LoginScreen(),
        "/register": (context) => RegisterScreen(),
        "/second": (context) => SecondScreen(),
        // "/detail": (context) => DetailScreen(),
      },
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("Tabbar"),
//           bottom: TabBar(
//             tabs: <Widget>[
//               Tab(
//                 icon: Icon(Icons.camera),
//                 text: "camera",
//               ),
//               Tab(
//                 icon: Icon(Icons.cake),
//                 text: "cake",
//               ),
//               Tab(
//                 icon: Icon(Icons.add_alarm),
//                 text: "alarm"
//               )
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: <Widget>[
//             Icon(Icons.camera),
//             new Counter(),
//             Icon(Icons.add_alarm)
//           ],
//         ),
//       ),
//     );
//   }
// }

class Counter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CounterState();
  }

}

class CounterState extends State<Counter>{
  int counter = 0;
 @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Hello, RawitSHIE!"),
      // ),
      body:Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("counter status: ${counter}"),
          Text("Value 2"),
          Text("Value 3")
        ],
      ),
      floatingActionButton: IconButton(
        icon: Icon(Icons.add),
        onPressed: () {
          setState(() {
            counter++;
          });
          print(" counter value $counter");
          },
      )
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   int counter = 0;

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Hello, RawitSHIE!"),
//       ),
//       body: Text("counter status: ${counter}"),
//       floatingActionButton: IconButton(
//         icon: Icon(Icons.add),
//         onPressed: () {
//           counter++;
//           print(" counter value $counter");
//           },
//       )
//     );
//   }
// }
