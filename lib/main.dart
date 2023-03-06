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
  bool activebtonJP = false;
  bool activebtonYEN = false;
  bool activebtonARS = false;
  bool activebtonCAD = false;
  bool activebtonAUS = false;

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

  double? dolarUSD, euro, pesoARS, dolAUS, dolCAD, ieneJPN, renminbiCNY, libraGBP, real;
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
      libraGBP = map["results"]["currencies"]["GBP"]["buy"];
    });
  }
  //conversores real
  vlrReal(){
    return (valorInserido);
  }
  converUSD(){
    return  (valorInserido! / this.dolarUSD!);
  }
  converEUR(){
    return  (valorInserido! / this.euro!);
  }
  converLBR(){
    return  (valorInserido! / this.libraGBP!);
  }
  converCAD(){
    return  (valorInserido! / this.dolCAD!);
  }
  converAUS(){
    return  (valorInserido! / this.dolAUS!);
  }
  converARS(){
    return  (valorInserido! / this.pesoARS!);
  }
  converJPY(){
    return  (valorInserido! / this.ieneJPN!);
  }
  converYEN(){
    return  (valorInserido! / this.renminbiCNY!);
  }
  //
  //
  vlrUSD(){
    return (valorInserido!);
  }
  REALedol(){
    return (valorInserido!/this.dolarUSD!);
  }
  convertEUR(){
    return  (valorInserido! / this.euro!* this.dolarUSD!);
  }
  convertLBR(){
    return  (valorInserido! / this.libraGBP! * this.dolarUSD!);
  }
  convertCAD(){
    return  (valorInserido! * this.dolCAD!);
  }
  convertAUS(){
    return  (valorInserido! * this.dolAUS!);
  }
  convertARS(){
    return  (valorInserido! / this.pesoARS!);
  }
  convertJPY(){
    return  (valorInserido! / this.ieneJPN!);
  }
  convertYEN(){
    return  (valorInserido! / this.renminbiCNY!);
  }
  //
  //
  vlrEURO(){
    return  (valorInserido!);
  }
  REALeuro(){
    return (valorInserido!/this.euro!);
  }
  converTUSD(){
    return  (valorInserido! / this.dolarUSD! * this.euro!);
  }
  converTLBR(){
    return  (valorInserido! * this.libraGBP! / this.euro!);
  }
  converTCAD(){
    return  (valorInserido! * this.dolCAD!);
  }
  converTAUS(){
    return  (valorInserido! * this.dolAUS!);
  }
  converTARS(){
    return  (valorInserido! * this.pesoARS!);
  }
  converTJPY(){
    return  (valorInserido! * this.ieneJPN!);
  }
  converTYEN(){
    return  (valorInserido! * this.renminbiCNY!);
  }
  //
  //
  vlrGBP(){
    return(valorInserido!);
  }
  REALeGBP(){
    return (valorInserido!/this.libraGBP!);
  }
  ConverUSD(){
    return  (valorInserido! * this.dolarUSD!);
  }
  ConvertEUR(){
    return  (valorInserido! * this.euro!);
  }
  ConvertCAD(){
    return  (valorInserido! * this.dolCAD!);
  }
  ConvertAUS(){
    return  (valorInserido! * this.dolAUS!);
  }
  ConvertARS(){
    return  (valorInserido! / this.pesoARS!);
  }
  ConvertJPY(){
    return  (valorInserido! / this.ieneJPN!);
  }
  ConvertYEN(){
    return  (valorInserido! / this.renminbiCNY!);
  }
  //
  //
  vlrCAD(){
    return(valorInserido!);
  }
  REALeCAD(){
    return (valorInserido!/this.dolCAD!);
  }
  CONVERTUSD(){
    return  (valorInserido! / this.dolarUSD!);
  }
  CONVERTEUR(){
    return  (valorInserido! * this.euro!);
  }
  CONVERTLBR(){
    return  (valorInserido! * this.libraGBP!);
  }
  CONVERTAUS(){
    return  (valorInserido! * this.dolAUS!);
  }
  CONVERTARS(){
    return  (valorInserido! / this.pesoARS!);
  }
  CONVERTJPY(){
    return  (valorInserido! / this.ieneJPN!);
  }
  CONVERTYEN(){
    return  (valorInserido! / this.renminbiCNY!);
  }
  //
  //
  vlrAUS(){
    return (valorInserido!);
  }
  REALAUS(){
    return (valorInserido!/this.dolAUS!);
  }
  CONVUSD(){
    return  (valorInserido! / this.dolarUSD!);
  }
  CONVCAD(){
    return  (valorInserido! * this.dolCAD!);
  }
  CONVEUR(){
    return  (valorInserido! * this.euro!);
  }
  CONVLBR(){
    return  (valorInserido! * this.libraGBP!);
  }
  CONVARS(){
    return  (valorInserido! / this.pesoARS!);
  }
  CONVJPY(){
    return  (valorInserido! / this.ieneJPN!);
  }
  CONVYEN(){
    return  (valorInserido! / this.renminbiCNY!);
  }
  //
  //
  vlrARS(){
    return  (valorInserido!);
  }
  REALeARS(){
    return (valorInserido!/this.pesoARS!);
  }
  cvsorUSD(){
    return  (valorInserido! / this.dolarUSD!);
  }
  cvsorEUR(){
    return  (valorInserido! / this.euro!);
  }
  cvsorLBR(){
    return  (valorInserido! / this.libraGBP!);
  }
  cvsorCAD(){
    return  (valorInserido! / this.dolCAD!);
  }
  cnvsorAUS(){
    return(valorInserido! / this.dolAUS!);
  }
  cvsorJPY(){
    return  (valorInserido! / this.ieneJPN!);
  }
  cvsorYEN(){
    return  (valorInserido! / this.renminbiCNY!);
  }
  //
  //
  vlrJPY(){
    return (valorInserido!);
  }
  REALeJPY(){
    return (valorInserido!/this.ieneJPN!);
  }
  cnvtUSD(){
    return(valorInserido!);
  }
  cnvtEUR(){
    return(valorInserido!);
  }
  cnvtLBR(){
    return(valorInserido!);
  }
  cnvtCAD(){
    return(valorInserido!);
  }
  cnvtAUS(){
    return(valorInserido!);
  }
  cnvtARS(){
    return(valorInserido!);
  }
  cnvtYEN(){
    return(valorInserido!);
  }
  //
  //
  vlrYENE(){
    return (valorInserido!);
  }
  REALeYENE(){
    return (valorInserido!/this.renminbiCNY!);
  }








  Carregar() {
    if (dolarUSD == null) {
      return Center(
        child: Text(
          "Obtendo dados...",
          style: TextStyle(
            fontSize: 30,
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
        centerTitle: true,
        backgroundColor: Color.fromRGBO(1, 21, 0, 0),
        elevation: 0,
        titleSpacing: 70,
        title: Text(
          "COTAÇÃO DE MOEDAS",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(19, 56, 178, 1.0),
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
            Container(
              padding: EdgeInsets.all(18),
              color: Color.fromRGBO(30, 36, 224, 1.0),
              width: double.infinity,
              height: 159,
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Insira um valor",
                  labelStyle: TextStyle(
                    color: Color.fromRGBO(211, 189, 12, 1.0),
                    fontSize: 29,
                  ),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                controller: _ValorInserido,
                onChanged: (_){
                  valorInserido = double.parse(_ValorInserido.text.replaceAll(".", "").replaceAll(",", "."));
                  if ( activebtonR$ )
                    setState(() => StrBrl = vlrReal().toStringAsFixed(2));

                  if ( activebtonR$ )
                    setState(() => StrUSD = converUSD ().toStringAsFixed(2));

                  if ( activebtonR$)
                    setState(() => StrEUR = converEUR().toStringAsFixed(2));

                  if ( activebtonR$ )
                    setState(() => StrLBR = converLBR().toStringAsFixed(2));

                  if ( activebtonR$ )
                    setState(() => StrCAD = converCAD().toStringAsFixed(2));

                  if ( activebtonR$ )
                    setState(() => StrAUS = converAUS().toStringAsFixed(2));

                  if ( activebtonR$ )
                    setState(() => StrARS = converARS().toStringAsFixed(2));

                  if ( activebtonR$ )
                    setState(() => StrJPY = converJPY().toStringAsFixed(2));

                  if ( activebtonR$ )
                    setState(() => StrYEN = converYEN().toStringAsFixed(2));
                  //
                  //
                  //
                  if ( activebtonU$D )
                    setState(() => StrUSD = vlrUSD().toStringAsFixed(2));

                  if ( activebtonU$D )
                    setState(() => StrBrl = REALedol().toStringAsFixed(2));

                  if ( activebtonU$D )
                    setState(() => StrEUR = convertEUR()  .toStringAsFixed(2));

                  if ( activebtonU$D )
                    setState(() => StrLBR = convertLBR().toStringAsFixed(2));

                  if ( activebtonU$D )
                  setState(() => StrCAD = convertCAD().toStringAsFixed(2));

                  if ( activebtonU$D )
                  setState(() => StrAUS = convertAUS().toStringAsFixed(2));

                  if ( activebtonU$D )
                  setState(() => StrJPY = convertJPY().toStringAsFixed(2));

                  if ( activebtonU$D )
                    setState(() => StrYEN = convertYEN().toStringAsFixed(2));
                  //
                  //
                  if ( activebtonEUR )
                    setState(() => StrEUR = vlrEURO().toStringAsFixed(2));

                  if ( activebtonEUR )
                    setState(() => StrBrl = REALeuro().toStringAsFixed(2));

                  if ( activebtonEUR )
                    setState(() => StrUSD = converTUSD().toStringAsFixed(2));

                  if ( activebtonEUR )
                    setState(() => StrLBR = converTLBR().toStringAsFixed(2));

                  if ( activebtonEUR )
                    setState(() => StrCAD = converTCAD().toStringAsFixed(2));

                  if ( activebtonEUR )
                    setState(() => StrAUS = converTAUS().toStringAsFixed(2));

                  if ( activebtonEUR )
                    setState(() => StrJPY = converTJPY().toStringAsFixed(2));

                  if ( activebtonEUR )
                    setState(() => StrYEN = converTYEN().toStringAsFixed(2));
                  //
                  //
                  if ( activebtonLBR )
                    setState(() => StrLBR = vlrGBP().toStringAsFixed(2));

                  if ( activebtonLBR )
                    setState(() => StrBrl = REALeGBP().toStringAsFixed(2));

                  if ( activebtonLBR )
                    setState(() => StrUSD = CONVERTUSD().toStringAsFixed(2));

                  if ( activebtonLBR )
                    setState(() => StrCAD = ConvertCAD().toStringAsFixed(2));

                  if ( activebtonLBR )
                    setState(() => StrAUS = CONVERTAUS().toStringAsFixed(2));
                  if ( activebtonLBR )
                    setState(() => StrARS = CONVERTARS().toStringAsFixed(2));
                  if ( activebtonLBR )
                    setState(() => StrJPY = CONVERTJPY().toStringAsFixed(2));
                  if ( activebtonLBR )
                    setState(() => StrYEN = CONVERTYEN().toStringAsFixed(2));
                  //
                  //
                  if ( activebtonCAD )
                    setState(() => StrCAD = vlrCAD().toStringAsFixed(2));
                  if ( activebtonCAD )
                    setState(() => StrBrl = REALeCAD().toStringAsFixed(2));
                  if ( activebtonCAD )
                    setState(() => StrUSD = CONVERTUSD().toStringAsFixed(2));
                  if ( activebtonCAD )
                    setState(() => StrEUR = CONVERTEUR().toStringAsFixed(2));
                  if ( activebtonCAD )
                    setState(() => StrAUS = CONVERTAUS().toStringAsFixed(2));
                  if ( activebtonCAD )
                    setState(() => StrARS = CONVERTARS().toStringAsFixed(2));
                  if ( activebtonCAD )
                    setState(() => StrJPY = CONVERTJPY().toStringAsFixed(2));
                  if ( activebtonCAD )
                    setState(() => StrYEN = CONVERTYEN().toStringAsFixed(2));
                  //
                  //
                  if ( activebtonAUS )
                    setState(() => StrAUS = vlrAUS().toStringAsFixed(2));

                  if ( activebtonAUS )
                    setState(() => StrBrl = REALeCAD().toStringAsFixed(2));

                  if ( activebtonAUS )
                    setState(() => StrUSD = CONVERTUSD().toStringAsFixed(2));
                  if ( activebtonAUS )
                    setState(() => StrEUR = REALeCAD().toStringAsFixed(2));
                  if ( activebtonAUS )
                    setState(() => StrARS = CONVERTARS().toStringAsFixed(2));
                  if ( activebtonAUS )
                    setState(() => StrJPY = CONVERTJPY().toStringAsFixed(2));
                  if ( activebtonAUS )
                    setState(() => StrYEN = CONVERTYEN().toStringAsFixed(2));




                },
              ),
            ),
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height - 290,
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 69,
                        width: 99,
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
                                activebtonJP = false;
                                activebtonLBR = false;
                                activebtonYEN = false;
                              })  ;
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              activebtonR$
                                  ? Color.fromRGBO(255, 255, 255, 1.0)
                                  : Color.fromRGBO(27, 89, 222, 1.0),
                            ),
                          ),
                          child: Text(
                            '$StrBrl\nR\$',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      Container(
                        height: 69,
                        width: 99,
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
                                activebtonJP = false;
                                activebtonLBR = false;
                                activebtonYEN = false;
                              });
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              activebtonU$D
                                  ? Color.fromRGBO(255, 255, 255, 1.0)
                                  : Color.fromRGBO(27, 89, 222, 1.0),
                            ),
                          ),
                          child: Text(
                            '$StrUSD\nU\$D',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      Container(
                        height: 69,
                        width: 99,
                        child: ElevatedButton(
                          onPressed: () {
                            if (!activebtonEUR) {
                              setState(() {
                                activebtonEUR = !activebtonEUR;
                                activebtonU$D = false;
                                activebtonARS = false;
                                activebtonAUS = false;
                                activebtonCAD = false;
                                activebtonR$ = false;
                                activebtonJP = false;
                                activebtonLBR = false;
                                activebtonYEN = false;
                              });
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              activebtonEUR
                                  ? Color.fromRGBO(255, 255, 255, 1.0)
                                  : Color.fromRGBO(27, 89, 222, 1.0),
                            ),
                          ),
                          child: Text(
                            '$StrEUR\n €',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black),
                          ),
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
                                activebtonJP = false;
                                activebtonR$ = false;
                                activebtonYEN = false;
                              });
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              activebtonLBR
                                  ? Color.fromRGBO(255, 255, 255, 1.0)
                                  : Color.fromRGBO(27, 89, 222, 1.0),
                            ),
                          ),
                          child: Text(
                            '$StrLBR\n£',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      Container(
                        height: 69,
                        width: 99,
                        child: ElevatedButton(
                          onPressed: () {
                            if (!activebtonCAD) {
                              setState(() {
                                activebtonCAD = true;
                                activebtonU$D = false;
                                activebtonARS = false;
                                activebtonAUS = false;
                                activebtonEUR = false;
                                activebtonJP = false;
                                activebtonLBR = false;
                                activebtonR$ = false;
                                activebtonYEN = false;
                              });
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              activebtonCAD
                                  ? Color.fromRGBO(255, 255, 255, 1.0)
                                  : Color.fromRGBO(27, 89, 222, 1.0),
                            ),
                          ),
                          child: Text(
                            '$StrCAD\nC\$',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      Container(
                        height: 69,
                        width: 99,
                        child: ElevatedButton(
                          onPressed: () {
                            if (!activebtonAUS) {
                              setState(() {
                                activebtonAUS= true;
                                activebtonU$D = false;
                                activebtonARS = false;
                                activebtonCAD = false;
                                activebtonEUR = false;
                                activebtonJP = false;
                                activebtonLBR = false;
                                activebtonR$ = false;
                                activebtonYEN = false;
                              });
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              activebtonAUS
                                  ? Color.fromRGBO(255, 255, 255, 1.0)
                                  : Color.fromRGBO(27, 89, 222, 1.0),
                            ),
                          ),
                          child: Text(
                            '$StrAUS\nAU\$',
                            style: TextStyle(color: Colors.black),
                          ),
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
                        child: ElevatedButton(
                          onPressed: () {
                            if (!activebtonARS) {
                              setState(() {
                                activebtonARS = true;
                                activebtonU$D = false;
                                activebtonAUS = false;
                                activebtonCAD = false;
                                activebtonEUR = false;
                                activebtonJP = false;
                                activebtonLBR = false;
                                activebtonR$ = false;
                                activebtonYEN = false;
                              });
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              activebtonARS
                                  ? Color.fromRGBO(255, 255, 255, 1.0)
                                  : Color.fromRGBO(27, 89, 222, 1.0),
                            ),
                          ),
                          child: Text(
                            '$StrARS\nAR\$',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      Container(
                        height: 69,
                        width: 99,
                        child: ElevatedButton(
                          onPressed: () {
                            if (!activebtonJP) {
                              setState(() {
                                activebtonJP= true;
                                activebtonU$D = false;
                                activebtonARS = false;
                                activebtonAUS = false;
                                activebtonCAD = false;
                                activebtonEUR = false;
                                activebtonLBR = false;
                                activebtonR$ = false;
                                activebtonYEN = false;

                              });
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              activebtonJP
                                  ? Color.fromRGBO(255, 255, 255, 1.0)
                                  : Color.fromRGBO(27, 89, 222, 1.0),
                            ),
                          ),
                          child: Text(
                            '$StrJPY\nJP¥',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      Container(
                        height: 69,
                        width: 99,
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
                                activebtonJP = false;
                                activebtonR$ = false;
                                activebtonLBR = false;
                              });
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              activebtonYEN
                                  ? Color.fromRGBO(255, 255, 255, 1.0)
                                  : Color.fromRGBO(27, 89, 222, 1.0),
                            ),
                          ),
                          child: Text(
                            '$StrYEN\n¥',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ])
      ),
    );
  }
}