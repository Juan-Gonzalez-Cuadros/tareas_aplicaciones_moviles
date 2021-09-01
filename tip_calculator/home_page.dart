import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var textController = TextEditingController();
  bool currentSwitchValue = false;
  double tip = 0.0;
  int? selectedRadio = 0;
  
  var radioGroupValues = {
    0: "Amazing (20%)",
    1: "Good (18%)",
    2: "Okay (15%)",
  };

  tipCalculation() {
    var costOfService = double.parse(textController.text);
    if (selectedRadio == 0) {
      tip = costOfService * 0.20;
    } else if(selectedRadio == 1) {
      tip = costOfService * 0.18;
    } else if(selectedRadio == 2) {
      tip = costOfService * 0.15;
    }
    if(currentSwitchValue){
      tip = tip.ceilToDouble();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tip time'),
        ),
        body: ListView(
          children: [
            SizedBox(height: 14,),
            ListTile(
              leading: Icon(Icons.store),
              title: TextField(
                controller: textController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(), 
                  labelText: "Cost of service",
                ),
              ),
            ),

            ListTile(
              leading: Icon(Icons.dinner_dining),
              title: Text("How was the service?"),
            ),
            
            //Lista de radio buttons
            Column(
              mainAxisSize: MainAxisSize.min,
              children: radioGroupValues.entries
                .map(
                  (element) => ListTile(
                    leading: Radio(
                      value: element.key, 
                      groupValue: selectedRadio, 
                      onChanged: (int? currentSelectedRadio){
                        selectedRadio = currentSelectedRadio;
                        setState(() {});
                      },
                    ),
                    title: Text("${element.value}"),
                  ),
                )
                .toList(),
            ),

            ListTile(
              leading: Icon(Icons.credit_card),
              title: Text("Round tip?"),
              trailing: Switch(
                value: currentSwitchValue, 
                onChanged: (switchChanged){
                  currentSwitchValue = switchChanged;
                  setState(() {});
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: MaterialButton(
                onPressed: () {
                  tipCalculation();
                  setState(() {});
                }, 
                child: Text(
                  "CALCULATE", 
                  style: TextStyle(
                    color: Colors.grey[200]
                  ),
                ),
                color: Colors.green,
              ),
            ),

            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Text("Tip Amount: \$${tip.toStringAsFixed(2)}"),
              ),
            ),
          ],
        ),
      );
  }
}