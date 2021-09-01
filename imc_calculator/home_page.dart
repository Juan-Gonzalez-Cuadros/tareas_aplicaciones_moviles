import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool selectedGender = false;
  var textController1 = TextEditingController();
  var textController2 = TextEditingController();
  double imc = 0.0;

  final String _mj = ''' 
  Tabla del IMC para mujeres

  Edad      IMC ideal 
  16-17     19-24 
  18-18     19-24   
  19-24     19-24 
  25-34     20-25 
  35-44     21-26 
  45-54     22-27 
  55-64     23-28 
  65-90     25-30
    ''';
  final String _hb = ''' 
  Tabla del IMC para hombres

  Edad      IMC ideal 
  16-16     19-24   
  17-17     20-25   
  18-18     20-25   
  19-24     21-26 
  25-34     22-27 
  35-54     23-38 
  55-64     24-29 
  65-90     25-30
    ''';

  imcCalculation() {
    var imcMeter = double.parse(textController1.text);
    var imcKg = double.parse(textController2.text);
    imc = imcKg / pow(imcMeter, 2);

    var gender = selectedGender;
    if(gender == false){
      createFDialog(context);
    }
    else if(gender == true){
      createMDialog(context);
    }
  }

  createFDialog(BuildContext context) {
    return showDialog(
      context: context, builder: (context) {
        return AlertDialog(
          title: Text('Tu IMC: ${imc.toStringAsFixed(2)}'),
          content: Text(_mj),
          actions: <Widget>[
            TextButton(
              child: Text('ACCEPT'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
    );
  }

  createMDialog(BuildContext context) {
    return showDialog(
      context: context, builder: (context) {
        return AlertDialog(
          title: Text('Tu IMC: ${imc.toStringAsFixed(2)}'),
          content: Text(_hb),
          actions: <Widget>[
            TextButton(
              child: Text('ACCEPT'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
    );
  }

  createMaleDialog(BuildContext context) {
    return showDialog(
      context: context, builder: (context) {
        return AlertDialog(
          title: Text('Tu IMC: ${imc.toStringAsFixed(2)}'),
          content: Text('Tabla del IMC para mujeres'),
          actions: <Widget>[
            TextButton(
              child: Text('ACCEPT'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calcular IMC'),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  textController1.clear();
                  textController2.clear();
                  selectedGender = false;
                  setState(() {});
                },
                child: Icon(Icons.delete_forever),
              ),
            ),

          ],
        ),
        body: ListView(
          
          children: [
            SizedBox(height: 14,),
            
            ListTile(
              title: Text("Ingrese sus datos para calcular el IMC", textAlign: TextAlign.center,),
            ),
            
            //Lista de radio buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.female,
                        color: selectedGender ? Colors.black : Colors.blue[200],
                      ),
                      onPressed: () {
                        selectedGender = false;
                        setState(() {});
                      },
                    ),
                  ],
                ),

                Column(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.male,
                        color: selectedGender ? Colors.blue[200] : Colors.black,
                      ),
                      onPressed: () {
                        selectedGender = true;
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ],
            ),
            
            ListTile(
              leading: Icon(Icons.align_horizontal_left),
              title: TextField(
                controller: textController1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(), 
                  labelText: "Ingresar altura (Metros)",
                ),
              ),
            ),

            ListTile(
              leading: Icon(Icons.crop_square_rounded),
              title: TextField(
                controller: textController2,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(), 
                  labelText: "Ingresar peso (KG)",
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: MaterialButton(
                onPressed: () {
                  imcCalculation();
                  setState(() {});
                },
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  "Calcular", 
                  style: TextStyle(
                    color: Colors.black
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }
}