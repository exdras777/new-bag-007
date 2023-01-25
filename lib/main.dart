import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
//import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';


void main() { runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          //Define the default brightness and colors.
         //brightness: Brightness.dark,
        //primaryColor: Colors.lightBlue[500],

          // Define the default font family.
          //fontFamily: 'Georgia',

          //Define the default `TextTheme`. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
         textTheme: const TextTheme(
           // headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold   ),
           //headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
           // bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          ),
        ),



        home: Principal(),
  ));
}

class Principal extends StatefulWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {

  final realController = MoneyMaskedTextController(precision: 2);
  final dolarUSDController = MoneyMaskedTextController(precision: 2);
  final euroController = MoneyMaskedTextController(precision: 2);
  final pesoARSController = MoneyMaskedTextController(precision: 2);
  final dolCADController = MoneyMaskedTextController(precision: 2);
  final dolAUSController = MoneyMaskedTextController(precision: 2);
  final ieneJPNController = MoneyMaskedTextController(precision: 2);
  final renminbiCNYController = MoneyMaskedTextController(precision: 2);
  final libraGBPController = MoneyMaskedTextController(precision: 2);

  String _preco = "0";
  recuperarpreco() async {
    final url = Uri.parse("https://blockchain.info/ticker");
    http.Response response = await http.get(url);

    final retorno = json.decode(response.body);
    setState(() {
      _preco = retorno['BRL']['buy'].toStringAsFixed(2);
    });
  }

  var dolarUSD,euro,pesoARS,dolAUS,dolCAD,ieneJPN,renminbiCNY,libraGBP;
  RetornaDados() async {
    final url = Uri.parse("https://api.hgbrasil.com/finance?format=json-cors&key=05aaee4a");
    final response = await http.get(url);
    final map = json.decode(response.body);
    setState(() {
      dolarUSD = map["results"]["currencies"]["USD"]["buy"];
      euro = map["results"]["currencies"]["EUR"]["buy"];
      pesoARS = map["results"]["currencies"]["ARS"]["buy"];
      dolCAD = map["results"]["currencies"]["CAD"]["buy"];
      dolAUS = map["results"]["currencies"]["AUD"]["buy"];
      ieneJPN = map["results"]["currencies"]["JPY"]["buy"];
      renminbiCNY = map["results"]["currencies"]["CNY"]["buy"];
      libraGBP = map["results"]["currencies"]["GBP"]["buy"];
    });
  }

  _realConvert(String text){
    setState(() {
      double real = double.parse(text.replaceAll(".", "").replaceAll(",", "."));
      dolarUSDController.text = (real/this.dolarUSD!).toStringAsFixed(2);
      euroController.text = (real/this.euro!).toStringAsFixed(2);
      pesoARSController.text = (real/this.pesoARS!).toStringAsFixed(2);
      dolCADController.text = (real/this.dolCAD!).toStringAsFixed(2);
      dolAUSController.text = (real/this.dolAUS!).toStringAsFixed(2);
      ieneJPNController.text = (real/this.ieneJPN!).toStringAsFixed(2);
      renminbiCNYController.text = (real/this.renminbiCNY).toStringAsFixed(2);
      libraGBPController.text = (real/this.libraGBP).toStringAsFixed(2);
    });
  }
  _dolarConvert(String text){
    setState(() {
      double dolarUSD = double.parse(text.replaceAll(".", "").replaceAll(",", "."));
      realController.text = (dolarUSD * this.dolarUSD!).toStringAsFixed(2);
      euroController.text = (dolarUSD * this.dolarUSD! / this.euro!).toStringAsFixed(2);
      pesoARSController.text = (dolarUSD * this.dolarUSD! / this.pesoARS!).toStringAsFixed(2);
      dolCADController.text= (dolarUSD *  this.dolarUSD! / this.dolCAD).toStringAsFixed(2);
      dolAUSController.text = (dolarUSD *  this.dolarUSD! / this.dolAUS).toStringAsFixed(2);
      ieneJPNController.text = (dolarUSD *  this.dolarUSD! / this.ieneJPN).toStringAsFixed(2);
      renminbiCNYController.text = (dolarUSD * this.dolarUSD! / this. renminbiCNY).toStringAsFixed(2);
      libraGBPController.text = (dolarUSD * this.dolarUSD! / this. libraGBP).toStringAsFixed(2);
    });
  }
  _euroConvert(String text){
    setState(() {
      double euro = double.parse(text.replaceAll(".", "").replaceAll(",", "."));
      realController.text = (euro * this.euro!).toStringAsFixed(2);
      dolarUSDController.text = (euro * this.euro! / this.dolarUSD!).toStringAsFixed(2);
      pesoARSController.text = (euro * this.euro! / this.pesoARS!).toStringAsFixed(2);
      dolCADController.text = (euro * this.euro! / this.dolCAD!).toStringAsFixed(2);
      dolAUSController.text = (euro * this.euro! / this.dolAUS!).toStringAsFixed(2);
      ieneJPNController.text = (euro *  this.euro! / this.ieneJPN).toStringAsFixed(2);
      renminbiCNYController.text = (euro * this.euro! / this. renminbiCNY).toStringAsFixed(2);
      libraGBPController.text = (euro * this.euro! / this. libraGBP).toStringAsFixed(2);

    });
  }
  _pesoConvert(String text){
    setState(() {
      double pesoARS = double.parse(text.replaceAll(".", "").replaceAll(",", "."));
      realController.text = (pesoARS * this.pesoARS!).toStringAsFixed(2);
      dolarUSDController.text = (pesoARS * this.pesoARS! / this.dolarUSD!).toStringAsFixed(2);
      euroController.text = (pesoARS * this.pesoARS! / this.euro!).toStringAsFixed(2);
      dolCADController.text = (pesoARS * this.pesoARS! / this.dolCAD).toStringAsFixed(2);
      dolAUSController.text = (pesoARS * this.pesoARS! / this.dolAUS).toStringAsFixed(2);
      ieneJPNController.text = (pesoARS *  this.pesoARS! / this.ieneJPN).toStringAsFixed(2);
      renminbiCNYController.text = (pesoARS * this.pesoARS! / this. renminbiCNY).toStringAsFixed(2);
      libraGBPController.text = (pesoARS * this.pesoARS! / this. libraGBP).toStringAsFixed(2);

    });
  }
  _dolCADConvert(String text){
    setState(() {
      double dolCAD = double.parse(text.replaceAll(".", "").replaceAll(",", "."));
      realController.text = (dolCAD * this.dolCAD).toStringAsFixed(2);
      dolarUSDController.text = (dolCAD * this.dolCAD! / this.dolarUSD!).toStringAsFixed(2);
      euroController.text = (dolCAD * this.dolCAD! / this.euro!).toStringAsFixed(2);
      pesoARSController.text = (dolCAD * this.dolCAD! / this.pesoARS!).toStringAsFixed(2);
      dolAUSController.text = (dolCAD * this.dolCAD! / this.dolAUS).toStringAsFixed(2);
      ieneJPNController.text = (dolCAD *  this.dolCAD! / this.ieneJPN).toStringAsFixed(2);
      renminbiCNYController.text = (dolCAD * this.dolCAD! / this.renminbiCNY).toStringAsFixed(2);
      libraGBPController.text = (dolCAD * this.dolCAD! / this. libraGBP).toStringAsFixed(2);
    });
  }
  _dolAUSConvert(String text){
    setState(() {
      double dolAUS = double.parse(text.replaceAll(".", "").replaceAll(",", "."));
      realController.text = (dolAUS * this.dolAUS!).toStringAsFixed(2);
      dolarUSDController.text = (dolAUS * this.dolAUS! / this.dolarUSD!).toStringAsFixed(2);
      euroController.text = (dolAUS * this.dolAUS! / this.euro!).toStringAsFixed(2);
      pesoARSController.text = (dolAUS * this.dolAUS! / this.pesoARS!).toStringAsFixed(2);
      dolCADController.text = (dolAUS * this.dolAUS! / this.dolCAD).toStringAsFixed(2);
      ieneJPNController.text = (dolAUS *  this.dolAUS! / this.ieneJPN).toStringAsFixed(2);
      renminbiCNYController.text = (dolAUS * this.dolAUS! / this. renminbiCNY).toStringAsFixed(2);
      libraGBPController.text = (dolAUS * this.dolAUS! / this.libraGBP).toStringAsFixed(2);
    });
  }
  _ieneJPNConvert(String text){
    setState(() {
      double ieneJPN = double.parse(text.replaceAll(".", "").replaceAll(",", "."));
      realController.text = (ieneJPN * this.ieneJPN!).toStringAsFixed(2);
      dolarUSDController.text = (ieneJPN * this.ieneJPN! / this.dolarUSD!).toStringAsFixed(2);
      euroController.text = (ieneJPN * this.ieneJPN! / this.euro!).toStringAsFixed(2);
      pesoARSController.text = (ieneJPN * this.ieneJPN! / this.pesoARS!).toStringAsFixed(2);
      dolCADController.text = (ieneJPN * this.ieneJPN! / this.dolCAD).toStringAsFixed(2);
      dolAUSController.text = (ieneJPN * this.ieneJPN! / this.dolAUS).toStringAsFixed(2);
      renminbiCNYController.text = (ieneJPN * this.ieneJPN! / this. renminbiCNY).toStringAsFixed(2);
      libraGBPController.text = (ieneJPN * this.ieneJPN! / this.libraGBP).toStringAsFixed(2);
    });
  }
  _renminbiCNYConvert(String text){
    setState(() {
      double renminbiCNY = double.parse(text.replaceAll(".", "").replaceAll(",", "."));
      realController.text = (renminbiCNY * this.renminbiCNY!).toStringAsFixed(2);
      dolarUSDController.text = (renminbiCNY * this.renminbiCNY! / this.dolarUSD!).toStringAsFixed(2);
      euroController.text = (renminbiCNY * this.renminbiCNY! / this.euro!).toStringAsFixed(2);
      pesoARSController.text = (renminbiCNY * this.renminbiCNY! / this.pesoARS!).toStringAsFixed(2);
      dolCADController.text = (renminbiCNY * this.renminbiCNY! / this.dolCAD).toStringAsFixed(2);
      dolAUSController.text = (renminbiCNY * this.renminbiCNY! / this.dolAUS).toStringAsFixed(2);
      ieneJPNController.text = (renminbiCNY * this.renminbiCNY! / this.ieneJPN).toStringAsFixed(2);
      libraGBPController.text = (renminbiCNY * this.renminbiCNY! / this.libraGBP).toStringAsFixed(2);
    });
  }
  _libraGBPConvert(String text){
    setState(() {
      double libraGBP = double.parse(text.replaceAll(".", "").replaceAll(",", "."));
      realController.text = (libraGBP * this.libraGBP!).toStringAsFixed(2);
      dolarUSDController.text = (libraGBP * this.libraGBP! / this.dolarUSD!).toStringAsFixed(2);
      euroController.text = (libraGBP * this.libraGBP! / this.euro!).toStringAsFixed(2);
      pesoARSController.text = (libraGBP * this.libraGBP! / this.pesoARS!).toStringAsFixed(2);
      dolCADController.text = (libraGBP * this.libraGBP! / this.dolCAD).toStringAsFixed(2);
      dolAUSController.text = (libraGBP * this.libraGBP! / this.dolAUS).toStringAsFixed(2);
      ieneJPNController.text = (libraGBP *  this.libraGBP! / this.ieneJPN).toStringAsFixed(2);
      renminbiCNYController.text = (libraGBP * this.libraGBP! / this. renminbiCNY).toStringAsFixed(2);
    });
  }

  /*Carregar(){
    if ( dolarUSD == null) {
      return Center(
        child: Text("Obtendo dados...",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      );
    }else{
      return SingleChildScrollView(
        child: Column(
          /*crossAxisAlignment: CrossAxisAlignment.center,*/
          children: [
            Divider(),
            Padding(
              padding: EdgeInsets.only(right:20 ,left: 1,bottom: 1),
              child: TextField(
                controller:realController,
                decoration: InputDecoration(
                    labelText: "Real",
                    labelStyle: TextStyle(color: Color.fromRGBO(211, 189, 12, 1.0)),
                    border: OutlineInputBorder(),
                    prefixText:"R\$ "
                ),
                style: TextStyle(
                  color: Color.fromRGBO(202, 204, 165, 1.0), fontSize: 25,
                ),
                onChanged:_realConvert,
                keyboardType: TextInputType.number,
              ),
            ),
            Divider(),
            Padding(padding: EdgeInsets.only(right: 20,left: 1,bottom: 1),
              child: TextField(
                controller: dolarUSDController,
                decoration: InputDecoration(
                    labelText: "Dolar",
                    labelStyle: TextStyle(color: Color.fromRGBO(
                        211, 189, 12, 1.0)),
                    border: OutlineInputBorder(),
                    prefixText: "US\$ "
                ),
                style: TextStyle(
                  color: Color.fromRGBO(202, 204, 165, 1.0), fontSize: 25,
                ),
                onChanged: _dolarConvert,
                keyboardType: TextInputType.number,
              ),
            ),
            Divider(),
            Padding(padding:EdgeInsets.only(right: 20,left: 1,bottom: 1),
                child: TextField(
                  controller: euroController,
                  decoration: InputDecoration(
                      labelText: "Euro ",
                      labelStyle: TextStyle(color: Color.fromRGBO(211, 189, 12, 1.0)),
                      border: OutlineInputBorder(),
                      prefixText: "€ "
                  ),
                  style: TextStyle(
                    color: Color.fromRGBO(202, 204, 165, 1.0), fontSize: 25,
                  ),
                  onChanged: _euroConvert,
                  keyboardType: TextInputType.number,
                )
            ),
            Divider(),
            Padding(
                padding:EdgeInsets.only(right: 20,left: 5,bottom: 1),
                child: TextField(
                  controller: libraGBPController,
                  decoration: InputDecoration(
                      labelText: "Libra",
                      labelStyle: TextStyle(color: Color.fromRGBO(211, 189, 12, 1.0)),
                      border: OutlineInputBorder(),
                      prefixText: "£ "
                  ),
                  style: TextStyle(
                    color: Color.fromRGBO(202, 204, 165, 1.0), fontSize: 25,
                  ),
                  onChanged:_libraGBPConvert,
                  keyboardType: TextInputType.number,
                )
            ),
            Divider(),
            Padding(
                padding:EdgeInsets.only(right: 20,left: 5,bottom: 1),
                child: TextField(
                  controller: ieneJPNController,
                  decoration: InputDecoration(
                      labelText: "Iene",
                      labelStyle: TextStyle(color: Color.fromRGBO(211, 189, 12, 1.0)),
                      border: OutlineInputBorder(),
                      prefixText: "JP¥ "
                  ),
                  style: TextStyle(
                    color: Color.fromRGBO(202, 204, 165, 1.0), fontSize: 25,
                  ),
                  onChanged: _ieneJPNConvert,
                  keyboardType: TextInputType.number,
                )
            ),
            Divider(),
            Padding(
                padding:EdgeInsets.only(right: 20,left: 5,bottom: 1),
                child: TextField(
                  controller: renminbiCNYController,
                  decoration: InputDecoration(
                      labelText: "Yuan",
                      labelStyle: TextStyle(color: Color.fromRGBO(211, 189, 12, 1.0)),
                      border: OutlineInputBorder(),
                      prefixText: "CN¥ "
                  ),
                  style: TextStyle(
                    color: Color.fromRGBO(202, 204, 165, 1.0), fontSize: 25,
                  ),
                  onChanged: _renminbiCNYConvert,
                  keyboardType: TextInputType.number,
                )
            ),
            Divider(),
            Padding(padding:EdgeInsets.only(right: 20,left: 5,bottom: 1),
              child: TextField(
                controller: dolCADController,
                decoration: InputDecoration(
                    labelText: "Dolar Canadense",
                    labelStyle: TextStyle(color: Color.fromRGBO(211, 189, 12, 1.0)),
                    border: OutlineInputBorder(),
                    prefixText: "CAD\$ "
                ),
                style: TextStyle(
                  color: Color.fromRGBO(202, 204, 165, 1.0), fontSize: 25,
                ),
                onChanged: _dolCADConvert,
                keyb oardType: TextInputType.number,
              ),
            ),
            Divider(),
            Padding(padding:EdgeInsets.only(right: 20,left: 5,bottom: 1),
                child: TextField(
                  controller: dolAUSController,
                  decoration: InputDecoration(
                      labelText: "Dolar Australiano",
                      labelStyle: TextStyle(color: Color.fromRGBO(211, 189, 12, 1.0)),
                      border: OutlineInputBorder(),
                      prefixText: "AU\$ "
                  ),
                  style: TextStyle(
                    color: Color.fromRGBO(202, 204, 165, 1.0), fontSize: 25,
                  ),
                  onChanged: _dolAUSConvert,
                  keyboardType: TextInputType.number,
                )
            ),
            Divider(),
            Padding(padding: EdgeInsets.only(right: 20,left: 5,bottom: 1),
                child:TextField(
                  controller: pesoARSController,
                  decoration: InputDecoration(
                      labelText: "Peso Argentino",
                      labelStyle: TextStyle(color: Color.fromRGBO(
                          211, 189, 12, 1.0)),
                      border: OutlineInputBorder(),
                      prefixText: "AR\$ "
                  ),
                  style: TextStyle(
                    color:Color.fromRGBO(202, 204, 165, 1.0), fontSize: 25,
                  ),
                  onChanged: _pesoConvert,
                  keyboardType: TextInputType.number,
                )
            ),
            Divider(),
          ],
        ),
      );
    }
  }*/

  @override
  void initState() {
    recuperarpreco();
    RetornaDados();
    super.initState();
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(1, 21, 0, 0),
        elevation: 0,
        titleSpacing: 70,
        title: Text("COTAÇÃO DE MOEDAS",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(19, 56, 178, 1.0),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
            color: Color.fromRGBO(30, 36, 224, 1.0),
            width: double.infinity,
            height: 159,
              child:
              TextField(
                decoration: InputDecoration(
                    labelText: "Insira um valor",
                    labelStyle: TextStyle(color: Color.fromRGBO(211, 189, 12, 1.0)),
                    border: OutlineInputBorder(),
                ),
                style: TextStyle(
                  color:Color.fromRGBO(202, 204, 165, 1.0),
                  fontSize: 28,
                ),
              ),
          ),
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height -290,
              child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 69,
                            width: 99,
                            child: ElevatedButton(onPressed: (){},
                              child: Text('R\$'),
                            ),
                          ),
                          Container(
                            height: 69,
                            width: 99,
                            child: ElevatedButton(onPressed: (){},
                              child: Text('R\$'),
                            ),
                          ),
                          Container(
                            height: 69,
                            width: 99,
                            child: ElevatedButton(onPressed: (){},
                              child: Text('R\$'),
                            ),
                          ),
                        ],
                      ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 69,
                        width: 99,
                        child: ElevatedButton(onPressed: (){},
                          child: Text('US\$'),
                        ),
                      ),
                      Container(
                        height: 69,
                        width: 99,
                        child: ElevatedButton(onPressed: (){},
                          child: Text('US\$'),
                        ),
                      ),
                      Container(
                        height: 69,
                        width: 99,
                        child: ElevatedButton(onPressed: (){},
                          child: Text('US\$'),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 69,
                        width: 99,
                        child: ElevatedButton(onPressed: (){},
                          child: Text('€'),
                        ),
                      ),
                      Container(
                        height: 69,
                        width: 99,
                        child: ElevatedButton(onPressed: (){},
                          child: Text('€'),
                        ),
                      ),
                      Container(
                        height: 69,
                        width: 99,
                        child: ElevatedButton(onPressed: (){},
                          child: Text('€'),
                        ),
                      )
                    ],

                  ),

                ],
              ),
            )
    ]
        )
      ),
    );
  }
  }


          /*decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(143, 96, 26, 1.0),
                Color.fromRGBO(21, 6, 77, 1),
                Color.fromRGBO(21, 6, 77, 1),
                Color.fromRGBO(218, 138, 16, 1)],
            ),*/
              //boxShadow:[
               //new BoxShadow(
                 //color: Color.fromRGBO(12, 68, 189, 1.0),//scarfold
                  //offset: new Offset(9,10),
                 // blurRadius: 40,
                 // spreadRadius: 24*/