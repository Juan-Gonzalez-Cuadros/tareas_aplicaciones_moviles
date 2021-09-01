import 'package:flutter/material.dart';
void main() => runApp(MyAppIteso());
class MyAppIteso extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {

  bool correoClick = false;
  bool telClick = false;
  bool rutaClick = false;
  int count = 9999;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App ITESO'),
      ),
      body: ListView(
        children: [
          // Imagen
          Image.network(
            "https://cruce.iteso.mx/wp-content/uploads/sites/123/2018/04/Portada-2-e1525031912445.jpg",
          ),
          Container(
            height: 20,
          ),
          // Fila con textos y boton
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ITESO Universidad Jesuita de Guadalajara",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "San Pedro Tlaquepaque",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),

              IconButton(
                icon: Icon(Icons.thumb_up),
                color: Colors.indigo,
                onPressed: () {
                  setState(() {
                    count += 1;
                  });
                }
              ),
              
              IconButton(
                icon: Icon(Icons.thumb_down),
                color: Colors.indigo,
                onPressed: () {
                  setState(() {
                    if (count > 1)
                      count -= 1;
                    else
                      count = 0;
                  });
                }
              ),

                  Text("$count", style: Theme.of(context).textTheme.bodyText1),
            ],
          ),
          // Fila con iconos grandes
          Container(height: 48),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  IconButton(
                    iconSize: 64,
                    icon: Icon(
                      Icons.mail,
                      color: correoClick ? Colors.indigo : Colors.black,
                    ),
                    onPressed: () {
                      correoClick = !correoClick;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Enviando correo:...")),
                      );
                      setState(() {});
                    },
                  ),
                  Text("Correo"),
                ],
              ),

              Column(
                children: [
                  IconButton(
                    iconSize: 64,
                    icon: Icon(
                      Icons.call,
                      color: telClick ? Colors.indigo : Colors.black,
                    ),
                    onPressed: () {
                      telClick = !telClick;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Haciendo llamada:...")),
                      );
                      setState(() {});
                    },
                  ),
                  Text("Telefono"),
                ],
              ),

              Column(
                children: [
                  IconButton(
                    iconSize: 64,
                    icon: Icon(
                      Icons.directions,
                      color: rutaClick ? Colors.indigo : Colors.black,
                    ),
                    onPressed: () {
                      rutaClick = !rutaClick;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Llendo al Iteso:...")),
                      );
                      setState(() {});
                    },
                  ),
                  Text("Direccion"),
                ],
              ),
            ],
          ),
          // Texto del iteso
          Container(height: 48),
          Text(
            "El ITESO, Universidad Jesuita de Guadalajara (Instituto Tecnológico y de Estudios Superiores de Occidente), es una universidad privada ubicada en la Zona Metropolitana de Guadalajara, Jalisco, México, fundada en el año 1957."
            "La institución forma parte del Sistema Universitario Jesuita (SUJ) que integra a ocho universidades en México. La universidad es nombrada como la Universidad Jesuita de Guadalajara.",
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}