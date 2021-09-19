import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:layout/pages/detail.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class Homepage extends StatefulWidget {
  //const Homepage({ Key? key }) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Green Concept'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: FutureBuilder(
          builder: (context, AsyncSnapshot snapshot) {

            //var data = json.decode(snapshot.data.toString());

            return ListView.builder(
              itemBuilder: (BuildContext context, int index){
                return MyBox(snapshot.data[index]['title'], snapshot.data[index]['subtitle'], snapshot.data[index]['image'], snapshot.data[index]['detail']);
              },
              itemCount: snapshot.data.length,
            );

          },
          future: getData(),
          //future: DefaultAssetBundle.of(context).loadString('assets/data.json'),
        )
      ),
    );
  }

  Widget MyBox(String title,String desc,String coverimg, String detail) {
    var v1, v2, v3, v4;
    v1 = title;
    v2 = desc;
    v3 = coverimg;
    v4 = detail;
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: 25),
      padding: EdgeInsets.all(25),
      height: 200,
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(coverimg),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.40), BlendMode.darken),
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color:Colors.white,
            ),
          ),
          SizedBox(height: 20),
          Text(
            desc,
            style: TextStyle(
              fontSize: 15,
              color:Colors.white,
            ),
          ),
          SizedBox(height: 20),
          TextButton(
            onPressed: (){
              print('Next Page!>>');
              Navigator.push(context, MaterialPageRoute(builder: (context)=>detailpage(v1,v2,v3,v4)));
            },
            child: Text('Read More'))
        ],
      ),
    );
  }

  Future getData() async {
    //https://raw.githubusercontent.com/KitisakChalongjan/BasicAPI/main/data.json
    var url = Uri.https('raw.githubusercontent.com', '/KitisakChalongjan/BasicAPI/main/data.json');
    var response = await http.get(url);
    var result = json.decode(response.body);
    return result;
  }
}
