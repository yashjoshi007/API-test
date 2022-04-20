import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'list.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {




  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(

        resizeToAvoidBottomInset: false,
        body: Column(
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(15.0, 80.0, 0.0, 0.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Signup',
                          style: GoogleFonts.poppins(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(140, 10, 0.0, 0.0),
                            child: CircleAvatar(
                              backgroundImage: AssetImage("assets/f1.jpg"),
                              radius: 45,
                            )
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 35.0, left: 0.0, right: 5.0),
                          child: Row(
                            children: [
                              Expanded(child: TextField(

                                decoration: InputDecoration(

                                  border: OutlineInputBorder(),
                                  labelText: 'Username',
                                  prefixIcon: Icon(Icons.person),
                                  labelStyle: GoogleFonts.poppins(



                                  ),


                                ),
                              ),
                              ),







                            ],
                          ),

                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 35.0, left: 0.0, right: 5.0),
                          child: Row(
                            children: [
                              Expanded(child: TextField(

                                decoration: InputDecoration(

                                  border: OutlineInputBorder(),
                                  labelText: 'Password',
                                  prefixIcon: Icon(Icons.vpn_key),
                                  labelStyle: GoogleFonts.poppins(



                                  ),


                                ),
                              ),
                              ),







                            ],
                          ),

                        ),

                      ]
                  )
              ),


              Padding(
                padding: EdgeInsets.only(top: 5.0, left: 0.0, right: 0.0),
                child: Column(
                  children: [




                    SizedBox(height: 10.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('By continuing you accept our Privacy Policy and terms of use.',
                          style: GoogleFonts.poppins(
                            fontSize: 12,

                          ),),


                      ],
                    ),
                    SizedBox(height: 40.0,),
                    Container(

                      decoration: BoxDecoration(
                          boxShadow: [BoxShadow(

                            color: Colors.black,
                            spreadRadius: 1,
                            offset: Offset(4,4),

                          )
                          ]
                      ),
                      child: ElevatedButton(onPressed:() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Listone()));
                      } , child: const Text('Signup'),
                        style: ElevatedButton.styleFrom(

                          minimumSize: Size(280,50),
                          textStyle: GoogleFonts.poppins(fontSize: 24,),
                          primary: Colors.orange,
                          onPrimary: Colors.white,
                          elevation: 10,
                          shadowColor: Colors.black,


                        ),
                      ),


                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already Have an Account ?',
                          style: GoogleFonts.poppins(

                          ),),
                        SizedBox(width: 5.0,),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Listone()));
                          },
                          child: Text('Login', style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,

                            color: Colors.orange,
                          ),),
                        ),
                      ],
                    )


                  ],
                ),

              ),


            ]
        )
    );

  }
}
void _tripEditModalBottomSheet(context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext bc) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
        ),
        height: MediaQuery
            .of(context)
            .size
            .height * .40,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text("Choose your Gender",style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.cancel,
                      color: Colors.orange,
                      size: 25,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),

              ElevatedButton(onPressed: (){}, child: Text('Male',style: GoogleFonts.poppins(fontSize: 14),),),
              SizedBox(height: 5,),
              ElevatedButton(onPressed: (){}, child: Text('Female',style: GoogleFonts.poppins(fontSize: 14),),),
              SizedBox(height: 5,),
              ElevatedButton(onPressed: (){}, child: Text('Trans Gender',style: GoogleFonts.poppins(fontSize: 14),),),
              SizedBox(height: 5,),
              ElevatedButton(onPressed: (){}, child: Text('Prefer Not to say',style: GoogleFonts.poppins(fontSize: 14),),),
              SizedBox(height: 5,),
              Container(

                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(
                      color: Colors.black,
                      spreadRadius: 0.5,


                    )
                    ]
                ),
                child: ElevatedButton(onPressed:() {} , child: const Text('Done'),
                  style: ElevatedButton.styleFrom(

                    minimumSize: Size(200,30),
                    textStyle: GoogleFonts.poppins(fontSize: 32,),
                    primary: Colors.orange,
                    onPrimary: Colors.white,
                    elevation: 10,
                    shadowColor: Colors.black,


                  ),
                ),


              ),

            ],
          ),
        ),
      );
    },
  );
}
