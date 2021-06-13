import 'package:flutter/material.dart';
import 'package:practica2/settings/color_settings.dart';

class ConversorScreen extends StatefulWidget {
  ConversorScreen({Key? key}) : super(key: key);

  @override
  _ConversorScreenState createState() => _ConversorScreenState();
}

class _ConversorScreenState extends State<ConversorScreen> {
  double entrada = 0.0;
  double salida = 00.0;
  bool faCe = true;

  @override
  Widget build(BuildContext context) {
    Container btnCalcular = Container(
      child: RaisedButton(
        textColor: Colors.white,
        color: ColorApps.secondaryColorApp,
        child: Text('Calcular'),
        onPressed: () {
          setState(() {
            faCe == false
                ? salida = (entrada - 32) * (5 / 9)
                : salida = (entrada * 9 / 5) + 32;
          });
          AlertDialog dialog = AlertDialog(
            title: const Text('Resultado'),
            content: faCe == false
                ? Text(
                    "${entrada.toStringAsFixed(2)} °F -> ${salida.toStringAsFixed(2)} °C")
                : Text(
                    "${entrada.toStringAsFixed(2)} °C -> ${salida.toStringAsFixed(2)} °F"),
          );
          showDialog(builder: (context) => dialog, context: context);
        },
      ),
    );

    return Scaffold(
      appBar: AppBar(
          backgroundColor: ColorApps.backPrimaryColorApp,
          title: Text('Conversor °C - °F')),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              style: TextStyle(color: Colors.teal, fontWeight: FontWeight.w300),
              keyboardType: TextInputType.number,
              onChanged: (str) {
                try {
                  entrada = double.parse(str);
                } catch (e) {
                  entrada = 0.0;
                }
              },
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.green, fontSize: 17.0),
                icon: Icon(Icons.thermostat, color: Colors.green),
                labelText:
                    'Ingresa un valor en grados ${faCe == false ? "Fahrenheit" : "Celsius"}',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text('Elige el tipo de grado a calcular'),
            SizedBox(
              height: 15,
            ),
            Text("Fahrenheit"),
            Radio<bool>(
                groupValue: faCe,
                value: false,
                onChanged: (v) {
                  setState(() {
                    faCe = v!;
                  });
                }),
            Text("Celsius"),
            Radio<bool>(
                groupValue: faCe,
                value: true,
                onChanged: (v) {
                  setState(() {
                    faCe = v!;
                  });
                }),
            btnCalcular,
          ],
        ),
      ),
    );
  }
}
