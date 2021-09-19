import 'dart:html';

import 'package:flutter/material.dart';

class detailpage extends StatefulWidget {
  //const detailpage({ Key? key }) : super(key: key);

  final v1, v2, v3, v4;
  detailpage(this.v1,this.v2,this.v3,this.v4);

  @override
  _detailpageState createState() => _detailpageState();
}

class _detailpageState extends State<detailpage> {

  var _v1, _v2, _v3, _v4;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _v1 = widget.v1;
    _v2 = widget.v2;
    _v3 = widget.v3;
    _v4 = widget.v4;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('อันตรายจากพลาสติก'),),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    _v1,
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),
                  Text(
                    _v2,
                    style: TextStyle(
                      fontSize: 18
                    ),
                  ),
                ],
              ),
            ),
            Image.network(_v3),
            Text(
              _v4,
              style: TextStyle(
                fontSize: 14
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}