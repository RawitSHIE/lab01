import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget{
  @override
  LoginScreenState createState() {
    // TODO: implement createState
    return new LoginScreenState();
  }
  
}

class LoginScreenState extends State {
  final _formkey =GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: "Email"),
                  validator: (value){
                    if (value.isEmpty) return "Email is require";
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Password"),
                  obscureText: true,
                  validator: (value){
                    if (value.isEmpty) return "Missing Password";
                  },
                  keyboardType: TextInputType.text,
                ),
                RaisedButton(
                    child: Text("Login"),
                    onPressed: () {
                      auth.signInWithEmailAndPassword(
                        email:"rawitgun@gmail.com",
                        password: "12345678",
                      ).then((FirebaseUser user){
                        if(user.isEmailVerified){
                          print("got ot home");
                        }else{
                          print("error wrong pass");
                        }
                      });
                    },
                  ),
                FlatButton(
                  child: Text("Register"),
                  textTheme: ButtonTextTheme.accent,
                  onPressed: (){
                    Navigator.pushNamed(context, "/register");
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