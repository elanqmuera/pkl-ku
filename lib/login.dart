import 'package:flutter/material.dart';
class login extends StatefulWidget {
  const login({ Key? key }) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),),
        body: Container(
          child: Center(child: Text ("ini halaman login") ),
        ),
        
      
    );
  }
}