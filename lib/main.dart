import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'CALCOLA SCONTI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  int sconto = 0;
  double prezzo = 0, prezzoscon = 0;

  void _resetbutton() {
    setState((){
      prezzo = 0;
      sconto = 0;
      prezzoscon = 0;
    }
    );
  }

  void _calcolascon(){
    setState((){
      sconto = int.parse(controllerSconto.text);
      prezzo = double.parse(controllerPrezzo.text);
      prezzoscon = prezzo - ((prezzo * sconto) / 100);
    });

  }

  TextEditingController controllerSconto = TextEditingController();
  TextEditingController controllerPrezzo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:
      Column(

        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[

          TextField(

              controller: controllerPrezzo,
              decoration: InputDecoration(labelText: "Inserisci il prezzo €")
          ),
          TextField(

              controller: controllerSconto,
              decoration: InputDecoration(labelText: "Inserisci lo sconto da applicare %")
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FlatButton(
                  onPressed: _calcolascon,
                  color: Colors.blue,
                  child: Text(
                    "Calcola",
                  )),
              FlatButton(
                  onPressed: _resetbutton,
                  color: Colors.orange,
                  child: Text(
                    "Reset",
                  ))
            ],

          ),
          Text(
            'Prezzo scontato: $prezzoscon€',
            style: TextStyle(fontWeight: FontWeight.bold, height: 1, fontSize: 35),

          ),
        ],
      ),


    );
  }
}