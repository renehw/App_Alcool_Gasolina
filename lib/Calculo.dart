import 'package:flutter/material.dart';

class Calculo extends StatefulWidget {
  @override
  _CalculoState createState() => _CalculoState();
}

class _CalculoState extends State<Calculo> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular() {
    double precoAlcool = double.tryParse(_controllerAlcool.text);
    double precoGasolina = double.tryParse(_controllerGasolina.text);

    if ((precoAlcool == null) || precoGasolina == null) {
      setState(() {
        _textoResultado =
            "Número inválido, digite números maiores que 0 e utilizando (.)";
      });
    } else {
      if ((precoAlcool / precoGasolina) >= 0.7) {
        setState(() {
          _textoResultado = "Melhor abastecer com gasolina";
        });
      } else {
        setState(() {
          _textoResultado = "Melhor abastecer com alcool";
        });
      }
    }
  }

  /*void _limparCampos() {
    _controllerGasolina.text = "";
    _controllerAlcool.text = "";
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(25, 25, 25, 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "images/logo.png",
              ),
              Padding(
                padding: EdgeInsets.only(top: 15, bottom: 15),
                child: Text(
                    "Saiba qual a melhor opção para abastecimento do seu carro",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(labelText: "Preço Álcool, ex: 1.59"),
                style: TextStyle(fontSize: 17),
                controller: _controllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(labelText: "Preço Gasolina, ex: 3.15"),
                style: TextStyle(fontSize: 17),
                controller: _controllerGasolina,
              ),
              Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: RaisedButton(
                      child: Text(
                        "Calcular",
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                      color: Colors.orangeAccent.shade400,
                      onPressed: _calcular)),
              Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    _textoResultado,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
