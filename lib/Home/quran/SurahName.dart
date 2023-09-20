import 'package:flutter/material.dart';
import 'package:islamic/Home/quran/SurahScreen.dart';

class SurahNames extends StatelessWidget {
  String surahName;
  int index;

  SurahNames({required this.surahName, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(SurahScreen.routeName,
                arguments: SurahDetailsArgs(name: surahName, index: index));
          },
          child: Text(
            surahName,
            style: Theme.of(context).textTheme.titleSmall,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.02,
        ),
        Text(
          '${index + 1}',
          style: Theme.of(context).textTheme.titleSmall,
        )
      ],
    );
  }
}
