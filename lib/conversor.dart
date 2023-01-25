/* import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class conversor extends StatefulWidget {

  @override
  _conversorState createState() => _conversorState();
}

class _conversorState extends State<conversor> { /**/

  final realController = TextEditingController();
  final dolarUSDController = TextEditingController();
  final euroController = TextEditingController();
  final pesoARSController = TextEditingController();
  final dolCADController = TextEditingController();
  final dolAUSController = TextEditingController();
  final ieneJPNController = TextEditingController();
  final renminbiCNYController = TextEditingController();
  final libraGBPController = TextEditingController();


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
      double real = double.parse(text);
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
      double dolarUSD = double.parse(text);
      realController.text = (dolarUSD * this.dolarUSD!).toStringAsFixed(2);
      euroController.text = (dolarUSD * this.dolarUSD! / this.euro!).toStringAsFixed(2);
      pesoARSController.text = (dolarUSD / this.pesoARS!).toStringAsFixed(2);
      dolCADController.text= (dolarUSD *  this.dolarUSD! / this.dolCAD).toStringAsFixed(2);
      dolAUSController.text = (dolarUSD *  this.dolarUSD! / this.dolAUS).toStringAsFixed(2);
      ieneJPNController.text = (dolarUSD *  this.dolarUSD! / this.ieneJPN).toStringAsFixed(2);
      renminbiCNYController.text = (dolarUSD * this.dolarUSD! / this. renminbiCNY).toStringAsFixed(2);
      libraGBPController.text = (dolarUSD * this.dolarUSD! / this. libraGBP).toStringAsFixed(2);
    });
  }
  _euroConvert(String text){
    setState(() {
      double euro = double.parse(text);
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
      double pesoARS = double.parse(text);
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
      double dolCAD = double.parse(text);
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
      double dolAUS = double.parse(text);
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
      double ieneJPN = double.parse(text);
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
      double renminbiCNY = double.parse(text);
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
      double libraGBP = double.parse(text);
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

  
  Carregar(){
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
          crossAxisAlignment: CrossAxisAlignment.end ,
          children: [


            Divider(),
            Padding(
              padding: EdgeInsets.only(right: 25,left: 5,bottom: 1),
              child: TextField(
                controller: realController,
                decoration: InputDecoration(
                    labelText: "Real",
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(),
                    prefixText: "R\$ "
                ),
                style: TextStyle(
                  color: Colors.black, fontSize: 25,
                ),
                onChanged: _realConvert,
                keyboardType: TextInputType.number,
              ),
            ),
            Divider(),
            Padding(padding: EdgeInsets.only(right: 25,left: 5,bottom: 1),
                child: TextField(
                  controller: dolarUSDController,
                  decoration: InputDecoration(
                      labelText: "Dolar",
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(),
                      prefixText: "US\$ "
                  ),
                  style: TextStyle(
                    color: Colors.black, fontSize: 25,
                  ),
                  onChanged: _dolarConvert,
                  keyboardType: TextInputType.number,
                ),
            ),
            Divider(),
            Padding(padding:EdgeInsets.only(right: 25,left: 5,bottom: 1),
                child: TextField(
                  controller: euroController,
                  decoration: InputDecoration(
                      labelText: "Euro",
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(),
                      prefixText: "€"
                  ),
                  style: TextStyle(
                    color: Colors.black, fontSize: 25,
                  ),
                  onChanged: _euroConvert,
                  keyboardType: TextInputType.number,
                )
            ),
            Divider(),
            Padding(padding: EdgeInsets.only(right: 25,left: 5,bottom: 1),
              child:TextField(
                controller: pesoARSController,
                decoration: InputDecoration(
                    labelText: "Peso Argentino",
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(),
                    prefixText: "AR\$"
                ),
                style: TextStyle(
                  color: Colors.black, fontSize: 25,
                ),
                onChanged: _pesoConvert,
                keyboardType: TextInputType.number,
              )
            ),
            Divider(),
            Padding(padding:EdgeInsets.only(right: 25,left: 5,bottom: 1),
              child: TextField(
            controller: dolCADController,
            decoration: InputDecoration(
                labelText: "Dolar Canadense",
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
                prefixText: "CAD\$"
            ),
                style: TextStyle(
                color: Colors.black, fontSize: 25,
            ),
              onChanged: _dolCADConvert,
              keyboardType: TextInputType.number,
              ),
            ),
            Divider(),
            Padding(padding:EdgeInsets.only(right: 25,left: 5,bottom: 1),
                child: TextField(
                  controller: dolAUSController,
                  decoration: InputDecoration(
                      labelText: "Dolar Australiano",
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(),
                      prefixText: "AU\$"
                  ),
                  style: TextStyle(
                    color: Colors.black, fontSize: 25,
                  ),
                  onChanged: _dolAUSConvert,
                  keyboardType: TextInputType.number,
                )
            ),
            Divider(),
            Padding(
              padding:EdgeInsets.only(right: 25,left: 5,bottom: 1),
                child: TextField(
                  controller: ieneJPNController,
                  decoration: InputDecoration(
                      labelText: "Iene",
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(),
                      prefixText: "JP¥"
                  ),
                  style: TextStyle(
                    color: Colors.black, fontSize: 25,
                  ),
                  onChanged: _ieneJPNConvert,
                  keyboardType: TextInputType.number,
                )
            ),
            Divider(),
            Padding(
              padding:EdgeInsets.only(right: 25,left: 5,bottom: 1),
                child: TextField(
                  controller: renminbiCNYController,
                  decoration: InputDecoration(
                      labelText: "Yuan",
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(),
                      prefixText: "CN¥"
                  ),
                  style: TextStyle(
                    color: Colors.black, fontSize: 25,
                  ),
                  onChanged: _renminbiCNYConvert,
                  keyboardType: TextInputType.number,
                )
            ),
            Divider(),
            Padding(
                padding:EdgeInsets.only(right: 25,left: 5,bottom: 1),
                child: TextField(
                  controller: libraGBPController,
                  decoration: InputDecoration(
                      labelText: "Libra",
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(),
                      prefixText: "£"
                  ),
                  style: TextStyle(
                    color: Colors.black, fontSize: 25,
                  ),
                  onChanged: _libraGBPConvert,
                  keyboardType: TextInputType.number,
                )
            )
          ],
        ),
      );
    }
  }

  @override
  void initState() {
    RetornaDados();
    super.initState();
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 0, 0, 0),
        elevation: 0,
        titleSpacing: 11,
        title:Text("NEW BAG",
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w800,
              color: Color.fromARGB(255, 9, 14, 14)
          ),
        ),
      ),
      body:Container(
        decoration: BoxDecoration(
            boxShadow: [
              new BoxShadow(
                color: Color.fromRGBO(148, 131, 124, 1.0),//scarfold
                offset: new Offset(0,6),
                blurRadius: 45,
                spreadRadius: 40,
              )
            ]
        ),
        padding: EdgeInsets.only(left:10,top:10 ,right: 20),
        child: Carregar(),
      ),
    );
  }
}*/