import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  final String userValue;
  const SecondPage({super.key, required this.userValue});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final TextEditingController _textEditingControllers = TextEditingController();
  @override
  void initState() {
    _textEditingControllers.text = widget.userValue;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Navigator.of(context).pop(_textEditingControllers.value.text);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Second Page"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Welcome User!",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _textEditingControllers,
                  decoration: InputDecoration(
                    labelText: "Enter anything you want!",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(60)),
                  ),
                ),
                // Text(
                //   widget.userValue,
                //   style: const TextStyle(
                //     fontSize: 20,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.black87,
                //   ),
                //)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
