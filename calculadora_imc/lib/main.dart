import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false, //retira a tarja de debug
      home:
          MinhaCalculadoraDeImc(), //Primeiro Widget a ser executado dentro de MyApp
    );
  }
}

class MinhaCalculadoraDeImc extends StatefulWidget {
  @override
  _MinhaCalculadoraDeImcState createState() => _MinhaCalculadoraDeImcState();
}

class _MinhaCalculadoraDeImcState extends State<MinhaCalculadoraDeImc> {
  TextEditingController pesoController;
  TextEditingController alturaController;

  double imc;
  String classificacao;
  Color corResultado;

  @override
  void initState() {
    pesoController = TextEditingController(text: '');
    alturaController = TextEditingController(text: '');
    super.initState();
  }

  @override
  void dispose() {
    pesoController.dispose();
    alturaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              imc == null
                  ? Text(
                      'Adicione valores de peso e altura \n para calcular seu IMC',
                      style:
                          TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                      textAlign: TextAlign.center,
                    )
                  : Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(150),
                          border: Border.all(
                            width: 10,
                            color: corResultado,
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${imc.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 42,
                              color: corResultado,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            classificacao,
                            style: TextStyle(
                              fontSize: 20,
                              color: corResultado,
                            ),
                          )
                        ],
                      ),
                    ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text('Seu peso'),
                      SizedBox(
                        height: 6,
                      ),
                      Container(
                        width: 75,
                        child: TextField(
                          controller: pesoController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            suffixText: 'kg',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 22,
                  ),
                  Column(
                    children: [
                      Text('Sua altura'),
                      SizedBox(
                        height: 6,
                      ),
                      Container(
                        width: 75,
                        child: TextField(
                          controller: alturaController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            suffixText: 'm',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              // ignore: deprecated_member_use
              Container(
                width: 200,
                height: 60,
                child: RaisedButton(
                  onPressed: () {
                    try {
                      double peso = double.parse(pesoController.text);
                      double altura = double.parse(alturaController.text);
                      setState(() {
                        imc = peso / (altura * altura);
                        classificacao = getClassificacaoIMC(imc);
                        corResultado = getColor(imc);
                      });
                    } on Exception {
                      setState(() {
                        imc = null;
                        pesoController.text = '';
                        alturaController.text = '';
                        classificacao = null;
                        corResultado = null;
                      });
                    }
                  },
                  child: Text(
                    'Calcular',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  String getClassificacaoIMC(double imc) {
    if (imc <= 18.5) {
      return 'Abaixo do peso';
    } else if (imc > 18.5 && imc <= 24.9) {
      return 'Peso normal';
    } else if (imc > 25.0 && imc < 29.9) {
      return 'Sobrepeso';
    } else if (imc > 30.0 && imc < 34.9) {
      return 'Obesidade grau I';
    } else if (imc > 35.0 && imc < 39.9) {
      return 'Obesidade grau II';
    } else if (imc > 40.0) {
      return 'Obesidade grau III';
    }
    return null;
  }

  Color getColor(double imc) {
    if (imc <= 18.5) {
      return Colors.blue;
    } else if (imc > 18.5 && imc <= 24.9) {
      return Colors.green;
    } else if (imc > 25.0 && imc < 29.9) {
      return Color(0xFFF4BE8E);
    } else if (imc > 30.0 && imc < 34.9) {
      return Color(0xFFEE9809);
    } else if (imc > 35.0 && imc < 39.9) {
      return Color(0xFFE44F38);
    } else if (imc > 40.0) {
      return Colors.red;
    }
    return null;
  }
}
