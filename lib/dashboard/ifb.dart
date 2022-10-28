import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchUsers() async {
  var result =
  await http.get(Uri.parse(
    "https://api.jsonbin.io/v3/b/635281f365b57a31e69dd08a"
      //"https://randomuser.me/api/?results=20"
  ));
  return jsonDecode(result.body)['record']['dailyplan'];
}

class IFBMyApi extends StatefulWidget {
  IFBMyApi({Key? key}) : super(key: key);

  @override
  _IFBMyApiState createState() => _IFBMyApiState();
}

class _IFBMyApiState extends State<IFBMyApi> {
  late Future response;

  @override
  void initState() {
    response = fetchUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text("DashBoard"),
      ),
      body: myApiWidget(),
    );
  }

  myApiWidget() {
    return FutureBuilder(
      future: response,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: Colors.blue[100],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ListTile(
                      title: Text("Name: "+snapshot.data[index]['name']),
                      trailing:
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //SizedBox(height: 8,),
                          Text("Plan Achieved: "),
                          SizedBox(height: 5,),
                          Text(((snapshot.data[index]['production']/snapshot.data[index]['plan']*100).truncateToDouble().toString())+"%"),

                        ],
                      ),
                      leading:
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(snapshot.data[index]['sequence']),
                        ],
                      ),
                      /*leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          snapshot.data[index]['picture']['large'],
                        ),
                      ),
                       */
                      subtitle:
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5,),
                          Text("Code: "+snapshot.data[index]['code']),
                          SizedBox(height: 5,),
                          Text("Plan: "+snapshot.data[index]['plan'].toString()),
                          SizedBox(height: 5,),
                          Text("Production: "+snapshot.data[index]['production'].toString()),
                          SizedBox(height: 5,),

                          ],
                      ),
                    )
                  ],
                ),
              );
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
/*
  myApiWidget() {
    return FutureBuilder(
      future: response,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(snapshot.data[index]['name']['title'] +
                          " " +
                          snapshot.data[index]['name']['first'] +
                          " " +
                          snapshot.data[index]['name']['last']),
                      trailing:
                      Text(snapshot.data[index]['dob']['age'].toString()),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          snapshot.data[index]['picture']['large'],
                        ),
                      ),
                      subtitle: Text(snapshot.data[index]['email']),
                    )
                  ],
                ),
              );
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
   */


}