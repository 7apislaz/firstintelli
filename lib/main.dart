import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'countController.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    Get.put(CountController());
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              '눌러서 카운트를 추가해여',
            ),
            Obx(() {
              return Text(
                '${Get.find<CountController>().counter.value}',
                style: Theme.of(context).textTheme.headline4,
              );
            } ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Get.find<CountController>().increment();
            },
            backgroundColor: Colors.green,
            child: const Icon(Icons.add)),
          SizedBox(width: 10, height: 10,),
          FloatingActionButton(
            onPressed: () {
              Get.find<CountController>().decrement();
            },
            backgroundColor: Colors.pink,
            child: const Icon(Icons.remove)),
          SizedBox(width: 10, height: 10,),
          FloatingActionButton(
              onPressed: () {
                Get.find<CountController>().putNumber(4);
              },
              backgroundColor: Colors.blue,
              child: const Text('4')),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
