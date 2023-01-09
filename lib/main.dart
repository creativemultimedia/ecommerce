import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rumittask/second.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Future<List> get()
  async {
    var url = Uri.parse('https://dummyjson.com/products/categories');
    var response = await http.get(url);
    List l=jsonDecode(response.body);
    return l;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(future: get(),builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.done){
          List list=snapshot.data as List;
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return second(list[index]);
                },));
              },
              title: Text(list[index]),);
          },);
        }else
          {
            return CircularProgressIndicator();
          }
      },),
    );
  }
}
