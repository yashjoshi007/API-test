import 'dart:convert';

import 'package:http/http.dart';
import 'package:intern/usermodel.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class Listone extends StatefulWidget {
  const Listone({Key? key}) : super(key: key);

  @override
  _ExampleThreeState createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<Listone> {

  List<Usermodel> userList = [] ;

  Future<List<Usermodel>> getUserApi ()async{
    final response =await http.get(Uri.parse('https://gorest.co.in/public/v2/users'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      for(Map i in data){
        print(i['name']);
        userList.add(Usermodel.fromJson(i));
      }
      return userList;
    }else {
      return userList;

    }
  }
  final url = "https://gorest.co.in/public/v2/users";
  void postData() async{
    try{
      final response = await post(Uri.parse(url),body: {
       "name": "YYAASH",
       "email": "yaassy@gmail.com",
       "gender": "male",
       "status": "active"
      },
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer 1c58030f184610aa5ad8a3425af284b334e64fd5a08780773bde612b2ae6400d',
        });
      print(response.body);
      Fluttertoast.showToast(
          msg: "The user is added.",  // message
          toastLength: Toast.LENGTH_SHORT, // length
          gravity: ToastGravity.CENTER,    // location
                       // duration
      );

    }catch(er){}
  }
  final urb = "https://gorest.co.in/public/v2/users/7792";
  void deleteData() async {
    try {
      final response = await delete(Uri.parse(urb), body: {
        "name": "YYAASSSSH",
        "email": "yaasshhy@gmail.com",
        "gender": "male",
        "status": "active"
      },
          headers: {
            HttpHeaders
                .authorizationHeader: 'Bearer 1c58030f184610aa5ad8a3425af284b334e64fd5a08780773bde612b2ae6400d',
          });
      print(response.body);
      Fluttertoast.showToast(
        msg: "The user is deleted", // message
        toastLength: Toast.LENGTH_SHORT, // length
        gravity: ToastGravity.CENTER, // location
        // duration
      );
    } catch (er) {}
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Users List'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: () {
              // do something
              postData();
            },
          )
        ],

      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUserApi () ,
              builder: (context ,AsyncSnapshot<List<Usermodel>> snapshot){

                if(!snapshot.hasData){
                  return CircularProgressIndicator();
                }else{
                  return ListView.builder(
                      itemCount: userList.length,
                      itemBuilder: (context , index){
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Card(
                                child: ListTile(

                            title: ReusbaleRow(title: '', value: snapshot.data![index].name.toString()),
                               onTap: (){

                               },
                                ),
                                )],
                            ),
                          ),

                        );
                      });
                }

              },
            ),
          ),
        ],

      ),

    );
  }

}

class ReusbaleRow extends StatelessWidget {
  String title , value ;
  ReusbaleRow({Key? key , required this.title , required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value ),

        ],
      ),
    );
  }
}