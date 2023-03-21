
import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';


class homepage extends StatefulWidget {

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  DatabaseReference ref = FirebaseDatabase.instance.ref("qr");
  DatabaseReference ref1 = FirebaseDatabase.instance.ref("qr1");
  DatabaseReference ref2 = FirebaseDatabase.instance.ref("qr2");
  DatabaseReference loc = FirebaseDatabase.instance.ref("location");



  final qrkey = GlobalKey(debugLabel: 'QR');

  Barcode? barcode;
  QRViewController ? controller;



  @override
  Widget build(BuildContext context) => SafeArea(
    child: Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          buildQrView(context),
          Positioned(bottom: 10 ,child: buildResult())
        ],
      ),
    ),
  );


  Widget buildResult()=> Container(
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white24,



    ),
    child: Column(

      children: [
        Row(
          children: [
            IconButton(onPressed: ()
            {
              controller?.resumeCamera();
            },
                icon: CircleAvatar(
                  radius: 15,
                  child: Icon(
                    Icons.qr_code_scanner_outlined,
                  ),
                )
            ),

            Row(
              children: [
                Text(
                  barcode != null ? 'result : ${barcode!.code}':'scan the code',
                  maxLines: 100,
                ),
              ],
            ),
          ],
        ),



        Row(
          children: [
            TextButton.icon(onPressed: ()
            {
              loc.set(4);
            },
              icon: CircleAvatar(
                radius: 15,
                child: Icon(
                  Icons.done_outline,
                ),
              ), label: Text(
                "Received",
              ),
            ),
          ],
        ),
          ],
        ),

  );






  Widget buildQrView(BuildContext context)=> QRView(
    key : qrkey,
    onQRViewCreated: onQRViewCreated,
    overlay: QrScannerOverlayShape(
      cutOutSize: MediaQuery.of(context).size.width * 0.6,
      borderWidth: 10,
      borderLength: 60,
      borderRadius: 10,


    ),
  );




  Future<void> onQRViewCreated(QRViewController controller) async {
    DatabaseEvent event = await ref.once();
    DatabaseEvent event1 = await ref1.once();
    DatabaseEvent event2 = await ref2.once();
    this.controller = controller;
    controller.scannedDataStream.listen((barcode) {
      setState(()    {
        this.barcode = barcode;
        ref.set("https://belalbebo");
        ref1.set("https://ahmedshatla");
        ref2.set("https://himaaast");
        if ((event.snapshot.value).toString() == ('${barcode.code}').toString() ||
            (event1.snapshot.value).toString() == ('${barcode.code}').toString() ||
            (event2.snapshot.value).toString() == ('${barcode.code}').toString()){
          loc.set(5);

          print("done");
        }

        else{
          loc.set(6);

          print("error");
        }

        print('${barcode.code}'.toString());
        print(event.snapshot.value);
      });
    });


  }





}
