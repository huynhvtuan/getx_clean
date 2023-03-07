import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_detail_controller.dart';

class HomeDetailView extends GetView<HomeDetailController> {
  const HomeDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: (10 / 100) * MediaQuery.of(context).size.width,
                  width: (10 / 100) * MediaQuery.of(context).size.width,
                  // margin: const EdgeInsets.all(50.0),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xfff09a9a),
                        spreadRadius: 75,
                        blurRadius: 70,
                        offset: Offset(-100, -150),
                      )
                    ],
                  ),
                ),
                Container(
                  height: (10 / 100) * MediaQuery.of(context).size.width,
                  width: (10 / 100) * MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        // color: Colors.blue,
                        color: Color(0xFFD3E6F8),
                        spreadRadius: 75,
                        blurRadius: 70,
                        offset: Offset(100, -90),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 200,
            right: 300,
            child: Icon(
              Icons.access_alarm,
              size: 100,
            ),
          ),
        ],
      ),
    ));
  }
}
