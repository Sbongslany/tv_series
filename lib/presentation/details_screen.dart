import 'package:flutter/cupertino.dart';
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
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(widget.e.name!)
          ],
        ),
      ),
    );
  }
}
