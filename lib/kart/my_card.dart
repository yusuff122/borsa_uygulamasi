import 'dart:ffi';
import 'package:sizer/sizer.dart';
import 'package:doviz_projeler/model/doviz_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyCard extends StatelessWidget {
  String isim = '';
  double alis = 0;
  double satis = 0;
  MyCard({required this.isim, required this.alis, required this.satis});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: Center(
        child: Column(
          children: [
            Container(
              width: 100.h,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 22, 13, 127),
                    Color.fromARGB(255, 5, 8, 96),
                    Color.fromARGB(255, 4, 8, 74),
                  ]),
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      isim,
                      style: TextStyle(color: Colors.white60),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        Text(
                          alis.toString(),
                          style: TextStyle(
                              fontSize: 22.sp,
                              color: Colors.blueAccent.shade400,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10, left: 1.h),
                          child: Text(' Döviz Alış ',
                              style: TextStyle(
                                  color: Colors.white60, fontSize: 12.sp)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Padding(
                      padding: EdgeInsets.all(2.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Döviz Satış',
                              style: TextStyle(color: Colors.white70)),
                          Padding(
                            padding: EdgeInsets.only(right: 8.h, bottom: 1.h),
                            child: Text(satis.toString(),
                                style: TextStyle(
                                    color: Colors.blueAccent.shade400,
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
