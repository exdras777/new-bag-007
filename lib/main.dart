import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      textTheme: const TextTheme(
      ),
    ),
    home: Principal(),
  ));
}

TextEditingController customController = TextEditingController();

class Principal extends StatefulWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  final _ValorInserido = MoneyMaskedTextController(precision: 2);

  bool activebtonR$ = true;
  bool activebtonU$D = false;
  bool activebtonEUR = false;
  bool activebtonLBR = false;
  bool activebtonCAD = false;
  bool activebtonAUS = false;
  bool activebtonARS = false;
  bool activebtonJPY = false;
  bool activebtonYEN = false;

  String StrBrl = '0.00';
  String StrUSD = '0.00';
  String StrEUR = '0.00';
  String StrLBR = '0.00';
  String StrCAD = '0.00';
  String StrAUS = '0.00';
  String StrARS = '0.00';
  String StrJPY = '0.00';
  String StrYEN = '0.00';

  double? valorInserido;

  String _preco = "0";
  recuperarpreco() async {
    final url = Uri.parse("https://blockchain.info/ticker");
    http.Response response = await http.get(url);
    final retorno = json.decode(response.body);
    setState(() {
      _preco = retorno['BRL']['buy'].toStringAsFixed(2);
    });
  }
  double? dolarUSD, euro, pesoARS, dolAUS, dolCAD, ieneJPN, renminbiCNY, libra, real;
  RetornaDados() async {
    final url = Uri.parse(
        "https://api.hgbrasil.com/finance?format=json-cors&key=05aaee4a");
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
      libra = map["results"]["currencies"]["GBP"]["buy"];
    });
  }
  //conversores
  brlUSD(){
    return  (valorInserido! / this.dolarUSD!);
  }
  brlEUR(){
    return  (valorInserido! / this.euro!);
  }
  brlLBR(){
    return  (valorInserido! / this.libra!);
  }
  brlCAD(){
    return  (valorInserido! / this.dolCAD!);
  }
  brlAUS(){
    return  (valorInserido! / this.dolAUS!);
  }
  brlARS(){
    return  (valorInserido! / this.pesoARS!);
  }
  brlJPY(){
    return  (valorInserido! / this.ieneJPN!);
  }
  brlYEN(){
    return  (valorInserido! /this.renminbiCNY!);
  }

  usdBRL(){
    return (valorInserido! * this.dolarUSD!);
  }
  usdEUR(){
    return  (valorInserido! / this.euro!* this.dolarUSD!);
  }
  usdLBR(){
    return  (valorInserido! / this.libra! * this.dolarUSD!);
  }
  usdCAD(){
    return  (valorInserido! / this.dolCAD! * this.dolarUSD!);
  }
  usdAUS(){
    return  (valorInserido! / this.dolAUS! * this.dolarUSD!);
  }
  usdARS(){
    return  (valorInserido! / this.pesoARS! * this.dolarUSD!);
  }
  usdJPY(){
    return  (valorInserido! / this.ieneJPN! * this.dolarUSD!);
  }
  usdYEN(){
    return  (valorInserido! / this.renminbiCNY! *this.dolarUSD!);
  }

  eurBRL(){
    return (valorInserido! * this.euro!);
  }
  eurUSD(){
    return  (valorInserido! / this.dolarUSD! * this.euro!);
  }
  eurLBR(){
    return  (valorInserido! / this.libra! * this.euro!);
  }
  eurCAD(){
    return  (valorInserido! / this.dolCAD! * this.euro!);
  }
  eurAUS(){
    return  (valorInserido! / this.dolAUS! * this.euro!);
  }
  eurARS(){
    return  (valorInserido! / this.pesoARS! * this.euro!);
  }
  eurJPY(){
    return  (valorInserido! / this.ieneJPN! * this.euro!);
  }
  eurYEN(){
    return  (valorInserido! / this.renminbiCNY! *this.euro!);
  }

  lbrBRL(){
    return (valorInserido! * this.libra!);
  }
  lbrUSD(){
    return  (valorInserido! * this.libra! / this.dolarUSD!);
  }
  lbrEUR(){
    return  (valorInserido! * this.libra! / this.euro!);
  }
  lbrCAD(){
    return  (valorInserido! * this.libra! / this.dolCAD!);
  }
  lbrAUS(){
    return  (valorInserido! * this.libra! / this.dolAUS!);
  }
  lbrARS(){
    return  (valorInserido! * this.libra! / this.pesoARS!);
  }
  lbrJPY(){
    return  (valorInserido! * this.libra! / this.ieneJPN!);
  }
  lbrYEN(){
    return  (valorInserido! * this.libra! / this.renminbiCNY!);
  }

  dcadBRL(){
    return(valorInserido! * dolCAD!);
  }
  dcadUSD(){
    return  (valorInserido! * this.dolCAD! / this.dolarUSD!);
  }
  dcadEUR(){
    return  (valorInserido! * this.dolCAD! / this.euro!);
  }
  dcadLBR(){
    return  (valorInserido! * this.dolCAD! / this.libra!);
  }
  dcadAUS(){
    return  (valorInserido! * this.dolCAD! / this.dolAUS!);
  }
  dcadARS(){
    return  (valorInserido! * this.dolCAD! / this.pesoARS!);
  }
  dcadJPY(){
    return  (valorInserido! * this.dolCAD! / this.ieneJPN!);
  }
  dcadYEN(){
    return  (valorInserido! * this.dolCAD! / this.renminbiCNY!);
  }

  ausBRL(){
    return (valorInserido! * this.dolAUS!);
  }
  ausUSD(){
    return  (valorInserido! * this.dolAUS! / this.dolarUSD!);
  }
  ausCAD(){
    return  (valorInserido! * this.dolAUS! / this.dolCAD!);
  }
  ausEUR(){
    return  (valorInserido! * this.dolAUS! / this.euro!);
  }
  ausLBR(){
    return  (valorInserido! * this.dolAUS! / this.libra!);
  }
  ausARS(){
    return  (valorInserido! * this.dolAUS! / this.pesoARS!);
  }
  ausJPY(){
    return  (valorInserido! * this.dolAUS! / this.ieneJPN!);
  }
  ausYEN(){
    return  (valorInserido! * this.dolAUS! / this.renminbiCNY!);
  }

  arsBRL(){
    return (valorInserido! * this.pesoARS!);
  }
  arsUSD(){
    return  (valorInserido! * this.pesoARS! / this.dolarUSD!);
  }
  arsEUR(){
    return  (valorInserido! * this.pesoARS! / this.euro!);
  }
  arsLBR(){
    return  (valorInserido! * this.pesoARS! / this. libra!);
  }
  arsCAD(){
    return  (valorInserido! * this.pesoARS! / this.dolCAD!);
  }
  arsAUS(){
    return(valorInserido! * this.pesoARS! / this.dolAUS!);
  }
  arsJPY(){
    return  (valorInserido! * this.pesoARS! / this.ieneJPN!);
  }
  arsYEN(){
    return  (valorInserido! * this.pesoARS! / this.renminbiCNY!);
  }

  jpBRL(){
    return (valorInserido! * this.ieneJPN!);
  }
  jpUSD(){
    return(valorInserido! * this.ieneJPN! / this.dolarUSD!);
  }
  jpEUR(){
    return(valorInserido!* this.ieneJPN! / this.euro!);
  }
  jpLBR(){
    return(valorInserido! * this.ieneJPN! / this.libra!);
  }
  jpCAD(){
    return(valorInserido!* this.ieneJPN! / this.dolCAD!);
  }
  jpAUS(){
    return(valorInserido! * this.ieneJPN! / this.dolAUS!);
  }
  jpARS(){
    return(valorInserido! * this.ieneJPN! / this.pesoARS!);
  }
  jpYEN(){
    return(valorInserido! * this.ieneJPN! / this.renminbiCNY!);
  }

  ynBRL(){
    return (valorInserido! * this.renminbiCNY!);
  }
  ynUSD(){
    return (valorInserido! * this.renminbiCNY! / this.dolarUSD!);
  }
  ynEUR(){
    return (valorInserido! * this.renminbiCNY! / this.euro!);
  }
  ynLBR(){
    return (valorInserido! * this.renminbiCNY! / this.libra!);
  }
  ynCAD(){
    return (valorInserido! * this.renminbiCNY! /this.dolCAD!);
  }
  ynAUS(){
    return (valorInserido! * this.renminbiCNY! / this.dolAUS!);
  }
  ynARS(){
    return (valorInserido! * this.renminbiCNY! / this.pesoARS!);
  }
  ynJPY(){
    return (valorInserido! * this.renminbiCNY! / this.ieneJPN!);
  }


  Carregar() {
    if (real == null) {
      return Center(
        child: Text(
          "Obtendo dados...",
          style: TextStyle(
              fontSize: 30,
              color: Color.fromRGBO(12, 12, 3, 1)
          ),
        ),
      );
    }
  }
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
        leading: IconButton(
          color: Colors.black,
            onPressed: (){
            showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text("Nomes das Moedas"),
                  content: Text("R\$ = Real brasileiro \n"
                      "U\$D = Dolar Estado Unidense \n"
                  ""),
                ),
              barrierDismissible: true,
            );
          },
          icon: Icon(Icons.help),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(1, 21, 0, 0),
        elevation: 0,
        titleSpacing:50,
        title: Text(
          "COTAÇÃO DE MOEDAS",
          style: TextStyle(
            fontSize:19,
            fontWeight: FontWeight.w900,
            color: Color.fromRGBO(30, 36, 224, 1.0),
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
              children: [
            Container(
              padding: EdgeInsets.all(18),
              color: Color.fromRGBO(30, 36, 224, 1.0),
              width: double.infinity,
              height: 91,
              child: TextField(
                style: TextStyle(
                  color: Colors.white
                ),
                decoration: InputDecoration(
                  labelText: "Insira um valor",
                  labelStyle: TextStyle(
                    color: Color.fromRGBO(255,255,255,1),
                    fontSize: 24,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(17.4))
                  ),
                ),
                keyboardType: TextInputType.number,
                controller: _ValorInserido,
                onChanged: (_){
                  valorInserido = double.parse(_ValorInserido.text.replaceAll(".", "").replaceAll(",", "."));
                  if ( activebtonR$  ) {
                    setState(() => StrBrl = valorInserido!.toStringAsFixed(2));
                    setState(() => StrUSD = brlUSD().toStringAsFixed(2));
                    setState(() => StrEUR = brlEUR().toStringAsFixed(2));
                    setState(() => StrLBR = brlLBR().toStringAsFixed(2));
                    setState(() => StrCAD = brlCAD().toStringAsFixed(2));
                    setState(() => StrAUS = brlAUS().toStringAsFixed(2));
                    setState(() => StrARS = brlARS().toStringAsFixed(2));
                    setState(() => StrJPY = brlJPY().toStringAsFixed(2));
                    setState(() => StrYEN = brlYEN().toStringAsFixed(2));
                  }
                  if ( activebtonU$D ) {  
                    setState(() => StrUSD = valorInserido!.toStringAsFixed(2));
                    setState(() => StrBrl = usdBRL().toStringAsFixed(2));
                    setState(() => StrEUR = usdEUR()  .toStringAsFixed(2));
                    setState(() => StrLBR = usdLBR().toStringAsFixed(2));
                    setState(() => StrCAD = usdCAD().toStringAsFixed(2));
                    setState(() => StrAUS = usdAUS().toStringAsFixed(2));
                    setState(() => StrARS = usdARS().toStringAsFixed(2));
                    setState(() => StrJPY = usdJPY().toStringAsFixed(2));
                    setState(() => StrYEN = usdYEN().toStringAsFixed(2));
                  }
                  if ( activebtonEUR ) {
                    setState(() => StrEUR = valorInserido!.toStringAsFixed(2));
                    setState(() => StrBrl = eurBRL().toStringAsFixed(2));
                    setState(() => StrUSD = eurUSD().toStringAsFixed(2));
                    setState(() => StrLBR = eurLBR().toStringAsFixed(2));
                    setState(() => StrCAD = eurCAD().toStringAsFixed(2));
                    setState(() => StrAUS = eurAUS().toStringAsFixed(2));
                    setState(() => StrARS = eurARS().toStringAsFixed(2));
                    setState(() => StrJPY = eurJPY().toStringAsFixed(2));
                    setState(() => StrYEN = eurYEN().toStringAsFixed(2));
                  }
                  if ( activebtonLBR ) {
                    setState(() => StrLBR = valorInserido!.toStringAsFixed(2));
                    setState(() => StrBrl = lbrBRL().toStringAsFixed(2));
                    setState(() => StrUSD = lbrUSD().toStringAsFixed(2));
                    setState(() => StrEUR = lbrEUR().toStringAsFixed(2));
                    setState(() => StrCAD = lbrCAD().toStringAsFixed(2));
                    setState(() => StrAUS = lbrAUS().toStringAsFixed(2));
                    setState(() => StrARS = lbrARS().toStringAsFixed(2));
                    setState(() => StrJPY = lbrJPY().toStringAsFixed(2));
                    setState(() => StrYEN = lbrYEN().toStringAsFixed(2));
                  }
                  if ( activebtonCAD ) {
                    setState(() => StrCAD = valorInserido!.toStringAsFixed(2));
                    setState(() => StrBrl = dcadBRL().toStringAsFixed(2));
                    setState(() => StrUSD = dcadUSD().toStringAsFixed(2));
                    setState(() => StrEUR = dcadEUR().toStringAsFixed(2));
                    setState(() => StrLBR = dcadLBR().toStringAsFixed(2));
                    setState(() => StrAUS = dcadAUS().toStringAsFixed(2));
                    setState(() => StrARS = dcadARS().toStringAsFixed(2));
                    setState(() => StrJPY = dcadJPY().toStringAsFixed(2));
                    setState(() => StrYEN = dcadYEN().toStringAsFixed(2));
                  }
                  if ( activebtonAUS ) {
                    setState(() => StrAUS = valorInserido!.toStringAsFixed(2));
                    setState(() => StrBrl = ausBRL().toStringAsFixed(2));
                    setState(() => StrUSD = ausUSD().toStringAsFixed(2));
                    setState(() => StrEUR = ausEUR().toStringAsFixed(2));
                    setState(() => StrLBR = ausLBR().toStringAsFixed(2));
                    setState(() => StrCAD = ausCAD().toStringAsFixed(2));
                    setState(() => StrARS = ausARS().toStringAsFixed(2));
                    setState(() => StrJPY = ausJPY().toStringAsFixed(2));
                    setState(() => StrYEN = ausYEN().toStringAsFixed(2));
                  }
                  if ( activebtonARS ) {
                    setState(() => StrARS = valorInserido!.toStringAsFixed(2));
                    setState(() => StrBrl = arsBRL().toStringAsFixed(2));
                    setState(() => StrUSD = arsUSD().toStringAsFixed(2));
                    setState(() => StrEUR = arsEUR().toStringAsFixed(2));
                    setState(() => StrLBR = arsLBR().toStringAsFixed(2));
                    setState(() => StrCAD = arsCAD().toStringAsFixed(2));
                    setState(() => StrAUS = arsAUS().toStringAsFixed(2));
                    setState(() => StrJPY = arsJPY().toStringAsFixed(2));
                    setState(() => StrYEN = arsYEN().toStringAsFixed(2));
                  }
                  if ( activebtonJPY ) {
                    setState(() => StrJPY = valorInserido!.toStringAsFixed(2));
                    setState(() => StrBrl = jpBRL().toStringAsFixed(2));
                    setState(() => StrUSD = jpUSD().toStringAsFixed(2));
                    setState(() => StrEUR = jpEUR().toStringAsFixed(2));
                    setState(() => StrLBR = jpLBR().toStringAsFixed(2));
                    setState(() => StrAUS = jpAUS().toStringAsFixed(2));
                    setState(() => StrCAD = jpCAD().toStringAsFixed(2));
                    setState(() => StrARS = jpARS().toStringAsFixed(2));
                    setState(() => StrYEN = jpYEN().toStringAsFixed(2));
                  }
                  if ( activebtonYEN ) {
                    setState(() => StrYEN = valorInserido!.toStringAsFixed(2));
                    setState(() => StrBrl = ynBRL().toStringAsFixed(2));
                    setState(() => StrUSD = ynUSD().toStringAsFixed(2));
                    setState(() => StrEUR = ynEUR().toStringAsFixed(2));
                    setState(() => StrLBR = ynLBR().toStringAsFixed(2));
                    setState(() => StrCAD = ynCAD().toStringAsFixed(2));
                    setState(() => StrAUS = ynAUS().toStringAsFixed(2));
                    setState(() => StrARS = ynARS().toStringAsFixed(2));
                    setState(() => StrJPY = ynJPY().toStringAsFixed(2));
                  }
                },
              ),
            ),
            Container(
              color: Color.fromRGBO(255, 255, 255, 1.0),
              height: MediaQuery.of(context).size.height - 313,
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child:
                        SizedBox(
                          height: 80,
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () {
                            if (!activebtonR$) {
                            setState(() {
                              activebtonR$ = true;
                              activebtonU$D = false;
                              activebtonARS = false;
                              activebtonAUS = false;
                              activebtonCAD = false;
                              activebtonEUR = false;
                              activebtonJPY = false;
                              activebtonLBR = false;
                              activebtonYEN = false;
                            });
                            } valorInserido = double.parse(_ValorInserido.text.replaceAll(".", "").replaceAll(",", "."));
                            if ( activebtonR$  ) {
                              setState(() => StrBrl = valorInserido!.toStringAsFixed(2));
                              setState(() => StrUSD = brlUSD().toStringAsFixed(2));
                              setState(() => StrEUR = brlEUR().toStringAsFixed(2));
                              setState(() => StrLBR = brlLBR().toStringAsFixed(2));
                              setState(() => StrCAD = brlCAD().toStringAsFixed(2));
                              setState(() => StrAUS = brlAUS().toStringAsFixed(2));
                              setState(() => StrARS = brlARS().toStringAsFixed(2));
                              setState(() => StrJPY = brlJPY().toStringAsFixed(2));
                              setState(() => StrYEN = brlYEN().toStringAsFixed(2));
                            }
                            if ( activebtonU$D ) {
                              setState(() => StrUSD = valorInserido!.toStringAsFixed(2));
                              setState(() => StrBrl = usdBRL().toStringAsFixed(2));
                              setState(() => StrEUR = usdEUR()  .toStringAsFixed(2));
                              setState(() => StrLBR = usdLBR().toStringAsFixed(2));
                              setState(() => StrCAD = usdCAD().toStringAsFixed(2));
                              setState(() => StrAUS = usdAUS().toStringAsFixed(2));
                              setState(() => StrARS = usdARS().toStringAsFixed(2));
                              setState(() => StrJPY = usdJPY().toStringAsFixed(2));
                              setState(() => StrYEN = usdYEN().toStringAsFixed(2));
                            }
                            if ( activebtonEUR ) {
                              setState(() => StrEUR = valorInserido!.toStringAsFixed(2));
                              setState(() => StrBrl = eurBRL().toStringAsFixed(2));
                              setState(() => StrUSD = eurUSD().toStringAsFixed(2));
                              setState(() => StrLBR = eurLBR().toStringAsFixed(2));
                              setState(() => StrCAD = eurCAD().toStringAsFixed(2));
                              setState(() => StrAUS = eurAUS().toStringAsFixed(2));
                              setState(() => StrARS = eurARS().toStringAsFixed(2));
                              setState(() => StrJPY = eurJPY().toStringAsFixed(2));
                              setState(() => StrYEN = eurYEN().toStringAsFixed(2));
                            }
                            if ( activebtonLBR ) {
                              setState(() => StrLBR = valorInserido!.toStringAsFixed(2));
                              setState(() => StrBrl = lbrBRL().toStringAsFixed(2));
                              setState(() => StrUSD = lbrUSD().toStringAsFixed(2));
                              setState(() => StrEUR = lbrEUR().toStringAsFixed(2));
                              setState(() => StrCAD = lbrCAD().toStringAsFixed(2));
                              setState(() => StrAUS = lbrAUS().toStringAsFixed(2));
                              setState(() => StrARS = lbrARS().toStringAsFixed(2));
                              setState(() => StrJPY = lbrJPY().toStringAsFixed(2));
                              setState(() => StrYEN = lbrYEN().toStringAsFixed(2));
                            }
                            if ( activebtonCAD ) {
                              setState(() => StrCAD = valorInserido!.toStringAsFixed(2));
                              setState(() => StrBrl = dcadBRL().toStringAsFixed(2));
                              setState(() => StrUSD = dcadUSD().toStringAsFixed(2));
                              setState(() => StrEUR = dcadEUR().toStringAsFixed(2));
                              setState(() => StrLBR = dcadLBR().toStringAsFixed(2));
                              setState(() => StrAUS = dcadAUS().toStringAsFixed(2));
                              setState(() => StrARS = dcadARS().toStringAsFixed(2));
                              setState(() => StrJPY = dcadJPY().toStringAsFixed(2));
                              setState(() => StrYEN = dcadYEN().toStringAsFixed(2));
                            }
                            if ( activebtonAUS ) {
                              setState(() => StrAUS = valorInserido!.toStringAsFixed(2));
                              setState(() => StrBrl = ausBRL().toStringAsFixed(2));
                              setState(() => StrUSD = ausUSD().toStringAsFixed(2));
                              setState(() => StrEUR = ausEUR().toStringAsFixed(2));
                              setState(() => StrLBR = ausLBR().toStringAsFixed(2));
                              setState(() => StrCAD = ausCAD().toStringAsFixed(2));
                              setState(() => StrARS = ausARS().toStringAsFixed(2));
                              setState(() => StrJPY = ausJPY().toStringAsFixed(2));
                              setState(() => StrYEN = ausYEN().toStringAsFixed(2));
                            }
                            if ( activebtonARS ) {
                              setState(() => StrARS = valorInserido!.toStringAsFixed(2));
                              setState(() => StrBrl = arsBRL().toStringAsFixed(2));
                              setState(() => StrUSD = arsUSD().toStringAsFixed(2));
                              setState(() => StrEUR = arsEUR().toStringAsFixed(2));
                              setState(() => StrLBR = arsLBR().toStringAsFixed(2));
                              setState(() => StrCAD = arsCAD().toStringAsFixed(2));
                              setState(() => StrAUS = arsAUS().toStringAsFixed(2));
                              setState(() => StrJPY = arsJPY().toStringAsFixed(2));
                              setState(() => StrYEN = arsYEN().toStringAsFixed(2));
                            }
                            if ( activebtonJPY ) {
                              setState(() => StrJPY = valorInserido!.toStringAsFixed(2));
                              setState(() => StrBrl = jpBRL().toStringAsFixed(2));
                              setState(() => StrUSD = jpUSD().toStringAsFixed(2));
                              setState(() => StrEUR = jpEUR().toStringAsFixed(2));
                              setState(() => StrLBR = jpLBR().toStringAsFixed(2));
                              setState(() => StrAUS = jpAUS().toStringAsFixed(2));
                              setState(() => StrCAD = jpCAD().toStringAsFixed(2));
                              setState(() => StrARS = jpARS().toStringAsFixed(2));
                              setState(() => StrYEN = jpYEN().toStringAsFixed(2));
                            }
                            if ( activebtonYEN ) {
                              setState(() => StrYEN = valorInserido!.toStringAsFixed(2));
                              setState(() => StrBrl = ynBRL().toStringAsFixed(2));
                              setState(() => StrUSD = ynUSD().toStringAsFixed(2));
                              setState(() => StrEUR = ynEUR().toStringAsFixed(2));
                              setState(() => StrLBR = ynLBR().toStringAsFixed(2));
                              setState(() => StrCAD = ynCAD().toStringAsFixed(2));
                              setState(() => StrAUS = ynAUS().toStringAsFixed(2));
                              setState(() => StrARS = ynARS().toStringAsFixed(2));
                              setState(() => StrJPY = ynJPY().toStringAsFixed(2));
                            }
                            },
                            style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              activebtonR$
                                  ? Color.fromRGBO(2, 82, 252, 1.0)
                                  : Color.fromRGBO(255, 255, 255, 0.9),
                              ),
                            ),
                            child: Text(
                            '$StrBrl\nR\$',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: activebtonR$
                                    ? Colors.white
                                    : Colors.black
                            ),
                          ),
                        ),
                      ),
                    ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child:
                        SizedBox(
                          height: 82,
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () {
                            if (!activebtonU$D) {
                              setState(() {
                              activebtonU$D = true;
                              activebtonR$ = false;
                              activebtonARS = false;
                              activebtonAUS = false;
                              activebtonCAD = false;
                              activebtonEUR = false;
                              activebtonJPY = false;
                              activebtonLBR = false;
                              activebtonYEN = false;
                              });
                            } valorInserido = double.parse(_ValorInserido.text.replaceAll(".", "").replaceAll(",", "."));
                              if ( activebtonR$  ) {
                                setState(() => StrBrl = valorInserido!.toStringAsFixed(2));
                                setState(() => StrUSD = brlUSD().toStringAsFixed(2));
                                setState(() => StrEUR = brlEUR().toStringAsFixed(2));
                                setState(() => StrLBR = brlLBR().toStringAsFixed(2));
                                setState(() => StrCAD = brlCAD().toStringAsFixed(2));
                                setState(() => StrAUS = brlAUS().toStringAsFixed(2));
                                setState(() => StrARS = brlARS().toStringAsFixed(2));
                                setState(() => StrJPY = brlJPY().toStringAsFixed(2));
                                setState(() => StrYEN = brlYEN().toStringAsFixed(2));
                              }
                              if ( activebtonU$D ) {
                                setState(() => StrUSD = valorInserido!.toStringAsFixed(2));
                                setState(() => StrBrl = usdBRL().toStringAsFixed(2));
                                setState(() => StrEUR = usdEUR()  .toStringAsFixed(2));
                                setState(() => StrLBR = usdLBR().toStringAsFixed(2));
                                setState(() => StrCAD = usdCAD().toStringAsFixed(2));
                                setState(() => StrAUS = usdAUS().toStringAsFixed(2));
                                setState(() => StrARS = usdARS().toStringAsFixed(2));
                                setState(() => StrJPY = usdJPY().toStringAsFixed(2));
                                setState(() => StrYEN = usdYEN().toStringAsFixed(2));
                              }
                              if ( activebtonEUR ) {
                                setState(() => StrEUR = valorInserido!.toStringAsFixed(2));
                                setState(() => StrBrl = eurBRL().toStringAsFixed(2));
                                setState(() => StrUSD = eurUSD().toStringAsFixed(2));
                                setState(() => StrLBR = eurLBR().toStringAsFixed(2));
                                setState(() => StrCAD = eurCAD().toStringAsFixed(2));
                                setState(() => StrAUS = eurAUS().toStringAsFixed(2));
                                setState(() => StrARS = eurARS().toStringAsFixed(2));
                                setState(() => StrJPY = eurJPY().toStringAsFixed(2));
                                setState(() => StrYEN = eurYEN().toStringAsFixed(2));
                              }
                              if ( activebtonLBR ) {
                                setState(() => StrLBR = valorInserido!.toStringAsFixed(2));
                                setState(() => StrBrl = lbrBRL().toStringAsFixed(2));
                                setState(() => StrUSD = lbrUSD().toStringAsFixed(2));
                                setState(() => StrEUR = lbrEUR().toStringAsFixed(2));
                                setState(() => StrCAD = lbrCAD().toStringAsFixed(2));
                                setState(() => StrAUS = lbrAUS().toStringAsFixed(2));
                                setState(() => StrARS = lbrARS().toStringAsFixed(2));
                                setState(() => StrJPY = lbrJPY().toStringAsFixed(2));
                                setState(() => StrYEN = lbrYEN().toStringAsFixed(2));
                              }
                              if ( activebtonCAD ) {
                                setState(() => StrCAD = valorInserido!.toStringAsFixed(2));
                                setState(() => StrBrl = dcadBRL().toStringAsFixed(2));
                                setState(() => StrUSD = dcadUSD().toStringAsFixed(2));
                                setState(() => StrEUR = dcadEUR().toStringAsFixed(2));
                                setState(() => StrLBR = dcadLBR().toStringAsFixed(2));
                                setState(() => StrAUS = dcadAUS().toStringAsFixed(2));
                                setState(() => StrARS = dcadARS().toStringAsFixed(2));
                                setState(() => StrJPY = dcadJPY().toStringAsFixed(2));
                                setState(() => StrYEN = dcadYEN().toStringAsFixed(2));
                              }
                              if ( activebtonAUS ) {
                                setState(() => StrAUS = valorInserido!.toStringAsFixed(2));
                                setState(() => StrBrl = ausBRL().toStringAsFixed(2));
                                setState(() => StrUSD = ausUSD().toStringAsFixed(2));
                                setState(() => StrEUR = ausEUR().toStringAsFixed(2));
                                setState(() => StrLBR = ausLBR().toStringAsFixed(2));
                                setState(() => StrCAD = ausCAD().toStringAsFixed(2));
                                setState(() => StrARS = ausARS().toStringAsFixed(2));
                                setState(() => StrJPY = ausJPY().toStringAsFixed(2));
                                setState(() => StrYEN = ausYEN().toStringAsFixed(2));
                              }
                              if ( activebtonARS ) {
                                setState(() => StrARS = valorInserido!.toStringAsFixed(2));
                                setState(() => StrBrl = arsBRL().toStringAsFixed(2));
                                setState(() => StrUSD = arsUSD().toStringAsFixed(2));
                                setState(() => StrEUR = arsEUR().toStringAsFixed(2));
                                setState(() => StrLBR = arsLBR().toStringAsFixed(2));
                                setState(() => StrCAD = arsCAD().toStringAsFixed(2));
                                setState(() => StrAUS = arsAUS().toStringAsFixed(2));
                                setState(() => StrJPY = arsJPY().toStringAsFixed(2));
                                setState(() => StrYEN = arsYEN().toStringAsFixed(2));
                              }
                              if ( activebtonJPY ) {
                                setState(() => StrJPY = valorInserido!.toStringAsFixed(2));
                                setState(() => StrBrl = jpBRL().toStringAsFixed(2));
                                setState(() => StrUSD = jpUSD().toStringAsFixed(2));
                                setState(() => StrEUR = jpEUR().toStringAsFixed(2));
                                setState(() => StrLBR = jpLBR().toStringAsFixed(2));
                                setState(() => StrAUS = jpAUS().toStringAsFixed(2));
                                setState(() => StrCAD = jpCAD().toStringAsFixed(2));
                                setState(() => StrARS = jpARS().toStringAsFixed(2));
                                setState(() => StrYEN = jpYEN().toStringAsFixed(2));
                              }
                              if ( activebtonYEN ) {
                                setState(() => StrYEN = valorInserido!.toStringAsFixed(2));
                                setState(() => StrBrl = ynBRL().toStringAsFixed(2));
                                setState(() => StrUSD = ynUSD().toStringAsFixed(2));
                                setState(() => StrEUR = ynEUR().toStringAsFixed(2));
                                setState(() => StrLBR = ynLBR().toStringAsFixed(2));
                                setState(() => StrCAD = ynCAD().toStringAsFixed(2));
                                setState(() => StrAUS = ynAUS().toStringAsFixed(2));
                                setState(() => StrARS = ynARS().toStringAsFixed(2));
                                setState(() => StrJPY = ynJPY().toStringAsFixed(2));
                              }
                              },
                            style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              activebtonU$D
                                  ? Color.fromRGBO(2, 82, 252, 1.0)
                                  : Color.fromRGBO(255, 255, 255, 0.9),
                            ),
                          ),
                            child: Text(
                            '$StrUSD\nU\$D',
                            style: TextStyle(
                                color: activebtonU$D
                                    ? Colors.white
                                    : Colors.black
                            ),
                          ),
                        ),
                      ),
                    ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child:
                        SizedBox(
                          height: 82,
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () {
                            if (!activebtonEUR) {
                              setState(() {
                              activebtonEUR = true;
                              activebtonU$D = false;
                              activebtonARS = false;
                              activebtonAUS = false;
                              activebtonCAD = false;
                              activebtonR$ = false;
                              activebtonJPY = false;
                              activebtonLBR = false;
                              activebtonYEN = false;
                              });
                            } valorInserido = double.parse(_ValorInserido.text.replaceAll(".", "").replaceAll(",", "."));
                                if ( activebtonR$  ) {
                                  setState(() => StrBrl = valorInserido!.toStringAsFixed(2));
                                  setState(() => StrUSD = brlUSD().toStringAsFixed(2));
                                  setState(() => StrEUR = brlEUR().toStringAsFixed(2));
                                  setState(() => StrLBR = brlLBR().toStringAsFixed(2));
                                  setState(() => StrCAD = brlCAD().toStringAsFixed(2));
                                  setState(() => StrAUS = brlAUS().toStringAsFixed(2));
                                  setState(() => StrARS = brlARS().toStringAsFixed(2));
                                  setState(() => StrJPY = brlJPY().toStringAsFixed(2));
                                  setState(() => StrYEN = brlYEN().toStringAsFixed(2));
                                }
                                if ( activebtonU$D ) {
                                  setState(() => StrUSD = valorInserido!.toStringAsFixed(2));
                                  setState(() => StrBrl = usdBRL().toStringAsFixed(2));
                                  setState(() => StrEUR = usdEUR()  .toStringAsFixed(2));
                                  setState(() => StrLBR = usdLBR().toStringAsFixed(2));
                                  setState(() => StrCAD = usdCAD().toStringAsFixed(2));
                                  setState(() => StrAUS = usdAUS().toStringAsFixed(2));
                                  setState(() => StrARS = usdARS().toStringAsFixed(2));
                                  setState(() => StrJPY = usdJPY().toStringAsFixed(2));
                                  setState(() => StrYEN = usdYEN().toStringAsFixed(2));
                                }
                                if ( activebtonEUR ) {
                                  setState(() => StrEUR = valorInserido!.toStringAsFixed(2));
                                  setState(() => StrBrl = eurBRL().toStringAsFixed(2));
                                  setState(() => StrUSD = eurUSD().toStringAsFixed(2));
                                  setState(() => StrLBR = eurLBR().toStringAsFixed(2));
                                  setState(() => StrCAD = eurCAD().toStringAsFixed(2));
                                  setState(() => StrAUS = eurAUS().toStringAsFixed(2));
                                  setState(() => StrARS = eurARS().toStringAsFixed(2));
                                  setState(() => StrJPY = eurJPY().toStringAsFixed(2));
                                  setState(() => StrYEN = eurYEN().toStringAsFixed(2));
                                }
                                if ( activebtonLBR ) {
                                  setState(() => StrLBR = valorInserido!.toStringAsFixed(2));
                                  setState(() => StrBrl = lbrBRL().toStringAsFixed(2));
                                  setState(() => StrUSD = lbrUSD().toStringAsFixed(2));
                                  setState(() => StrEUR = lbrEUR().toStringAsFixed(2));
                                  setState(() => StrCAD = lbrCAD().toStringAsFixed(2));
                                  setState(() => StrAUS = lbrAUS().toStringAsFixed(2));
                                  setState(() => StrARS = lbrARS().toStringAsFixed(2));
                                  setState(() => StrJPY = lbrJPY().toStringAsFixed(2));
                                  setState(() => StrYEN = lbrYEN().toStringAsFixed(2));
                                }
                                if ( activebtonCAD ) {
                                  setState(() => StrCAD = valorInserido!.toStringAsFixed(2));
                                  setState(() => StrBrl = dcadBRL().toStringAsFixed(2));
                                  setState(() => StrUSD = dcadUSD().toStringAsFixed(2));
                                  setState(() => StrEUR = dcadEUR().toStringAsFixed(2));
                                  setState(() => StrLBR = dcadLBR().toStringAsFixed(2));
                                  setState(() => StrAUS = dcadAUS().toStringAsFixed(2));
                                  setState(() => StrARS = dcadARS().toStringAsFixed(2));
                                  setState(() => StrJPY = dcadJPY().toStringAsFixed(2));
                                  setState(() => StrYEN = dcadYEN().toStringAsFixed(2));
                                }
                                if ( activebtonAUS ) {
                                  setState(() => StrAUS = valorInserido!.toStringAsFixed(2));
                                  setState(() => StrBrl = ausBRL().toStringAsFixed(2));
                                  setState(() => StrUSD = ausUSD().toStringAsFixed(2));
                                  setState(() => StrEUR = ausEUR().toStringAsFixed(2));
                                  setState(() => StrLBR = ausLBR().toStringAsFixed(2));
                                  setState(() => StrCAD = ausCAD().toStringAsFixed(2));
                                  setState(() => StrARS = ausARS().toStringAsFixed(2));
                                  setState(() => StrJPY = ausJPY().toStringAsFixed(2));
                                  setState(() => StrYEN = ausYEN().toStringAsFixed(2));
                                }
                                if ( activebtonARS ) {
                                  setState(() => StrARS = valorInserido!.toStringAsFixed(2));
                                  setState(() => StrBrl = arsBRL().toStringAsFixed(2));
                                  setState(() => StrUSD = arsUSD().toStringAsFixed(2));
                                  setState(() => StrEUR = arsEUR().toStringAsFixed(2));
                                  setState(() => StrLBR = arsLBR().toStringAsFixed(2));
                                  setState(() => StrCAD = arsCAD().toStringAsFixed(2));
                                  setState(() => StrAUS = arsAUS().toStringAsFixed(2));
                                  setState(() => StrJPY = arsJPY().toStringAsFixed(2));
                                  setState(() => StrYEN = arsYEN().toStringAsFixed(2));
                                }
                                if ( activebtonJPY ) {
                                  setState(() => StrJPY = valorInserido!.toStringAsFixed(2));
                                  setState(() => StrBrl = jpBRL().toStringAsFixed(2));
                                  setState(() => StrUSD = jpUSD().toStringAsFixed(2));
                                  setState(() => StrEUR = jpEUR().toStringAsFixed(2));
                                  setState(() => StrLBR = jpLBR().toStringAsFixed(2));
                                  setState(() => StrAUS = jpAUS().toStringAsFixed(2));
                                  setState(() => StrCAD = jpCAD().toStringAsFixed(2));
                                  setState(() => StrARS = jpARS().toStringAsFixed(2));
                                  setState(() => StrYEN = jpYEN().toStringAsFixed(2));
                                }
                                if ( activebtonYEN ) {
                                  setState(() => StrYEN = valorInserido!.toStringAsFixed(2));
                                  setState(() => StrBrl = ynBRL().toStringAsFixed(2));
                                  setState(() => StrUSD = ynUSD().toStringAsFixed(2));
                                  setState(() => StrEUR = ynEUR().toStringAsFixed(2));
                                  setState(() => StrLBR = ynLBR().toStringAsFixed(2));
                                  setState(() => StrCAD = ynCAD().toStringAsFixed(2));
                                  setState(() => StrAUS = ynAUS().toStringAsFixed(2));
                                  setState(() => StrARS = ynARS().toStringAsFixed(2));
                                  setState(() => StrJPY = ynJPY().toStringAsFixed(2));
                                }
                                },
                                style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  activebtonEUR
                                  ? Color.fromRGBO(2, 82, 252, 1.0)
                                  : Color.fromRGBO(255, 255, 255, 0.9),
                              ),
                            ),
                            child: Text(
                            '$StrEUR\n€',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: activebtonEUR
                                    ? Colors.white
                                    : Colors.black
                              )
                            ),
                          ),
                        )
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child:
                        SizedBox(
                          height: 82,
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () {
                              if (!activebtonLBR) {
                                setState(() {
                                  activebtonLBR = true;
                                  activebtonU$D = false;
                                  activebtonARS = false;
                                  activebtonAUS = false;
                                  activebtonCAD = false;
                                  activebtonEUR = false;
                                  activebtonJPY = false;
                                  activebtonR$ = false;
                                  activebtonYEN = false;
                                });
                              } valorInserido = double.parse(_ValorInserido.text.replaceAll(".", "").replaceAll(",", "."));
                              if ( activebtonR$  ) {
                                setState(() => StrBrl = valorInserido!.toStringAsFixed(2));
                                setState(() => StrUSD = brlUSD().toStringAsFixed(2));
                                setState(() => StrEUR = brlEUR().toStringAsFixed(2));
                                setState(() => StrLBR = brlLBR().toStringAsFixed(2));
                                setState(() => StrCAD = brlCAD().toStringAsFixed(2));
                                setState(() => StrAUS = brlAUS().toStringAsFixed(2));
                                setState(() => StrARS = brlARS().toStringAsFixed(2));
                                setState(() => StrJPY = brlJPY().toStringAsFixed(2));
                                setState(() => StrYEN = brlYEN().toStringAsFixed(2));
                              }
                              if ( activebtonU$D ) {
                                setState(() => StrUSD = valorInserido!.toStringAsFixed(2));
                                setState(() => StrBrl = usdBRL().toStringAsFixed(2));
                                setState(() => StrEUR = usdEUR()  .toStringAsFixed(2));
                                setState(() => StrLBR = usdLBR().toStringAsFixed(2));
                                setState(() => StrCAD = usdCAD().toStringAsFixed(2));
                                setState(() => StrAUS = usdAUS().toStringAsFixed(2));
                                setState(() => StrARS = usdARS().toStringAsFixed(2));
                                setState(() => StrJPY = usdJPY().toStringAsFixed(2));
                                setState(() => StrYEN = usdYEN().toStringAsFixed(2));
                              }
                              if ( activebtonEUR ) {
                                setState(() => StrEUR = valorInserido!.toStringAsFixed(2));
                                setState(() => StrBrl = eurBRL().toStringAsFixed(2));
                                setState(() => StrUSD = eurUSD().toStringAsFixed(2));
                                setState(() => StrLBR = eurLBR().toStringAsFixed(2));
                                setState(() => StrCAD = eurCAD().toStringAsFixed(2));
                                setState(() => StrAUS = eurAUS().toStringAsFixed(2));
                                setState(() => StrARS = eurARS().toStringAsFixed(2));
                                setState(() => StrJPY = eurJPY().toStringAsFixed(2));
                                setState(() => StrYEN = eurYEN().toStringAsFixed(2));
                              }
                              if ( activebtonLBR ) {
                                setState(() => StrLBR = valorInserido!.toStringAsFixed(2));
                                setState(() => StrBrl = lbrBRL().toStringAsFixed(2));
                                setState(() => StrUSD = lbrUSD().toStringAsFixed(2));
                                setState(() => StrEUR = lbrEUR().toStringAsFixed(2));
                                setState(() => StrCAD = lbrCAD().toStringAsFixed(2));
                                setState(() => StrAUS = lbrAUS().toStringAsFixed(2));
                                setState(() => StrARS = lbrARS().toStringAsFixed(2));
                                setState(() => StrJPY = lbrJPY().toStringAsFixed(2));
                                setState(() => StrYEN = lbrYEN().toStringAsFixed(2));
                              }
                              if ( activebtonCAD ) {
                                setState(() => StrCAD = valorInserido!.toStringAsFixed(2));
                                setState(() => StrBrl = dcadBRL().toStringAsFixed(2));
                                setState(() => StrUSD = dcadUSD().toStringAsFixed(2));
                                setState(() => StrEUR = dcadEUR().toStringAsFixed(2));
                                setState(() => StrLBR = dcadLBR().toStringAsFixed(2));
                                setState(() => StrAUS = dcadAUS().toStringAsFixed(2));
                                setState(() => StrARS = dcadARS().toStringAsFixed(2));
                                setState(() => StrJPY = dcadJPY().toStringAsFixed(2));
                                setState(() => StrYEN = dcadYEN().toStringAsFixed(2));
                              }
                              if ( activebtonAUS ) {
                                setState(() => StrAUS = valorInserido!.toStringAsFixed(2));
                                setState(() => StrBrl = ausBRL().toStringAsFixed(2));
                                setState(() => StrUSD = ausUSD().toStringAsFixed(2));
                                setState(() => StrEUR = ausEUR().toStringAsFixed(2));
                                setState(() => StrLBR = ausLBR().toStringAsFixed(2));
                                setState(() => StrCAD = ausCAD().toStringAsFixed(2));
                                setState(() => StrARS = ausARS().toStringAsFixed(2));
                                setState(() => StrJPY = ausJPY().toStringAsFixed(2));
                                setState(() => StrYEN = ausYEN().toStringAsFixed(2));
                              }
                              if ( activebtonARS ) {
                                setState(() => StrARS = valorInserido!.toStringAsFixed(2));
                                setState(() => StrBrl = arsBRL().toStringAsFixed(2));
                                setState(() => StrUSD = arsUSD().toStringAsFixed(2));
                                setState(() => StrEUR = arsEUR().toStringAsFixed(2));
                                setState(() => StrLBR = arsLBR().toStringAsFixed(2));
                                setState(() => StrCAD = arsCAD().toStringAsFixed(2));
                                setState(() => StrAUS = arsAUS().toStringAsFixed(2));
                                setState(() => StrJPY = arsJPY().toStringAsFixed(2));
                                setState(() => StrYEN = arsYEN().toStringAsFixed(2));
                              }
                              if ( activebtonJPY ) {
                                setState(() => StrJPY = valorInserido!.toStringAsFixed(2));
                                setState(() => StrBrl = jpBRL().toStringAsFixed(2));
                                setState(() => StrUSD = jpUSD().toStringAsFixed(2));
                                setState(() => StrEUR = jpEUR().toStringAsFixed(2));
                                setState(() => StrLBR = jpLBR().toStringAsFixed(2));
                                setState(() => StrAUS = jpAUS().toStringAsFixed(2));
                                setState(() => StrCAD = jpCAD().toStringAsFixed(2));
                                setState(() => StrARS = jpARS().toStringAsFixed(2));
                                setState(() => StrYEN = jpYEN().toStringAsFixed(2));
                              }
                              if ( activebtonYEN ) {
                                setState(() => StrYEN = valorInserido!.toStringAsFixed(2));
                                setState(() => StrBrl = ynBRL().toStringAsFixed(2));
                                setState(() => StrUSD = ynUSD().toStringAsFixed(2));
                                setState(() => StrEUR = ynEUR().toStringAsFixed(2));
                                setState(() => StrLBR = ynLBR().toStringAsFixed(2));
                                setState(() => StrCAD = ynCAD().toStringAsFixed(2));
                                setState(() => StrAUS = ynAUS().toStringAsFixed(2));
                                setState(() => StrARS = ynARS().toStringAsFixed(2));
                                setState(() => StrJPY = ynJPY().toStringAsFixed(2));
                              }
                            },
                              style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                activebtonLBR
                                    ? Color.fromRGBO(2, 82, 252, 1.0)
                                    : Color.fromRGBO(255, 255, 255, 0.9),
                              ),
                            ),
                            child: Text(
                              '$StrLBR\n£',
                                textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: activebtonLBR
                                      ? Colors.white
                                      : Colors.black
                              ),
                            ),
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child:
                        SizedBox(
                          height: 82,
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () {
                            if (!activebtonAUS) {
                              setState(() {
                                activebtonAUS= true;
                                activebtonU$D = false;
                                activebtonARS = false;
                                activebtonCAD = false;
                                activebtonEUR = false;
                                activebtonJPY = false;
                                activebtonLBR = false;
                                activebtonR$ = false;
                                activebtonYEN = false;
                              });
                            } valorInserido = double.parse(_ValorInserido.text.replaceAll(".", "").replaceAll(",", "."));
                                if ( activebtonR$  ) {
                                  setState(() => StrBrl = valorInserido!.toStringAsFixed(2));
                                  setState(() => StrUSD = brlUSD().toStringAsFixed(2));
                                  setState(() => StrEUR = brlEUR().toStringAsFixed(2));
                                  setState(() => StrLBR = brlLBR().toStringAsFixed(2));
                                  setState(() => StrCAD = brlCAD().toStringAsFixed(2));
                                  setState(() => StrAUS = brlAUS().toStringAsFixed(2));
                                  setState(() => StrARS = brlARS().toStringAsFixed(2));
                                  setState(() => StrJPY = brlJPY().toStringAsFixed(2));
                                  setState(() => StrYEN = brlYEN().toStringAsFixed(2));
                                }
                                if ( activebtonU$D ) {
                                  setState(() => StrUSD = valorInserido!.toStringAsFixed(2));
                                  setState(() => StrBrl = usdBRL().toStringAsFixed(2));
                                  setState(() => StrEUR = usdEUR()  .toStringAsFixed(2));
                                  setState(() => StrLBR = usdLBR().toStringAsFixed(2));
                                  setState(() => StrCAD = usdCAD().toStringAsFixed(2));
                                  setState(() => StrAUS = usdAUS().toStringAsFixed(2));
                                  setState(() => StrARS = usdARS().toStringAsFixed(2));
                                  setState(() => StrJPY = usdJPY().toStringAsFixed(2));
                                  setState(() => StrYEN = usdYEN().toStringAsFixed(2));
                                }
                                if ( activebtonEUR ) {
                                  setState(() => StrEUR = valorInserido!.toStringAsFixed(2));
                                  setState(() => StrBrl = eurBRL().toStringAsFixed(2));
                                  setState(() => StrUSD = eurUSD().toStringAsFixed(2));
                                  setState(() => StrLBR = eurLBR().toStringAsFixed(2));
                                  setState(() => StrCAD = eurCAD().toStringAsFixed(2));
                                  setState(() => StrAUS = eurAUS().toStringAsFixed(2));
                                  setState(() => StrARS = eurARS().toStringAsFixed(2));
                                  setState(() => StrJPY = eurJPY().toStringAsFixed(2));
                                  setState(() => StrYEN = eurYEN().toStringAsFixed(2));
                                }
                                if ( activebtonLBR ) {
                                  setState(() => StrLBR = valorInserido!.toStringAsFixed(2));
                                  setState(() => StrBrl = lbrBRL().toStringAsFixed(2));
                                  setState(() => StrUSD = lbrUSD().toStringAsFixed(2));
                                  setState(() => StrEUR = lbrEUR().toStringAsFixed(2));
                                  setState(() => StrCAD = lbrCAD().toStringAsFixed(2));
                                  setState(() => StrAUS = lbrAUS().toStringAsFixed(2));
                                  setState(() => StrARS = lbrARS().toStringAsFixed(2));
                                  setState(() => StrJPY = lbrJPY().toStringAsFixed(2));
                                  setState(() => StrYEN = lbrYEN().toStringAsFixed(2));
                                }
                                if ( activebtonCAD ) {
                                  setState(() => StrCAD = valorInserido!.toStringAsFixed(2));
                                  setState(() => StrBrl = dcadBRL().toStringAsFixed(2));
                                  setState(() => StrUSD = dcadUSD().toStringAsFixed(2));
                                  setState(() => StrEUR = dcadEUR().toStringAsFixed(2));
                                  setState(() => StrLBR = dcadLBR().toStringAsFixed(2));
                                  setState(() => StrAUS = dcadAUS().toStringAsFixed(2));
                                  setState(() => StrARS = dcadARS().toStringAsFixed(2));
                                  setState(() => StrJPY = dcadJPY().toStringAsFixed(2));
                                  setState(() => StrYEN = dcadYEN().toStringAsFixed(2));
                                }
                                if ( activebtonAUS ) {
                                  setState(() => StrAUS = valorInserido!.toStringAsFixed(2));
                                  setState(() => StrBrl = ausBRL().toStringAsFixed(2));
                                  setState(() => StrUSD = ausUSD().toStringAsFixed(2));
                                  setState(() => StrEUR = ausEUR().toStringAsFixed(2));
                                  setState(() => StrLBR = ausLBR().toStringAsFixed(2));
                                  setState(() => StrCAD = ausCAD().toStringAsFixed(2));
                                  setState(() => StrARS = ausARS().toStringAsFixed(2));
                                  setState(() => StrJPY = ausJPY().toStringAsFixed(2));
                                  setState(() => StrYEN = ausYEN().toStringAsFixed(2));
                                }
                                if ( activebtonARS ) {
                                  setState(() => StrARS = valorInserido!.toStringAsFixed(2));
                                  setState(() => StrBrl = arsBRL().toStringAsFixed(2));
                                  setState(() => StrUSD = arsUSD().toStringAsFixed(2));
                                  setState(() => StrEUR = arsEUR().toStringAsFixed(2));
                                  setState(() => StrLBR = arsLBR().toStringAsFixed(2));
                                  setState(() => StrCAD = arsCAD().toStringAsFixed(2));
                                  setState(() => StrAUS = arsAUS().toStringAsFixed(2));
                                  setState(() => StrJPY = arsJPY().toStringAsFixed(2));
                                  setState(() => StrYEN = arsYEN().toStringAsFixed(2));
                                }
                                if ( activebtonJPY ) {
                                  setState(() => StrJPY = valorInserido!.toStringAsFixed(2));
                                  setState(() => StrBrl = jpBRL().toStringAsFixed(2));
                                  setState(() => StrUSD = jpUSD().toStringAsFixed(2));
                                  setState(() => StrEUR = jpEUR().toStringAsFixed(2));
                                  setState(() => StrLBR = jpLBR().toStringAsFixed(2));
                                  setState(() => StrAUS = jpAUS().toStringAsFixed(2));
                                  setState(() => StrCAD = jpCAD().toStringAsFixed(2));
                                  setState(() => StrARS = jpARS().toStringAsFixed(2));
                                  setState(() => StrYEN = jpYEN().toStringAsFixed(2));
                                }
                                if ( activebtonYEN ) {
                                  setState(() => StrYEN = valorInserido!.toStringAsFixed(2));
                                  setState(() => StrBrl = ynBRL().toStringAsFixed(2));
                                  setState(() => StrUSD = ynUSD().toStringAsFixed(2));
                                  setState(() => StrEUR = ynEUR().toStringAsFixed(2));
                                  setState(() => StrLBR = ynLBR().toStringAsFixed(2));
                                  setState(() => StrCAD = ynCAD().toStringAsFixed(2));
                                  setState(() => StrAUS = ynAUS().toStringAsFixed(2));
                                  setState(() => StrARS = ynARS().toStringAsFixed(2));
                                  setState(() => StrJPY = ynJPY().toStringAsFixed(2));
                                }
                            },
                            style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              activebtonAUS
                                  ? Color.fromRGBO(2, 82, 252, 1.0)
                                  : Color.fromRGBO(255, 255, 255, 0.9),
                            ),
                          ),
                            child: Text(
                            '$StrAUS\nAU\$',
                            style: TextStyle(
                                color: activebtonAUS
                                    ? Colors.white
                                    : Colors.black
                            ),
                          ),
                        ),
                      )
                    ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child:
                        SizedBox(
                        height: 82,
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () {
                            if (!activebtonCAD) {
                              setState(() {activebtonCAD = true;
                              activebtonU$D = false;
                              activebtonARS = false;
                              activebtonAUS = false;
                              activebtonEUR = false;
                              activebtonJPY = false;
                              activebtonLBR = false;
                              activebtonR$ = false;
                              activebtonYEN = false;
                              });
                            }
                            valorInserido = double.parse(_ValorInserido.text.replaceAll(".", "").replaceAll(",", "."));
                                if ( activebtonR$  ) {
                                  setState(() => StrBrl = valorInserido!.toStringAsFixed(2));
                                  setState(() => StrUSD = brlUSD().toStringAsFixed(2));
                                  setState(() => StrEUR = brlEUR().toStringAsFixed(2));
                                  setState(() => StrLBR = brlLBR().toStringAsFixed(2));
                                  setState(() => StrCAD = brlCAD().toStringAsFixed(2));
                                  setState(() => StrAUS = brlAUS().toStringAsFixed(2));
                                  setState(() => StrARS = brlARS().toStringAsFixed(2));
                                  setState(() => StrJPY = brlJPY().toStringAsFixed(2));
                                  setState(() => StrYEN = brlYEN().toStringAsFixed(2));
                                }
                                if ( activebtonU$D ) {
                                  setState(() => StrUSD = valorInserido!.toStringAsFixed(2));
                                  setState(() => StrBrl = usdBRL().toStringAsFixed(2));
                                  setState(() => StrEUR = usdEUR()  .toStringAsFixed(2));
                                  setState(() => StrLBR = usdLBR().toStringAsFixed(2));
                                  setState(() => StrCAD = usdCAD().toStringAsFixed(2));
                                  setState(() => StrAUS = usdAUS().toStringAsFixed(2));
                                  setState(() => StrARS = usdARS().toStringAsFixed(2));
                                  setState(() => StrJPY = usdJPY().toStringAsFixed(2));
                                  setState(() => StrYEN = usdYEN().toStringAsFixed(2));
                                }
                                if ( activebtonEUR ) {
                                  setState(() => StrEUR = valorInserido!.toStringAsFixed(2));
                                  setState(() => StrBrl = eurBRL().toStringAsFixed(2));
                                  setState(() => StrUSD = eurUSD().toStringAsFixed(2));
                                  setState(() => StrLBR = eurLBR().toStringAsFixed(2));
                                  setState(() => StrCAD = eurCAD().toStringAsFixed(2));
                                  setState(() => StrAUS = eurAUS().toStringAsFixed(2));
                                  setState(() => StrARS = eurARS().toStringAsFixed(2));
                                  setState(() => StrJPY = eurJPY().toStringAsFixed(2));
                                  setState(() => StrYEN = eurYEN().toStringAsFixed(2));
                                }
                                if ( activebtonLBR ) {
                                  setState(() => StrLBR = valorInserido!.toStringAsFixed(2));
                                  setState(() => StrBrl = lbrBRL().toStringAsFixed(2));
                                  setState(() => StrUSD = lbrUSD().toStringAsFixed(2));
                                  setState(() => StrEUR = lbrEUR().toStringAsFixed(2));
                                  setState(() => StrCAD = lbrCAD().toStringAsFixed(2));
                                  setState(() => StrAUS = lbrAUS().toStringAsFixed(2));
                                  setState(() => StrARS = lbrARS().toStringAsFixed(2));
                                  setState(() => StrJPY = lbrJPY().toStringAsFixed(2));
                                  setState(() => StrYEN = lbrYEN().toStringAsFixed(2));
                                }
                                if ( activebtonCAD ) {
                                  setState(() => StrCAD = valorInserido!.toStringAsFixed(2));
                                  setState(() => StrBrl = dcadBRL().toStringAsFixed(2));
                                  setState(() => StrUSD = dcadUSD().toStringAsFixed(2));
                                  setState(() => StrEUR = dcadEUR().toStringAsFixed(2));
                                  setState(() => StrLBR = dcadLBR().toStringAsFixed(2));
                                  setState(() => StrAUS = dcadAUS().toStringAsFixed(2));
                                  setState(() => StrARS = dcadARS().toStringAsFixed(2));
                                  setState(() => StrJPY = dcadJPY().toStringAsFixed(2));
                                  setState(() => StrYEN = dcadYEN().toStringAsFixed(2));
                                }
                                if ( activebtonAUS ) {
                                  setState(() => StrAUS = valorInserido!.toStringAsFixed(2));
                                  setState(() => StrBrl = ausBRL().toStringAsFixed(2));
                                  setState(() => StrUSD = ausUSD().toStringAsFixed(2));
                                  setState(() => StrEUR = ausEUR().toStringAsFixed(2));
                                  setState(() => StrLBR = ausLBR().toStringAsFixed(2));
                                  setState(() => StrCAD = ausCAD().toStringAsFixed(2));
                                  setState(() => StrARS = ausARS().toStringAsFixed(2));
                                  setState(() => StrJPY = ausJPY().toStringAsFixed(2));
                                  setState(() => StrYEN = ausYEN().toStringAsFixed(2));
                                }
                                if ( activebtonARS ) {
                                  setState(() => StrARS = valorInserido!.toStringAsFixed(2));
                                  setState(() => StrBrl = arsBRL().toStringAsFixed(2));
                                  setState(() => StrUSD = arsUSD().toStringAsFixed(2));
                                  setState(() => StrEUR = arsEUR().toStringAsFixed(2));
                                  setState(() => StrLBR = arsLBR().toStringAsFixed(2));
                                  setState(() => StrCAD = arsCAD().toStringAsFixed(2));
                                  setState(() => StrAUS = arsAUS().toStringAsFixed(2));
                                  setState(() => StrJPY = arsJPY().toStringAsFixed(2));
                                  setState(() => StrYEN = arsYEN().toStringAsFixed(2));
                                }
                                if ( activebtonJPY ) {
                                  setState(() => StrJPY = valorInserido!.toStringAsFixed(2));
                                  setState(() => StrBrl = jpBRL().toStringAsFixed(2));
                                  setState(() => StrUSD = jpUSD().toStringAsFixed(2));
                                  setState(() => StrEUR = jpEUR().toStringAsFixed(2));
                                  setState(() => StrLBR = jpLBR().toStringAsFixed(2));
                                  setState(() => StrAUS = jpAUS().toStringAsFixed(2));
                                  setState(() => StrCAD = jpCAD().toStringAsFixed(2));
                                  setState(() => StrARS = jpARS().toStringAsFixed(2));
                                  setState(() => StrYEN = jpYEN().toStringAsFixed(2));
                                }
                                if ( activebtonYEN ) {
                                  setState(() => StrYEN = valorInserido!.toStringAsFixed(2));
                                  setState(() => StrBrl = ynBRL().toStringAsFixed(2));
                                  setState(() => StrUSD = ynUSD().toStringAsFixed(2));
                                  setState(() => StrEUR = ynEUR().toStringAsFixed(2));
                                  setState(() => StrLBR = ynLBR().toStringAsFixed(2));
                                  setState(() => StrCAD = ynCAD().toStringAsFixed(2));
                                  setState(() => StrAUS = ynAUS().toStringAsFixed(2));
                                  setState(() => StrARS = ynARS().toStringAsFixed(2));
                                  setState(() => StrJPY = ynJPY().toStringAsFixed(2));
                                }

                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              activebtonCAD
                                  ? Color.fromRGBO(2, 82, 252, 1.0)
                                  : Color.fromRGBO(255, 255, 255, 0.9),
                            ),
                           ),
                          child: Text(
                            '$StrCAD\nCAD',
                            style: TextStyle(
                                color: activebtonCAD
                                    ? Colors.white
                                    : Colors.black
                            ),
                          ),
                        ),
                      )
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child:
                        SizedBox(
                         height: 82,
                          width: 100,
                         child: ElevatedButton(
                          onPressed: () {
                            if (!activebtonARS) {
                              setState(() {

                                activebtonARS = true;
                                activebtonU$D = false;
                                activebtonAUS = false;
                                activebtonCAD = false;
                                activebtonEUR = false;
                                activebtonJPY = false;
                                activebtonLBR = false;
                                activebtonR$ = false;
                                activebtonYEN = false;
                              });
                            }valorInserido = double.parse(_ValorInserido.text.replaceAll(".", "").replaceAll(",", "."));
                            if ( activebtonR$  ) {
                              setState(() => StrBrl = valorInserido!.toStringAsFixed(2));
                              setState(() => StrUSD = brlUSD().toStringAsFixed(2));
                              setState(() => StrEUR = brlEUR().toStringAsFixed(2));
                              setState(() => StrLBR = brlLBR().toStringAsFixed(2));
                              setState(() => StrCAD = brlCAD().toStringAsFixed(2));
                              setState(() => StrAUS = brlAUS().toStringAsFixed(2));
                              setState(() => StrARS = brlARS().toStringAsFixed(2));
                              setState(() => StrJPY = brlJPY().toStringAsFixed(2));
                              setState(() => StrYEN = brlYEN().toStringAsFixed(2));
                            }
                            if ( activebtonU$D ) {
                              setState(() => StrUSD = valorInserido!.toStringAsFixed(2));
                              setState(() => StrBrl = usdBRL().toStringAsFixed(2));
                              setState(() => StrEUR = usdEUR()  .toStringAsFixed(2));
                              setState(() => StrLBR = usdLBR().toStringAsFixed(2));
                              setState(() => StrCAD = usdCAD().toStringAsFixed(2));
                              setState(() => StrAUS = usdAUS().toStringAsFixed(2));
                              setState(() => StrARS = usdARS().toStringAsFixed(2));
                              setState(() => StrJPY = usdJPY().toStringAsFixed(2));
                              setState(() => StrYEN = usdYEN().toStringAsFixed(2));
                            }
                            if ( activebtonEUR ) {
                              setState(() => StrEUR = valorInserido!.toStringAsFixed(2));
                              setState(() => StrBrl = eurBRL().toStringAsFixed(2));
                              setState(() => StrUSD = eurUSD().toStringAsFixed(2));
                              setState(() => StrLBR = eurLBR().toStringAsFixed(2));
                              setState(() => StrCAD = eurCAD().toStringAsFixed(2));
                              setState(() => StrAUS = eurAUS().toStringAsFixed(2));
                              setState(() => StrARS = eurARS().toStringAsFixed(2));
                              setState(() => StrJPY = eurJPY().toStringAsFixed(2));
                              setState(() => StrYEN = eurYEN().toStringAsFixed(2));
                            }
                            if ( activebtonLBR ) {
                              setState(() => StrLBR = valorInserido!.toStringAsFixed(2));
                              setState(() => StrBrl = lbrBRL().toStringAsFixed(2));
                              setState(() => StrUSD = lbrUSD().toStringAsFixed(2));
                              setState(() => StrEUR = lbrEUR().toStringAsFixed(2));
                              setState(() => StrCAD = lbrCAD().toStringAsFixed(2));
                              setState(() => StrAUS = lbrAUS().toStringAsFixed(2));
                              setState(() => StrARS = lbrARS().toStringAsFixed(2));
                              setState(() => StrJPY = lbrJPY().toStringAsFixed(2));
                              setState(() => StrYEN = lbrYEN().toStringAsFixed(2));
                            }
                            if ( activebtonCAD ) {
                              setState(() => StrCAD = valorInserido!.toStringAsFixed(2));
                              setState(() => StrBrl = dcadBRL().toStringAsFixed(2));
                              setState(() => StrUSD = dcadUSD().toStringAsFixed(2));
                              setState(() => StrEUR = dcadEUR().toStringAsFixed(2));
                              setState(() => StrLBR = dcadLBR().toStringAsFixed(2));
                              setState(() => StrAUS = dcadAUS().toStringAsFixed(2));
                              setState(() => StrARS = dcadARS().toStringAsFixed(2));
                              setState(() => StrJPY = dcadJPY().toStringAsFixed(2));
                              setState(() => StrYEN = dcadYEN().toStringAsFixed(2));
                            }
                            if ( activebtonAUS ) {
                              setState(() => StrAUS = valorInserido!.toStringAsFixed(2));
                              setState(() => StrBrl = ausBRL().toStringAsFixed(2));
                              setState(() => StrUSD = ausUSD().toStringAsFixed(2));
                              setState(() => StrEUR = ausEUR().toStringAsFixed(2));
                              setState(() => StrLBR = ausLBR().toStringAsFixed(2));
                              setState(() => StrCAD = ausCAD().toStringAsFixed(2));
                              setState(() => StrARS = ausARS().toStringAsFixed(2));
                              setState(() => StrJPY = ausJPY().toStringAsFixed(2));
                              setState(() => StrYEN = ausYEN().toStringAsFixed(2));
                            }
                            if ( activebtonARS ) {
                              setState(() => StrARS = valorInserido!.toStringAsFixed(2));
                              setState(() => StrBrl = arsBRL().toStringAsFixed(2));
                              setState(() => StrUSD = arsUSD().toStringAsFixed(2));
                              setState(() => StrEUR = arsEUR().toStringAsFixed(2));
                              setState(() => StrLBR = arsLBR().toStringAsFixed(2));
                              setState(() => StrCAD = arsCAD().toStringAsFixed(2));
                              setState(() => StrAUS = arsAUS().toStringAsFixed(2));
                              setState(() => StrJPY = arsJPY().toStringAsFixed(2));
                              setState(() => StrYEN = arsYEN().toStringAsFixed(2));
                            }
                            if ( activebtonJPY ) {
                              setState(() => StrJPY = valorInserido!.toStringAsFixed(2));
                              setState(() => StrBrl = jpBRL().toStringAsFixed(2));
                              setState(() => StrUSD = jpUSD().toStringAsFixed(2));
                              setState(() => StrEUR = jpEUR().toStringAsFixed(2));
                              setState(() => StrLBR = jpLBR().toStringAsFixed(2));
                              setState(() => StrAUS = jpAUS().toStringAsFixed(2));
                              setState(() => StrCAD = jpCAD().toStringAsFixed(2));
                              setState(() => StrARS = jpARS().toStringAsFixed(2));
                              setState(() => StrYEN = jpYEN().toStringAsFixed(2));
                            }
                            if ( activebtonYEN ) {
                              setState(() => StrYEN = valorInserido!.toStringAsFixed(2));
                              setState(() => StrBrl = ynBRL().toStringAsFixed(2));
                              setState(() => StrUSD = ynUSD().toStringAsFixed(2));
                              setState(() => StrEUR = ynEUR().toStringAsFixed(2));
                              setState(() => StrLBR = ynLBR().toStringAsFixed(2));
                              setState(() => StrCAD = ynCAD().toStringAsFixed(2));
                              setState(() => StrAUS = ynAUS().toStringAsFixed(2));
                              setState(() => StrARS = ynARS().toStringAsFixed(2));
                              setState(() => StrJPY = ynJPY().toStringAsFixed(2));
                            }
                          },
                            style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              activebtonARS
                                  ? Color.fromRGBO(2, 82, 252, 1.0)
                                  : Color.fromRGBO(255, 255, 255, 0.9),
                            ),
                          ),
                          child: Text(
                            '$StrARS\nAR\$',
                            style: TextStyle(
                              color: activebtonARS
                                  ? Colors.white
                                  : Colors.black
                            ),
                          ),
                        ),
                      )
                    ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child:
                        SizedBox(
                          height: 82,
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () {
                            if (!activebtonJPY) {
                              setState(() {

                                activebtonJPY= true;
                                activebtonU$D = false;
                                activebtonARS = false;
                                activebtonAUS = false;
                                activebtonCAD = false;
                                activebtonEUR = false;
                                activebtonLBR = false;
                                activebtonR$ = false;
                                activebtonYEN = false;
                              });
                            }valorInserido = double.parse(_ValorInserido.text.replaceAll(".", "").replaceAll(",", "."));
                            if ( activebtonR$  ) {
                              setState(() => StrBrl = valorInserido!.toStringAsFixed(2));
                              setState(() => StrUSD = brlUSD().toStringAsFixed(2));
                              setState(() => StrEUR = brlEUR().toStringAsFixed(2));
                              setState(() => StrLBR = brlLBR().toStringAsFixed(2));
                              setState(() => StrCAD = brlCAD().toStringAsFixed(2));
                              setState(() => StrAUS = brlAUS().toStringAsFixed(2));
                              setState(() => StrARS = brlARS().toStringAsFixed(2));
                              setState(() => StrJPY = brlJPY().toStringAsFixed(2));
                              setState(() => StrYEN = brlYEN().toStringAsFixed(2));
                            }
                            if ( activebtonU$D ) {
                              setState(() => StrUSD = valorInserido!.toStringAsFixed(2));
                              setState(() => StrBrl = usdBRL().toStringAsFixed(2));
                              setState(() => StrEUR = usdEUR()  .toStringAsFixed(2));
                              setState(() => StrLBR = usdLBR().toStringAsFixed(2));
                              setState(() => StrCAD = usdCAD().toStringAsFixed(2));
                              setState(() => StrAUS = usdAUS().toStringAsFixed(2));
                              setState(() => StrARS = usdARS().toStringAsFixed(2));
                              setState(() => StrJPY = usdJPY().toStringAsFixed(2));
                              setState(() => StrYEN = usdYEN().toStringAsFixed(2));
                            }
                            if ( activebtonEUR ) {
                              setState(() => StrEUR = valorInserido!.toStringAsFixed(2));
                              setState(() => StrBrl = eurBRL().toStringAsFixed(2));
                              setState(() => StrUSD = eurUSD().toStringAsFixed(2));
                              setState(() => StrLBR = eurLBR().toStringAsFixed(2));
                              setState(() => StrCAD = eurCAD().toStringAsFixed(2));
                              setState(() => StrAUS = eurAUS().toStringAsFixed(2));
                              setState(() => StrARS = eurARS().toStringAsFixed(2));
                              setState(() => StrJPY = eurJPY().toStringAsFixed(2));
                              setState(() => StrYEN = eurYEN().toStringAsFixed(2));
                            }
                            if ( activebtonLBR ) {
                              setState(() => StrLBR = valorInserido!.toStringAsFixed(2));
                              setState(() => StrBrl = lbrBRL().toStringAsFixed(2));
                              setState(() => StrUSD = lbrUSD().toStringAsFixed(2));
                              setState(() => StrEUR = lbrEUR().toStringAsFixed(2));
                              setState(() => StrCAD = lbrCAD().toStringAsFixed(2));
                              setState(() => StrAUS = lbrAUS().toStringAsFixed(2));
                              setState(() => StrARS = lbrARS().toStringAsFixed(2));
                              setState(() => StrJPY = lbrJPY().toStringAsFixed(2));
                              setState(() => StrYEN = lbrYEN().toStringAsFixed(2));
                            }
                            if ( activebtonCAD ) {
                              setState(() => StrCAD = valorInserido!.toStringAsFixed(2));
                              setState(() => StrBrl = dcadBRL().toStringAsFixed(2));
                              setState(() => StrUSD = dcadUSD().toStringAsFixed(2));
                              setState(() => StrEUR = dcadEUR().toStringAsFixed(2));
                              setState(() => StrLBR = dcadLBR().toStringAsFixed(2));
                              setState(() => StrAUS = dcadAUS().toStringAsFixed(2));
                              setState(() => StrARS = dcadARS().toStringAsFixed(2));
                              setState(() => StrJPY = dcadJPY().toStringAsFixed(2));
                              setState(() => StrYEN = dcadYEN().toStringAsFixed(2));
                            }
                            if ( activebtonAUS ) {
                              setState(() => StrAUS = valorInserido!.toStringAsFixed(2));
                              setState(() => StrBrl = ausBRL().toStringAsFixed(2));
                              setState(() => StrUSD = ausUSD().toStringAsFixed(2));
                              setState(() => StrEUR = ausEUR().toStringAsFixed(2));
                              setState(() => StrLBR = ausLBR().toStringAsFixed(2));
                              setState(() => StrCAD = ausCAD().toStringAsFixed(2));
                              setState(() => StrARS = ausARS().toStringAsFixed(2));
                              setState(() => StrJPY = ausJPY().toStringAsFixed(2));
                              setState(() => StrYEN = ausYEN().toStringAsFixed(2));
                            }
                            if ( activebtonARS ) {
                              setState(() => StrARS = valorInserido!.toStringAsFixed(2));
                              setState(() => StrBrl = arsBRL().toStringAsFixed(2));
                              setState(() => StrUSD = arsUSD().toStringAsFixed(2));
                              setState(() => StrEUR = arsEUR().toStringAsFixed(2));
                              setState(() => StrLBR = arsLBR().toStringAsFixed(2));
                              setState(() => StrCAD = arsCAD().toStringAsFixed(2));
                              setState(() => StrAUS = arsAUS().toStringAsFixed(2));
                              setState(() => StrJPY = arsJPY().toStringAsFixed(2));
                              setState(() => StrYEN = arsYEN().toStringAsFixed(2));
                            }
                            if ( activebtonJPY ) {
                              setState(() => StrJPY = valorInserido!.toStringAsFixed(2));
                              setState(() => StrBrl = jpBRL().toStringAsFixed(2));
                              setState(() => StrUSD = jpUSD().toStringAsFixed(2));
                              setState(() => StrEUR = jpEUR().toStringAsFixed(2));
                              setState(() => StrLBR = jpLBR().toStringAsFixed(2));
                              setState(() => StrAUS = jpAUS().toStringAsFixed(2));
                              setState(() => StrCAD = jpCAD().toStringAsFixed(2));
                              setState(() => StrARS = jpARS().toStringAsFixed(2));
                              setState(() => StrYEN = jpYEN().toStringAsFixed(2));
                            }
                            if ( activebtonYEN ) {
                              setState(() => StrYEN = valorInserido!.toStringAsFixed(2));
                              setState(() => StrBrl = ynBRL().toStringAsFixed(2));
                              setState(() => StrUSD = ynUSD().toStringAsFixed(2));
                              setState(() => StrEUR = ynEUR().toStringAsFixed(2));
                              setState(() => StrLBR = ynLBR().toStringAsFixed(2));
                              setState(() => StrCAD = ynCAD().toStringAsFixed(2));
                              setState(() => StrAUS = ynAUS().toStringAsFixed(2));
                              setState(() => StrARS = ynARS().toStringAsFixed(2));
                              setState(() => StrJPY = ynJPY().toStringAsFixed(2));
                            }
                            },
                            style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              activebtonJPY
                                  ? Color.fromRGBO(2, 82, 252, 1.0)
                                  : Color.fromRGBO(255, 255, 255, 0.9),
                              ),
                            ),
                            child: Text(
                            '$StrJPY\nJP¥',
                            style: TextStyle(
                                color: activebtonJPY
                                  ? Colors.white
                                  : Colors.black
                            ),
                          ),
                        ),
                      )
                    ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child:
                        SizedBox(
                          height: 82,
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () {
                            if (!activebtonYEN) {
                              setState(() {

                                activebtonYEN = true;
                                activebtonU$D = false;
                                activebtonARS = false;
                                activebtonAUS = false;
                                activebtonCAD = false;
                                activebtonEUR = false;
                                activebtonJPY = false;
                                activebtonR$ = false;
                                activebtonLBR = false;
                              });
                            } valorInserido = double.parse(_ValorInserido.text.replaceAll(".", "").replaceAll(",", "."));
                            if ( activebtonR$  ) {
                              setState(() => StrBrl = valorInserido!.toStringAsFixed(2));
                              setState(() => StrUSD = brlUSD().toStringAsFixed(2));
                              setState(() => StrEUR = brlEUR().toStringAsFixed(2));
                              setState(() => StrLBR = brlLBR().toStringAsFixed(2));
                              setState(() => StrCAD = brlCAD().toStringAsFixed(2));
                              setState(() => StrAUS = brlAUS().toStringAsFixed(2));
                              setState(() => StrARS = brlARS().toStringAsFixed(2));
                              setState(() => StrJPY = brlJPY().toStringAsFixed(2));
                              setState(() => StrYEN = brlYEN().toStringAsFixed(2));
                            }
                            if ( activebtonU$D ) {
                              setState(() => StrUSD = valorInserido!.toStringAsFixed(2));
                              setState(() => StrBrl = usdBRL().toStringAsFixed(2));
                              setState(() => StrEUR = usdEUR()  .toStringAsFixed(2));
                              setState(() => StrLBR = usdLBR().toStringAsFixed(2));
                              setState(() => StrCAD = usdCAD().toStringAsFixed(2));
                              setState(() => StrAUS = usdAUS().toStringAsFixed(2));
                              setState(() => StrARS = usdARS().toStringAsFixed(2));
                              setState(() => StrJPY = usdJPY().toStringAsFixed(2));
                              setState(() => StrYEN = usdYEN().toStringAsFixed(2));
                            }
                            if ( activebtonEUR ) {
                              setState(() => StrEUR = valorInserido!.toStringAsFixed(2));
                              setState(() => StrBrl = eurBRL().toStringAsFixed(2));
                              setState(() => StrUSD = eurUSD().toStringAsFixed(2));
                              setState(() => StrLBR = eurLBR().toStringAsFixed(2));
                              setState(() => StrCAD = eurCAD().toStringAsFixed(2));
                              setState(() => StrAUS = eurAUS().toStringAsFixed(2));
                              setState(() => StrARS = eurARS().toStringAsFixed(2));
                              setState(() => StrJPY = eurJPY().toStringAsFixed(2));
                              setState(() => StrYEN = eurYEN().toStringAsFixed(2));
                            }
                            if ( activebtonLBR ) {
                              setState(() => StrLBR = valorInserido!.toStringAsFixed(2));
                              setState(() => StrBrl = lbrBRL().toStringAsFixed(2));
                              setState(() => StrUSD = lbrUSD().toStringAsFixed(2));
                              setState(() => StrEUR = lbrEUR().toStringAsFixed(2));
                              setState(() => StrCAD = lbrCAD().toStringAsFixed(2));
                              setState(() => StrAUS = lbrAUS().toStringAsFixed(2));
                              setState(() => StrARS = lbrARS().toStringAsFixed(2));
                              setState(() => StrJPY = lbrJPY().toStringAsFixed(2));
                              setState(() => StrYEN = lbrYEN().toStringAsFixed(2));
                            }
                            if ( activebtonCAD ) {
                              setState(() => StrCAD = valorInserido!.toStringAsFixed(2));
                              setState(() => StrBrl = dcadBRL().toStringAsFixed(2));
                              setState(() => StrUSD = dcadUSD().toStringAsFixed(2));
                              setState(() => StrEUR = dcadEUR().toStringAsFixed(2));
                              setState(() => StrLBR = dcadLBR().toStringAsFixed(2));
                              setState(() => StrAUS = dcadAUS().toStringAsFixed(2));
                              setState(() => StrARS = dcadARS().toStringAsFixed(2));
                              setState(() => StrJPY = dcadJPY().toStringAsFixed(2));
                              setState(() => StrYEN = dcadYEN().toStringAsFixed(2));
                            }
                            if ( activebtonAUS ) {
                              setState(() => StrAUS = valorInserido!.toStringAsFixed(2));
                              setState(() => StrBrl = ausBRL().toStringAsFixed(2));
                              setState(() => StrUSD = ausUSD().toStringAsFixed(2));
                              setState(() => StrEUR = ausEUR().toStringAsFixed(2));
                              setState(() => StrLBR = ausLBR().toStringAsFixed(2));
                              setState(() => StrCAD = ausCAD().toStringAsFixed(2));
                              setState(() => StrARS = ausARS().toStringAsFixed(2));
                              setState(() => StrJPY = ausJPY().toStringAsFixed(2));
                              setState(() => StrYEN = ausYEN().toStringAsFixed(2));
                            }
                            if ( activebtonARS ) {
                              setState(() => StrARS = valorInserido!.toStringAsFixed(2));
                              setState(() => StrBrl = arsBRL().toStringAsFixed(2));
                              setState(() => StrUSD = arsUSD().toStringAsFixed(2));
                              setState(() => StrEUR = arsEUR().toStringAsFixed(2));
                              setState(() => StrLBR = arsLBR().toStringAsFixed(2));
                              setState(() => StrCAD = arsCAD().toStringAsFixed(2));
                              setState(() => StrAUS = arsAUS().toStringAsFixed(2));
                              setState(() => StrJPY = arsJPY().toStringAsFixed(2));
                              setState(() => StrYEN = arsYEN().toStringAsFixed(2));
                            };
                            if ( activebtonJPY ) {
                              setState(() => StrJPY = valorInserido!.toStringAsFixed(2));
                              setState(() => StrBrl = jpBRL().toStringAsFixed(2));
                              setState(() => StrUSD = jpUSD().toStringAsFixed(2));
                              setState(() => StrEUR = jpEUR().toStringAsFixed(2));
                              setState(() => StrLBR = jpLBR().toStringAsFixed(2));
                              setState(() => StrAUS = jpAUS().toStringAsFixed(2));
                              setState(() => StrCAD = jpCAD().toStringAsFixed(2));
                              setState(() => StrARS = jpARS().toStringAsFixed(2));
                              setState(() => StrYEN = jpYEN().toStringAsFixed(2));
                            }
                            if ( activebtonYEN ) {
                              setState(() => StrYEN = valorInserido!.toStringAsFixed(2));
                              setState(() => StrBrl = ynBRL().toStringAsFixed(2));
                              setState(() => StrUSD = ynUSD().toStringAsFixed(2));
                              setState(() => StrEUR = ynEUR().toStringAsFixed(2));
                              setState(() => StrLBR = ynLBR().toStringAsFixed(2));
                              setState(() => StrCAD = ynCAD().toStringAsFixed(2));
                              setState(() => StrAUS = ynAUS().toStringAsFixed(2));
                              setState(() => StrARS = ynARS().toStringAsFixed(2));
                              setState(() => StrJPY = ynJPY().toStringAsFixed(2));
                            }
                            },
                            style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              activebtonYEN
                                  ? Color.fromRGBO(2, 82, 252, 1.0)
                                  : Color.fromRGBO(255, 255, 255, 0.9),
                              ),
                            ),
                            child: Text(
                            '$StrYEN\nCN¥',
                            style: TextStyle(color:
                            activebtonYEN
                                ? Colors.white
                                : Colors.black
                            ),
                          ),
                        ),
                      )
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
