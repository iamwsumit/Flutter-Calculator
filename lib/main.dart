import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade400,
        primary: Colors.blue.shade400),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String answer = "0";

  void setAnswer() {
    setState(() {
      FocusScope.of(context).requestFocus(FocusNode());
    });
  }

  final TextEditingController number1Controller = TextEditingController();
  final TextEditingController number2Controller = TextEditingController();

  void add() {
    try {
      int n1 = int.parse(number1Controller.text);
      int n2 = int.parse(number2Controller.text);
      int sum = n1 + n2;
      answer = "$n1 + $n2 = $sum";
      setAnswer();
    } catch (e) {
      Fluttertoast.showToast(msg: 'Invalid Integer');
    }
  }

  void subtract() {
    try {
      int n1 = int.parse(number1Controller.text);
      int n2 = int.parse(number2Controller.text);
      int sum = n1 - n2;
      answer = "$n1 - $n2 = $sum";
      setAnswer();
    } catch (e) {
      Fluttertoast.showToast(msg: 'Invalid Integer');
    }
  }

  void multiply() {
    try {
      int n1 = int.parse(number1Controller.text);
      int n2 = int.parse(number2Controller.text);
      int sum = n1 * n2;
      answer = "$n1 * $n2 = $sum";
      setAnswer();
    } catch (e) {
      Fluttertoast.showToast(msg: 'Invalid Integer');
    }
  }

  void divide() {
    try {
      int n1 = int.parse(number1Controller.text);
      int n2 = int.parse(number2Controller.text);
      if (n2 == 0) {
        Fluttertoast.showToast(msg: 'Can not divide by 0');
        return;
      }
      double sum = n1 / n2;
      answer = "$n1 / $n2 = $sum";
      setAnswer();
    } catch (e) {
      Fluttertoast.showToast(msg: 'Invalid Integer');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        title: const Text("Flutter Calculator"),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                      child: SizedBox(
                          child: TextField(
                    keyboardType: TextInputType.number,
                    controller: number1Controller,
                    decoration: const InputDecoration(
                        hintText: "Enter First Num",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5)))),
                  ))),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                  Expanded(
                      child: SizedBox(
                          child: TextField(
                    controller: number2Controller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        hintText: "Enter Second Num",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5)))),
                  )))
                ],
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: ShapeDecoration(
                    color: Colors.grey.shade400,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)))),
                width: double.infinity,
                child: Text("$answer",
                    textAlign: TextAlign.left,
                    style: const TextStyle(fontSize: 30, color: Colors.black)),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: TextButton(
                                  onPressed: () => add(),
                                  style: ButtonStyle(
                                      padding: WidgetStateProperty.all(
                                          const EdgeInsets.symmetric(
                                              vertical: 12)),
                                      backgroundColor: WidgetStateProperty.all(
                                          Colors.blue.shade400),
                                      shape: WidgetStateProperty.all(
                                          const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))))),
                                  child: const Text('Add',
                                      style:
                                          TextStyle(color: Colors.black, fontSize: 17)))),
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 7)),
                          Expanded(
                              child: TextButton(
                                  onPressed: () => subtract(),
                                  style: ButtonStyle(
                                      padding: WidgetStateProperty.all(
                                          const EdgeInsets.symmetric(
                                              vertical: 12)),
                                      backgroundColor: WidgetStateProperty.all(
                                          Colors.blue.shade400),
                                      shape: WidgetStateProperty.all(
                                          const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))))),
                                  child: const Text('Subtract',
                                      style:
                                          TextStyle(color: Colors.black, fontSize: 17)))),
                        ],
                      ),
                      const Padding(padding: EdgeInsets.all(7)),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: TextButton(
                                  onPressed: () => multiply(),
                                  style: ButtonStyle(
                                      padding: WidgetStateProperty.all(
                                          const EdgeInsets.symmetric(
                                              vertical: 12)),
                                      backgroundColor: WidgetStateProperty.all(
                                          Colors.blue.shade400),
                                      shape: WidgetStateProperty.all(
                                          const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))))),
                                  child: const Text('Multiply',
                                      style:
                                          TextStyle(color: Colors.black, fontSize: 17)))),
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 7)),
                          Expanded(
                              child: TextButton(
                                  onPressed: () => divide(),
                                  style: ButtonStyle(
                                      padding: WidgetStateProperty.all(
                                          const EdgeInsets.symmetric(
                                              vertical: 12)),
                                      backgroundColor: WidgetStateProperty.all(
                                          Colors.blue.shade400),
                                      shape: WidgetStateProperty.all(
                                          const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))))),
                                  child: const Text('Divide',
                                      style:
                                          TextStyle(color: Colors.black, fontSize: 17)))),
                        ],
                      ),
                    ],
                  )),
            ],
          )),
    );
  }
}
