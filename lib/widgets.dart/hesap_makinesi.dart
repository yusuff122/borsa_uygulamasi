import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_awesome_calculator/flutter_awesome_calculator.dart';
import 'package:sizer/sizer.dart';

class AramaSAyfa extends StatefulWidget {
  const AramaSAyfa({Key? key}) : super(key: key);

  @override
  State<AramaSAyfa> createState() => _AramaSAyfaState();
}

class _AramaSAyfaState extends State<AramaSAyfa> {
  final _advanceController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 13, 2, 31),
        elevation: 0,
        title: Text(
          'Hesap makinesi',
          style: TextStyle(color: Colors.white70),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 13, 2, 31),
      body: Align(
        alignment: Alignment.center,
        child: FlutterAwesomeCalculator(
          context: context,
          digitsButtonColor: Colors.white60,
          backgroundColor: Colors.white70,
          expressionAnswerColor: Colors.black,
          showAnswerField: true,
          fractionDigits: 5,
          buttonRadius: 8,
          height: 70.h,
        ),
      ),
    );
  }
}
