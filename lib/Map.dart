

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrcode/Component.dart';
import 'package:qrcode/LoginScreen.dart';
import 'package:qrcode/RegCubit/Cubit.dart';
import 'package:qrcode/RegCubit/States.dart';
import 'package:qrcode/RegisterScreen.dart';
import 'package:qrcode/Registeration_model.dart';
import 'package:qrcode/login_model.dart';

class map extends StatelessWidget {


  DatabaseReference me = FirebaseDatabase.instance.ref("location");



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context)=> QRRegisterCubit(),
      child: BlocConsumer<QRRegisterCubit , QRRegisterState>(
        listener: (BuildContext context, state){

        },
        builder: (BuildContext context , state){
          return Scaffold(
            appBar: AppBar(
            ),

            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [




                        Expanded(
                          child: Stack(
                            children: [
                              Image(width:double.infinity,
                                image: AssetImage("assets/aast.jpg"),
                              ),


                              Column(
                                children: [

                                  SizedBox(
                                    height: 160,
                                  ),

                                  Row(
                                    children: [

                                      Container(
                                          child: Text("")),
                                      SizedBox(
                                        width: 240,
                                      ),

                                      Container(
                                        child: Text("A",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(
                                    height: 60,
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          child: Text("")),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        child: Text("S",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.lightGreen,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),





                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          child: Text("")),
                                      SizedBox(
                                        width: 130,
                                      ),
                                      Container(
                                        child: Text("P",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.indigoAccent,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),


                                ],
                              ),







                            ],
                          ),
                        ),



                      ],
                    ),
                  ),



                  Expanded(
                    child: Column(
                      children: [
                        
                        
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(onPressed: ()
                                {
                                  me.set(1);
                                },
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(50,50),
                                    shape: const CircleBorder(),
                                  ),
                                  child: Text
                                    (
                                    "A",
                                  ),
                                ),
                              ),

                              Expanded(
                                child: ElevatedButton(onPressed: ()
                                 {
                                  me.set(2);

                                },
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(50,50),
                                    shape: const CircleBorder(),
                                  ),
                                  child: Text
                                    (
                                    "B",
                                  ),
                                ),
                              ),


                            ],
                          ),
                        ),

                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ElevatedButton(onPressed: ()
                                {
                                  me.set(3);

                                },
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(50,50),
                                    shape: const CircleBorder(),
                                  ),
                                  child: Text
                                    (
                                    "station",
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
