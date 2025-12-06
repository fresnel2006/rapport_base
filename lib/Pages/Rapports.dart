import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rapport_base/Pages/Page.dart';

class RapportsPage extends StatefulWidget {
  const RapportsPage({super.key});

  @override
  State<RapportsPage> createState() => _RapportsPageState();
}

class _RapportsPageState extends State<RapportsPage> {
  var message;
  var rapport;
  Future <void> afficher_rapport() async {
    final url=Uri.parse("http://10.0.2.2:8000/afficher_rapport");
    message=await http.get(url);

    setState(() {
      rapport=jsonDecode(message.body);
    });
    print(rapport["resultat"][0]);
  }
  @override
  void dispose(){
    super.dispose();
    rapport.dispose();
  }
  @override
  void initState(){
    super.initState();
    afficher_rapport();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(width: MediaQuery.of(context).size.width *1,),
          SizedBox(height: MediaQuery.of(context).size.height *0.06,),
          Container(child: Text("RAPPORTS",style: TextStyle(fontSize: MediaQuery.of(context).size.width *0.05,fontFamily: "Poppins"),),),
          SizedBox(height: MediaQuery.of(context).size.height *0.02,),
          Container(height: MediaQuery.of(context).size.height *0.004,
          width: MediaQuery.of(context).size.width *0.6,
          color: Colors.black,),

          Container(
            height: MediaQuery.of(context).size.height *0.9,

            child: ListView.builder(itemCount: rapport["resultat"].length,itemBuilder: (context, index) => ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PageRapports(rapport:rapport["resultat"][index],)));
              },
              title: Text("RAPPORT ${index+1}",style: TextStyle(fontFamily: "Poppins",color: Colors.green),),
              subtitle: Text("${rapport["resultat"][0][5]}",style: TextStyle(fontFamily: "Poppins",color: Colors.black45),),
              trailing: Container(child: Icon(Icons.arrow_forward,color: Colors.green,),),
            ),),)
        ],) ,
      ),
    );
  }
}