import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:absenku/login.dart';

// void main() => runApp(MyApp());

Future<void> main() async {
WidgetsFlutterBinding.ensureInitialized();

 await Firebase.initializeApp();
 runApp(MyApp());
}

class MyApp extends StatelessWidget {
final Stream<QuerySnapshot> _usersStream =
 FirebaseFirestore.instance.collection('users').snapshots();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Praktik Kerja Lapangan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: StreamBuilder(stream: _usersStream, builder:(_,AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
          return const Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
          }

          return ListView(
            shrinkWrap: true,
            children:
            snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
              document.data()! as Map<String, dynamic>;
            return ListTile(
            title: Text(data['userName']),
            );
            }).toList(),
          );
        }
      )
    ),
    );
  }
}


