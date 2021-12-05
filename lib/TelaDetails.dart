import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  // const Details({Key? key}) : super(key: key);
  var detail;

  Details(this.detail);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.detail["title"]),
        backgroundColor: Colors.black87,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              // remove codigo html
              Text(widget.detail["body"].replaceAll(new RegExp(r'(<([^>]+)>)'), '').toString(), style: TextStyle(fontSize: 17),),
              Text(widget.detail["html_url"].toString(), style: TextStyle(color: Colors.grey),)
            ],
          ),
        )
      ),
    );
  }
}
