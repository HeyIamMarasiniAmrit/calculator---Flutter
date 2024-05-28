import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Calculatorview extends StatefulWidget {
  const Calculatorview({super.key});

  @override
  State<Calculatorview> createState() => _CalculatorviewState();
}

class _CalculatorviewState extends State<Calculatorview> {
  int x = 0;
  int y = 0;
  num z = 0;
  final displayOneController = TextEditingController();
  final displayTwoController = TextEditingController();

  late final AppLifecycleListener _listener;

  void initState() {
    super.initState();
    displayOneController.text = x.toString();
    displayTwoController.text = y.toString();

    _listener = AppLifecycleListener(
      onShow: _onShow,
      onHide: _onHide,
      onDetach: _onDetach,
      onResume: _onResume,
      onInactive: _onInactive,
      onPause: _onPause,
      onRestart: _onRestart,
      onStateChange: _onStateChanged,
    );
  }

  void _onShow() => ("onShow called");
  void _onHide() => ("onHide called");
  void _onResume() => ("onResume called");
  void _onDetach() => ("onDetach called");
  void _onPause() => ("onPause called");
  void _onInactive() => ("onInactive called");
  void _onRestart() => ("onRestart called");
  void _onStateChanged(AppLifecycleState State) {
    print("onStateChanged called with state: $State");
  }

  @override
  void dispose() {
    displayOneController.dispose();
    displayTwoController.dispose();
    _listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32.0),
      child: Column(
        children: [
          CalculatorDisplay(
              key: const Key("displayOne"),
              hint: "Enter First Number",
              controller: displayOneController),
          SizedBox(height: 30),
          CalculatorDisplay(
              key: const Key("displayTwo"),
              hint: "Enter second Number",
              controller: displayTwoController),
          SizedBox(height: 30),
          Text(
            key: const Key("Result"),
            z.toString(),
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(displayOneController.text)! +
                        num.tryParse(displayTwoController.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(displayOneController.text)! -
                        num.tryParse(displayTwoController.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.minus),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(displayOneController.text)! *
                        num.tryParse(displayTwoController.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.multiply),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(displayOneController.text)! /
                        num.tryParse(displayTwoController.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.divide),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton.extended(
            onPressed: () {
              setState(() {
                x = 0;
                y = 0;
                z = 0;
                displayOneController.clear();
                displayTwoController.clear();
              });
            },
            label: const Text("Clear"),
          ),
        ],
      ),
    );
  }
}

class CalculatorDisplay extends StatelessWidget {
  const CalculatorDisplay(
      {super.key, this.hint = "Enter a Number", required this.controller});

  final String? hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      autofocus: true,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 3.0,
            ),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black,
            width: 3.0,
          )),
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.black,
          )),
    );
  }
}
