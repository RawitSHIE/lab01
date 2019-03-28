import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RegisterScreenState();
  }
}

class RegisterScreenState extends State {
  final _formkey = GlobalKey<FormState>();

  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: "Email"),
                  validator: (value) {
                    if (value.isEmpty) return "Email is require";
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Password"),
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty && value.length < 8)
                      return "Missing Password";
                  },
                  keyboardType: TextInputType.text,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Repeat Password"),
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty) return "Missing Password";
                  },
                  keyboardType: TextInputType.text,
                ),
                RaisedButton(
                  child: Text("register"),
                  onPressed: () {
                    auth
                        .createUserWithEmailAndPassword(email: "rawitgun@gmail.com", password: "12345678")
                        .then((FirebaseUser user) {
                          user.sendEmailVerification();
                          print(user.email);
                        }).catchError((error){
                          print("$error");
                        }
                        );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
