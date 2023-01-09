import 'package:flutter/material.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:rumittask/config.dart';

class FullDetails extends StatefulWidget {
  Config c;

  FullDetails(this.c);

  @override
  State<FullDetails> createState() => _FullDetailsState();
}

class _FullDetailsState extends State<FullDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),
      body: Column(children: [
        Expanded(child: GFCarousel(
          items: widget.c.imges.map(
                (url) {
              return Container(
                margin: EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Image.network(
                      url,
                      fit: BoxFit.cover,
                      width: 1000.0
                  ),
                ),
              );
            },
          ).toList(),
          onPageChanged: (index) {
            setState(() {
              index;
            });
          },
        ),),
        Expanded(child: Text("${widget.c.title}")),




      ],),
    );
  }
}
