import 'package:flutter/material.dart';

class guest_select extends StatefulWidget {

  const guest_select({Key? key}) : super(key: key);

  @override
  State<guest_select> createState() => _guest_selectState();
}

class _guest_selectState extends State<guest_select> {
  late String gmno ='test';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('조합원 조회'),),

    );
  }
}
