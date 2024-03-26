import 'dart:async';
import 'dart:ffi';
import 'package:crypto/models/entities.model.dart';
import 'package:crypto/repository/user.repository.dart';

import 'package:flutter/material.dart';


import '../../Library/carousel_pro/src/carousel_pro.dart';

class Votations extends StatefulWidget {
  final EntitieModel entitie;
  const Votations({super.key, required this.entitie});
  @override
  createState() => _votationState();
}

class _votationState extends State<Votations> {
  void initState() {
    getUser();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            
            SizedBox(height: 10.0),
            ValueListenableBuilder(valueListenable: currentEntities, 
            builder: (BuildContext context, value, Widget? child) {
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return ListTile(
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
 