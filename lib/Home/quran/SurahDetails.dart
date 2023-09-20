import 'package:flutter/material.dart';

class SurahDetails extends StatelessWidget {
  String content;
  int index;

  SurahDetails({required this.content, required this.index});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$content{${index + 1}}',
      style: Theme.of(context).textTheme.titleSmall,
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
    );
  }
}
