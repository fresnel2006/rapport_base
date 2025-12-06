import 'dart:convert';

import 'dart:typed_data';

import 'package:flutter/material.dart';

class PageRapports extends StatefulWidget {
  PageRapports({super.key, required this.rapport});
  var rapport;
  @override
  State<PageRapports> createState() => _PageRapportsState();
}

class _PageRapportsState extends State<PageRapports> {
  var imageBytes;
  @override
  void initState(){
    super.initState();
    print(widget.rapport);
    setState(() {
      imageBytes = base64Decode(widget.rapport[4]);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: MediaQuery.of(context).size.width *0.04),
              alignment: Alignment.topLeft,
              child: Column(children: [
                SizedBox(height: MediaQuery.of(context).size.height *0.06,),
                Container(child: Row(children: [
                  Text("NUMERO : ",style: TextStyle(fontFamily: "Poppins",color: Colors.green,)),
                  Text("${widget.rapport[0]}",style: TextStyle(fontFamily: "Poppins"),)
                ],),),
                SizedBox(height: MediaQuery.of(context).size.height *0.005,),
                Container(child: Row(children: [
                  Text("LATITUDE : ",style: TextStyle(fontFamily: "Poppins",color: Colors.green,)),
                  Text("${widget.rapport[1]}",style: TextStyle(fontFamily: "Poppins"))
                ],),),
                SizedBox(height: MediaQuery.of(context).size.height *0.005,),
                Container(child: Row(children: [
                  Text("LONGITUDE : ",style: TextStyle(fontFamily: "Poppins",color: Colors.green,)),
                  Text("${widget.rapport[2]}",style: TextStyle(fontFamily: "Poppins"))
                ],),),
                SizedBox(height: MediaQuery.of(context).size.height *0.005,),
                Container(child: Row(children: [
                  Text("JOUR DU RAPPORT : ",style: TextStyle(fontFamily: "Poppins",color: Colors.green,)),
                  Text("${widget.rapport[5]}",style: TextStyle(fontFamily: "Poppins"))
                ],),),



              ],),),

    SizedBox(height: MediaQuery.of(context).size.height *0.03,),
    Container(width: MediaQuery.of(context).size.width *0.7,
    decoration: BoxDecoration(
    border: Border.all(color: Colors.black),
    color: Colors.black,),

    ),SizedBox(height: MediaQuery.of(context).size.height *0.03,),
            Container(
              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width *0.04,right: MediaQuery.of(context).size.width *0.04),
              child: Column(children: [
              Text("DESCRIPTION : ",style: TextStyle(fontFamily: "Poppins",color: Colors.green,fontSize: MediaQuery.of(context).size.width *0.06)),
                SizedBox(height: MediaQuery.of(context).size.height *0.02,),
              Text("${widget.rapport[3]}",style: TextStyle(fontFamily: "Poppins",color: Colors.black87))
            ],),),
            SizedBox(height: MediaQuery.of(context).size.height *0.04,),
            Container(
              child:
              Image.memory(height: MediaQuery.of(context).size.height *0.3,
                imageBytes,
                fit: BoxFit.cover,
              ),

            ),
            SizedBox(height: MediaQuery.of(context).size.height *0.04,),
            Container(child: ElevatedButton(onPressed: (){
Navigator.pop(context);
            }, child: Text("RETOUR",style: TextStyle(color: Colors.white),),style: ElevatedButton.styleFrom(backgroundColor: Colors.green),),)
          ],
        ),),
    );
  }
}