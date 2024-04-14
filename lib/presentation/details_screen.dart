import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tv_series/models/character_model.dart';

class DetailsScreen extends StatefulWidget {
  final CharacterModel e;
  const DetailsScreen({super.key, required this.e});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.deepOrange,
      appBar: AppBar(),
      body: Center(
        child: Column(

          children: [
            Text(widget.e.name!, style: textStyle(40, FontWeight.bold),),

            Image.network(widget.e.image!),
            const SizedBox(height: 10,),
            Text(widget.e.created!, style: textStyle(20, FontWeight.w200)),
            Text('Gender : ${widget.e.gender!}', style: textStyle(30, FontWeight.w200)),
            Text('Status : ${widget.e.status!}',style: textStyle(30, FontWeight.w200))
          ],
        ),
      ),
    );
  }

  TextStyle textStyle(double size, FontWeight fontWeight ) =>  TextStyle(fontWeight: fontWeight, fontSize: size, color: Colors.white);
}
