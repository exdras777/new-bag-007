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

  conversorInserido(){

  }

  convertUSD(){
    return (valorInserido!/ this.dolarUSD!);
  }

  // convertEUR(){
  //   convertEUR().text (real/this.dolarUSD);
  // }
  //
  // convertLBR(){
  //   convertLBR().text (libraGBP * this.libraGBP!);
  // }
  //
  // convertCAD(){
  //   convertCAD().text (dolCAD * this.dolCAD);
  // }
  //
  // convertAUS(){
  //   convertAUS().text (dolAUS * this.dolAUS!);
  // }
  //
  // convertARS(){
  //   convertARS().text (pesoARS * this.pesoARS!);
  // }
  //
  // convertJPY(){
  //   convertJPY().text (ieneJPN * this.ieneJPN!);
  // }
  //
  // convertYEN(){
  //   convertYEN().text (renminbiCNY * this.renminbiCNY!);
  // }



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
                    setState(() => StrBrl = convertUSD().toStringAsFixed(2));

                  // if ( activebtonU$D )
                  //   setState(() => StrUSD = convertUSD().toStringAsFixed(2));

                  // if ( activebtonEUR )
                  //   setState(() => StrEUR = convertEUR()!.toStringAsFixed(2));
                  //
                  //   if ( activebtonLBR )
                  //   setState(() => StrLBR = convertLBR()!.toStringAsFixed(2));
                  //
                  //   if ( activebtonCAD )
                  //   setState(() => StrCAD = convertCAD()!.toStringAsFixed(2));
                  //
                  //   if ( activebtonAUS )
                  //   setState(() => StrAUS = convertAUS()!.toStringAsFixed(2));
                  //
                  //   if ( activebtonARS )
                  //   setState(() => StrARS = convertARS()!.toStringAsFixed(2));
                  //
                  //   if ( activebtonJP )
                  //   setState(() => StrJPY = convertJPY()!.toStringAsFixed(2));
                  //
                  //   if ( activebtonYEN )
                  //   setState(() => StrYEN = convertYEN()!.toStringAsFixed(2));
                },
              ),
        ),
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height - 290,
              child: Column(
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