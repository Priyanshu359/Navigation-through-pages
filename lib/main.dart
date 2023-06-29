import 'dart:developer';

import 'package:flutter/material.dart';
import 'second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Demo App'),
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
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                
                controller: _textEditingController,
                decoration: InputDecoration(
                  // constraints: BoxConstraints(maxWidth: 150) ,
                  labelText: "Enter anything you want!",
                  contentPadding: EdgeInsets.all(20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                onPressed: ()async {
                  String userValue = _textEditingController.text;
                  String value = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondPage(userValue: userValue)
                    )
                  );
                  log(value);
                  _textEditingController.text=value;
                  setState(() {
                    
                  });
                },
                child: const Text("Click!"),
              )
            ],
          ),
        ),
      )
    );
  }
}
