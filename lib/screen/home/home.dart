import 'dart:async';
import 'dart:ffi';
import 'package:crypto/models/entities.model.dart';
import 'package:crypto/repository/user.repository.dart';
import 'package:crypto/screen/home/votations.dart';
import 'package:crypto/utils/helper.dart';

import 'package:flutter/material.dart';


import '../../Library/carousel_pro/src/carousel_pro.dart';

class home extends StatefulWidget {
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  void initState() {
    getUser();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ///
            /// Header image slider
            ///
            SizedBox(
                height: 210.0,
                width: double.infinity,
                child: new Carousel(
                  boxFit: BoxFit.cover,
                  dotColor: Colors.white.withOpacity(0.8),
                  dotSize: 5.5,
                  dotSpacing: 16.0,
                  dotBgColor: Colors.transparent,
                  showIndicator: true,
                  overlayShadow: true,
                  overlayShadowColors: Theme.of(context)
                      .scaffoldBackgroundColor
                      .withOpacity(0.9),
                  overlayShadowSize: 0.25,
                  images: [
                    AssetImage("assets/image/banner/banner2.png"),
                    AssetImage("assets/image/banner/banner3.jpg"),
                    AssetImage("assets/image/banner/banner2.png"),
                    AssetImage("assets/image/banner/banner3.jpg"),
                  ],
                )),
            SizedBox(height: 10.0),
            ValueListenableBuilder(valueListenable: currentEntities, 
            builder: (BuildContext context, value, Widget? child) {
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Helper.nextScreen(context, Votations(entitie: value[index]));
                      },
                      leading: Icon(Icons.build),
                      title: Text(value[index].title),
                      trailing: Icon(Icons.forward),
                    );
                  },
                );
            })
          ],
        ),
      ),
    );
  }
}
 