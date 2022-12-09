import 'package:flutter/material.dart';

import 'home.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Basic Animation'),
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
   bool bigger = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
       mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){
              setState(() {
                bigger ? bigger = false : bigger = true ;
              });
            },
            child: AnimatedContainer(
              onEnd: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Home())) ;
              },
              curve: Curves.slowMiddle ,
              duration:const Duration(seconds: 2),
              width: bigger ? 400 :  50,
              child: Image.network("https://res.cloudinary.com/dk-find-out/image/upload/q_80,w_640,f_auto/DCTM_Penguin_UK_DK_AL526630_wkmzns.jpg"),),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        onPressed: () {

        },
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
