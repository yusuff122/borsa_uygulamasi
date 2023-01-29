import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:simple_html_css/simple_html_css.dart';

class HaberDetay extends StatefulWidget {
  String haberDetay = '';
  String haberImageUrl = '';
  String haberMansetDetay = '';

  HaberDetay(
      {required this.haberDetay,
      required this.haberImageUrl,
      required this.haberMansetDetay,
      super.key});

  @override
  State<HaberDetay> createState() => _HaberDetayState();
}

class _HaberDetayState extends State<HaberDetay> {
  @override
  Widget build(BuildContext context) {
    String text = widget.haberDetay.replaceAll(
      r'\r\\n\t',
      r'',
    );
    var textSpan = HTML.toTextSpan(context, text, linksCallback: ((p0) {
      print("p0");
      print(p0);
    }),
        defaultTextStyle: (Theme.of(context).textTheme.titleLarge),
        overrideStyle: <String, TextStyle>{
          'p': TextStyle(fontSize: 15, color: Colors.white70),
          'a': TextStyle(fontSize: 15, color: Colors.red),
          'u': TextStyle(fontSize: 15, color: Colors.red),
        });

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 11, 2, 26),
        body: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.45,
                decoration: BoxDecoration(
                  color: Colors.white60,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(widget.haberImageUrl),
                      fit: BoxFit.cover),
                ),
                child: Stack(children: [
                  Positioned(
                    top: 40,
                    left: 10,
                    child: Container(
                      width: 60,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.circular(10)),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 28,
                        ),
                        onPressed: (() {
                          Navigator.pop(context);
                        }),
                      ),
                    ),
                  )
                ])),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    widget.haberMansetDetay,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(
                    height: 1,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  RichText(
                    text: textSpan,
                    selectionRegistrar: SelectionContainer.maybeOf(context),
                  ),
                  /* Text(textSpan.toString(),
                      style: TextStyle(color: Colors.white70, fontSize: 15))*/
                ],
              ),
            )
          ],
        ));
  }
}
