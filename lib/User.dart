
import 'package:flutter/material.dart';
import 'package:qrcode/Component.dart';
import 'package:qrcode/Homepage.dart';
import 'package:qrcode/LoginScreen.dart';
import 'package:qrcode/Map.dart';

class usre extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage("assets/dcfb25beb7d38c53b1e5211957ac5865ee951758.jpeg"),
        //   )
        // ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(
                  "Introduce Yourself",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic
                ),
              ),
              SizedBox(
                height: 50,
              ),

              Row(
                children: [

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: (){
                            navigateTo(context, map());
                          },
                          icon:CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(
                              "https://cdn-icons-png.flaticon.com/512/2362/2362391.png",
                            ),
                            backgroundColor: Colors.white,
                          ),
                        ),
                        Text(
                          "Sender",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Spacer(),


                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: (){
                            navigateTo(context, homepage());
                          },
                          icon:CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(
                              "https://cdn-icons-png.flaticon.com/512/1585/1585149.png",
                            ),
                            backgroundColor: Colors.white,
                          ),
                        ),

                        Text(
                          "Receiver",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
