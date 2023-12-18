import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  TextEditingController _controller=TextEditingController();
  double _oldvalue=0;
  double _newvalue=0;
  double _result=0;
  String _curerntValue='';

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     _oldvalue=0;
     _newvalue=0;
     _result=0;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16,right: 16,top: 16),
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _controller,

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: () {
                  setState(() {
                    _curerntValue='';
                    _controller.text=_curerntValue;
                  });

                }, child: Text('AC')),
                TextButton(onPressed: () {

                }, child: Text('+/-')),
                TextButton(onPressed: () {

                }, child: Text('%')),
                TextButton(onPressed: () {

                }, child: Text('/'))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: () {
                  _curerntValue=_curerntValue+'7';
                  _controller.text=_curerntValue;
                }, child: Text('7')),
                TextButton(onPressed: () {
                  _curerntValue=_curerntValue+'8';
                  _controller.text=_curerntValue;
                }, child: Text('8')),
                TextButton(onPressed: () {
                  _curerntValue=_curerntValue+'9';
                  _controller.text=_curerntValue;
                }, child: Text('9')),
                TextButton(onPressed: () {

                }, child: Text('X'))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: () {
                  _curerntValue=_curerntValue+'4';
                  _controller.text=_curerntValue;
                }, child: Text('4')),
                TextButton(onPressed: () {
                  _curerntValue=_curerntValue+'5';
                  _controller.text=_curerntValue;
                }, child: Text('5')),
                TextButton(onPressed: () {
                  _curerntValue=_curerntValue+'6';
                  _controller.text=_curerntValue;
                }, child: Text('6')),
                TextButton(onPressed: () {

                }, child: Text('-'))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: () {
                  _curerntValue=_curerntValue+'1';
                  _controller.text=_curerntValue;
                }, child: Text('1')),
                TextButton(onPressed: () {
                  _curerntValue=_curerntValue+'2';
                  _controller.text=_curerntValue;
                }, child: Text('2')),
                TextButton(onPressed: () {
                  _curerntValue=_curerntValue+'3';
                  _controller.text=_curerntValue;
                }, child: Text('3')),
                TextButton(onPressed: () {
                  _oldvalue=double.parse(_controller.text.toString());
                  _curerntValue=_curerntValue+'+';
                  _controller.text=_curerntValue;
                  print("_oldvalue "+_oldvalue.toString());

                }, child: Text('+'))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: () {
                  _curerntValue=_curerntValue+'0';
                  _controller.text=_curerntValue;
                }, child: Text('0')),
                TextButton(onPressed: () {
                  _curerntValue=_curerntValue+'.';
                  _controller.text=_curerntValue;
                }, child: Text('.')),
                TextButton(onPressed: () {
                  calculate();

                }, child: Text('='))
              ],
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void calculate() {
   String enteredValue= _controller.text.toString();
   if(enteredValue.contains("+")){
     List<String> values= enteredValue.split("+");
    //S values[0];
   }
  }
}
