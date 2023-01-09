import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'package:rumittask/config.dart';
import 'package:rumittask/fulldetails.dart';

class second extends StatefulWidget {
  String cat_name;

  second(this.cat_name);

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  Future<List> get() async {
    var url =
        Uri.parse('https://dummyjson.com/products/category/${widget.cat_name}');
    var response = await http.get(url);
    // List l=jsonDecode(response.body);
    Map m = jsonDecode(response.body);
    List list = m['products'];
    return list;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //  get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List l = snapshot.data as List;

            return GridView.builder(
              itemCount: l.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
              itemBuilder: (context, index) {
                Config c = Config.get(l[index]);
                double d=double.parse(c.rating.toString());
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return FullDetails(c);
                    },));
                  },
                  child: Container(
                    child: Column(
                      children: [Image.network("${c.thumnail}",width: 100,height: 100,),
                      Text("${c.title}"),
                        Text("Rs. ${c.price}"),
                    RatingBar.builder(
                      initialRating:d,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 20,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    )


                      ],
                    ),
                  ),
                );
              },
            );
          } else
            return CircularProgressIndicator();
        },
      ),
    );
  }
}
